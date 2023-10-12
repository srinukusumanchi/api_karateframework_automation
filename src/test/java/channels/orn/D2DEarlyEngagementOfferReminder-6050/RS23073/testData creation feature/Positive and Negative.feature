@PositiveAndNegative_D2DEarlyEngagementOfferReminderORN_TestData_6050_ORN
Feature: Create test data for D2DEarlyEngagementOfferReminderORN Offer-6050 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_BASE_Positive_TestData_Multipleinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for base Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID             | ACCT_ODT |
      | "6050_ORN_BASE_01" | "45"     |

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Positive_TestData_Multipleinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                        | ACCT_ODT |
      | "6050_ORN_LANG_CD_eq_fr"                                                      | "45"     |
      | "6050_ORN_CUST_AGE_eq_18"                                                     | "45"     |
      | "6050_ORN_EMPLOYEE_STAFF_F_eq_NULL"                                           | "45"     |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03" | "45"     |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01" | "45"     |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03" | "45"     |
      | "6050_ORN_ACCT_ODT_eq_44days"                                                 | "44"     |
      | "6050_ORN_ACCT_ODT_eq_50days"                                                 | "50"     |
      | "6050_ORN_HAS_CLOSED_CHQ_F_eq_NULL"                                           | "45"     |

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_TestData_singlecustinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for singlecustinsights  Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                          | ACCT_ODT |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAY"   | "45"     |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_BILL"  | "45"     |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAT"   | "45"     |
      | "N_6050_ORN_INSIGHT_CD_ne_FLG_D2DOFRFULFIL_PAT" | "45"     |

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Negative_TestData_multiplecustinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for multiplecustinsights Negative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line"45"
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                            | ACCT_ODT |
      | "N_6050_ORN_DECEASED_F_eq_Y"                                                      | "45"     |
      | "N_6050_ORN_DECEASED_F_eq_NULL"                                                   | "45"     |
      | "N_6050_ORN_CUST_TP_CD_ne_PSNL"                                                   | "45"     |
      | "N_6050_ORN_PRIM_CNTRY_CD_ne_CA"                                                  | "45"     |
      | "N_6050_ORN_PRIM_CNTRY_CD_eq_NULL"                                                | "45"     |
      | "N_6050_ORN_LANG_CD_ne_en"                                                        | "45"     |
      | "N_6050_ORN_LANG_CD_ne_fr"                                                        | "45"     |
      | "N_6050_ORN_LANG_CD_eq_NULL"                                                      | "45"     |
      | "N_6050_ORN_CUST_AGE_lt_18"                                                       | "45"     |
      | "N_6050_ORN_CUST_AGE_eq_NULL"                                                     | "45"     |
      | "N_6050_ORN_EMPLOYEE_STAFF_F_eq_Y"                                                | "45"     |
      | "N_6050_ORN_PRV_BNK_IND_eq_Y"                                                     | "45"     |
      | "N_6050_ORN_PRV_BNK_IND_eq_NULL"                                                  | "45"     |
      | "N_6050_ORN_HAS_CLOSED_CHQ_F_eq_Y"                                                | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_ne_BB"                                                 | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_NULL"                                               | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_04"   | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_NULL" | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_02"   | "45"     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_NULL" | "45"     |
      | "N_6050_ORN_SRC_SYS_PRD_CD_eq_NULL"                                               | "45"     |
      | "N_6050_ORN_SRC_ACCT_STAT_CD_ne_A"                                                | "45"     |
      | "N_6050_ORN_SRC_ACCT_STAT_CD_eq_NULL"                                             | "45"     |
      | "N_6050_ORN_ACCT_ODT_lt_44days"                                                   | "43"     |
      | "N_6050_ORN_ACCT_ODT_gt_50days"                                                   | "51"     |
      | "N_6050_ORN_ACCT_ODT_eq_NULL"                                                     | "NULL"   |
      | "N_6050_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                        | "45"     |
      | "N_6050_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                     | "45"     |


  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Negative_diffAcct_num_TestData_multiplecustinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for multiplecustinsights with different acct num Negative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number1 to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Generating account number2 to insert into database
    * def accountNumber1 = '00000001'+CID
    * print "account number2 is " + accountNumber1

    # Used table keyword to iterate for any BDD line"45"
    * table examples
      | testId   | CID | accountNumber  |
      | <TestID> | CID | accountNumber1 |
      | cust2    | CID | accountNumber1 |
      | cust3    | CID | accountNumber1 |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                    | ACCT_ODT |
      | "N_6050_ORN_CUST_INSIGHT_ACCT_NUM_ne_TargerAccountNumber" | "45"     |


  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Negative_NullinsightAcct_num_TestData_multiplecustinsights @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for multiplecustinsights with null acct num Negative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number1 to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line"45"
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | cust2    | CID |
      | cust3    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
#    # insert the created Account Number into the CUST_INSIGHTS sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                     | ACCT_ODT |
      | "N_6050_ORN_CUST_INSIGHT_ACCT_NUM_eq_NULL" | "45"     |


  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_ExternalTable_TestData_6050 @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN <TestID> ExternalTableExclusion Create test data for base PositiveNegative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    * string VALID_START_DATE = <VALID_START_DATE>
    * print "VALID_START_DATE is", VALID_START_DATE
    * string VALID_END_DATE = <VALID_END_DATE>
    * print "VALID_END_DATE is", VALID_END_DATE
#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

      ##To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/orn/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

    Examples:
      | TestID                                                                               | VALID_START_DATE | VALID_END_DATE | ACCT_ODT |
      #Exclusion Negative
      | "6050_ORN_Creative_1_ExtTable_Curr_Dt_lt_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" | -2               | -2             | 45       |
      | "6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_gt_VALID_END_DATE"   | 2                | 2              | 45       |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CODE_ne_RS23073"                                | 2                | -2             | 45       |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"                            | 2                | -2             | 45       |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                         | 2                | -2             | 45       |

      #Exclusion Positive
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" | 1                | -1             | 45       |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_eq_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" | 0                | -1             | 45       |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_eq_VALID_END_DATE" | 1                | 0              | 45       |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_eq_VALID_START_DATE_Curr_Dt_eq_VALID_END_DATE" | 0                | 0              | 45       |