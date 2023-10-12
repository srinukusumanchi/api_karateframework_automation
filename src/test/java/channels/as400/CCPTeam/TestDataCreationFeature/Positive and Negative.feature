@CCPTeam_TestData_CLI_CreditorInsurance_ReturnMail
Feature: Create test data for @CCPTeam_TestData_CLI_CreditorInsurance_ReturnMail

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for Positive Test Cases

    * def testDataFileName = CCPTeamTestData
    # Reading testId from Example section
    * def testId = <TestID>

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

  # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_PREF_Insertion_Database')

    Examples:
      | TestID                                     | OfferStart | OfferExpiry |
      | "AS400_CLI_Creditor_ReturnMail_TestData1"  | "3"        | "70"        |
      | "AS400_CLI_Creditor_ReturnMail_TestData2"  | "3"        | "70"        |
      | "AS400_CLI_Creditor_ReturnMail_TestData3"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData4"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData5"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData6"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData7"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData8"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData9"  | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData10" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData11" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData12" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData13" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData14" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData15" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData16" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData17" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData18" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData19" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData20" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData21" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData22" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData23" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData24" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData25" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData26" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData27" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData28" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData29" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData30" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData31" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData32" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData33" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData34" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData35" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData36" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData37" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData38" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData39" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData40" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData41" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData42" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData43" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData44" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData45" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData46" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData47" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData48" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData49" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData50" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData51" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData52" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData53" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData54" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData55" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData56" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData57" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData58" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData59" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData60" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData61" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData62" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData63" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData64" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData65" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData66" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData67" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData68" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData69" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData70" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData71" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData72" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData73" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData74" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData75" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData76" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData77" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData78" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData79" | "3"        | "70"        |
#      | "AS400_CLI_Creditor_ReturnMail_TestData80" | "3"        | "70"        |