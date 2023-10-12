@PositiveAndNegative_TestData_4479
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_IH_Validation_TestData @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for validating IH field values
    * def testDataFileName = CLItestDataFileName
    #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into data base
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
      | "4479_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Positive_TestCases_TestData @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for Positive Test Cases
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
      | TestID                                                        | OfferStart | OfferExpiry |
      | "4479_INDV_BRTH_DT_Equal to 18 yrs"                           | "1"        | "70"        |
      | "4479_INDV_BRTH_DT_Equal to 70 yrs"                           | "1"        | "70"        |
      | "4479_Lang Code = E"                                          | "2"        | "70"        |
      | "4479_Lang Code = EN"                                         | "1"        | "70"        |
      | "4479_Lang Code = F"                                          | "1"        | "70"        |
      | "4479_Lang Code = FR"                                         | "1"        | "70"        |
      | "4479_Lang Code small case = en"                              | "1"        | "70"        |
      | "4479_Lang Code small case = fr"                              | "1"        | "70"        |
      | "4479_Lang Code small case = f"                               | "1"        | "70"        |
      | "4479_Lang Code small case = e"                               | "1"        | "70"        |
      | "4479_SRC_ACCT_STAT_CD = 5"                                   | "1"        | "70"        |
      | "4479_DNS_F = Y"                                              | "1"        | "70"        |
      | "4479_DNS_F = NULL"                                           | "2"        | "70"        |
      | "4479_DNS_F = N"                                              | "1"        | "70"        |
      | "4479_PRD CD- VCL, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"  | "2"        | "40"        |
      | "4479_PRD CD- VCL, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"  | "3"        | "40"        |
      | "4479_PRD CD- VCL, SUB PRD CD -NF  & CC_SCNRY_CUST_ID = Null" | "4"        | "40"        |
      | "4479_PRD CD- VCL, SUB PRD CD -DM  & CC_SCNRY_CUST_ID = Null" | "5"        | "40"        |
      | "4479_PRD CD-VLR, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "6"        | "40"        |
      | "4479_PRD CD-VLR, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   | "7"        | "40"        |
      | "4479_PRD CD-VGD, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "8"        | "40"        |
      | "4479_PRD CD-VGD, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"   | "9"        | "40"        |
      | "4479_PRD CD-VGD, SUB PRD CD -SP & CC_SCNRY_CUST_ID = Null"   | "10"       | "40"        |
      | "4479_PRD CD-VGD, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   | "11"       | "40"        |
      | "4479_PRD CD-VUS, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "12"       | "40"        |
      | "4479_PRD CD-VLR, SUB PRD CD -RC & CC_SCNRY_CUST_ID = Null"   | "13"       | "40"        |
      | "4479_PRD CD-VCL, SUB PRD CD -ZZ & CC_SCNRY_CUST_ID = Null"   | "14"       | "40"        |
      | "4479_PRD CD-VFA, SUB PRD CD -A1 & CC_SCNRY_CUST_ID = Null"   | "15"       | "40"        |
      | "4479_PRD CD-VFF, SUB PRD CD - F1 & CC_SCNRY_CUST_ID = Null"  | "16"       | "40"        |
      | "4479_PRD CD-VFF, SUB PRD CD -TR & CC_SCNRY_CUST_ID = Null"   | "17"       | "40"        |
      | "4479_PRD CD-VFF, SUB PRD CD -TS & CC_SCNRY_CUST_ID = Null"   | "18"       | "40"        |
      | "4479_CLI Offer Start Date equal to current date"             | "1"        | "40"        |
      | "4479_CLI Offer Expiry Date equal to current date"            | "39"       | "1"         |
      | "4479_SRC_ACCT_STAT_CD = A"                                   | "69"       | "40"        |
      | "4479_SRC_ACCT_STAT_CD = Open"                                | "69"       | "40"        |
      | "4479_SRC_ACCT_STAT_CD = Active"                              | "69"       | "40"        |
      | "4479_SRC_ACCT_STAT_CD = NULL"                                | "69"       | "40"        |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for Negative Test Cases
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
      | "N - 4479_PRIM_CNTRY_CD! = CA"                         | "1"        | "40"        |
      | "N - 4479_PRIM_CNTRY_CD = Null"                        | "2"        | "40"        |
      | "N - 4479_CUST_TP_CD != PSNL"                          | "3"        | "40"        |
      | "N - 4479_CUST_TP_CD =  Null"                          | "4"        | "40"        |
      | "N - 4479_CUST_AGEless than 18"                        | "5"        | "40"        |
      | "N - 4479_CUST_AGE Equal to Null"                      | "6"        | "40"        |
      | "N - 4479_CUST_AGE greater than 70"                    | "7"        | "40"        |
      | "N - 4479_Deceased_F = Y"                              | "8"        | "40"        |
      | "N - 4479_Deceased_F = Null"                           | "9"        | "40"        |
      | "N - 4479_LANG_CD = K"                                 | "10"       | "40"        |
      | "N - 4479_LANG_CD = NE"                                | "11"       | "40"        |
      | "N - 4479_LANG_CD = Null"                              | "12"       | "40"        |
      | "N - 4479_MKT_F = N"                                   | "13"       | "40"        |
      | "N - 4479_MKT_F = NULL"                                | "14"       | "40"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SP"                 | "15"       | "40"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SV"                 | "16"       | "40"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SS"                 | "17"       | "40"        |
      | "N - 4479_CLI_OFR_F =A"                                | "5"        | "40"        |
      | "N - 4479_CLI_OFR_F = Null"                            | "6"        | "40"        |
      | "N - 4479_ACCT_SUBSYS_ID = BB"                         | "7"        | "40"        |
      | "N - 4479_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" | "8"        | "40"        |
      | "N - 4479_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    | "9"        | "40"        |
      | "N - 4479_CLI_OFR_CRNT_F = N"                          | "10"       | "40"        |
      | "N - 4479_CLI_OFR_CRNT_F = Null"                       | "6"        | "40"        |
      | "N - 4479_CC_STEP_LINK_F  = Y"                         | "7"        | "40"        |
      | "N - 4479_CC_STEP_LINK_F  = Null"                      | "8"        | "40"        |
      | "N - 4479_CC_ACCT_VIP_IND  = 2"                        | "5"        | "40"        |
      | "N - 4479_CC_ACCT_VIP_IND  = 9"                        | "6"        | "40"        |
      | "N - 4479_CLI_OFR_ST_DT  null"                         | "NULL"     | "40"        |
      | "N - 4479_CLI_OFR_EXP_DT is null"                      | "34"       | "NULL"      |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = N"                | "4"        | "40"        |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = Null"             | "5"        | "40"        |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData1 @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for Negative Test Case on future offer start date
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
      | "N - 4479_CLI_OFR_ST_DT  greater than current date" |

  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData2 @4479@A400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Create test data for Negative Test Case on past offer expiry date
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
      | "N - 4479_CLI_OFR_EXP_DT lesser than current date" |