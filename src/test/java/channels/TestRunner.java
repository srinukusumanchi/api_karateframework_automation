package channels;

import baseclass.BasePage;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.RunnerOptions;
import jira.constants.Constants;
import jira.xray.JiraBNS;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.*;
import org.slf4j.Logger;
import reports.utils.LogHelper;
import reports.karate.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

import static org.junit.Assert.assertTrue;
import static reports.reporting.reportportal.Utils.getReportPortalURL;

/**
 * @author pthomas3
 */
// important: do not use ) !
//@CucumberOptions(features = {"src/test/java/Features/Disposition and suppression-AS400.feature.feature.feature.feature.feature.feature.feature.feature.feature.feature"}, tags = "@MiniPmtInsurance")
//@RunWith(Cucumber.class)
//@RunWith(Karate.class)
public class TestRunner extends JiraBNS {
    /* Initialize the logger */
    private static final Logger log = LogHelper.getLogger();

    public TestRunner() throws IOException {
        super();
    }

    @BeforeAll
    static void beforeAllTestCases() throws IOException, InterruptedException, ParseException {
//        It comes to this method before all the tests started
        if (Constants.userStoryLinking) {
            linkUserStoryToTests();
            System.out.println("***************JVM Stops as Jira import feature flag is true****************");
            System.exit(0);
        }

        //        It comes to this method before all the tests started
        if (Constants.importFeaturfileToJira) {
            importCucumberFeatureFilesToJIRA();
            System.out.println("***************JVM Stops as Jira import feature flag is true****************");
            System.exit(0);
        }
        if (Constants.editAutoTestTotalToXRAY) {
            updateAutoTestTotal();
            System.exit(0);
        }
        if (Constants.automationManulCount) {
            getTestSetAutomationManualCount();
            System.exit(0);
        }
        if (Constants.deleteFeatureFiles) {
            deleteFeatureFiles();
        }
        if (Constants.downloadFeatureFile) {
            downloadFeatureFile();
            System.out.println("*****************Executing in JIRA***************************");
        } else {
            System.out.println("*****************Executing in Local***************************");
        }
        if (Constants.jiraExecution) {
//            Delete Cucumber html reports folder
            new BasePage().deleteDirectory(System.getProperty("user.dir") + "/target/cucumber-html-reports");

//            Delete Surefire-reports reports folder
            new BasePage().deleteDirectory(System.getProperty("user.dir") + "/target/surefire-reports");

        }
    }

    @BeforeEach
    void beforeEachTestCase() {
//    It comes to this method before each test case starts
    }

    @AfterAll
    static void afterAllTestCases() throws Exception {
//        It comes to this method after all the tests ended.
        if (Constants.jiraExecution) {
            createTestExecution();
            String testExecutionKey = getLatestTestRun();
            changeIsuueSummary(testExecutionKey, System.getProperty("karate.env"), getReportPortalURL());
            maptestExecutionToTestPlan(testExecutionKey);
            compressCucumberHtmlReports();
            pushAttachments(testExecutionKey, System.getProperty("user.dir") + "/test-results/cucumber-html-reports-zip-" +
                    getCucumberReportFileName().split("xray.")[1].replace(".json", "") + ".zip");

        }

    }

    @AfterEach
    void afterEachTestCase() {
//    It comes to this method after each test case ends
    }

    //    KarateStats stats;
    /*@Test
    public void testParallel() throws IOException {

        String project = Constants.projectFunctionality;
        System.setProperty("karate.env", project);
        String tags = Constants.functionalityTags;
        Results results = com.intuit.karate.Runner.path("classpath:smoke/validationFeatures").tags(tags).parallel(1);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }*/

    @Test
    void testParallel() throws IOException {
        log.info("+------------------------------------+");
        log.info("| Starting Functional Test Execution |");
        log.info("+------------------------------------+");
        String project = Constants.projectFunctionality;
        System.setProperty("karate.env", project);
        String tags = Constants.functionalityTags;
        List<String> xrayTag = new LinkedList<>();
        xrayTag.add(tags);

        List<String> features = new LinkedList<>();
        features.add("src\\test\\java\\channels");
        RunnerOptions options = RunnerOptions.fromAnnotationAndSystemProperties(features, xrayTag, getClass());
        Results results = Runner.parallel(options.getTags(),
                options.getFeatures(),
                options.getName(),
                Collections.singletonList(new ReportportalHook()),
                1,
                null);
        generateReport(results.getReportDir());
        int countFeatures = results.getFeatureCount();
        int countScenarios = results.getScenarioCount();
        if (countFeatures == 0 && countScenarios == 0) {
            log.error("+-----------------------------------------------+");
            log.error("| DID NOT FIND ANY FEATURES OR SCENARIOS TO RUN |");
            log.error("|       FEATURES = {}       SCENARIOS = {}      |", countFeatures, countScenarios);
            log.error("+-----------------------------------------------+");
        } else if (results.getFailCount() >= 1) {
            assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        } else {
            log.info("Execution completed for FEATURES = {}   and   SCENARIOS = {}", countFeatures, countScenarios);
        }
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        JiraBNS.setCucumberJSONFileName(jsonPaths.get(jsonFiles.size() - 1));
        String project = Constants.projectFunctionality;
        Configuration config = new Configuration(new File("target"), project);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

    }
}

