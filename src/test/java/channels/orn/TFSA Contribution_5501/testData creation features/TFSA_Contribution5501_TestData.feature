@TFSA_Contribution_ORN_5501
Feature: Create test data for TFSA Contribution-5501 ORN  test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @TFSAContribution_ORN_SingleInsight_TestData @5501 @ORN @RS21092
  Scenario Outline: TFSA Contribution_RS21092_5501_ORN Create test data for single insight

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData
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

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                     | ACCT_ODT | CUST_OPND_DT |
      | "N-5501_INSIGHT_CD!=FLG_TFSA_CONTRIBUTION and CURR_VAL!=0" | "100"    | "100"        |


  @TFSAContribution_ORN_2_Insights_TestData @5464 @ORN @RS21092
  Scenario Outline: TFSA Contribution_RS21092_5501_ORN Create test data for2 insights

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData

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
      | TestID                                                                                                                                                                                                    | ACCT_ODT | CUST_OPND_DT |
#      | "5501_CUST_TP_CD=PSNL,5501_Primary Country Cd = CA,5501_CUST_AGE >18,5501_DO_NOT_SOLICIT_F = Y,5501_MRKTBLE_F = Y,5501_NOT_AML_KYC = N,CUST_OPNT_DT > 90 days,5501_Customer Not Decease,5501_ACCT_ODT>90" | "100"    | "92"         |
#      | "5501_CUST_AGE=18"                                                                                                                                                                                        | "92"     | "100"        |
#      | "5501_LANG_CD in E"                                                                                                                                                                                       | "100"    | "100"        |
#      | "5501_LANG_CD in EN"                                                                                                                                                                                      | "100"    | "100"        |
#      | "5501_LANG_CD in F"                                                                                                                                                                                       | "100"    | "100"        |
#      | "5501_LANG_CD in FR"                                                                                                                                                                                      | "100"    | "100"        |
#      | "5501_LANG_CD in small case_e"                                                                                                                                                                            | "100"    | "100"        |
#      | "5501_LANG_CD in small case_en"                                                                                                                                                                           | "100"    | "100"        |
#      | "5501_LANG_CD in small case_f"                                                                                                                                                                            | "100"    | "100"        |
#      | "5501_LANG_CD in small case_fr"                                                                                                                                                                           | "100"    | "100"        |
#      | "5501_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                            | "100"    | "100"        |
#      | "5501_NOT_AML_KYC = NULL"                                                                                                                                                                                 | "100"    | "100"        |
#      | "5501_Validate Rest period for the offer"                                                                                                                                                                 | "100"    | "100"        |
#      | "5501_Validate Persistence period for the offer"                                                                                                                                                          | "100"    | "100"        |
#      | "5501_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                       | "100"    | "100"        |
#      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                     | "100"    | "100"        |
#      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                     | "100"    | "100"        |
#      | "5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                     | "100"    | "100"        |
#      | "5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                     | "100"    | "100"        |
#      | "5501_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                                                                    | "100"    | "100"        |
#      | "N-5501_CUST_TP_CD != PSNL"                                                                                                                                                                               | "100"    | "100"        |
#      | "N-5501_Primary Country Cd != CA"                                                                                                                                                                         | "100"    | "100"        |
#      | "N-5501_Primary Country Cd = NULL"                                                                                                                                                                        | "100"    | "100"        |
#      | "N-5501_CUST_AGE < 18"                                                                                                                                                                                    | "100"    | "100"        |
#      | "N-5501_CUST_AGE = NULL"                                                                                                                                                                                  | "100"    | "100"        |
#      | "N-5501_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                                                                    | "100"    | "100"        |
#      | "N-5501_LANG_CD = NULL"                                                                                                                                                                                   | "100"    | "100"        |
#      | "N-5501_MRKTBLE_F = N"                                                                                                                                                                                    | "100"    | "100"        |
#      | "N-5501_MRKTBLE_F = NULL"                                                                                                                                                                                 | "100"    | "100"        |
#      | "N-5501_NOT_AML_KYC = Y"                                                                                                                                                                                  | "100"    | "100"        |
#      | "N-5501_CUST_OPNT_DT < 90 days"                                                                                                                                                                           | "100"    | "90"         |
#      | "N-5501_CUST_OPNT_DT = 90 days"                                                                                                                                                                           | "100"    | "91"         |
#      | "N-5501_CUST_OPNT_DT = NULL"                                                                                                                                                                              | "100"    | "NULL"       |
#      | "N-5501_Customer Decease - Y"                                                                                                                                                                             | "100"    | "100"        |
#      | "N-5501_Customer Decease - NULL"                                                                                                                                                                          | "100"    | "100"        |
      | "N-5501_ACCT_ODT < 90 Days"                                                                                                                                                                               | "89"     | "100"        |
      | "N-5501_ACCT_ODT = 90 Days"                                                                                                                                                                               | "90"     | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                                                                                  | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                  | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"                                                                                                                  | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                  | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                                                   | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"                                                                                                                     | "100"    | "100"        |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                                                  | "100"    | "100"        |
      | "N-5501_INSIGHT_CD!=FLG_TFSA_CONTRIBUTION and CURR_VAL=0"                                                                                                                                                 | "100"    | "100"        |
      | "N-5501_INSIGHT_CD=FLG_TFSA_CONTRIBUTION and CURR_VAL!=0"                                                                                                                                                 | "100"    | "100"        |
#Added for Jan 5th 2023 release
      | "5501_MD_FINANCIAL_F_ne_Y"                                                                                                                                                                                | "100"    | "100"        |
      | "5501_ITRADE_MCLEOD_F_ne_Y"                                                                                                                                                                               | "100"    | "100"        |
      | "5501_DEDICATED_INVSTMNT_ADVISOR_F_ne_Y"                                                                                                                                                                  | "100"    | "100"        |
      | "5501_MD_FINANCIAL_F_eq_NULL"                                                                                                                                                                             | "100"    | "100"        |
      | "5501_ITRADE_MCLEOD_F_eq_NULL"                                                                                                                                                                            | "100"    | "100"        |
      | "5501_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                                                                                                                               | "100"    | "100"        |
      | "N-5501_MD_FINANCIAL_F_eq_Y"                                                                                                                                                                              | "100"    | "100"        |
      | "N-5501_ITRADE_MCLEOD_F_eq_Y"                                                                                                                                                                             | "100"    | "100"        |
      | "N-5501_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                                                                                                                                | "100"    | "100"        |

  @TFSAContribution_ORN_3_Insights_TestData @5501 @ORN @RS21091
  Scenario Outline: TFSA Contribution_RS21092_5501_ORN Create test data for 3 insights

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData

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
      | TestID                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"  | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"   | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"   | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1" | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"    | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL ! = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" | "100"    | "100"        |
#Added for Jan 5th 2023 release
      | "5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_ne_1"                                                                                                         | "100"    | "100"        |
      | "5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_NULL"                                                                                                      | "100"    | "100"        |
      | "N-5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_1"                                                                                                       | "100"    | "100"        |

  @TFSAContribution_2_accounts_ORN_TestData @5501 @ORN @RS21091
  Scenario Outline: TFSA Contribution_RS21092_5501_ORN Create test data for 2 accounts

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData
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
      | TestID                                                                                     | ACCT_ODT | CUST_OPND_DT |
      | "N-5501_PLN_ACCT_CD_MASTER != TFSA and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "N-5501_PLN_ACCT_CD_MASTER = TFSA  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "N-5501_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  | "100"    | "100"        |
      | "5501_PRD CODE=01  SUB PRD CD=01"                                                          | "100"    | "100"        |
      | "5501_PRD CODE=VGD SUB PRD CD=NF"                                                          | "100"    | "100"        |
      | "5501_PRD CD = 02 SUB PRD CD = 05"                                                         | "100"    | "100"        |
      | "5501_PRD CD = 19 SUB PRD CD = 05"                                                         | "100"    | "100"        |
      | "5501_PRD CD = 13 SUB PRD CD = 05"                                                         | "100"    | "100"        |
      | "5501_PRD CD = 07 SUB PRD CD = 01"                                                         | "100"    | "100"        |
      | "5501_PRD CD = 23 SUB PRD CD = 02"                                                         | "100"    | "100"        |
      | "5501_PRD CD = VGD SUB PRD CD= AB"                                                         | "100"    | "100"        |
      | "5501_PRD CD = VCL SUB PRD CD= BC"                                                         | "100"    | "100"        |
      | "5501_PRD CD = VLR SUB PRD CD= CD"                                                         | "100"    | "100"        |
      | "5501_SRC_ACCT_STAT_CD! =  A"                                                              | "100"    | "100"        |
      | "5501_SRC_ACCT_STAT_CD!  Open"                                                             | "100"    | "100"        |
      | "5501_SRC_ACCT_STAT_CD = NULL"                                                             | "100"    | "100"        |
      | "N-5501_PRIMARY_ACCT_HOLDER_FLAG = N"                                                      | "100"    | "100"        |
      | "N-5501_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                   | "100"    | "100"        |

  @TFSAContribution_ORN_4_Insights_TestData @5501 @ORN @RS21092
  Scenario Outline: TFSA Contribution_RS21092_5501_ORN Create test data for 4 insights

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData
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

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    * def Cust3 = <TestID>+'_cust_3'
    * print 'Customer 2 Test ID is '+Cust3

    * def Cust4 = <TestID>+'_cust_4'
    * print 'Customer 2 Test ID is '+Cust4

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |
      | Cust3    | CID |
      | Cust4    | CID |


   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" | "100"    | "100"        |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"  | "100"    | "100"        |
    
#    Added for June 8th 2023 release for adding external table for inclusion and exclusion for TFSA Contribution offer

  @TFSAContribution_ORN_Single_record_ExternalTable_Positive_Negative_Scenarios_TestData @5501 @ORN @RS21092
  Scenario Outline: TFSAContribution_RS21092_5501_ORN_TestData <TestID> Create test data for single account with External table positive and negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
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

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/orn/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

     # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')


    Examples:
      | TestID                                         | VALID_START_DATE | VALID_END_DATE | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5501_ORN_VALID_START_DATE_lt_Curr_Dt"         | 1                | -5             | 100          | 60                | 60                | 100       |
      | "5501_ORN_VALID_START_DATE_eq_Curr_Dt"         | 0                | -5             | 100          | 60                | 60                | 100      |
      | "5501_ORN_VALID_END_DATE_gt_Curr_Dt"           | 5                | -1             | 100          | 60                | 60                | 100       |
      | "5501_ORN_VALID_END_DATE_eq_Curr_Dt"           | 5                | 0              | 100          | 60                | 60                | 100   |
      | "N_5501_ORN_VALID_START_DATE_gt_Curr_Dt"       | -1               | -5             | 100          | 60                | 60                | 100       |
      | "N_5501_ORN_VALID_END_DATE_lt_Curr_Dt"         | 5                | 1              | 100          | 60                | 60                | 100       |
      | "N_5501_ORN_CAMPAIGN_CODE_ne_RS21092"          | 5                | -5             | 100          | 60                | 60                | 100       |
      | "N_5501_ORN_Seg_CAMPAIGN_CELL_CODE_ne_CIE5501" | 5                | -5             | 100          | 60                | 60                | 100      |
      | "N_5501_ORN_Seg_CAMPAIGN_CELL_CODE_eq_NULL"    | 5                | -5             | 100          | 60                | 60                | 100       |
      | "N_5501_ORN_CAMPAIGN_CELL_CODE_FLAG_ne_Y"      | 5                | -5             | 100          | 60                | 60                | 100       |
      | "N_5501_ORN_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"   | 5                | -5             | 100          | 60                | 60                | 100      |
      | "N_5501_ORN_ORN_CHANNEL_ne_Y"                  | 5                | -5             | 100          | 60                | 60                | 100      |
      | "N_5501_ORN_ORN_CHANNEL_eq_NULL"               | 5                | -5             | 100          | 60                | 60                | 100       |

  @TFSAContribution_ORN_multiple_record_ExternalTable_Positive_Negative_Scenarios_TestData @5501 @ORN @RS21092
  Scenario Outline: TFSAContribution_RS21092_5501_ORN_TestData <TestID> Create test data for multiple record with External table

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TFSAFundORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
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

     # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


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
      | "5501_ORN_multiple_Externaltbl_Records" | 1                 | -5             | 100          | 4                 | 60                | 100       |
