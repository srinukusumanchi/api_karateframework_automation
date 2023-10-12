package smoke.testDataCreationFeature;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevModeTestData {

    // ------------------------    Test data  -----------------------

    //    SOL Test Data
    @Karate.Test
    Karate sanitySOLTestData() {
        System.setProperty("karate.env", "Sanity-SOL");
        return Karate.run("classpath:smoke/testDataCreationFeature").tags("@Sanity-SOL");
    }


    // AS400 Test Data
    @Karate.Test
    Karate sanityAS400TestData() {
        System.setProperty("karate.env", "Sanity-AS400");
        return Karate.run("classpath:smoke/testDataCreationFeature").tags("@Sanity-AS400");
    }

    //    NOVA Test Data
    @Karate.Test
    Karate sanityNOVATestData() {
        System.setProperty("karate.env", "Sanity-NOVA");
        return Karate.run("classpath:smoke/testDataCreationFeature").tags("@Sanity-NOVA2");
    }

    @Karate.Test
    Karate sanityORNTestData() {
        System.setProperty("karate.env", "Sanity-ORN");
        return Karate.run("classpath:smoke/testDataCreationFeature").tags("@International_Money_Transfer_ORN_Base_TestData_6087");
    }

    // ------------------------ End of Test data  -----------------------
}