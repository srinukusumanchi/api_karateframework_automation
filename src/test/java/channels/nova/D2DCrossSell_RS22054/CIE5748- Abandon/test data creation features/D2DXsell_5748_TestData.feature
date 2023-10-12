@D2DXSell_Nova_5748_TestData_Creation
Feature: Create test data for D2DXSell- 5748 Nova test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DXSell_NOVA_Sanity_5748_TestData @5748 @NOVA @RS22054 @Sanity
  Scenario Outline: D2DXSell_RS22054_5748_NOVA_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
      # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                              | Event_Date |
      | "5748_NOVA_BASE_Preferred_Ultimate" | 1          |
      | "5748_NOVA_BASE_Other_Abandon"      | 1          |

  @D2DXSell_NOVA_positive_5748_TestData @5748 @NOVA @RS22054 @Sanity
  Scenario Outline: D2DXSell_RS22054_5748_NOVA_TestData Create test data for positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
      # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                      | Event_Date |
      | "5748_NOVA_CUST_AGE_eq_18_CUST_DIM"                                                         | 2          |
      | "5748_NOVA_CUST_AGE_eq_65_CUST_DIM"                                                         | 3          |
      | "5748_NOVA_Not_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts"               | 4          |
      | "5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts"            | 5          |
      | "5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing_Accounts"            | 6          |
      | "5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_2"                                 | 7          |
      | "5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_4"                                 | 8          |
      | "5748_NOVA_Physician_Flag"                                                                  | 9          |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | 2          |
      | "5748_NOVA_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | 2          |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | 2          |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" | 2          |
      | "5748_NOVA_DNS_eq_Y"                                                                        | 2          |

  @D2DXSell_NOVA_Negative_5748_TestData @5748 @NOVA @RS22054 @Sanity
  Scenario Outline: D2DXSell_RS22054_5748_NOVA_TestData Create test data for negative scenarios

     # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

    * string ACCT_ODT = <ACCT_ODT>

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
      # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Acct_ODT into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                              | Event_Date |ACCT_ODT|
#      | "N-5748_NOVA_DECEASED_F_eq_Y"                                                      | 1          |"NULL"|
#      | "N-5748_NOVA_DECEASED_F_eq_NULL"                                                   | 2          |"NULL"|
#      | "N-5748_NOVA_CUST_TP_CD_ne_PSNL"                                                   | 3          |"NULL"|
#      | "N-5748_NOVA_LANG_CD_eq_K"                                                         | 4          |"NULL"|
#      | "N-5748_NOVA_LANG_CD_eq_NULL"                                                      | 5          |"NULL"|
#      | "N-5748_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                | 6          |"NULL"|
#      | "N-5748_NOVA_PRIM_CNTRY_CD_ne_CA"                                                  | 7          |"NULL"|
#      | "N-5748_NOVA_MKTBL_eq_N"                                                           | 8          |"NULL"|
#      | "N-5748_NOVA_MKTBL_eq_NULL"                                                        | 9          |"NULL"|
#      | "N-5748_NOVA_NOT_AML_KYC_eq_Y"                                                     | 10         |"NULL"|
#      | "N-5748_NOVA_ITRADE_MCLEOD_F_eq_Y"                                                 | 11         |"NULL"|
#      | "N-5748_NOVA_EMPLOYEE_STAFF_F_eq_Y"                                                | 12         |"NULL"|
#      | "N-5748_NOVA_HAS_CLOSED_CHQ_F_eq_Y"                                                | 13         |"NULL"|
#      | "N_5748_NOVA_CUST_AGE_gt_65"                                                       | 15         |"NULL"|
#      | "N_5748_NOVA_CUST_AGE_lt_18"                                                       | 16         |"NULL"|
#      | "N_5748_NOVA_CUST_AGE_eq_NULL"                                                     | 17         |"NULL"|
#      | "N_5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts" | 18         |"NULL"|
#      | "N_5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_ne_1_2_3_4"                | 19         |"NULL"|
#      | "N_5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_NULL"                   | 1          |"NULL"|
#      | "N_5748_NOVA_INSIGHT_CD_ne_FLG_D2D_ABANDON_APP_CURR_VAL_eq_1"                      | 2          |"NULL"|
#      | "N_5748_NOVA_INSIGHT_CD_EVENT_DT_eq_NULL"                                          | "NULL"     |"NULL"|
#      | "N_5748_NOVA_INSIGHT_CD_EVENT_DT_gt_21"                                            | 22         |"NULL"|
      | "N_5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" | 1          |179|
      | "N_5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" | 1          |180|

