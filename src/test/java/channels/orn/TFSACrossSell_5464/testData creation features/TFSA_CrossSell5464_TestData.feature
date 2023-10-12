@TFSA_CrossSell_ORN_5464
Feature: Create test data for TFSA Cross Sell-5464 ORN Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @TFSACrossSell_Positive_negative_ORN_single_account_TestData_Load @5464 @ORN @RS21091
  Scenario Outline: TFSA Cross Sell_RS21091_5464_ORN <TestID> Create test data for single accounts

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * print  <TestID>

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                                                                                                                                    | ACCT_ODT | CUST_OPND_DT |
      | "5464_CUST_TP_CD=PSNL,5464_Primary Country Cd = CA,5464_CUST_AGE >18,5464_DO_NOT_SOLICIT_F = Y,5464_MRKTBLE_F = Y,5464_NOT_AML_KYC = N,CUST_OPNT_DT > 90 days,5464_Customer Not Decease,5464_ACCT_ODT>90" | "92"     | "92"         |
      | "5464_CUST_AGE=18"                                                                                                                                                                                        | "92"     | "92"         |
      | "5464_LANG_CD in EN"                                                                                                                                                                                      | "93"     | "93"         |
      | "5464_LANG_CD in E"                                                                                                                                                                                       | "94"     | "94"         |
      | "5464_LANG_CD in F"                                                                                                                                                                                       | "95"     | "95"         |
      | "5464_LANG_CD in FR"                                                                                                                                                                                      | "96"     | "96"         |
      | "5464_LANG_CD in small case_e"                                                                                                                                                                            | "97"     | "97"         |
      | "5464_LANG_CD in small case_en"                                                                                                                                                                           | "98"     | "98"         |
      | "5464_LANG_CD in small case_f"                                                                                                                                                                            | "99"     | "99"         |
      | "5464_LANG_CD in small case_fr"                                                                                                                                                                           | "100"    | "100"        |
      | "5464_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                            | "101"    | "101"        |
      | "5464_NOT_AML_KYC = NULL"                                                                                                                                                                                 | "102"    | "102"        |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                     | "103"    | "103"        |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                     | "104"    | "104"        |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                       | "105"    | "105"        |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                       | "106"    | "106"        |
      | "5464_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                         | "107"    | "107"        |
      | "5464_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                         | "108"    | "108"        |
      | "N-5464_CUST_TP_CD != PSNL"                                                                                                                                                                               | "109"    | "109"        |
      | "N-5464_Primary Country Cd != CA"                                                                                                                                                                         | "110"    | "110"        |
      | "N-5464_Primary Country Cd = NULL"                                                                                                                                                                        | "111"    | "111"        |
      | "N-5464_CUST_AGE < 18"                                                                                                                                                                                    | "112"    | "112"        |
      | "N-5464_CUST_AGE = NULL"                                                                                                                                                                                  | "113"    | "113"        |
      | "N-5464_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                                                                    | "114"    | "114"        |
      | "N-5464_LANG_CD = NULL"                                                                                                                                                                                   | "115"    | "115"        |
      | "N-5464_MRKTBLE_F = N"                                                                                                                                                                                    | "117"    | "117"        |
      | "N-5464_MRKTBLE_F = NULL"                                                                                                                                                                                 | "118"    | "118"        |
      | "N-5464_NOT_AML_KYC = Y"                                                                                                                                                                                  | "119"    | "119"        |
      | "N-5464_CUST_OPNT_DT < 90 days"                                                                                                                                                                           | "120"    | "89"         |
      | "N-5464_CUST_OPNT_DT = 90 days"                                                                                                                                                                           | "121"    | "90"         |
      | "N-5464_CUST_OPNT_DT = NULL"                                                                                                                                                                              | "122"    | "NULL"       |
      | "N-5464_Customer Decease - Y"                                                                                                                                                                             | "123"    | "120"        |
      | "N-5464_Customer Decease - NULL"                                                                                                                                                                          | "124"    | "121"        |
      | "N-5464_ACCT_ODT < 90 Days"                                                                                                                                                                               | "90"     | "122"        |
      | "N-5464_ACCT_ODT = 90 Days"                                                                                                                                                                               | "90"     | "123"        |
      | "5464_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                                                        | "125"    | "124"        |
      | "5464_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                                                        | "126"    | "125"        |
      | "5464_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                                                        | "127"    | "126"        |
      | "5464_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                                                        | "128"    | "127"        |
      | "5464_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                                                        | "129"    | "128"        |
      | "5464_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                                                        | "130"    | "129"        |
      | "5464_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                                                        | "131"    | "130"        |
      | "5464_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                                                        | "132"    | "131"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                                                                                  | "133"    | "132"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                  | "134"    | "133"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                | "135"    | "134"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"                                                                                                                  | "136"    | "135"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                  | "137"    | "136"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                | "138"    | "137"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                                                   | "139"    | "138"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"                                                                                                                     | "140"    | "139"        |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                  | "141"    | "140"        |
      | "5464_Perform Viewed Disposition and offer should display when Lead scope - ACT"                                                                                                                          | "143"    | "142"        |
      | "5464_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT"                                                                                                           | "144"    | "143"        |
      | "5464_Validate IH fields with proposition"                                                                                                                                                                | "145"    | "144"        |
      | "5464_Validate Rest period for the offer"                                                                                                                                                                 | "146"    | "145"        |
      | "5464_Validate Persistence period for the offer"                                                                                                                                                          | "147"    | "146"        |
      | "5464_SRC_ACCT_STAT_CD! =  A"                                                                                                                                                                             | "92"     | "92"         |
      | "5464_SRC_ACCT_STAT_CD! = Open"                                                                                                                                                                           | "92"     | "92"         |
      | "5464_SRC_ACCT_STAT_CD = NULL"                                                                                                                                                                            | "93"     | "93"         |

  @TFSACrossSell_ORN_Test_Data_Load_multiple_accounts @5464 @ORN @RS21091
  Scenario Outline: TFSA Cross Sell_RS21091_5464_ORN Create test data for multiple accounts

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID


    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5464_PLN_ACCT_CD_MASTER != TFSA and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" | "92"     | "92"         |
      | "5464_PLN_ACCT_CD_MASTER = TFSA  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" | "92"     | "92"         |
      | "5464_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  | "93"     | "93"         |
      | "N-5464_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active" | "94"     | "94"         |

  @TFSACrossSell_ORN_two_insights_testdata_Load @5464 @ORN @RS21091
  Scenario Outline: TFSA Cross Sell_RS21091_5464_ORN <TestID> Create test data for 2 insights

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * print  <TestID>

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"  | "92"     | "92"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"   | "92"     | "92"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"   | "93"     | "93"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1" | "94"     | "94"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"    | "95"     | "95"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL ! = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" | "96"     | "96"         |

  @TFSACrossSell_ORN_three_insights_testdata_Load @5464 @ORN @RS21091
  Scenario Outline: TFSA Cross Sell_RS21091_5464_ORN Create test data for 3 insights

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    * def Cust3 = <TestID>+'_cust_3'
    * print 'Customer 3 Test ID is '+Cust3

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |
      | Cust3    | CID |


   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
#      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" | "92"     | "99"         |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"  | "92"     | "93"         |


  @TFSAXsell_ORN_Single_record_ExternalTable_Positive_Negative_Scenarios_TestData @5464 @ORN @RS21091
  Scenario Outline: TFSAXSell_RS21091_5464_ORN_TestData <TestID> Create test data for single account with External table positive and negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Generating account number to insert into database
#    * def accountNumber = '00000000'+CID
#    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

#  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

#  # insert the created Account Number into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
#    # insert the created acct_odt into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
#
#     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/orn/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')


    Examples:
      | TestID                                         | VALID_START_DATE | VALID_END_DATE | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5464_ORN_VALID_START_DATE_lt_Curr_Dt"         | 1                | -5             | 100          | 60                | 60                | 50       |
      | "5464_ORN_VALID_START_DATE_eq_Curr_Dt"         | 0                | -5             | 100          | 60                | 60                | 100      |
      | "5464_ORN_VALID_END_DATE_gt_Curr_Dt"           | 5                | -1             | 100          | 60                | 60                | 70       |
      | "5464_ORN_VALID_END_DATE_eq_Curr_Dt"           | 5                | 0              | 100          | 60                | 60                | "NULL"   |
      | "N_5464_ORN_VALID_START_DATE_gt_Curr_Dt"       | -1               | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_VALID_END_DATE_lt_Curr_Dt"         | 5                | 1              | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_CAMPAIGN_CODE_ne_RS21091"          | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_Seg_CAMPAIGN_CELL_CODE_ne_CIE5464" | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_Seg_CAMPAIGN_CELL_CODE_eq_NULL"    | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_CAMPAIGN_CELL_CODE_FLAG_ne_Y"      | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"   | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_ORN_CHANNEL_ne_Y"                  | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5464_ORN_ORN_CHANNEL_eq_NULL"               | 5                | -5             | 100          | 60                | 60                | 50       |

  @TFSAXsell_ORN_multiple_record_ExternalTable_Positive_Negative_Scenarios_TestData @5464 @ORN @RS21091
  Scenario Outline: TFSAXSell_RS21091_5464_ORN_TestData <TestID> Create test data for multiple record with External table

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSACrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE1 = <VALID_START_DATE1>
    * string VALID_START_DATE2 = <VALID_START_DATE2>
    * string VALID_END_DATE = <VALID_END_DATE>

    * def ExtRec1 = <TestID>+'_rec1'
    * print 'Record2 Test ID is '+ExtRec1

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

#  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
#
#  # insert the created Account Number into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
#    # insert the created acct_odt into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
#
#     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


###To add into External input table


  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | VALID_START_DATE  |
      | <TestID> | CID | VALID_START_DATE1 |
      | ExtRec1  | CID | VALID_START_DATE2 |

     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/orn/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database') examples


    Examples:
      | TestID                                  | VALID_START_DATE1 | VALID_END_DATE | CUST_OPND_DT | VALID_START_DATE2 | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5464_ORN_multiple_Externaltbl_Records" | 1                 | -5             | 100          | 4                 | 60                | 50       |
