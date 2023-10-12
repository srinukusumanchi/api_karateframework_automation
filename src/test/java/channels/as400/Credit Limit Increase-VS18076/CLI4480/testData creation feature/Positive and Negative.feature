@CIMCAMP-418 @PositiveAndNegative_TestData_4480
Feature: Create test data for Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower-4480 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_IH_Validation_TestData @4480 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower_VS18076_4480_AS400 Create test data for validating IH field values
    * def testDataFileName = CLItestDataFileName
      #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(5)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(70)

#     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                               |
      | "4480_Validate IH Record fields against Proposition" |

  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_Positive_TestCases_TestData @4480 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower_VS18076_4480_AS400 Create test data for Positive Test Cases
    * def testDataFileName = CLItestDataFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                       | OfferStart | OfferExpiry |
      | "4480_INDV_BRTH_DT_Equal to 18 yrs"                          | "1"        | "80"        |
      | "4480_INDV_BRTH_DT_Equal to 70 yrs"                          | "1"        | "80"        |
      | "4480_Lang Code = E"                                         | "1"        | "80"        |
      | "4480_Lang Code = EN"                                        | "1"        | "80"        |
      | "4480_Lang Code = F"                                         | "1"        | "80"        |
      | "4480_Lang Code = FR"                                        | "1"        | "80"        |
      | "4480_Lang Code small case = en"                             | "1"        | "80"        |
      | "4480_Lang Code small case = fr"                             | "1"        | "80"        |
      | "4480_Lang Code small case = f"                              | "1"        | "80"        |
      | "4480_Lang Code small case = e"                              | "1"        | "80"        |
      | "4480_SRC_ACCT_STAT_CD = 5"                                  | "1"        | "80"        |
      | "4480_DNS_F = Y"                                             | "1"        | "80"        |
      | "4480_DNS_F = NULL"                                          | "18"       | "60"        |
      | "4480_DNS_F = N"                                             | "22"       | "65"        |
      | "4480_PRD CD- AXG, SUB PRD CD -GC & CC_SCNRY_CUST_ID = Null" | "19"       | "70"        |
      | "4480_PRD CD- AXG, SUB PRD CD -GS & CC_SCNRY_CUST_ID = Null" | "20"       | "75"        |
      | "4480_PRD CD- AXS, SUB PRD CD -SC & CC_SCNRY_CUST_ID = Null" | "21"       | "80"        |
      | "4480_PRD CD- AXS, SUB PRD CD -SS & CC_SCNRY_CUST_ID = Null" | "22"       | "20"        |
      | "4480_PRD CD-AXP, SUB PRD CD -PC & CC_SCNRY_CUST_ID = Null"  | "23"       | "25"        |
      | "4480_CLI Offer Start Date equal to current date"            | "1"        | "35"        |
      | "4480_CLI Offer Expiry Date equal to current date"           | "39"       | "1"         |
      | "4480_SRC_ACCT_STAT_CD = A"                                  | "69"       | "24"        |
      | "4480_SRC_ACCT_STAT_CD = Open"                               | "69"       | "24"        |
      | "4480_SRC_ACCT_STAT_CD = Active"                             | "69"       | "24"        |
      | "4480_SRC_ACCT_STAT_CD = NULL"                               | "69"       | "24"        |


  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_Negative_TestCases_TestData @4480 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower_VS18076_4480_AS400 Create test data for Negative Test Cases
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                 | OfferStart | OfferExpiry |
      | "N - 4480_PRIM_CNTRY_CD! = CA"                         | "1"        | "20"        |
      | "N - 4480_PRIM_CNTRY_CD = Null"                        | "2"        | "10"        |
      | "N - 4480_CUST_TP_CD != PSNL"                          | "3"        | "15"        |
      | "N - 4480_CUST_TP_CD =  Null"                          | "4"        | "20"        |
      | "N - 4480_Indv_Brth_Dtless than 18"                    | "5"        | "25"        |
      | "N - 4480_Indv_Brth_Dt Equal to Null"                  | "6"        | "30"        |
      | "N - 4480_Indv_Brth_Dt greater than 70"                | "7"        | "35"        |
      | "N - 4480_Deceased_F = Y"                              | "8"        | "40"        |
      | "N - 4480_Deceased_F = Null"                           | "9"        | "45"        |
      | "N - 4480_LANG_CD = K"                                 | "10"       | "50"        |
      | "N - 4480_LANG_CD = NE"                                | "11"       | "55"        |
      | "N - 4480_LANG_CD = Null"                              | "12"       | "60"        |
      | "N - 4480_MKT_F = N"                                   | "13"       | "65"        |
      | "N - 4480_MKT_F = NULL"                                | "14"       | "70"        |
      | "N - 4480_PRD CD- AXG, SUB PRD CD -SP"                 | "15"       | "75"        |
      | "N - 4480_PRD CD- AXS, SUB PRD CD -SV"                 | "16"       | "80"        |
      | "N - 4480_PRD CD- AXP, SUB PRD CD -SS"                 | "17"       | "85"        |
      | "N - 4480_CLI_OFR_F =A"                                | "22"       | "15"        |
      | "N - 4480_CLI_OFR_F = Null"                            | "23"       | "20"        |
      | "N - 4480_ACCT_SUBSYS_ID = BB"                         | "24"       | "25"        |
      | "N - 4480_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" | "25"       | "30"        |
      | "N - 4480_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    | "26"       | "35"        |
      | "N - 4480_CLI_OFR_CRNT_F = N"                          | "27"       | "40"        |
      | "N - 4480_CLI_OFR_CRNT_F = Null"                       | "28"       | "45"        |
      | "N - 4480_CC_STEP_LINK_F  = Y"                         | "29"       | "45"        |
      | "N - 4480_CC_STEP_LINK_F  = Null"                      | "30"       | "59"        |
      | "N - 4480_CC_ACCT_VIP_IND  = 2"                        | "31"       | "55"        |
      | "N - 4480_CC_ACCT_VIP_IND  = 9"                        | "32"       | "60"        |
      | "N - 4480_CLI_OFR_ST_DT  null"                         | "NULL"     | "65"        |
      | "N - 4480_CLI_OFR_EXP_DT is null"                      | "34"       | "NULL"      |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = N"                | "35"       | "30"        |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = Null"             | "1"        | "35"        |


  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_Negative_TestCases_TestData @4480 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower_VS18076_4480_AS400 Create test data for Negative Test Case on future offer start date
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = futureDateInDays(4)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(5)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                              |
      | "N - 4480_CLI_OFR_ST_DT  greater than current date" |

  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_Negative_TestCases_TestData @4480 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Sole Borrower_VS18076_4480_AS400 Create test data for Negative Test Case on past offer expiry date
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = dateFormat(4)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = dateFormat(2)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                             |
      | "N - 4480_CLI_OFR_EXP_DT lesser than current date" |