@MPSAWelcomeBonus_ORN_5839
Feature: Create test data for MPSA Welcome Bonus 5839 offer positive nd negative scenarios

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_ORN_TestData @5839 @ORN @RS22116 @Sanity-ORN
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_ORN Create test data for base test case

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # insert the created CID into the ORN Test data excel sheet
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
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID             | ACCT_ODT |
      | "5839_ORN_BASE_01" | "20"     |


  @MPSAWelcomeBonus @MPSAWelcomeBonus_Positive_ORN_TestData @5839 @ORN @RS22116
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_ORN Create test data for Positive Scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # insert the created CID into the ORN Test data excel sheet
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
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                          | ACCT_ODT |
      | "5839_ORN_CUST_AGE_eq_18"                       | "20"     |
      | "5839_ORN_LANG_CD_eq_fr"                        | "20"     |
      | "5839_ORN_NOT_AML_KYC_eq_NULL"                  | "20"     |
      | "5839_ORN_MD_FINANCIAL_F_eq_NULL"               | "20"     |
      | "5839_ORN_ITRADE_MCLEOD_F_eq_NULL"              | "20"     |
      | "5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL" | "20"     |
      | "5839_ORN_DO_NOT_SOLICIT_F_eq_NULL"             | "20"     |
      | "5839_ORN_ACCT_ODT_eq_30"                       | "30"     |
      | "5839_ORN_ITRADE_MCLEOD_F_eq_Y"                 | "20"     |


  @MPSAWelcomeBonus @MPSAWelcomeBonus_Negative_ORN_TestData @5839 @ORN @RS22116
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_ORN Create test data for Negative Scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # insert the created CID into the ORN Test data excel sheet
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
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                         | ACCT_ODT |
      | "N_5839_ORN_DECEASED_F_eq_Y"                   | "20"     |
      | "N_5839_ORN_DECEASED_F_eq_NULL"                | "20"     |
      | "N_5839_ORN_CUST_TP_CD_ne_PSNL"                | "20"     |
      | "N_5839_ORN_CUST_TP_CD_eq_NULL"                | "20"     |
      | "N_5839_ORN_PRIM_CNTRY_CD_ne_CA"               | "20"     |
      | "N_5839_ORN_PRIM_CNTRY_CD_eq_NULL"             | "20"     |
      | "N_5839_ORN_CUST_AGE_lt_18"                    | "20"     |
      | "N_5839_ORN_CUST_AGE_eq_NULL"                  | "20"     |
      | "N_5839_ORN_LANG_CD_ne_en_fr"                  | "20"     |
      | "N_5839_ORN_LANG_CD_eq_NULL"                   | "20"     |
      | "N_5839_ORN_NOT_AML_KYC_eq_Y"                  | "20"     |
      | "N_5839_ORN_MD_FINANCIAL_F_eq_Y"               | "20"     |
      | "N_5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y" | "20"     |
      | "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_Y"            | "20"     |
      | "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_NULL"         | "20"     |
      | "N_5839_ORN_MRKTBLE_F_n_eq_Y"                  | "20"     |
      | "N_5839_ORN_MRKTBLE_F_eq_NULL"                 | "20"     |
      | "N_5839_ORN_DO_NOT_SOLICIT_F_eq_Y"             | "20"     |
      | "N_5839_ORN_SRC_ACCT_STAT_CD_ne_Active"        | "20"     |
      | "N_5839_ORN_SRC_ACCT_STAT_CD_eq_NULL"          | "20"     |
      | "N_5839_ORN_ACCT_SUBSYS_ID_ne_UF"              | "20"     |
      | "N_5839_ORN_ACCT_SUBSYS_ID_eq_NULL"            | "20"     |
      | "N_5839_ORN_SRC_SYS_PRD_CD_ne_BSAMP"           | "20"     |
      | "N_5839_ORN_SRC_SYS_PRD_CD_eq_NULL"            | "20"     |
      | "N_5839_ORN_ACCT_ODT_eq_0"                     | "0"      |
      | "N_5839_ORN_ACCT_ODT_gt_30"                    | "31"     |
      | "N_5839_ORN_ACCT_ODT_eq_NULL"                  | "NULL"   |
      | "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"     | "20"     |
      | "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"  | "20"     |
      | "N_5839_ORN_INSIGHT_CD_ne_MPSA_WELCOME_BONUS"  | "20"     |
#      | "N_5839_ORN_INSIGHT_CD_eq_NULL"                | "20"     | -- cannot be inserted in DB
#      | "N_5839_ORN_CURR_VAL_ne_1"                     | "20"     |-- Req changed to avoid check on CURR_VAL equal to 1
      | "N_5839_ORN_CURR_VAL_eq_NULL"                  | "20"     |


  @MPSAWelcomeBonus @MPSAWelcomeBonus_MultipleInsights_PosNeg_ORN_TestData @5839 @ORN @RS22116
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_ORN Create test data for multiple cust insight Scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # insert the created CID into the ORN Test data excel sheet
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
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    * def Cust2 = <TestID>+'_Account_2'
    * print 'Customer 2 Test ID is '+Cust2
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight
    # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | CID |
      | <TestID> | accnumcustinsight | CID |
      | Cust2    | ""                | CID |
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights
    Examples:
      | TestID                                                                 | ACCT_ODT |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_ne_1"    | "20"     |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_NULL" | "20"     |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_ne_1"     | "20"     |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_NULL"  | "20"     |
      | "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_1"  | "20"     |
      | "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_1"   | "20"     |

