package jira.xray;


import com.google.common.net.UrlEscapers;
import jira.constants.Constants;
import junit.framework.Assert;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Assertions;
import org.zeroturnaround.zip.ZipUtil;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class JiraBNS {
    //    private Constants constants = null;
    private static String cucumberReportFileName = null;
    private static String zipFilePath = null;
    private static Random rnd = new Random();

    public static List<String> testCaseData = new LinkedList<>();

    public static List<String> getTestCaseData() {
        return testCaseData;
    }

    public static void setTestCaseData(List<String> testCaseData) {
        JiraBNS.testCaseData = testCaseData;
    }

    public JiraBNS() throws IOException {
        new Constants();
    }


    public static String getCucumberReportFileName() {
        return cucumberReportFileName;
    }

    public static void setCucumberJSONFileName(String cucumberJSONFileName) {
        JiraBNS.cucumberReportFileName = cucumberJSONFileName;
    }


    private static long getTimeStamp() {
        Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        return ts.getTime();
    }

    private static String createFile() throws IOException {
        long timeStamp = getTimeStamp();
        File featureFile = new File(System.getProperty("user.dir") + Constants.downloadFeatureFileLocation
                + File.separator + "TestPlan-" + Constants.testPlan + "_" + timeStamp + ".feature");
        return featureFile.createNewFile() ? featureFile.getName() : "File is not created";
    }


    private static CloseableHttpClient getHTTPClientObject() {
        return HttpClients.createDefault();
    }

    private static String encodeBase64String(String inputString) {
        return Base64.encodeBase64URLSafeString(inputString.getBytes());
    }

    private static String decodeString(String password) {
        return new String(Base64.decodeBase64(password));
    }

    private static String getBasicAuthKey(String userName, String password) {
        return "Basic " + encodeBase64String(userName + ":" + password);
    }

    private static String getRequest(String getURL) throws IOException, InterruptedException {
        CloseableHttpClient httpClient = getHTTPClientObject();
        HttpGet httpGet = new HttpGet(getURL);
        String decodedPassword = decodeString(Constants.password);
        httpGet.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
        Thread.sleep(5000);
        // Create a custom response handler
        ResponseHandler<String> responseHandler = response -> {
            int status = response.getStatusLine().getStatusCode();
            if (status >= 200 && status < 300) {
                HttpEntity entity = response.getEntity();
                return entity != null ? EntityUtils.toString(entity) : null;
            } else {
                throw new ClientProtocolException("Unexpected response status: " + status);
            }
        };
        return httpClient.execute(httpGet, responseHandler);
    }

    private static HttpURLConnection xrayExportTests(String jiraKeys) {
        HttpURLConnection httpConn = null;

        try {
            URL url = new URL(Constants.jiraURL + "/rest/raven/1.0/export/test" + "?keys=" + jiraKeys + "&fz=true");
            httpConn = (HttpURLConnection) url.openConnection();
            httpConn.setDoOutput(true);
            httpConn.setRequestMethod("GET");
            String decodedPassword = decodeString(Constants.password);
            httpConn.setRequestProperty("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpConn.setDoOutput(true);
            httpConn.connect();
        } catch (Exception exception) {
            System.out.println(exception);
        }

        return httpConn;
    }

    private static void extractZipFromXrayResponse(HttpURLConnection httpConn) throws IOException {
        String disposition = httpConn.getHeaderField("Content-Disposition");
        String contentType = httpConn.getContentType();
        int contentLength = httpConn.getContentLength();
        String fileName = "";
        if (disposition != null) {
            int index = disposition.indexOf("filename=");
            if (index > 0) {
                fileName = disposition.substring(index + 10, disposition.length() - 1);
            }
        } else {
            fileName = "NewFeatureBundle_" + Math.random() + ".zip";
        }

        System.out.println("Content-Type = " + contentType + " | Content-Disposition = " + disposition + " | Content-Length = " + contentLength + " | fileName = " + fileName);
        InputStream inputStream = httpConn.getInputStream();
        String saveFilePath = System.getProperty("user.dir") + File.separator + Constants.downloadFeatureFileLocation + File.separator + fileName;
        zipFilePath = saveFilePath;
        writeFeatureFile(inputStream, saveFilePath);
    }

    private static void writeFeatureFile(InputStream inputStream, String filePath) throws IOException {
        try {
            FileOutputStream outputStream = new FileOutputStream(filePath);
            Throwable var3 = null;

            try {
                /* int bytesRead = true;*/
                byte[] buffer = new byte[4096];

                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                outputStream.flush();
            } catch (Throwable var14) {
                var3 = var14;
                throw var14;
            } finally {
                if (outputStream != null) {
                    if (var3 != null) {
                        try {
                            outputStream.close();
                        } catch (Throwable var13) {
                            var3.addSuppressed(var13);
                        }
                    } else {
                        outputStream.close();
                    }
                }

            }
        } catch (Exception var16) {
            System.out.println("Unable to write file. #" + var16);
        }

        inputStream.close();
    }

    private static void readWriteFile(File newFile) {
        try {
            BufferedReader file = new BufferedReader(new FileReader(newFile));
            Throwable var2 = null;

            try {
                String line;
                StringBuilder sb;
                String rline;
                for (sb = new StringBuilder(); (line = file.readLine()) != null; sb.append('\n')) {
                    if (line.contains("Examples:")) {
                        rline = file.readLine();
                        if (rline.contains("datafile") && rline.contains("|") && rline.contains(":")) {
                            rline = rline.replaceFirst("(\t+)", "");
                            rline = rline.replaceFirst("(\\s+)|", "");
                            rline = rline.replace("|'", "{'");
                            rline = rline.replace("|", "}");
                            sb.append(line.trim());
                            sb.append(rline.trim());
                        } else {
                            sb.append(line);
                            sb.append('\n');
                            sb.append(rline);
                        }
                    } else {
                        sb.append(line);
                    }
                }

                rline = sb.toString();
                FileOutputStream fileOut = new FileOutputStream(newFile);
                Throwable var7 = null;

                try {
                    fileOut.write(rline.getBytes());
                } catch (Throwable var32) {
                    var7 = var32;
                    throw var32;
                } finally {
                    if (fileOut != null) {
                        if (var7 != null) {
                            try {
                                fileOut.close();
                            } catch (Throwable var31) {
                                var7.addSuppressed(var31);
                            }
                        } else {
                            fileOut.close();
                        }
                    }

                }
            } catch (Throwable var34) {
                var2 = var34;
                throw var34;
            } finally {
                if (file != null) {
                    if (var2 != null) {
                        try {
                            file.close();
                        } catch (Throwable var30) {
                            var2.addSuppressed(var30);
                        }
                    } else {
                        file.close();
                    }
                }

            }
        } catch (Exception var36) {
            Assert.fail(var36.getMessage());
        }

    }

    public static void unzip(String zipFilePath, String destDir, String featureFileName) throws InterruptedException {
        int max = 999;
        int min = 111;
        File dir = new File(destDir);
        if (!dir.exists() && dir.mkdirs()) {
            System.out.println(dir + " created.");
        }

        File newFile = null;
        byte[] buffer = new byte[8192];

        try {
            FileInputStream fis = new FileInputStream(zipFilePath);
            Throwable var9 = null;

            try {
                ZipInputStream zis = new ZipInputStream(fis);
                Throwable var11 = null;

                try {
                    ZipEntry ze = zis.getNextEntry();

                    while (true) {
                        if (ze == null) {
                            zis.closeEntry();
                            break;
                        }

                        String fileName = ze.getName();
                        newFile = new File(destDir + File.separator + fileName);
                        (new File(newFile.getParent())).mkdirs();
                        FileOutputStream fos = new FileOutputStream(newFile);
                        Throwable var15 = null;

                        try {
                            int len;
                            try {
                                while ((len = zis.read(buffer)) > 0) {
                                    fos.write(buffer, 0, len);
                                }
                            } catch (Throwable var62) {
                                var15 = var62;
                                throw var62;
                            }
                        } finally {
                            if (fos != null) {
                                if (var15 != null) {
                                    try {
                                        fos.close();
                                    } catch (Throwable var61) {
                                        var15.addSuppressed(var61);
                                    }
                                } else {
                                    fos.close();
                                }
                            }

                        }

                        zis.closeEntry();
                        readWriteFile(newFile);
                        Thread.sleep(3000L);
                        int n = rnd.nextInt(max) + min;
                        File fileNewName = new File(destDir + featureFileName + "_" + n + "_" + (new SimpleDateFormat("yyyyMMddHHmmSS'.feature'")).format(new Date()));
                        if (newFile.renameTo(fileNewName)) {
                            System.out.println(newFile + " renamed as " + fileNewName);
                        }

                        ze = zis.getNextEntry();
                    }
                } catch (Throwable var64) {
                    var11 = var64;
                    throw var64;
                } finally {
                    if (zis != null) {
                        if (var11 != null) {
                            try {
                                zis.close();
                            } catch (Throwable var60) {
                                var11.addSuppressed(var60);
                            }
                        } else {
                            zis.close();
                        }
                    }

                }
            } catch (Throwable var66) {
                var9 = var66;
                throw var66;
            } finally {
                if (fis != null) {
                    if (var9 != null) {
                        try {
                            fis.close();
                        } catch (Throwable var59) {
                            var9.addSuppressed(var59);
                        }
                    } else {
                        fis.close();
                    }
                }

            }

            System.out.println("Zip archive downloaded from Xray processed successfully.");
        } catch (IOException var68) {
            Assert.fail(var68.getMessage());
        }

    }

    protected static void downloadFeatureFile() throws IOException, InterruptedException {
        try {
            System.out.println("Started downloading feature files from Xray...");
            String jiraKeys = "";
            if (Constants.testPlan.contains(",")) {
                jiraKeys = Constants.testPlan.replace(',', ';');
            } else {
                jiraKeys = Constants.testPlan;
            }
            HttpURLConnection httpConn = xrayExportTests(jiraKeys);
            if (httpConn != null) {
                int responseCode = httpConn.getResponseCode();
                if (responseCode == 200) {
                    extractZipFromXrayResponse(httpConn);
                    httpConn.disconnect();
                    System.out.println("Feature file downloaded from Jira-Xray successfully.");
                    unzip(zipFilePath, System.getProperty("user.dir") + Constants.downloadFeatureFileLocation + "\\", "downloadXray");
                } else {
                    Assert.fail("Failed to download the feature file from Jira-Xray. HTTP code returned = " + responseCode);
                }
            }
        } catch (Exception exception) {
            Assertions.assertFalse(false, "Could not execute in JIRA:- " + exception.getMessage());
        }
    }

    private static void writeDataIntoFile(String fileLocation, String data) {
        try (PrintWriter out = new PrintWriter(fileLocation)) {
            out.println(data);
        } catch (Exception exception) {
            Assert.fail("Could not able to write in feature file:- " + exception.getMessage());
        }
    }


    protected static void deleteFeatureFiles() throws IOException {
        try {
            File directory = new File(System.getProperty("user.dir") + Constants.downloadFeatureFileLocation);
            String[] files = directory.list();
            if (files != null) {
                for (String file : files) {
                    if (file.startsWith("downloadXray") || file.startsWith("FeatureBundle")) {
                        FileUtils.forceDelete(new File(System.getProperty("user.dir") + Constants.downloadFeatureFileLocation + File.separator + file));
                        System.out.println("********Deleted Downloaded feature files from JIRA********* :- " + file);
                    }
                }
            }

        } catch (Exception e) {
            Assertions.assertFalse(true, "Unable to delete downloaded feature files:- " + e.getMessage());
        }

    }


    private static void verifyDuplicateScenarios() {
        String fileLocation = System.getProperty("user.dir") +
                Constants.downloadFeatureFileLocation + File.separator + Constants.featureFile;
        File file = new File(fileLocation);
        List<String> scenarioOutlines = new LinkedList<>();
        try {
            List<String> lines = FileUtils.readLines(file, StandardCharsets.UTF_8);
            String featureFileContent = lines.stream().map(x -> x.concat("\n")).collect(Collectors.joining(""));
            Pattern pattern = Pattern.compile("(Scenario Outline:.*)");
            Matcher matcher = pattern.matcher(featureFileContent);
            while (matcher.find()) {
                scenarioOutlines.add(matcher.group());
            }
            List<String> result = scenarioOutlines.stream()
                    .filter(e -> Collections.frequency(scenarioOutlines, e) > 1)
                    .distinct()
                    .collect(Collectors.toList());
            if (result.size() >= 1) {
                Assert.fail("******Scenario Outlines are duplicated in feature file:- " + Constants.featureFile
                        + "those are :- " + result + "******");
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }


    }


    protected static void importCucumberFeatureFilesToJIRA() throws IOException {
        verifyDuplicateScenarios();
        StringBuilder xrayIssueKeys = new StringBuilder();
        String url = Constants.jiraURL + "/rest/raven/1.0/import/feature?projectKey=" + Constants.projectKey;
        try (CloseableHttpClient client = getHTTPClientObject()) {
            HttpPost httpPost = new HttpPost(url);
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.addBinaryBody("file", new File(System.getProperty("user.dir") +
                    File.separator + Constants.featureFile));
            HttpEntity multipart = builder.build();
            String decodedPassword = decodeString(Constants.password);
            httpPost.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpPost.setEntity(multipart);
            CloseableHttpResponse response = client.execute(httpPost);
            String responseJSON = EntityUtils.toString(response.getEntity());
            JSONArray jsonArray = new JSONArray(responseJSON);

            for (int i = 0; i < jsonArray.length(); ++i) {
                org.json.JSONObject jsonObject = jsonArray.getJSONObject(i);
                xrayIssueKeys.append("JIRA Key->" + jsonObject.get("key").toString() + "\n");
            }
            System.out.println("Response Code : " + response.getStatusLine().getStatusCode());
            System.out.println("Xray Issue Keys :- \n" + xrayIssueKeys);
        } catch (Exception exception) {
            Assert.fail("Unable to upload feature file to Jira:- " + exception.getMessage());
        }
    }


    protected static void linkUserStoryToTests() {
        String userStory = Constants.userStoryIssue;
        String tests = Constants.testsUserStoryLinking;
        try {
            String[] testIssues = tests.split(",");
            for (String issue : testIssues) {
                String url = Constants.jiraURL + "/rest/api/2/issue/" + issue.trim();
                CloseableHttpClient client = getHTTPClientObject();
                HttpPut httpPut = new HttpPut(url);
                String decodedPassword = decodeString(Constants.password);
                httpPut.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
                httpPut.setHeader("Content-Type", "application/json");
                httpPut.setHeader("charset", "utf-8");
                String body = "{\"update\":{\"issuelinks\":[{\"add\":{\"type\":{\"name\":\"Tests\",\"inward\":\"is tested by\",\"outward\":\"tests\"},\"outwardIssue\":{\"key\":" + "\"" + userStory.trim() + "\"}}}]}}";
                StringEntity entity = new StringEntity(body);
                httpPut.setEntity(entity);
                client.execute(httpPut);
                // Create a custom response handler
                ResponseHandler<String> responseHandler = response -> {
                    int status = response.getStatusLine().getStatusCode();
                    if (status >= 200 && status < 300) {
                        System.out.println("User Story:-" + userStory + " linked to tests" + issue);
                        HttpEntity httpEntity = response.getEntity();
                        return httpEntity != null ? EntityUtils.toString(httpEntity) : null;
                    } else {
                        System.out.println("Error - User Story:-" + userStory + " is not linked to tests" + issue);
                        throw new ClientProtocolException("Unexpected response status: " + status);
                    }
                };
                System.out.println("Linked to test key:-" + issue.trim());
                client.close();
            }

        } catch (
                Exception e) {
            Assert.fail("********Unable to link user story:-" + userStory + " to tests :-*******");
        }

    }

    protected static void changeIsuueSummary(String issueId, String summary, String description) {
        try {
            String summaryChange = "{ \"fields\":{\"summary\":\"XRAY->" + summary + "\",\"description\":\"Report Portal URL:- " + description + "\"} }";
            String url = Constants.jiraURL + "/rest/api/2/issue/" + issueId;
            CloseableHttpClient client = getHTTPClientObject();
            HttpPut httpPut = new HttpPut(url);
            String decodedPassword = decodeString(Constants.password);
            httpPut.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpPut.setHeader("Content-Type", "application/json");
            httpPut.setHeader("charset", "utf-8");
            StringEntity entity = new StringEntity(summaryChange);
            httpPut.setEntity(entity);
            client.execute(httpPut);
            // Create a custom response handler
            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity httpEntity = response.getEntity();
                    return httpEntity != null ? EntityUtils.toString(httpEntity) : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };
            client.close();

        } catch (
                Exception e) {
            Assert.fail("********Unable to change summary for Jira Issue:-" + issueId + "*******");
        }

    }

    protected static void createTestExecution() {
        File file = new File(getCucumberReportFileName());

        try {
            List<String> lines = FileUtils.readLines(file, StandardCharsets.UTF_8);
            String testResults = lines.stream().collect(Collectors.joining(""));
            String url = Constants.jiraURL + "/rest/raven/1.0/import/execution/cucumber";
            CloseableHttpClient client = getHTTPClientObject();
            HttpPost httpPost = new HttpPost(url);
            String decodedPassword = decodeString(Constants.password);
            httpPost.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpPost.setHeader("Content-Type", "application/json");
            httpPost.setHeader("charset", "utf-8");
            StringEntity entity = new StringEntity(testResults);
            httpPost.setEntity(entity);
            client.execute(httpPost);
            // Create a custom response handler
            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                System.out.println("Status code is" + status);
                if (status >= 200 && status < 300) {
                    HttpEntity httpEntity = response.getEntity();
                    return httpEntity != null ? EntityUtils.toString(httpEntity) : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };
            client.close();

        } catch (Exception e) {
//            Assert.fail("********Unable to create Test execution in XRAY*******" + e.getMessage());
        }

    }

    private static String getTestRuns(String testKey) throws IOException, InterruptedException {
        String url = Constants.jiraURL + "/rest/raven/1.0/api/test/" + testKey + "/testexecutions";
        return getRequest(url.replaceAll("@", ""));
    }

    public static String getLatestTestRun() throws IOException, InterruptedException {
        String response = getTestRuns(Constants.functionalityTags.split(",")[0].replaceAll("@", ""));
        JSONArray jsonArray = new JSONArray(response);
        return (String) jsonArray.getJSONObject(jsonArray.length() - 1).get("key");
    }

    protected static void maptestExecutionToTestPlan(String testExecution) {
        try {
            String body = "{\"add\":[\"" + testExecution + "\"]}";
            String url = Constants.jiraURL + "/rest/raven/1.0/api/testplan/" + Constants.testPlan + "/testexecution";
            CloseableHttpClient client = getHTTPClientObject();
            HttpPost httpPost = new HttpPost(url);
            String decodedPassword = decodeString(Constants.password);
            httpPost.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpPost.setHeader("Content-Type", "application/json");
            httpPost.setHeader("charset", "utf-8");
            StringEntity entity = new StringEntity(body);
            httpPost.setEntity(entity);
            client.execute(httpPost);
            // Create a custom response handler
            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity httpEntity = response.getEntity();
                    return httpEntity != null ? EntityUtils.toString(httpEntity) : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };
            client.close();

        } catch (Exception e) {
            Assert.fail("********Unable to Map Test Set to Test Plan in XRAY*******");
        }
    }


    protected static void pushAttachments(String testExecutionKey, String attachmentPath) throws IOException {
        System.out.println("******************************* Adding attachment to test execution *****************************");
        String url = Constants.jiraURL + "/rest/api/latest/issue/" + testExecutionKey + "/attachments";
        CloseableHttpClient client = getHTTPClientObject();
        HttpPost httpPost = new HttpPost(url);
        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
        builder.addBinaryBody("file", new File(attachmentPath));
        HttpEntity multipart = builder.build();
        httpPost.setHeader("X-Atlassian-Token", "nocheck");
        String decodedPassword = decodeString(Constants.password);
        httpPost.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
        httpPost.setEntity(multipart);
        CloseableHttpResponse response = client.execute(httpPost);
        if (response.getStatusLine().getStatusCode() == 200) {
            System.out.println("Attachment added to test execution with issue key: " + testExecutionKey);
        } else {
            System.out.println("Addition of attachment to test execution with key:" + testExecutionKey + "failed. Please check manually.");
        }
        client.close();
    }

    protected static void compressCucumberHtmlReports() throws IOException {
        // Checks test-results folder exists or not
        String testResultsFolder = System.getProperty("user.dir") + "/test-results";
        if (!Files.exists(Paths.get(testResultsFolder))) {
            // If folder is not exists then it will create
            new File(System.getProperty("user.dir") + "/test-results").mkdir();
        }
        // Path of cucumber report with time stamp
        new File(System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" + getCucumberReportFileName().split("xray.")[1].replace(".json", "")).mkdir();
        String cucumeberReportsDestination = System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" + getCucumberReportFileName().split("xray.")[1].replace(".json", "");
        // Specifying cucumber-html-reports folder location under target folder
        File cucumberHtmlReports = new File(System.getProperty("user.dir") + "/target/cucumber-html-reports");
        for (File file : cucumberHtmlReports.listFiles()) {
            //Checks list of cucumber-html-reports folder contains folders/files
            if (file.isDirectory()) {
                String directory = cucumeberReportsDestination + File.separator + file.getName();
                if (!Files.exists(Paths.get(cucumeberReportsDestination + File.separator + file.getName()))) {
                    new File(cucumeberReportsDestination + File.separator + file.getName()).mkdir();
                }
                // Copies folder to destination folder
                FileUtils.copyDirectory(file, new File(cucumeberReportsDestination + File.separator + file.getName()));
            } else if (file.isFile()) {
                // Copies file to destination folder
                if (file.getName().contains("report-feature_src-test-java-channels-xray-"
                        + getCucumberReportFileName().split("xray.")[1].replace(".json", "") + "-feature")) {
                    FileUtils.copyFile(file, new File(cucumeberReportsDestination + File.separator + file.getName()));
                }
            }
        }
        //Zipping a directory which contains execution cucumber report files
        ZipUtil.pack(new File(System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" +
                        getCucumberReportFileName().split("xray.")[1].replace(".json", ""))
                , new File(System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" +
                        getCucumberReportFileName().split("xray.")[1].replace(".json", "") + ".zip"));
        // After compressing it will delete directory
        FileUtils.deleteDirectory(new File(System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" +
                getCucumberReportFileName().split("xray.")[1].replace(".json", "")));


    }



    private static int getExamplesCount(String testCaseValue) {
        int examplesCount = 0;
        List<String> testCaseArray = Arrays.asList(testCaseValue.split("\\\\n"));
        int count = 0;
        int scenarioOutLineBoolean = testCaseArray.stream().filter(x -> x.contains("Examples")).collect(Collectors.toList()).size();
        if (scenarioOutLineBoolean == 1) {
//            List<String> examples = Arrays.asList(testCaseValue.split("\\\\n\\\\tExamples: ")[1].split("\\\\n"));
            List<String> examples = Arrays.asList(testCaseValue.split("Examples:")[1].split("\\\\n"));
            examplesCount = (examples.stream().filter(x -> x.contains("|")).collect(Collectors.toList()).size()) - 1;
//            List<String> examples = Arrays.asList(testCaseValue.split("\\\\n\\\\tExamples: ")[1].split("\\\\n\\\\t\\\\t"));
//            examplesCount = (examples.stream().filter(x -> x.length() != 0).collect(Collectors.toList()).size()) - 1;
        }
        return examplesCount;
    }

    private static String getTestValue(String key) throws IOException, InterruptedException {
        String url = Constants.jiraURL + "/rest/raven/1.0/api/test?keys=" + key;
        return getRequest(url);
    }

    private static List<String> getLabels(String key) throws IOException, ParseException, InterruptedException {
        String url = Constants.jiraURL + "/rest/api/2/search?jql=issuekey=" + key;
        String response = getRequest(url);
        JSONParser jsonParser = new JSONParser();
        JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
        Object issuesObject = responseJsonObject.get("issues");
        ArrayList issuesArray = (ArrayList) issuesObject;
        HashMap fieldsMap = (HashMap) issuesArray.get(0);
        HashMap labels = (HashMap) fieldsMap.get("fields");
        return (List<String>) labels.get("labels");
    }

    private static void updateLabel(String add, String remove, String issueId) {
        try {
            String updateLabel = "{\"update\":{\"labels\":[{\"add\":\"x\"},{\"remove\":\"y\"}]}}";
            String addupdateLabel = updateLabel.replace("x", add);
            String removeupdateLabel = addupdateLabel.replace("y", remove);
            String url = Constants.jiraURL + "/rest/api/2/issue/" + issueId;
            CloseableHttpClient client = getHTTPClientObject();
            HttpPut httpPut = new HttpPut(url);
            String decodedPassword = decodeString(Constants.password);
            httpPut.setHeader("Authorization", getBasicAuthKey(Constants.userName, decodedPassword));
            httpPut.setHeader("Content-Type", "application/json");
            httpPut.setHeader("charset", "utf-8");
            StringEntity entity = new StringEntity(removeupdateLabel);
            httpPut.setEntity(entity);
            client.execute(httpPut);
            // Create a custom response handler
            ResponseHandler<String> responseHandler = response -> {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity httpEntity = response.getEntity();
                    return httpEntity != null ? EntityUtils.toString(httpEntity) : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            };
            client.close();

        } catch (
                Exception e) {
            Assert.fail("********Unable to change label for Jira Issue:-" + issueId + "*******");
        }
    }

    private static List<String> getAllTestPlansFromExternalId() throws IOException, ParseException, InterruptedException {
        List<String> testPlanIds = new LinkedList<>();
        String externalId = Constants.externalId;
        String url = "https://jira.agile.bns/rest/api/2/search?jql=type%20=%20%22Test%20Plan%22%20AND%20%22External%20issue%20ID%22~" + externalId;
        String response = getRequest(url);
        JSONParser jsonParser = new JSONParser();
        JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
        Object issuesObject = responseJsonObject.get("issues");
        ArrayList issuesArray = (ArrayList) issuesObject;
        for (int i = 0; i < issuesArray.size(); i++) {
            HashMap testPlanKey = (HashMap) issuesArray.get(i);
            testPlanIds.add((String) testPlanKey.get("key"));
        }
        return testPlanIds;
    }

    protected static void updateAutoTestTotal() throws IOException, ParseException, InterruptedException {
        JiraBNS labels = new JiraBNS();
        List<String> testPlans = getAllTestPlansFromExternalId();
        for (int j = 0; j < testPlans.size(); j++) {
            System.out.println("Test Plan iS:-" + testPlans.get(j));
            List<String> keys = labels.getAllTestsFromTestPlan(testPlans.get(j));
            for (String key : keys) {
                String testCaseResponse = getTestValue(key);
                int count = getExamplesCount(testCaseResponse);
                if (count != 0) {
                    List<String> labelValues = getLabels(key);
                    List<String> autoTestLabels = labelValues.stream().filter(x -> x.contains("AUTOTESTTOTAL#") == true).collect(Collectors.toList());
                    if (autoTestLabels.size() == 0) {
                        updateLabel("AUTOTESTTOTAL#" + count, "", key);
                        System.out.println("AUTOTESTTOTAL#" + count + " For key:- " + key);
                    } else if (autoTestLabels.size() == 1) {
                        if (!autoTestLabels.contains("AUTOTESTTOTAL#" + count)) {
                            updateLabel("AUTOTESTTOTAL#" + count, autoTestLabels.get(0), key);
                            System.out.println("AUTOTESTTOTAL#" + count + " For key:- " + key);
                        } else {
                            System.out.println("AUTOTESTTOTAL#" + count + " is as expected for the key:- " + key);
                        }
                    } else if (autoTestLabels.size() > 1) {
                        for (int i = 0; i < autoTestLabels.size(); i++) {
                            updateLabel("", autoTestLabels.get(i), key);
                        }
                        updateLabel("AUTOTESTTOTAL#" + count, "", key);
                        System.out.println("AUTOTESTTOTAL#" + count + " For key:- " + key);
                    } else {
                        System.out.println("Check this scenario for Key:- " + key);
                    }
                } else {
                    System.out.println("Scenario is MANUAL key:- " + key);
                }
            }
        }

    }

    private static String getTestSetName(String testSetKey) throws IOException, ParseException, InterruptedException {
        String url = Constants.jiraURL + "/rest/api/2/search?jql=issuekey=" + testSetKey;
        String response = getRequest(url);
        JSONParser jsonParser = new JSONParser();
        JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
        Object issuesObject = responseJsonObject.get("issues");
        ArrayList issuesArray = (ArrayList) issuesObject;
        HashMap fieldsMap = (HashMap) issuesArray.get(0);
        HashMap testKeys = (HashMap) fieldsMap.get("fields");
        return (String) testKeys.get("summary");
    }

    protected static void getTestSetAutomationManualCount() throws IOException, ParseException, InterruptedException {
        List<String> testSetKeys = Arrays.asList(Constants.testSetKeys.split(","));
        HashMap<String, HashMap<String, String>> testSetInformation = new HashMap<>();
        String testSetName = null;
        for (int i = 0; i < testSetKeys.size(); i++) {
            testSetName = testSetKeys.get(i) + " - " + getTestSetName(testSetKeys.get(i));
            HashMap<String, String> testInformation = new HashMap<>();
            int manualCount = 0;
            int automationCount = 0;
            String url = Constants.jiraURL + "/rest/api/2/search?jql=issue%20in%20testSetTests(" + testSetKeys.get(i) + ")";
            String response = getRequest(url);
            JSONParser jsonParser = new JSONParser();
            JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
            Object issuesObject = responseJsonObject.get("issues");
            ArrayList issuesArray = (ArrayList) issuesObject;
            testInformation.put("Total XRAY Issues", String.valueOf(issuesArray.size()));
            for (int j = 0; j < issuesArray.size(); j++) {
                HashMap testInfo = (HashMap) issuesArray.get(j);
                String testType = (String) ((HashMap) ((HashMap) testInfo.get("fields")).get("customfield_11101")).get("value");
                String testKey = (String) testInfo.get("key");
                String testCaseResponse = getTestValue(testKey);
                int count = getExamplesCount(testCaseResponse);
                boolean labelsManualBoolean = (((List<String>) ((HashMap) testInfo.get("fields")).get("labels")).stream().anyMatch(x -> x.contains("MANUAL")));
                if (testType.equals("Scenario") && labelsManualBoolean) {
                    manualCount = manualCount + 1;
                } else if (testType.equalsIgnoreCase("Manual")) {
                    manualCount = manualCount + 1;
                } else if (testType.equals("Scenario Outline") && labelsManualBoolean) {
                    manualCount = manualCount + count;
                } else if (testType.equals("Scenario")) {
                    automationCount = automationCount + 1;
                } else if (testType.equals("Scenario Outline")) {
                    automationCount = automationCount + count;
                }
            }
            testInformation.put("Total test cases", String.valueOf(manualCount + automationCount));
            testInformation.put("Manual", String.valueOf(manualCount));
            testInformation.put("Automation", String.valueOf(automationCount));
            testSetInformation.put(testSetName, testInformation);

        }
        testSetInformation.forEach((key, value) -> System.out.println(key + value));
    }

    private List<String> getAllTestsFromTestPlan(String testPlan) throws IOException, ParseException, InterruptedException {
        String url = Constants.jiraURL + "/rest/api/2/search?jql=issuekey=" + testPlan;
        String response = getRequest(url);
        JSONParser jsonParser = new JSONParser();
        JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
        Object issuesObject = responseJsonObject.get("issues");
        ArrayList issuesArray = (ArrayList) issuesObject;
        HashMap fieldsMap = (HashMap) issuesArray.get(0);
        HashMap testKeys = (HashMap) fieldsMap.get("fields");
        return (List<String>) testKeys.get("customfield_11125");
    }


//    Get details from JQL query

    public void getTestCaseDetails(String scenarioName) throws IOException, ParseException {
        try {
            String url = Constants.jiraURL + "/rest/api/2/search?jql=type = Test AND text~\"" + scenarioName + "\"";
            String encodedString = UrlEscapers.urlFragmentEscaper().escape(url);
            String response = getRequest(encodedString);
            JSONParser jsonParser = new JSONParser();
            JSONObject responseJsonObject = (JSONObject) jsonParser.parse(response);
            Object issuesObject = responseJsonObject.get("issues");
            ArrayList issuesArray = (ArrayList) issuesObject;
            HashMap testCaseKey = (HashMap) issuesArray.get(0);
            String testCaseKeyValue = (String) testCaseKey.get("key");
            HashMap fieldsMap = (HashMap) testCaseKey.get("fields");
            ArrayList issueLinksArrays = (ArrayList) fieldsMap.get("issuelinks");
            HashMap issueLinksMaps = (HashMap) issueLinksArrays.get(0);
            HashMap inwardMaps = (HashMap) issueLinksMaps.get("inwardIssue");
            if (inwardMaps != null) {
                String userStory = (String) inwardMaps.get("key");
                testCaseData.add("|" + scenarioName + "           |" + testCaseKeyValue + "            |" + userStory + "|");
//                System.out.println("|" + scenarioName + "           |" + testCaseKeyValue + "            " + userStory + "|");
            } else {
                HashMap outwardIssues = (HashMap) issueLinksMaps.get("outwardIssue");
                String userStory = (String) outwardIssues.get("key");
                testCaseData.add("|" + scenarioName + "           |" + testCaseKeyValue + "            |" + userStory + "|");
//                System.out.println("|" + scenarioName + "           |" + testCaseKeyValue + "            |" + userStory + "|");
            }

        } catch (Exception e) {
            testCaseData.add("|" + scenarioName + "           |Not Found               |Not Found|");
//            System.out.println("|" + scenarioName + "           |Not Found|               Not Found");
        }
        setTestCaseData(testCaseData);

    }

    public void printTestCaseData() {
        getTestCaseData().stream().forEach(System.out::println);
    }

    public void getTestRunStatus(String issueKey) throws IOException, ParseException {
        try {
            String url = Constants.jiraURL + "/rest/raven/1.0/api/test/" + issueKey.trim() + "/testruns";
            String encodedString = UrlEscapers.urlFragmentEscaper().escape(url);
            String response = getRequest(encodedString);
            JSONArray jsonArray = new JSONArray(response);
            org.json.JSONObject jsonObject = jsonArray.getJSONObject(1);
            String status = jsonObject.get("status").toString();
            testCaseData.add("|" + issueKey + "           |" + status + " |");
        } catch (Exception e) {
            testCaseData.add("|" + issueKey + "           |Not Found               |");
        }

    }
}