package channels.orn;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevMode {
    // It runs all test cases from AS400 feature
    @Karate.Test
    Karate testSample() {
        System.setProperty("karate.env", "ORN");
        return Karate.run("ORN").relativeTo(getClass());
    }

    // It will check tags under AS400 feature file
    @Karate.Test
    Karate testTags() {
        System.setProperty("karate.env", "ORN");
        return Karate.run("ORN").tags("@4479NovaContextual").relativeTo(getClass());
    }

    // It will check tags under specific location
    @Karate.Test
    Karate testFullPath() {
        System.setProperty("karate.env", "ORN");
        //return Karate.run("classpath:channels/orn").tags("@Pre-ApprovedCreditLimitIncreaseAmexCLISoleBorrower_Positive_TestCases_Validation");
        return Karate.run("classpath:channels/orn").tags("@MPSAWelcomeBonus_MultipleInsights_PosNeg_ORN_TestData");
    }
}