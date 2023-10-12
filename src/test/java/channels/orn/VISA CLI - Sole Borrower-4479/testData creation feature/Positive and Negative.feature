@CIMCAMP-418 @PositiveAndNegative_TestData_4479
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Positive and Negative test cases for ORN channel

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_IH_Validation_TestData_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for validating IH field values
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
    * string offerStartDate =  dateFormat(1)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(60)
#     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                               |
      | "4479_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Positive_TestCases_TestData_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Positive Test Cases
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
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                        | OfferStart | OfferExpiry |
      | "4479_ISSUE = Engagement and Group = Unsecured Lending"       | "5"        | "60"        |
      | "4479_CUST_TP_CD = PSNL"                                      | "5"        | "60"        |
      | "4479_PRIM_CNTRY_CD = CA"                                     | "5"        | "60"        |
      | "4479_INDV_BRTH_DT_Equal to 18 yrs"                           | "5"        | "60"        |
      | "4479_INDV_BRTH_DT_Greater than 18 yrs"                       | "5"        | "60"        |
      | "4479_INDV_BRTH_DT_Less than 70 yrs"                          | "5"        | "60"        |
      | "4479_INDV_BRTH_DT_Equal to 70 yrs"                           | "5"        | "60"        |
      | "4479_MKT_F = Y"                                              | "5"        | "60"        |
      | "4479_Deceased_F = N"                                         | "5"        | "60"        |
      | "4479_Lang Code = E"                                          | "5"        | "60"        |
      | "4479_Lang Code = EN"                                         | "5"        | "60"        |
      | "4479_Lang Code = F"                                          | "5"        | "60"        |
      | "4479_Lang Code = FR"                                         | "5"        | "60"        |
      | "4479_Lang Code Small Case = en"                              | "5"        | "60"        |
      | "4479_Lang Code Small Case = fr"                              | "5"        | "60"        |
      | "4479_PRIMARY_ACCT_HOLDER_FLAG = Y"                           | "5"        | "60"        |
      | "4479_SRC_ACCT_STAT_CD = 5"                                   | "5"        | "60"        |
      | "4479_ACCT_SUBSYS_ID = KS"                                    | "5"        | "60"        |
      | "4479_CLI_OFR_F =  Z"                                         | "5"        | "60"        |
      | "4479_PRD CD- VCL, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"  | "5"        | "60"       |
      | "4479_PRD CD- VCL, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"  | "5"        | "60"        |
      | "4479_PRD CD- VCL, SUB PRD CD -NF  & CC_SCNRY_CUST_ID = Null" | "5"        | "60"        |
      | "4479_PRD CD- VCL, SUB PRD CD -DM  & CC_SCNRY_CUST_ID = Null" | "5"        | "60"        |
      | "4479_PRD CD-VLR, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VLR, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VGD, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VGD, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VGD, SUB PRD CD -SP & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VGD, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VUS, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VLR, SUB PRD CD -RC & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VCL, SUB PRD CD -ZZ & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VFA, SUB PRD CD -A1 & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VFF, SUB PRD CD - F1 & CC_SCNRY_CUST_ID = Null"  | "5"        | "60"        |
      | "4479_PRD CD-VFF, SUB PRD CD -TR & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_PRD CD-VFF, SUB PRD CD -TS & CC_SCNRY_CUST_ID = Null"   | "5"        | "60"        |
      | "4479_CLI Offer Start Date Less than current date"            | "2"        | "60"        |
      | "4479_CLI Offer Start Date equal to current date"             | "1"        | "60"        |
      | "4479_CLI Offer Expiry Date greater than current date"        | "5"        | "60"        |
      | "4479_CLI Offer Expiry Date equal to current date"            | "5"        | "1"         |
      | "4479_CLI_APRVD_CR_LMT greater than CR_CRD_LMT_AMT"           | "5"        | "60"        |
      | "4479_CLI_OFR_CRNT_F = Y"                                     | "5"        | "60"        |
      | "4479_CC_STEP_LINK_F  = N"                                    | "5"        | "60"        |
      | "4479_CC_ACCT_VIP_IND  = 1"                                   | "5"        | "60"        |
      | "4479_SRC_ACCT_STAT_CD = A"                                   | "5"        | "60"        |
      | "4479_SRC_ACCT_STAT_CD = Open"                                | "5"        | "60"        |
      | "4479_SRC_ACCT_STAT_CD = Active"                              | "5"        | "60"        |
      | "4479_SRC_ACCT_STAT_CD = NULL"                                | "5"        | "60"        |
      | "4479_Indv_Brth_Dt greater than 70"                           | "5"        | "60"        |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Negative Test Cases
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
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                 | OfferStart | OfferExpiry |
      | "N - 4479_PRIM_CNTRY_CD! = CA"                         | "5"        | "60"        |
      | "N - 4479_PRIM_CNTRY_CD = Null"                        | "5"        | "60"        |
      | "N - 4479_CUST_TP_CD != PSNL"                          | "5"        | "60"        |
      | "N - 4479_Indv_Brth_Dtless than 18"                    | "5"        | "60"        |
      | "N - 4479_Indv_Brth_Dt Equal to Null"                  | "5"        | "60"        |
      | "N - 4479_Deceased_F = Y"                              | "5"        | "60"        |
      | "N - 4479_Deceased_F = Null"                           | "5"        | "60"        |
      | "N - 4479_LANG_CD = K"                                 | "5"        | "60"        |
      | "N - 4479_LANG_CD = NE"                                | "5"        | "60"        |
      | "N - 4479_LANG_CD = Null"                              | "5"        | "60"        |
      | "N - 4479_MKT_F = N"                                   | "5"        | "60"        |
      | "N - 4479_MKT_F = NULL"                                | "5"        | "60"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SP"                 | "5"        | "60"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SV"                 | "5"        | "60"        |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SS"                 | "5"        | "60"        |
      | "N - 4479_CLI_OFR_ST_DT  greater than current date"    | "5"        | "60"        |
      | "N - 4479_CLI_OFR_EXP_DT lesser than current date"     | "5"        | "60"        |
      | "N - 4479_CLI_OFR_F =A"                                | "5"        | "60"        |
      | "N - 4479_CLI_OFR_F = Null"                            | "5"        | "60"        |
      | "N - 4479_ACCT_SUBSYS_ID = BB"                         | "5"        | "60"        |
      | "N - 4479_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" | "5"        | "60"        |
      | "N - 4479_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    | "5"        | "60"        |
      | "N - 4479_CLI_OFR_CRNT_F = N"                          | "5"        | "60"        |
      | "N - 4479_CLI_OFR_CRNT_F = Null"                       | "5"        | "60"        |
      | "N - 4479_CC_STEP_LINK_F  = Y"                         | "5"        | "60"        |
      | "N - 4479_CC_STEP_LINK_F  = Null"                      | "5"        | "60"        |
      | "N - 4479_CC_ACCT_VIP_IND  = 2"                        | "5"        | "60"        |
      | "N - 4479_CC_ACCT_VIP_IND  = 9"                        | "5"        | "60"        |
      | "N - 4479_CLI_OFR_ST_DT  null"                         | "NULL"     | "60"        |
      | "N - 4479_CLI_OFR_EXP_DT is null"                      | "3"        | "NULL"      |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = N"                | "5"        | "60"        |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = Null"             | "5"        | "60"        |


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData_OFR_Date_gt_crdt_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Negative Test Case on future offer start date
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
    * string offerExpiryDate = futureDateInDays(60)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                              |
      | "N - 4479_CLI_OFR_ST_DT  greater than current date" |

  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Negative_TestCases_TestData_OFR_Date_lt_crdt_ORN @4479@SOL @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Negative Test Case on past offer expiry date
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
    * string offerExpiryDate = dateFormat(2)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')
      # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                             |
      | "N - 4479_CLI_OFR_EXP_DT lesser than current date" |