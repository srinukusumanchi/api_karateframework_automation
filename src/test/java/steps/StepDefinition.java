package steps;

import baseclass.BasePage;
import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;
import feature.utilities.DataBaseData;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.TrustAllStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.util.EntityUtils;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import webpages.*;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static webpages.APPStudio.*;

public class StepDefinition extends BasePage {


    public List<Map<String, String>> ddrRecords = null;
    public List<Map<String, String>> paConfigRecords = null;
    private static WebDriver guiDriver;
    public static int count = 0;

    public StepDefinition() {
        super();
    }

    private static HttpClient createAcceptSelfSignedCertificateClient()
            throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException {

        return HttpClients
                .custom()
                .setSSLContext(new SSLContextBuilder().loadTrustMaterial(null, TrustAllStrategy.INSTANCE).build())
                .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE)
                .build();//       return httpClient;

    }


    public static void main(String[] args) throws IOException, InterruptedException {
        StepDefinition stepDefinition = new StepDefinition();
        stepDefinition.runD2DActivity();
    }


    public static WebDriver getGuiDriver() {
        return guiDriver;
    }

    public static void setGuiDriver(WebDriver guiDriver) {
        StepDefinition.guiDriver = guiDriver;
    }

    /**
     * This function will check valid NBA response
     *
     * @param request - Passing Request body from karate framework
     * @return boolean - It returns true if valid response is returned
     */
    private boolean checkNbaRepsonse(String request, String offerCode) throws KeyStoreException, NoSuchAlgorithmException, KeyManagementException, IOException {
        boolean flag = false;

//        Ignoring SSL Certificate error
        try {
            HttpClient httpClient = createAcceptSelfSignedCertificateClient();
//            Retrives url based on channel
            String url = getURL();
//            Creating post request object
            HttpPost httpPostObject = new HttpPost(url);
//            Retrieves headers based on channel
            HttpPost httpPost = getHeaders(httpPostObject);
            StringEntity stringEntity = new StringEntity(request);
            httpPost.setEntity(stringEntity);
//            Retrieves response from HTTPClient object
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            // Read the contents of an entity and return it as a String.
            String content = EntityUtils.toString(entity);
            System.out.println("***HTTP Client Response***" + content);
//            when <NBACode> tag exists in response then assuming that we got a valid response
            System.out.println("Checking NBA Code" + content);
            if ((content.contains("<NBACode>") || content.contains("offer_code")) && content.contains(offerCode)) {
                flag = true;
            }
        } catch (NoSuchAlgorithmException | KeyStoreException | KeyManagementException | IOException e) {
            throw new RuntimeException(e);
        }
        return flag;
    }

    /**
     * This function will clear IH for CID when control group is 'Y'
     *
     * @param cid     -  Customer cid for clearing IH
     * @param request - Passing Request body from karate framework
     */
    public boolean clearInteractionHistory(String cid, String request, String offerCode) throws StaleElementReferenceException, IOException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        boolean flagToClearIH = checkNbaRepsonse(request, offerCode);
        boolean offerTriggeredOrNot = true;
        try {
            if (!flagToClearIH) {
//        Open Browser
                guiDriver = getBrowser();
//        Maximize window
                maximizeWindow();
                String url = getProperties().getProperty("pega.url");
                launchBaseURL(url);
//        Logging in  to Page
                Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
                String userName = getProperties().getProperty("pega.username");
                pega7LoginPage.enterUserName(userName);
                String password = getProperties().getProperty("pega.password");
                pega7LoginPage.enterPassword(password);
                pega7LoginPage.clickOnLoginButton();

//        Navigating to Interaction page and performing run activity
                PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
//                pegaDesignerStudio.enterSearchText("old:InteractionsHistByCustomer");
//                pegaDesignerStudio.clickOnSearchButton();
                pegaDesignerStudio.clickOnInteractionByCustomerLink();
                pegaDesignerStudio.clickOnActionsInteractionHistory();
                pegaDesignerStudio.clickOnRunInteractionHistory();
//                pegaDesignerStudio.clickOnCloseInteractionHistoryByCustomer();

//        verify offer details are is logged to IH with respect to customer
                IHbyCustomer iHbyCustomer = new IHbyCustomer();
                iHbyCustomer.clickOnSubjectId();
                iHbyCustomer.enterSubjectIdField(cid);
                iHbyCustomer.clickOnApplyChanges();
                iHbyCustomer.getIHTableData();
                offerTriggeredOrNot = iHbyCustomer.verifyOfferGenerated(offerCode);

                deleteInteractionHistory(cid);
//                pegaDesignerStudio.clickOnAggregatesRecreationForSingleCID();
//                pegaDesignerStudio.recreateAllIHAggregates(cid);
                //  Verify IH is cleared after performing delete interaction history
                switchToWindow("IH by Customer");
                verifyIHCleared(cid);

                //  Closes browser after IH is cleared for a CID
                closeBrowser();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return offerTriggeredOrNot;
    }

    public List<Map<String, String>> getDDRRecordsFromIH() {

        try {
            if (getDdrRecords() == null) {
//        Open Browser
                guiDriver = getBrowser();
//        Maximize window
                maximizeWindow();
                String url = getProperties().getProperty("pega.url");
                launchBaseURL(url);
//        Logging in  to Page
                Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
                String userName = getProperties().getProperty("pega.username");
                pega7LoginPage.enterUserName(userName);
                String password = getProperties().getProperty("pega.password");
                pega7LoginPage.enterPassword(password);
                pega7LoginPage.clickOnLoginButton();

//                Click on APP Studio
                PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
                pegaDesignerStudio.clickOnDevStudio();

                APPStudio appStudio = new APPStudio();
                appStudio.clickOnDataButton();
                appStudio.clickOnDataModel();
                appStudio.clickOnOutBoundScheduler();
                appStudio.clickOnOpenLink();
                appStudio.clickOnRecordsTab();
                ddrRecords = appStudio.getDDRRecords();
                setDdrRecords(ddrRecords);
                //  Closes browser after IH is cleared for a CID
                closeBrowser();
            } else {
                ddrRecords = getDdrRecords();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }


        return ddrRecords;
    }

    public List<Map<String, String>> getPAConfigValuesForPACCAndULOC() {

        try {
            if (getpaConfigRecords() == null) {
//        Open Browser
                guiDriver = getBrowser();
//        Maximize window
                maximizeWindow();
                String url = getProperties().getProperty("pega.url");
                launchBaseURL(url);
//        Logging in  to Page
                Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
                String userName = getProperties().getProperty("pega.username");
                pega7LoginPage.enterUserName(userName);
                String password = getProperties().getProperty("pega.password");
                pega7LoginPage.enterPassword(password);
                pega7LoginPage.clickOnLoginButton();

//                Click on APP Studio
                PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
                pegaDesignerStudio.clickOnDevStudio();

                APPStudio appStudio = new APPStudio();
                appStudio.clickOnDataButton();
                appStudio.clickOnDataModel();
                appStudio.clickOnPAConfiguration();
                appStudio.clickOnOpenLink();
                appStudio.clickOnRecordsTab();
                paConfigRecords = appStudio.getPAConfigTableValuesForPACCAndULOC();
                setpaConfigRecords(paConfigRecords);
                //  Closes browser after IH is cleared for a CID
                closeBrowser();
            } else {
                paConfigRecords = getpaConfigRecords();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return paConfigRecords;


    }

    public String getPAConfigKeyValuePairsForTheProducts(List<Map<String, String>> paConfigRecords, String primaryProductCode, String primaryProductSubCode, String startDate, String EndDate, String colName) {

        String ColValue = "";
        for (Map<String, String> KeyValMap : paConfigRecords) {
            if (KeyValMap.get("Primary Product Code").equals(primaryProductCode) && KeyValMap.get("Primary Product Sub Code").equals(primaryProductSubCode) &&
                    KeyValMap.get("Start Date").equals(startDate) && KeyValMap.get("End Date").equals(EndDate)) {

                ColValue = KeyValMap.get(colName);
                break;

            }
        }
        return ColValue;
    }


    public String getCampaignNumber(List<Map<String, String>> ddrRecords, String month, String year, String campaignCode, String channelFileName) {
        String campaignWaveNumber = null;
        List<Map<String, String>> ccFileRecords = ddrRecords.stream().filter(x -> x.get("ChannelFileName").equals(channelFileName)).collect(Collectors.toList());
        List<Map<String, String>> campaignRecords = ccFileRecords.stream().filter(x -> x.get("Campaign Code").equals(campaignCode)).collect(Collectors.toList());

        for (Map<String, String> records : campaignRecords) {
            String offerExpiryDate = changeDateFormat(records.get("Wave Expiry Date").split(" ")[0], "MM/dd/yyyy");
            if (Integer.parseInt(offerExpiryDate.split("/")[0]) == Integer.parseInt(month) &&
                    Integer.parseInt(offerExpiryDate.split("/")[2]) == Integer.parseInt(year)) {
                campaignWaveNumber = StringUtils.leftPad(records.get("Campaign Wave Number"), 2, "0");
                break;
            }
        }
        return campaignWaveNumber;
    }


    public String expiryFromDDR(List<Map<String, String>> ddrRecords, String month, String year, String campaignCode, String channelFileName) {
        String expiryDateDDR = null;
        List<Map<String, String>> ccFileRecords = ddrRecords.stream().filter(x -> x.get("ChannelFileName").equals(channelFileName)).collect(Collectors.toList());
        List<Map<String, String>> campaignRecords = ccFileRecords.stream().filter(x -> x.get("Campaign Code").equals(campaignCode)).collect(Collectors.toList());

        for (Map<String, String> records : campaignRecords) {
            String offerExpiryDate = changeDateFormat(records.get("Wave Expiry Date").split(" ")[0], "MM/dd/yyyy");
            if (Integer.parseInt(offerExpiryDate.split("/")[0]) == Integer.parseInt(month) &&
                    Integer.parseInt(offerExpiryDate.split("/")[2]) == Integer.parseInt(year)) {
                expiryDateDDR = changeDateFormat(offerExpiryDate, "yyyyMMdd");
                break;
            }
        }
        return expiryDateDDR;
    }


    public String startDateFromDDR(List<Map<String, String>> ddrRecords, String month, String year, String campaignCode, String channelFileName) {
        String startDateDDR = null;
        List<Map<String, String>> ccFileRecords = ddrRecords.stream().filter(x -> x.get("ChannelFileName").equals(channelFileName)).collect(Collectors.toList());
        List<Map<String, String>> campaignRecords = ccFileRecords.stream().filter(x -> x.get("Campaign Code").equals(campaignCode)).collect(Collectors.toList());

        for (Map<String, String> records : campaignRecords) {
            String offerExpiryDate = changeDateFormat(records.get("Wave Expiry Date").split(" ")[0], "MM/dd/yyyy");
            String offerStartDate = changeDateFormat(records.get("Wave Start Date").split(" ")[0], "MM/dd/yyyy");
            if (Integer.parseInt(offerExpiryDate.split("/")[0]) == Integer.parseInt(month) &&
                    Integer.parseInt(offerExpiryDate.split("/")[2]) == Integer.parseInt(year)) {
                startDateDDR = changeDateFormat(offerStartDate, "yyyy-MM-dd");
                break;
            }
        }
        return startDateDDR;
    }


    /**
     * This function for changing date format
     * *
     *
     * @return String - It returns changed format of date
     */
    public String changeDateFormat(String date, String format) {
        Date date1 = new Date(date);
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date1);
    }

    private void verifyIHCleared(String cid) throws IOException {
        IHbyCustomer iHbyCustomer = new IHbyCustomer();
        iHbyCustomer.clickOnActionsIHByCustomere();
        iHbyCustomer.refreshIh();
        boolean recordsRemoved = iHbyCustomer.verifyRecordsRemoved();
        if (recordsRemoved) {
            System.out.print("IH is cleared for CID" + cid);
        } else {
            System.out.print("IH is not cleared for CID" + cid);
        }
    }

    /**
     * This function will get IH records for CID
     *
     * @param cid -  Customer cid for getting IH records
     */
    public List<Map<String, String>> getIHRecordsData(String cid) throws StaleElementReferenceException, InterruptedException {
        List<Map<String, String>> ihRecords = null;
        try {
//        Open Browser
            guiDriver = getBrowser();
//        Maximize window
            maximizeWindow();
            String url = getProperties().getProperty("pega.url");
            launchBaseURL(url);
//        Logging in  to Page
            Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
            String userName = getProperties().getProperty("pega.username");
            pega7LoginPage.enterUserName(userName);
            String password = getProperties().getProperty("pega.password");
            pega7LoginPage.enterPassword(password);
            pega7LoginPage.clickOnLoginButton();

//        Navigating to Interaction page and performing run activity
            PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
//            pegaDesignerStudio.enterSearchText("old:InteractionsHistByCustomer");
//            pegaDesignerStudio.clickOnSearchButton();
            pegaDesignerStudio.clickOnInteractionByCustomerLink();
            pegaDesignerStudio.clickOnActionsInteractionHistory();
            pegaDesignerStudio.clickOnRunInteractionHistory();

//        verify offer details are is logged to IH with respect to customer
            IHbyCustomer iHbyCustomer = new IHbyCustomer();
            iHbyCustomer.clickOnSubjectId();
            iHbyCustomer.enterSubjectIdField(cid);
            iHbyCustomer.clickOnApplyChanges();
            ihRecords = iHbyCustomer.getIHTableData();

            //  Closes browser after IH is cleared for a CID
            closeBrowser();
        } catch (Exception e) {

        }
        return ihRecords;
    }

    private void deleteInteractionHistory(String cid) throws InterruptedException, IOException {
        PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
//        pegaDesignerStudio.enterSearchText("old:DeleteInteractionHistForCust");
//        pegaDesignerStudio.clickOnSearchButton();
        pegaDesignerStudio.clickOnFavorites();
        pegaDesignerStudio.clickOnDeleteInteractionByCustomerLink();
        pegaDesignerStudio.clickOnActionsDeleteInteractionHistory();
        pegaDesignerStudio.clickOnRunDeleteInteractionHistory();

        DeleteInteractionHistoryByCustomer deleteInteractionHistoryByCustomer = new DeleteInteractionHistoryByCustomer();
        deleteInteractionHistoryByCustomer.enterSubjectId(cid);
        deleteInteractionHistoryByCustomer.clickOnRunButton();
        delay(8000);

        ActivityStatusSuccess activityStatusSuccess = new ActivityStatusSuccess();
        activityStatusSuccess.verifyStatus(cid);

        closeWindow("Run");
        closeWindow("Pega Platform - Success");
        switchToWindow("Pega Dev Studio");

//        pegaDesignerStudio.clickOnCloseDeleteInteractionHistoryForCustomer();
    }

    private String getURL() {
        String url = null;
        String channel = System.getProperty("karate.env");
        if (channel.equals("AS400") || channel.equals("SOL") || channel.equals("Sanity-SOL") ||
                channel.equals("Sanity-AS400")) {
            url = properties.getProperty("webservices.soap.getNBA");
        } else if (channel.equals("NOVA") || channel.equals("Sanity-NOVA")
                || channel.equals("ORN") || channel.equals("Sanity-ORN")) {
            url = properties.getProperty("webservices.rest.getInteractions");
        }

        return url;
    }

    private void closeBrowser() {
        try {
            delay(10000);
            if (getWebDriver() != null) {
                getWebDriver().quit();
            }
        } catch (Exception e) {
//
        }

    }


    public void runD2DActivity() throws InterruptedException, IOException {
//        Open Browser
        guiDriver = getBrowser();
//        Maximize window
        maximizeWindow();
        String url = getProperties().getProperty("pega.url");
        launchBaseURL(url);
//        Logging in  to Page
        Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
        String userName = getProperties().getProperty("pega.username");
        pega7LoginPage.enterUserName(userName);
        String password = getProperties().getProperty("pega.password");
        pega7LoginPage.enterPassword(password);
        pega7LoginPage.clickOnLoginButton();

//        Navigating to Interaction page and performing run activity
        PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
        pegaDesignerStudio.enterSearchText("old:D2D_email");
        pegaDesignerStudio.clickOnSearchButton();
        pegaDesignerStudio.clickOnD2DEmailBatchLink();

        D2DEmailBatch d2DEmailBatch = new D2DEmailBatch();
        d2DEmailBatch.clickOnActions();
        d2DEmailBatch.clickOnRunButton();

        RunActivityD2DEmailBatch runActivityD2DEmailBatch = new RunActivityD2DEmailBatch();
        runActivityD2DEmailBatch.clickOnRunButton();
    }

    private HttpPost getHeaders(HttpPost httpPost) {
        String channel = System.getProperty("karate.env");
        httpPost.setHeader("Username", properties.getProperty("webservices.soap.userName"));
        httpPost.setHeader("Password", properties.getProperty("webservices.soap.password"));
        httpPost.setHeader("SOAPAction", properties.getProperty("webservices.soap.soapAction"));
        if (channel.equals("AS400") || channel.equals("SOL")) {
            httpPost.setHeader("Content-Type", "text/xml");
        } else if (channel.equals("NOVA")) {
            httpPost.setHeader("ContentType", "application/json");
        }

        return httpPost;
    }

    public void loginToPega() throws InterruptedException, IOException {
        //        Open Browser
        guiDriver = getBrowser();
//        Maximize window
        maximizeWindow();
        String url = getProperties().getProperty("pega.url");
        launchBaseURL(url);
//        Logging in  to Page
        Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
        String userName = getProperties().getProperty("pega.username");
        pega7LoginPage.enterUserName(userName);
        String password = getProperties().getProperty("pega.password");
        pega7LoginPage.enterPassword(password);
        pega7LoginPage.clickOnLoginButton();
    }

    public void deleteBulkInteractionHistory(String cid) throws InterruptedException, IOException {

        if (count == 0) {
            //        Open Browser
            guiDriver = getBrowser();
//        Maximize window
            maximizeWindow();
            String url = getProperties().getProperty("pega.url");
            launchBaseURL(url);
//        Logging in  to Page
            Pega7LoginPage pega7LoginPage = new Pega7LoginPage();
            String userName = getProperties().getProperty("pega.username");
            pega7LoginPage.enterUserName(userName);
            String password = getProperties().getProperty("pega.password");
            pega7LoginPage.enterPassword(password);
            pega7LoginPage.clickOnLoginButton();


            PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
            pegaDesignerStudio.clickOnFavorites();
            pegaDesignerStudio.clickOnDeleteInteractionByCustomerLink();
            pegaDesignerStudio.clickOnActionsDeleteInteractionHistoryForIHClear();
            pegaDesignerStudio.clickOnDeleteInteractionHistoryForIHClear();

            count = count + 1;
        }
        DeleteInteractionHistoryByCustomer deleteInteractionHistoryByCustomer = new DeleteInteractionHistoryByCustomer();
        deleteInteractionHistoryByCustomer.enterSubjectId(cid);
        deleteInteractionHistoryByCustomer.clickOnRunButton();
        delay(8000);
        ActivityStatusSuccess activityStatusSuccess = new ActivityStatusSuccess();
        activityStatusSuccess.verifyStatus(cid);
    }

    public void recreateAggregatesFor4DD() throws InterruptedException, IOException {
        PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
        pegaDesignerStudio.clickOnAggregatesRecreation();
    }

    public void recreateAggregatesAfterClearingIH() throws InterruptedException, IOException {
        PegaDesignerStudio pegaDesignerStudio = new PegaDesignerStudio();
        pegaDesignerStudio.clickOnAggregatesRecreationAfterClearingIH();
    }


    public String getOIISegmentationCLILogicValue(String offerCode, String cid, String fieldValue,
                                                  String testDatalocation, String testDataFileName,
                                                  String testDataSheetname) throws FilloException, IOException, ParseException {
        String doNotSolictFlag = "N";
        String nonQuebecFlag = "N";
        String scotiaCardFlag = "N";
        String solLoginFlag = "N";
        String mobLoginFlag = "N";


        String doNotSolictFlagDatabase = new DataBaseData().readValue("Select DO_NOT_SOLICIT_F from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (doNotSolictFlagDatabase != null) {
            doNotSolictFlagDatabase = doNotSolictFlagDatabase.trim();
        } else {
            doNotSolictFlagDatabase = "null";
        }
        String nonQuebecDatabase = new DataBaseData().readValue("Select PRIM_PROV_CD from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (nonQuebecDatabase != null) {
            nonQuebecDatabase = nonQuebecDatabase.trim();
        } else {
            nonQuebecDatabase = "null";
        }

        String strDatabase = null;
        List<Map<String, Object>> scotiaCardDatabase = new DataBaseData().readRows("SELECT C.SCD_NUM FROM " + properties.get("dbSchema") + ".CUST_dim A " +
                "INNER JOIN EDPPEGAT.CUST_ACCT_RLTNP_DIM B ON A.CIS_CUST_ID = B.CIS_CUST_ID " +
                "INNER JOIN EDPPEGAT.ACCT_DIM C ON B.ACCT_NUM = C.ACCT_NUM " +
                "where A.CIS_CUST_ID ='" + cid + "' AND B.ACCT_SUBSYS_ID='AC'");
        if (scotiaCardDatabase.stream().filter(x -> x.get("SCD_NUM").toString().length() == 13).collect(Collectors.toList()).size() >= 1) {
            strDatabase = scotiaCardDatabase.get(0).get("SCD_NUM").toString().trim();
        } else {
            strDatabase = "null";
        }
        String solLoginDatabase = new DataBaseData().readValue("Select SOL_LAST_LOGIN_DT from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (solLoginDatabase != null) {
            solLoginDatabase = solLoginDatabase.trim();
        } else {
            solLoginDatabase = "null";
        }

        String mobLoginDatabase = new DataBaseData().readValue("Select MOB_LAST_LOGIN_DT from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (mobLoginDatabase != null) {
            mobLoginDatabase = mobLoginDatabase.trim();
        } else {
            mobLoginDatabase = "null";
        }

        if (!doNotSolictFlagDatabase.equals("null")) {
            if (doNotSolictFlagDatabase.equals("Y")) {
                doNotSolictFlag = "Y";
            }
        }

        if (!nonQuebecDatabase.equals("null")) {
            if (!nonQuebecDatabase.equals("QC")) {
                nonQuebecFlag = "Y";
            }
        } else if (nonQuebecDatabase.equals("null")) {
            nonQuebecFlag = "Y";
        }

        if (!strDatabase.equals("null")) {
            if (strDatabase.length() == 13) {
                scotiaCardFlag = "Y";
            }
        }

        if (!solLoginDatabase.equals("null")) {
            String todayDate = getSystemDateTimeForBatch("yyyy-MM-dd");
            long dateDifference = findDifference(solLoginDatabase, todayDate);
            if (dateDifference < 30) {
                solLoginFlag = "Y";
            }
        }

        if (!mobLoginDatabase.equals("null")) {
            String todayDate = getSystemDateTimeForBatch("yyyy-MM-dd");
            long dateDifference = findDifference(mobLoginDatabase, todayDate);
            if (dateDifference < 30) {
                mobLoginFlag = "Y";
            }
        }

        Fillo fillo = new Fillo();
        Connection con = fillo.getConnection(System.getProperty("user.dir") + "/" + testDatalocation
                + "/" + testDataFileName);
        if (doNotSolictFlag.equals("N") && nonQuebecFlag.equals("Y") && scotiaCardFlag.equals("Y")) {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND DNS='" + doNotSolictFlag + "' AND NonQuebec='" + nonQuebecFlag + "' AND Scotiacard='" + scotiaCardFlag +
                    "' AND SOLLogin ='" + solLoginFlag + "' AND MOBLogin ='" + mobLoginFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        } else {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND DNS='" + doNotSolictFlag + "' AND NonQuebec='" + nonQuebecFlag + "' AND Scotiacard='" + scotiaCardFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        }

    }

    public String getOIISegmentationMortgageLogicValue(String offerCode, String cid, String fieldValue,
                                                       String testDatalocation, String testDataFileName,
                                                       String testDataSheetname) throws FilloException, IOException, ParseException {
        String hasACAccountFlag = "N";
        String solLoginFlag = "N";
        String mobLoginFlag = "N";
        String amortizationRemainFlag = "N";
        String currentBalanceAmountFlag = "N";
        String customerCountFlag = "N";

        List<Map<String, Object>> custRelationShipRows = new DataBaseData().readRows("Select ACCT_SUBSYS_ID, ACCT_NUM from " + properties.get("dbSchema") + ".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID = '" + cid + "'");
        List<Map<String, Object>> acccountrows = custRelationShipRows.stream().filter(x -> x.get("ACCT_SUBSYS_ID").toString().trim().equals("AC")).collect(Collectors.toList());
        for (Map<String, Object> acRow : acccountrows) {
            String accountNumber = acRow.get("ACCT_NUM").toString();
            String scotiaCardNumber = new DataBaseData().readValue("Select SCD_NUM from " + properties.get("dbSchema") + ".ACCT_DIM where ACCT_NUM = '" + accountNumber + "'");
            String srcAcctStatCd = new DataBaseData().readValue("Select SRC_ACCT_STAT_CD from " + properties.get("dbSchema") + ".ACCT_DIM where ACCT_NUM = '" + accountNumber + "'");
            if (scotiaCardNumber != null || srcAcctStatCd != null) {
                if (scotiaCardNumber.length() == 13 && srcAcctStatCd.trim().equals("A")) {
                    hasACAccountFlag = "Y";
                    break;
                }
            }

        }

        String solLoginDatabase = new DataBaseData().readValue("Select SOL_LAST_LOGIN_DT from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (solLoginDatabase != null) {
            solLoginDatabase = solLoginDatabase.trim();
        } else {
            solLoginDatabase = "null";
        }

        String mobLoginDatabase = new DataBaseData().readValue("Select MOB_LAST_LOGIN_DT from " + properties.get("dbSchema") + ".CUST_DIM where CIS_CUST_ID = '" + cid + "'");
        if (mobLoginDatabase != null) {
            mobLoginDatabase = mobLoginDatabase.trim();
        } else {
            mobLoginDatabase = "null";
        }

        if (!solLoginDatabase.equals("null")) {
            solLoginFlag = "Y";
        }

        if (!mobLoginDatabase.equals("null")) {
            mobLoginFlag = "Y";
        }

        List<Map<String, Object>> uoAcccountrows = custRelationShipRows.stream().filter(x -> x.get("ACCT_SUBSYS_ID").toString().trim().equals("UO")).collect(Collectors.toList());
        for (Map<String, Object> uoRow : uoAcccountrows) {
            String accountNumber = uoRow.get("ACCT_NUM").toString();
            String amortizationRemain = new DataBaseData().readValue("Select AMORTIZATION_REMAIN from " + properties.get("dbSchema") + ".ACCT_DIM where ACCT_NUM = '" + accountNumber + "'");
            if (amortizationRemain != null) {
                if (Integer.parseInt(amortizationRemain) >= 26) {
                    amortizationRemainFlag = "Y";
                    break;
                }
            } else {
                amortizationRemainFlag = "N";
            }

        }

        for (Map<String, Object> uoRow : uoAcccountrows) {
            String accountNumber = uoRow.get("ACCT_NUM").toString();
            String currentBalance = new DataBaseData().readValue("Select CRNT_BAL_AMT from " + properties.get("dbSchema") + ".ACCT_DIM where ACCT_NUM = '" + accountNumber + "'");
            if (currentBalance != null) {
                if (Float.parseFloat(currentBalance) >= 20000) {
                    currentBalanceAmountFlag = "Y";
                    break;
                }
            } else {
                currentBalanceAmountFlag = "N";
            }

        }

        if (custRelationShipRows.size() <= 2) {
            customerCountFlag = "Y";
        } else {
            customerCountFlag = "N";
        }

        Fillo fillo = new Fillo();
        Connection con = fillo.getConnection(System.getProperty("user.dir") + "/" + testDatalocation
                + "/" + testDataFileName);
        if (!(solLoginFlag.equals("N") && mobLoginFlag.equals("N")) && hasACAccountFlag.equals("Y")
                && amortizationRemainFlag.equals("Y") && currentBalanceAmountFlag.equals("Y") && customerCountFlag.equals("Y")) {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND SOLLogin='" + solLoginFlag + "' AND MOBLogin='" + mobLoginFlag + "' AND ACRecord='" + hasACAccountFlag +
                    "' AND AMORTIZATION_REMAIN ='" + amortizationRemainFlag + "' AND CRNT_BAL_AMT ='" + currentBalanceAmountFlag + "' AND CustomerCount ='" + customerCountFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        } else if (!(solLoginFlag.equals("Y") && mobLoginFlag.equals("Y")) && hasACAccountFlag.equals("N")
                && amortizationRemainFlag.equals("Y") && currentBalanceAmountFlag.equals("Y") && customerCountFlag.equals("Y")) {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND SOLLogin='" + solLoginFlag + "' AND MOBLogin='" + mobLoginFlag + "' AND ACRecord='" + hasACAccountFlag +
                    "' AND AMORTIZATION_REMAIN ='" + amortizationRemainFlag + "' AND CRNT_BAL_AMT ='" + currentBalanceAmountFlag + "' AND CustomerCount ='" + customerCountFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        } else if (!(solLoginFlag.equals("N") && mobLoginFlag.equals("N")) && hasACAccountFlag.equals("Y")
                && (amortizationRemainFlag.equals("Y") || currentBalanceAmountFlag.equals("Y") || customerCountFlag.equals("Y"))) {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND SOLLogin='" + solLoginFlag + "' AND MOBLogin='" + mobLoginFlag + "' AND ACRecord='" + hasACAccountFlag +
                    "' AND AMORTIZATION_REMAIN ='" + amortizationRemainFlag + "' AND CRNT_BAL_AMT ='" + currentBalanceAmountFlag + "' AND CustomerCount ='" + customerCountFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        } else if (!(solLoginFlag.equals("Y") && mobLoginFlag.equals("Y")) && hasACAccountFlag.equals("N")
                && (amortizationRemainFlag.equals("Y") || currentBalanceAmountFlag.equals("Y") || customerCountFlag.equals("Y"))) {
            Recordset oiiRecordSet = con.executeQuery("Select " + fieldValue + " from " + testDataSheetname + " where OfferCode = '" + offerCode +
                    "' AND SOLLogin='" + solLoginFlag + "' AND MOBLogin='" + mobLoginFlag + "' AND ACRecord='" + hasACAccountFlag +
                    "' AND AMORTIZATION_REMAIN ='" + amortizationRemainFlag + "' AND CRNT_BAL_AMT ='" + currentBalanceAmountFlag + "' AND CustomerCount ='" + customerCountFlag + "'");
            oiiRecordSet.next();
            return oiiRecordSet.getField(fieldValue);
        } else {
            return null;
        }
    }

}