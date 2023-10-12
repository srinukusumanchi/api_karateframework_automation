package channels.as400;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevMode {
    // It runs all test cases from AS400 feature
    @Karate.Test
    Karate testSample() {
        System.setProperty("karate.env", "AS400");
        return Karate.run("AS400").relativeTo(getClass());
    }

    // It will check tags under AS400 feature file
    @Karate.Test
    Karate testTags() {
        System.setProperty("karate.env", "AS400");
        return Karate.run("AS400").tags("@2423AS400_Testate").relativeTo(getClass());
    }

    // It will check tags under specific location
    @Karate.Test
    Karate testFullPath() {
        System.setProperty("karate.env", "AS400");
        return Karate.run("classpath:channels/as400").tags("@PA_CC_PositiveAndNegative_TestData_5575_AS400");
    }
}