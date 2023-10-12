package reports.reporting.reportportal;


import com.epam.reportportal.service.ReportPortal;
import com.epam.ta.reportportal.ws.model.attribute.ItemAttributesRQ;
import com.epam.ta.reportportal.ws.model.log.SaveLogRQ;
import com.intuit.karate.core.*;
import junit.framework.Assert;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import reports.utils.LogHelper;
import rp.com.google.common.base.Function;
import rp.com.google.common.base.Strings;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * The type Utils.
 * Some of the code is referred from online resources
 *
 * @author workwithprashant
 */
public class Utils {

    /* Initialize the logger */
    private static final Logger LOGGER = LogHelper.getLogger();
    private static Properties properties;
    private static File file;
    private static FileInputStream inputStream;
    private static String reportPortalURL = null;

    private Utils() {
        throw new AssertionError("No instances should exist for the class!");
    }


    public static String getReportPortalURL() {
        return reportPortalURL;
    }

    public static void setReportPortalURL(String reportPortalURL) {
        Utils.reportPortalURL = reportPortalURL;
    }

    /**
     * Send log.
     *
     * @param message the message
     * @param level   the level
     * @param file    the file
     */
    public static void sendLog(final String message, final String level, final SaveLogRQ.File file) {

        if (Strings.isNullOrEmpty(message)) {
            return;
        }
        ReportPortal.emitLog(new Function<String, SaveLogRQ>() {
            @Override
            public SaveLogRQ apply(String itemUuid) {
                SaveLogRQ rq = new SaveLogRQ();
                rq.setMessage(message);
                rq.setItemUuid(itemUuid);
                rq.setLevel(level);
                rq.setLogTime(Calendar.getInstance().getTime());
                if (file != null) {
                    rq.setFile(file);
                }
                return rq;
            }
        });
    }

    /**
     * Extract attributes set.
     *
     * @param tags the tags
     * @return the set
     */
    public static Set<ItemAttributesRQ> extractAttributes(List<Tag> tags) {
        Set<ItemAttributesRQ> attributes = new HashSet<ItemAttributesRQ>();
        tags.forEach((tag) -> {
            attributes.add(new ItemAttributesRQ(null, tag.getName()));
        });
        return attributes;
    }

    /**
     * Print step result string.
     *
     * @param stepResult the step result
     * @param stepNumber the step number
     * @return the string
     */
    static String printStepResult(StepResult stepResult, int stepNumber) {
        StringBuilder sb = new StringBuilder();
        try {
            if (stepResult.getStep().isPrint()) {
                sb.append("\n\t\t\t\t");
                sb.append(String.format("\n\tStep %d for %s\n%s %s", stepNumber, stepResult.getStep().getFeature().getNameForReport(), stepResult.getStep().getPrefix(), stepResult.getStep().getText()));
                if (stepResult.getErrorMessage() != null) {
                    sb.append("\n\t\t\t**Error**\t\n --------------------------------------\n").append(stepResult.getErrorMessage());
                }
                if (stepResult.getStepLog() != null) {
                    sb.append("\n\t\t\n --------------------------------------\n").append(stepResult.getStepLog());
                }
                sb.append("\n\t\t\t");
            }

        } catch (Exception ex) {
            LOGGER.error("Exception wile printing step result", ex);
        }
        return sb.toString();
    }

    /**
     * Gets uri.
     *
     * @param feature the feature
     * @return the uri
     */
    static String getURI(Feature feature) {
        return feature.getResource().getPath().toString();
    }

    /**
     * Print scenario result string.
     *
     * @param scenarioResult the scenario result
     * @return the string
     */
    static String printScenarioResult(ScenarioResult scenarioResult) {
        StringBuilder sb = new StringBuilder();
        try {

            sb.append("\n\t\t[");
            sb.append("\n\t\tstartTime=" + scenarioResult.getStartTime());
            sb.append("\n\t\tendTime=" + scenarioResult.getEndTime());
            sb.append("\n\t\tfailureMessageForDisplay=" + scenarioResult.getFailureMessageForDisplay());
            sb.append("\n\t\tstepResultsSize=" + scenarioResult.getStepResults().size());
            sb.append("\n\t\tscenarioName=" + scenarioResult.getScenario().getName());
            sb.append("\n\t\tscenarioNameForReport=" + scenarioResult.getScenario().getNameForReport());
            sb.append("\n\t\tscenarioKeyword=" + scenarioResult.getScenario().getKeyword());
            sb.append("\n\t\tscenarioDescription=" + scenarioResult.getScenario().getDescription());
            sb.append("\n\t\tstepResults=[");
            for (StepResult stepResult : scenarioResult.getStepResults()) {
                sb.append(Utils.printStepResult(stepResult, 0));
            }
            sb.append("\n\t\t]");

        } catch (Exception ex) {
            LOGGER.error("Exception wile printing scenario result", ex);

        }
        return sb.toString();
    }

    /**
     * Print call step result string.
     *
     * @param stepResult the step result
     * @param stepNumber the step number
     * @return the string
     */
    static String printCallStepResult(StepResult stepResult, int stepNumber) {
        StringBuilder sb = new StringBuilder();
        try {
            if (stepResult.getStep().isPrint()) {
                sb.append("\n\t\t\t");
                sb.append(String.format(String.format("\t\t\t\t  Step %d for calling feature file %%s\n%%s %%s", stepNumber), stepResult.getStep().getFeature().getNameForReport(), stepResult.getStep().getPrefix(), "\t\t\t\t  " + stepResult.getStep().getText()));
                if (stepResult.getErrorMessage() != null) {
                    sb.append("\n\t\t\t**Error**\t\n --------------------------------------\n").append(stepResult.getErrorMessage() + "\n");
                }
                if (stepResult.getStepLog() != null) {
                    sb.append("\n\t\t\n --------------------------------------\n").append(stepResult.getStepLog() + "\n");
                }
                sb.append("\n\t\t\t");
            }
        } catch (Exception ex) {
            LOGGER.error("Exception wile printing step result", ex);
        }
        return sb.toString();
    }

    /**
     * Print feature result string.
     *
     * @param featureResult the feature result
     * @return the string
     */
    static String printFeatureResult(FeatureResult featureResult) {
        StringBuffer sb = new StringBuffer();
        try {
            sb.append("[");
            sb.append("\n\tcallName=" + featureResult.getCallName());
            sb.append("\n\tscenarioCount=" + featureResult.getScenarioCount());
            sb.append("\n\tfailedCount=" + featureResult.getFailedCount());
            sb.append("\n\tresults=" + featureResult.getResults());
            sb.append("\n\tscenarioResults=[");
            for (ScenarioResult scenarioResult : featureResult.getScenarioResults()) {
                sb.append(Utils.printScenarioResult(scenarioResult));
            }
            sb.append("\n\t]");
            sb.append("\n]");
        } catch (Exception ex) {
            LOGGER.error("Exception wile printing feature result", ex);

        }
        return sb.toString();

    }

    /**
     * Print feature string.
     *
     * @param feature the feature
     * @return the string
     */
    public static String printFeature(Feature feature) {
        StringBuilder sb = new StringBuilder();
        try {
            sb.append("[");
            sb.append("\n\tname=" + feature.getName());
            sb.append("\n\tdescription=" + feature.getDescription());
            sb.append("\n\tcallTag=" + feature.getCallTag());
            sb.append("\n\tcallLine=" + feature.getCallLine());
            sb.append("\n\tnameForReport=" + feature.getNameForReport());
            sb.append("\n\tresource=" + feature.getResource());
            sb.append("\n\tags=" + feature.getTags());
            sb.append("\n\tisBackgroundPresent=" + feature.isBackgroundPresent());
            sb.append("\n]");
        } catch (Exception ex) {
            LOGGER.error("Exception wile printing feature", ex);
        }

        return sb.toString();

    }

    private static void readReportPortalProperties() {
        try {
            properties = new Properties();
            file = new File(System.getProperty("user.dir") + "/src/test/java/reportportal.properties");
            inputStream = new FileInputStream(file);
            properties.load(inputStream);
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
    }


    static String getLatestRPLaunchId() throws IOException {
        readReportPortalProperties();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String launchId = "";
        try {

            String url = properties.getProperty("rp.endpoint") + "/api/v1/" + properties.get("rp.project") + "/launch/latest?filter.eq.name=" + properties.get("rp.launch") + "&page.sort=desc";
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader("Authorization", "Bearer " + properties.getProperty("rp.uuid"));
            httpGet.setHeader("Content-Type", "application/json");
            httpGet.setHeader("charset", "utf-8");
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
            String responseJSON = httpClient.execute(httpGet, responseHandler);
            JSONParser jsonParser = new JSONParser();
            JSONObject responseJsonObject = (JSONObject) jsonParser.parse(responseJSON);
            Object issuesObject = responseJsonObject.get("content");
            ArrayList issuesArray = (ArrayList) issuesObject;
            HashMap fieldsMap = (HashMap) issuesArray.get(0);
            launchId = fieldsMap.get("id").toString();
            LOGGER.info("Report Portal launch ID: " + launchId);

        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        }
        return launchId;
    }

    protected static void generateReportPortalURL() throws IOException {
        try {
            readReportPortalProperties();
            String rpURL = properties.getProperty("rp.endpoint") + "/ui/#" + properties.getProperty("rp.project") + "/launches/all/" + getLatestRPLaunchId();
            System.out.println("********Report Portal URL**********:- " + rpURL);
            setReportPortalURL(rpURL);
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            Assert.fail("Unable to generate report portal url due to " + e.getMessage());
        }

    }
}
