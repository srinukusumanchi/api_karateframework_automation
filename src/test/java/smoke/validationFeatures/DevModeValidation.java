package smoke.validationFeatures;

import com.intuit.karate.junit5.Karate;


//@CucumberOptions(features = {"src/test/java/features"}, tags = "@BRANCHCDA-3628,@BRANCHCDA-3629")
// important: do not use @RunWith(Karate.class) !
class DevModeValidation {

    // ------------------------    Validation  -----------------------
    //    SOL Validation
    @Karate.Test
    Karate sanitySOLValidation() {
        System.setProperty("karate.env", "Sanity-SOL");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-SOL");
    }


    // AS400 Validation
    @Karate.Test
    Karate sanityAS400Validation() {
        System.setProperty("karate.env", "Sanity-AS400");
        return Karate.run("classpath:smoke/validationFeatures").tags("@D2DXSell_BASE_Top1_AS400_Smoke_Validation");
    }

    //    NOVA Validation
    @Karate.Test
    Karate sanityNOVAValidation() {
        System.setProperty("karate.env", "Sanity-NOVA");
        return Karate.run("classpath:smoke/validationFeatures").tags("@CrossSellNova_Smoke");
    }

    @Karate.Test
    Karate sanityORNValidation() {
        System.setProperty("karate.env", "Sanity-ORN");
        return Karate.run("classpath:smoke/validationFeatures").tags("@Sanity-ORN");
    }

// ------------------------ End of Validation  -----------------------
}