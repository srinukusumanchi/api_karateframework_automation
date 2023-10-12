package jira.constants;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Constants {
    static Properties properties = null;
    static FileInputStream inputStream = null;

    static {
        try {
            inputStream = new FileInputStream(new File(System.getProperty("user.dir")
                    + "/src/test/java/config/application.properties"));
            properties = new Properties();
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static final String jiraURL = (String) properties.get("xray.root.url");
    public static final String testPlan = (String) properties.get("xray.issue.keys");
    public static final String userName = (String) properties.get("xray.user.name");
    public static final String password = (String) properties.get("encrypted.xray.password");
    public static final boolean downloadFeatureFile = Boolean.parseBoolean((String) properties.get("xray.download.feature.file"));
    public static final String downloadFeatureFileLocation = (String) properties.get("xray.feature.files.loc");
    public static final boolean deleteFeatureFiles = Boolean.parseBoolean((String) properties.get("xray.features.xray.cleanup"));
    public static final String projectKey = (String) properties.get("xray.project.key");
    public static final String featureFile = (String) properties.get("xray.feature.upload.files.loc");
    public static final boolean importFeaturfileToJira = Boolean.parseBoolean((String) properties.get("xray.import.features"));
    public static final boolean editAutoTestTotalToXRAY = Boolean.parseBoolean((String) properties.get("xray.edit.autotesttotal"));
    public static final String externalId = (String) properties.get("xray.econvergence.externalId");
    public static final boolean jiraExecution = Boolean.parseBoolean((String) properties.get("xray.push.result"));
    public static final String projectFunctionality = (String) properties.get("karate.report.functionality");
    public static final String functionalityTags = (String) properties.get("karate.functionality.tags");
    public static final boolean automationManulCount = Boolean.parseBoolean((String) properties.get("xray.automation.manual.count"));
    public static final String testSetKeys = (String) properties.get("xray.issues.testSet");
    public static final boolean userStoryLinking = Boolean.parseBoolean((String) properties.get("xray.add.userstories"));
    public static final String userStoryIssue = (String) properties.get("xray.issue.userstories");
    public static final String testsUserStoryLinking = (String) properties.get("xray.issue.userstories.tests");
}
