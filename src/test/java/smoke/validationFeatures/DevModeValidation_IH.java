package smoke.validationFeatures;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevModeValidation_IH {

    // ------------------------    Validation  -----------------------
    //    SOL Validation
    @Karate.Test
    Karate sanitySOLIHValidation() {
        System.setProperty("karate.env", "Sanity-SOL");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-SOL-IH");
    }


    // AS400 Validation
    @Karate.Test
    Karate sanityAS400IHValidation() {
        System.setProperty("karate.env", "Sanity-AS400");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-AS400-IH");
    }

    //    NOVA Validation
    @Karate.Test
    Karate sanityNOVAIHValidation() {
        System.setProperty("karate.env", "Sanity-NOVA");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-NOVA-IH");
    }

    @Karate.Test
    Karate sanityORNIHValidation() {
        System.setProperty("karate.env", "Sanity-ORN");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-ORN-IH");
    }

// ------------------------ End of Validation  -----------------------
}