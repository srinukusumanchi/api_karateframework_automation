@Scotia_Smart_Money_Nova_5796_TestData_Creation
Feature: Create test data for Scotia Smart Money- 5796 Nova test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @Scotia_Smart_Money_NOVA_Sanity_TestData @5796 @NOVA @RS22071 @Sanity
  Scenario Outline: Scotia_Smart_Money_RS22071_5796_NOVA_TestData Create test data<TestID> for single account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ScotiaSmartMoneyNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID              | Event_Date |
      | "5796_NOVA_BASE_01" | "45"       |


  @Scotia_Smart_Money_NOVA_Single_Account_insight_scenarios_TestData @5796 @NOVA @RS22071
  Scenario Outline: Scotia_Smart_Money_RS22071_5796_NOVA_TestData Create test data<TestID> for single account single insight scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ScotiaSmartMoneyNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                       | Event_Date |
      | "5796_NOVA_Seg_01_LANG_CD_eq_fr"                                                             | "46"       |
      | "5796_NOVA_CUST_AGE_eq_18"                                                                   | "46"       |
      | "5796_NOVA_DO_NOT_SOLICIT_F_eq_NULL"                                                         | "46"       |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"              | "46"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_45"  | "47"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_50"  | "50"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_45"  | "45"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_lt_50"  | "45"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50"  | "55"       |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_365" | "365"      |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_lt_365" | "340"      |
      | "N_5796_NOVA_DECEASED_F_eq_Y"                                                                | "45"       |
      | "N_5796_NOVA_DECEASED_F_eq_NULL"                                                             | "45"       |
      | "N_5796_NOVA_Lang_CD_eq_bn"                                                                  | "45"       |
      | "N_5796_NOVA_Lang_CD_eq_NULL"                                                                | "45"       |
      | "N_5796_NOVA_CUST_AGE_eq_16"                                                                 | "45"       |
      | "N_5796_NOVA_CUST_AGE_eq_NULL"                                                               | "45"       |
      | "N_5796_NOVA_PRIM_CNTRY_CD_eq_Not-CA"                                                        | "45"       |
      | "N_5796_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                          | "45"       |
      | "N_5796_NOVA_MRKTBLE_F_eq_N"                                                                 | "45"       |
      | "N_5796_NOVA_MRKTBLE_F_eq_NULL"                                                              | "45"       |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_14"                                                           | "45"       |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_17"                                                           | "45"       |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_VFB"                                                          | "45"       |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_BLV"                                                          | "45"       |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_OverDraft"                                                    | "45"       |
      | "N_5796_NOVA_DO_NOT_SOLICIT_F_eq_Y"                                                          | "45"       |
      | "N_5796_NOVA_CURR_VAL_not_eq_1"                                                              | "45"       |
      | "N_5796_NOVA_CURR_VAL_eq_NULL"                                                               | "45"       |
      | "N_5796_NOVA_CUST_TP_CD_not_PSNL"                                                            | "45"       |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_CURR_VAL_eq_1_CURRENTDATE_EVENT_DATE_lt_45"        | "45"       |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_CURR_VAL_eq_1_CURRENTDATE_EVENT_DATE_gt_365"       | "369"      |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK"                                               | "5"        |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_CURR_VAL_eq_1_CURRENTDATE_EVENT_DATE_lt_45"    | "5"        |


  @Scotia_Smart_Money_NOVA_multiple_Account_insight_Positive_Scenarios_TestData @5796 @NOVA @RS22071
  Scenario Outline: Scotia_Smart_Money_RS22071_5796_NOVA_TestData Create test data<TestID> for multiple account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ScotiaSmartMoneyNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating AC account
    * def accountNumber2 = '0000000000000'+randGen(10)
    * print "AC account number is " + accountNumber2
    # Defining TestID for the loop
    * def TEST = testId+'_Account_2'


    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber  |
      | <TestID> | accountNumber  |
      | TEST     | accountNumber2 |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                 | Event_Date |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_01_VFB"   | "45"       |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_14_AXG"   | "45"       |
      | "N_5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_17_BLV" | "45"       |
      | "5796_NOVA_1_elig_acct_1_nonelig_acct" | "45"       |


  @Scotia_Smart_Money_NOVA_single_Account_multiple_insight_Positive_Scenarios_TestData @5796 @NOVA @RS22071
  Scenario Outline: Scotia_Smart_Money_RS22071_5796_NOVA_TestData Create test data<TestID> for single account multiple insight positive scenarios
    * def testDataFileName = ScotiaSmartMoneyNovaTestData
    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
#    Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
#     Convert the event date to YYYY-MM-DD format
    * string event_date_1 = <event_date1> == 'NULL'? 'NULL': dateFormatExcludeDays(<event_date1>)
    * print "Event Date1 is", event_date_1
    * string event_date_2 = <event_date2> == 'NULL'? 'NULL': dateFormatExcludeDays(<event_date2>)
    * print "Event Date2 is", event_date_2
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
    * def Insight2 = <TestID>+'_insight_2'
    * print 'Customer 2 Test ID is '+Insight2

   # Used table keyword to iterate for any BDD line
    * table mult_insights
      | testId   | event_date   | CID |
      | <TestID> | event_date_1 | CID |
      | Insight2 | event_date_2 | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') mult_insights
#
    Examples:
      | TestID                                                                                                                     | event_date1 | event_date2 |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50_FLG_SSM_LAST_CLICK_EVTDT_gt_45" | "60"        | "46"        |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50_FLG_SSM_LAST_CLICK_ne_1"        | "50"        | "47"        |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_CURR_VAL_eq_1_CURRENTDATE_EVENT_DATE_lt_45"                                  | "60"        | "44"        |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_gt_45"              | "47"        | "46"        |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_lt_45"              | "47"        | "44"        |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_eq_NULL"            | "47"        | "NULL"      |
