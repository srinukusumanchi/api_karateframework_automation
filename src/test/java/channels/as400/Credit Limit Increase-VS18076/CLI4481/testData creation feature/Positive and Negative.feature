@CIMCAMP-418 @PositiveAndNegative_TestData_4481
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower-4481 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_IH_Validation_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Create test data for validating IH field values
    * def testDataFileName = CLItestDataFileName
      #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

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

      # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                               |
      | "4481_Validate IH Record fields against Proposition" |

  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_Positive_TestCases_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Create test data for Positive Test Cases
    * def testDataFileName = CLItestDataFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

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

     # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                                        | OfferStart | OfferExpiry |
      | "4481_INDV_BRTH_DT_Equal to 18 yrs"                                           | "1"        | "80"        |
      | "4481_INDV_BRTH_DT_Equal to 70 yrs"                                           | "1"        | "80"        |
      | "4481_Lang Code = E"                                                          | "1"        | "80"        |
      | "4481_Lang Code = EN"                                                         | "1"        | "80"        |
      | "4481_Lang Code = F"                                                          | "1"        | "80"        |
      | "4481_Lang Code = FR"                                                         | "1"        | "80"        |
      | "4481_Lang Code small case = en"                                              | "1"        | "80"        |
      | "4481_Lang Code small case = fr"                                              | "1"        | "80"        |
      | "4481_Lang Code small case = f"                                               | "1"        | "80"        |
      | "4481_Lang Code small case = fr"                                              | "1"        | "80"        |
      | "4481_SRC_ACCT_STAT_CD = 5"                                                   | "1"        | "80"        |
      | "4481_DNS_F = Y"                                                              | "1"        | "80"        |
      | "4481_DNS_F = NULL"                                                           | "1"        | "80"        |
      | "4481_DNS_F = N"                                                              | "1"        | "80"        |
      | "4481_PRD CD- VCL, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  | "19"       | "60"        |
      | "4481_PRD CD- VCL, SUB PRD CD -ST & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  | "20"       | "65"        |
      | "4481_PRD CD- VCL, SUB PRD CD -NF  & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" | "21"       | "70"        |
      | "4481_PRD CD- VCL, SUB PRD CD -DM  & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" | "22"       | "55"        |
      | "4481_PRD CD-VLR, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "12"       | "70"        |
      | "4481_PRD CD-VLR, SUB PRD CD -NF & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "24"       | "75"        |
      | "4481_PRD CD-VGD, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "25"       | "80"        |
      | "4481_PRD CD-VGD, SUB PRD CD -ST & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "26"       | "85"        |
      | "4481_PRD CD-VGD, SUB PRD CD -SP & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "27"       | "90"        |
      | "4481_PRD CD-VGD, SUB PRD CD -NF & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "28"       | "90"        |
      | "4481_PRD CD-VUS, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "29"       | "30"        |
      | "4481_PRD CD-VLR, SUB PRD CD -RC & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "30"       | "80"        |
      | "4481_PRD CD-VCL, SUB PRD CD -ZZ & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "31"       | "75"        |
      | "4481_PRD CD-VFA, SUB PRD CD -A1 & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "32"       | "80"        |
      | "4481_PRD CD-VFF, SUB PRD CD - F1 & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  | "33"       | "85"        |
      | "4481_PRD CD-VFF, SUB PRD CD -TR & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "34"       | "90"        |
      | "4481_PRD CD-VFF, SUB PRD CD -TS & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   | "35"       | "90"        |
      | "4481_CLI Offer Start Date equal to current date"                             | "1"        | "80"        |
      | "4481_CLI Offer Expiry Date equal to current date"                            | "39"       | "1"         |
      | "4481_SRC_ACCT_STAT_CD = A"                                                   | "69"       | "24"        |
      | "4481_SRC_ACCT_STAT_CD = Open"                                                | "69"       | "24"        |
      | "4481_SRC_ACCT_STAT_CD = Active"                                              | "69"       | "24"        |
      | "4481_SRC_ACCT_STAT_CD = NULL"                                                | "69"       | "24"        |


  @CreditLimitIncrease @CreditLimitIncrease_SecondaryName_TestData @4481 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Create test data for Secondary name
    * def testDataFileName = CLItestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = dateFormat(7)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(20)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                         | CID          |
      | "4481_Secondary Name Validation"               | CID          |
      | "4481_Secondary Name Validation for Joint CID" | secondaryCid |

    * string testId = examples[0].testId
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

     # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples


  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_Negative_TestCases_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Create test data for Negative Test Cases
    * def testDataFileName = CLItestDataFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

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

     # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                 | OfferStart | OfferExpiry |
      | "N - 4481_PRIM_CNTRY_CD! = CA"                         | "1"        | "5"         |
      | "N - 4481_PRIM_CNTRY_CD = Null"                        | "2"        | "10"        |
      | "N - 4481_CUST_TP_CD != PSNL"                          | "3"        | "15"        |
      | "N - 4481_CUST_TP_CD =  Null"                          | "4"        | "20"        |
      | "N - 4481_Indv_Brth_Dtless than 18"                    | "5"        | "25"        |
      | "N - 4481_Indv_Brth_Dt Equal to Null"                  | "6"        | "30"        |
      | "N - 4481_Indv_Brth_Dt greater than 70"                | "7"        | "35"        |
      | "N - 4481_Deceased_F = Y"                              | "8"        | "40"        |
      | "N - 4481_Deceased_F = Null"                           | "9"        | "45"        |
      | "N - 4481_LANG_CD = K"                                 | "10"       | "50"        |
      | "N - 4481_LANG_CD = NE"                                | "11"       | "55"        |
      | "N - 4481_LANG_CD = Null"                              | "12"       | "60"        |
      | "N - 4481_MKT_F = N"                                   | "13"       | "65"        |
      | "N - 4481_MKT_F = NULL"                                | "14"       | "70"        |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SP"                 | "15"       | "75"        |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SV"                 | "16"       | "80"        |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SS"                 | "17"       | "85"        |
      | "N - 4481_CLI_OFR_F =A"                                | "22"       | "50"        |
      | "N - 4481_CLI_OFR_F = Null"                            | "23"       | "55"        |
      | "N - 4481_ACCT_SUBSYS_ID = BB"                         | "24"       | "60"        |
      | "N - 4481_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" | "25"       | "65"        |
      | "N - 4481_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    | "26"       | "70"        |
      | "N - 4481_CLI_OFR_CRNT_F = N"                          | "27"       | "75"        |
      | "N - 4481_CLI_OFR_CRNT_F = Null"                       | "28"       | "80"        |
      | "N - 4481_CC_STEP_LINK_F  = Y"                         | "29"       | "85"        |
      | "N - 4481_CC_STEP_LINK_F  = Null"                      | "30"       | "90"        |
      | "N - 4481_CC_ACCT_VIP_IND  = 2"                        | "31"       | "30"        |
      | "N - 4481_CC_ACCT_VIP_IND  = 9"                        | "32"       | "35"        |
      | "N - 4481_CLI_OFR_ST_DT  null"                         | "NULL"     | "34"        |
      | "N - 4481_CLI_OFR_EXP_DT is null"                      | "34"       | "NULL"      |
      | "N - 4481_PRIMARY_ACCT_HOLDER_FLAG = N"                | "35"       | "40"        |
      | "N - 4481_PRIMARY_ACCT_HOLDER_FLAG = Null"             | "1"        | "45"        |


  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_Negative_TestCases_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481 Create test data for Negative Test Case on future offer start date
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid


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

     # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                              |
      | "N - 4481_CLI_OFR_ST_DT  greater than current date" |

  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_Negative_TestCases_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Create test data for Negative Test Case on past offer expiry date
    * def testDataFileName = CLItestDataFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

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

     # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                             |
      | "N - 4481_CLI_OFR_EXP_DT lesser than current date" |