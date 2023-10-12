package channels.sol;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevMode {
    // It runs all test cases from AS400 feature
    @Karate.Test
    Karate testSample() {
        System.setProperty("karate.env", "SOL");
        return Karate.run("SOL").relativeTo(getClass());
    }

    // It will check tags under AS400 feature file
    @Karate.Test
    Karate testTags() {
        System.setProperty("karate.env", "SOL");
        return Karate.run("SOL").tags("@D2DDigital,@D2DFund").relativeTo(getClass());
    }

    // It will check tags under specific location
    @Karate.Test
    Karate testFullPath() {
        System.setProperty("karate.env", "SOL");
        return Karate.run("classpath:channels/sol").tags("@NTCMortgageAcquisitionSOL_MultipleAccounts_5152_Pos_Neg_TestData");

    }
}