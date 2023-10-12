@CIMCAMP-418 @PositiveAndNegative_TestData_4480
Feature: Create test data for Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower-4480 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease_IH_Validation_TestData @CreditLimitIncreaseAMEXSoloBorrower_IH_TestData @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Create test data for validating IH field values
    * def testDataFileName = CLItestDataFileName
      #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber


    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(5)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(80)
#     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                               |
      | "4480_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @CreditLimitIncreaseAMEXSoloBorrower_Positive_TestCases_TestData @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Create test data for Positive Test Cases
    * def testDataFileName = CLItestDataFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                       | OfferStart | OfferExpiry |
      | "4480_ISSUE = Engagement and Group = Unsecured Lending"      | "5"        | "70"        |
      | "4480_CUST_TP_CD = PSNL"                                     | "5"        | "70"        |
      | "4480_PRIM_CNTRY_CD = CA"                                    | "5"        | "70"        |
      | "4480_INDV_BRTH_DT_Equal to 18 yrs"                          | "5"        | "70"        |
      | "4480_INDV_BRTH_DT_Greater than 18 yrs"                      | "5"        | "70"        |
      | "4480_INDV_BRTH_DT_Less than 70 yrs"                         | "5"        | "70"        |
      | "4480_INDV_BRTH_DT_Equal to 70 yrs"                          | "5"        | "70"        |
      | "4480_MKT_F = Y"                                             | "5"        | "70"        |
      | "4480_Deceased_F = N"                                        | "5"        | "70"        |
      | "4480_Lang Code = E"                                         | "5"        | "70"        |
      | "4480_Lang Code = EN"                                        | "5"        | "70"        |
      | "4480_Lang Code = F"                                         | "5"        | "70"        |
      | "4480_Lang Code = FR"                                        | "5"        | "70"        |
      | "4480_Lang Code Small Case = en"                             | "5"        | "70"        |
      | "4480_Lang Code Small Case  = fr"                            | "5"        | "70"        |
      | "4480_PRIMARY_ACCT_HOLDER_FLAG = Y"                          | "5"        | "70"        |
      | "4480_SRC_ACCT_STAT_CD = 5"                                  | "5"        | "70"        |
      | "4480_ACCT_SUBSYS_ID = KS"                                   | "5"        | "70"        |
      | "4480_CLI_OFR_F =  Z"                                        | "5"        | "70"        |
      | "4480_PRD CD- AXG, SUB PRD CD -GC & CC_SCNRY_CUST_ID = Null" | "5"        | "70"        |
      | "4480_PRD CD- AXG, SUB PRD CD -GS & CC_SCNRY_CUST_ID = Null" | "5"        | "70"        |
      | "4480_PRD CD- AXS, SUB PRD CD -SC & CC_SCNRY_CUST_ID = Null" | "5"        | "70"        |
      | "4480_PRD CD- AXS, SUB PRD CD -SS & CC_SCNRY_CUST_ID = Null" | "5"        | "70"        |
      | "4480_PRD CD-AXP, SUB PRD CD -PC & CC_SCNRY_CUST_ID = Null"  | "5"        | "70"        |
      | "4480_CLI Offer Start Date Less than current date"           | "2"        | "80"        |
      | "4480_CLI Offer Start Date equal to current date"            | "1"        | "70"        |
      | "4480_CLI Offer Expiry Date greater than current date"       | "5"        | "70"        |
      | "4480_CLI Offer Expiry Date equal to current date"           | "5"        | "1"         |
      | "4480_CLI_APRVD_CR_LMT greater than CR_CRD_LMT_AMT"          | "5"        | "70"        |
      | "4480_CLI_OFR_CRNT_F = Y"                                    | "5"        | "70"        |
      | "4480_CC_STEP_LINK_F  = N"                                   | "5"        | "70"        |
      | "4480_CC_ACCT_VIP_IND  = 1"                                  | "5"        | "70"        |
      | "4480_SRC_ACCT_STAT_CD = A"                                  | "5"        | "70"        |
      | "4480_SRC_ACCT_STAT_CD = Open"                               | "5"        | "70"        |
      | "4480_SRC_ACCT_STAT_CD = Active"                             | "5"        | "70"        |
      | "4480_SRC_ACCT_STAT_CD = NULL"                               | "5"        | "70"        |
      | "4480_Indv_Brth_Dt greater than 70"                          | "5"        | "70"        |


  @CreditLimitIncrease @CreditLimitIncreaseAMEXSoloBorrower_Negative_TestCases_TestData @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Create test data for Negative Test Cases
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber


    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                 | OfferStart | OfferExpiry |
      | "N - 4480_PRIM_CNTRY_CD! = CA"                         | "5"        | "70"        |
      | "N - 4480_PRIM_CNTRY_CD = Null"                        | "5"        | "70"        |
      | "N - 4480_CUST_TP_CD != PSNL"                          | "5"        | "70"        |
      | "N - 4480_CUST_TP_CD =  Null"                          | "5"        | "70"        |
      | "N - 4480_Indv_Brth_Dtless than 18"                    | "5"        | "70"        |
      | "N - 4480_Indv_Brth_Dt Equal to Null"                  | "5"        | "70"        |
      | "N - 4480_Deceased_F = Y"                              | "5"        | "70"        |
      | "N - 4480_Deceased_F = Null"                           | "5"        | "70"        |
      | "N - 4480_LANG_CD = K"                                 | "5"        | "70"        |
      | "N - 4480_LANG_CD = NE"                                | "5"        | "70"        |
      | "N - 4480_LANG_CD = Null"                              | "5"        | "70"        |
      | "N - 4480_MKT_F = N"                                   | "5"        | "70"        |
      | "N - 4480_MKT_F = NULL"                                | "5"        | "70"        |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SP"                 | "5"        | "70"        |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SV"                 | "5"        | "70"        |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SS"                 | "5"        | "70"        |
      | "N - 4480_CLI_OFR_F =A"                                | "5"        | "70"        |
      | "N - 4480_CLI_OFR_F = Null"                            | "5"        | "70"        |
      | "N - 4480_ACCT_SUBSYS_ID = BB"                         | "5"        | "70"        |
      | "N - 4480_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" | "5"        | "70"        |
      | "N - 4480_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    | "5"        | "70"        |
      | "N - 4480_CLI_OFR_CRNT_F = N"                          | "5"        | "70"        |
      | "N - 4480_CLI_OFR_CRNT_F = Null"                       | "5"        | "70"        |
      | "N - 4480_CC_STEP_LINK_F  = Y"                         | "5"        | "70"        |
      | "N - 4480_CC_STEP_LINK_F  = Null"                      | "5"        | "70"        |
      | "N - 4480_CC_ACCT_VIP_IND  = 2"                        | "5"        | "70"        |
      | "N - 4480_CC_ACCT_VIP_IND  = 9"                        | "5"        | "70"        |
      | "N - 4480_CLI_OFR_ST_DT  null"                         | "NULL"     | "70"        |
      | "N - 4480_CLI_OFR_EXP_DT is null"                      | "5"        | "NULL"      |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = N"                | "5"        | "70"        |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = Null"             | "1"        | "70"        |


  @CreditLimitIncrease @CreditLimitIncreaseAMEXSoloBorrower_Negative_TestCases_TestData @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Create test data for Negative Test Case on future offer start date
    * def testDataFileName = CLItestDataFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber


    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = futureDateInDays(4)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(70)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                              |
      | "N - 4480_CLI_OFR_ST_DT  greater than current date" |

  @CreditLimitIncrease @CreditLimitIncreaseAMEXSoloBorrower_Negative_TestCases_TestData @4480 @SOL @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Create test data for Negative Test Case on past offer expiry date
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

        # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = dateFormat(4)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = dateFormat(3)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                             |
      | "N - 4480_CLI_OFR_EXP_DT lesser than current date" |