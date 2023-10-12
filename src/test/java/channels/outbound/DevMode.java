package channels.outbound;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevMode {
    // It runs all test cases from Outbound feature
    @Karate.Test
    Karate testSample() {
        System.setProperty("karate.env", "OUTBOUND");
        return Karate.run("OUTBOUND").relativeTo(getClass());
    }

    // It will check tags under AS400 feature file
    @Karate.Test
    Karate testTags() {
        System.setProperty("karate.env", "OUTBOUND");
        return Karate.run("OUTBOUND").tags("@Testdata").relativeTo(getClass());
    }

    // It will check tags under specific location
    @Karate.Test
    Karate testFullPath() {
        System.setProperty("karate.env", "OUTBOUND");
        return Karate.run("classpath:channels/outbound").tags("@CLI_InboundOutbound_KS");
    }


}