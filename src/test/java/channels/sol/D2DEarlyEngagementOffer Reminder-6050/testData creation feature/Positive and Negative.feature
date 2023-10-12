@PositiveAndNegative_D2DEarlyEngagementOfferReminder_SOL_TestData_6050_SOL
Feature: Create test data for D2DEarlyEngagementOfferReminderSOL Offer-6050 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_BASE_Positive_TestData_Multipleinsights @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for base Positive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID             | Acct_Odt |
      | "6050_SOL_BASE_01" | "45"     |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_Positive_TestData_Multipleinsights @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for Positive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                        | Acct_Odt |
      | "6050_SOL_LANG_CD_eq_fr"                                                      | "45"     |
      | "6050_SOL_CUST_AGE_eq_18"                                                     | "45"     |
      | "6050_SOL_EMPLOYEE_STAFF_F_eq_NULL"                                           | "45"     |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03" | "45"     |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01" | "45"     |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03" | "45"     |
      | "6050_SOL_ACCT_ODT_eq_44days"                                                 | "44"     |
      | "6050_SOL_ACCT_ODT_eq_50days"                                                 | "50"     |
      | "6050_SOL_HAS_CLOSED_CHQ_F_eq_NULL"                                           | "45"     |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_TestData_singlecustinsights @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for singlecustinsights  Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') 
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') 
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') 
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') 
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                          | Acct_Odt |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAY"   | "45"     |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_BILL"  | "45"     |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAT"   | "45"     |
      | "N_6050_SOL_INSIGHT_CD_ne_FLG_D2DOFRFULFIL_PAT" | "45"     |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_Negative_TestData_multiplecustinsights @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for multiplecustinsights Negative Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                            | Acct_Odt |
      | "N_6050_SOL_DECEASED_F_eq_Y"                                                      | "45"     |
      | "N_6050_SOL_DECEASED_F_eq_NULL"                                                   | "45"     |
      | "N_6050_SOL_CUST_TP_CD_ne_PSNL"                                                   | "45"     |
      | "N_6050_SOL_PRIM_CNTRY_CD_ne_CA"                                                  | "45"     |
      | "N_6050_SOL_PRIM_CNTRY_CD_eq_NULL"                                                | "45"     |
      | "N_6050_SOL_LANG_CD_ne_en"                                                        | "45"     |
      | "N_6050_SOL_LANG_CD_ne_fr"                                                        | "45"     |
      | "N_6050_SOL_LANG_CD_eq_NULL"                                                      | "45"     |
      | "N_6050_SOL_CUST_AGE_lt_18"                                                       | "45"     |
      | "N_6050_SOL_CUST_AGE_eq_NULL"                                                     | "45"     |
      | "N_6050_SOL_EMPLOYEE_STAFF_F_eq_Y"                                                | "45"     |
      | "N_6050_SOL_PRV_BNK_IND_eq_Y"                                                     | "45"     |
      | "N_6050_SOL_PRV_BNK_IND_eq_NULL"                                                  | "45"     |
      | "N_6050_SOL_HAS_CLOSED_CHQ_F_eq_Y"                                                | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_ne_BB"                                                 | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_NULL"                                               | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_04"   | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_NULL" | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_02"   | "45"     |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_NULL" | "45"     |
      | "N_6050_SOL_SRC_SYS_PRD_CD_eq_NULL"                                               | "45"     |
      | "N_6050_SOL_SRC_ACCT_STAT_CD_ne_A"                                                | "45"     |
      | "N_6050_SOL_SRC_ACCT_STAT_CD_eq_NULL"                                             | "45"     |
      | "N_6050_SOL_ACCT_ODT_lt_44days"                                                   | "43"     |
      | "N_6050_SOL_ACCT_ODT_gt_50days"                                                   | "51"     |
      | "N_6050_SOL_ACCT_ODT_eq_NULL"                                                     | "NULL"   |
      | "N_6050_SOL_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                        | "45"     |
      | "N_6050_SOL_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                     | "45"     |
      | "N_6050_SOL_CUST_INSIGHT_ACCT_NUM_ne_TargerAccountNumber"                         | "45"     |
      | "N_6050_SOL_CUST_INSIGHT_ACCT_NUM_eq_NULL"                                        | "45"     |


  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_TestData_ExternalExclusion @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for ExternalTableExclusion  Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

      ##To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

     # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/sol/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

    Examples:
      | TestID                                     | VALID_START_DATE | VALID_END_DATE | ACCT_ODT |
      #Exclusion Negative
      | "N_6050_SOL_VALID_START_DATE_gt_Curr_Dt"     | -1               | -2             | 45       |
      | "N_6050_SOL_VALID_END_DATE_lt_Curr_Dt"       | 1                | 1              | 45       |
      | "N_6050_SOL_CAMPAIGN_CODE_ne_RS23073"        | 1                | -2             | 45       |
      | "N_6050_SOL_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | 1                | -2             | 45       |
      | "N_6050_SOL_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | 1                | -2             | 45       |

  #Exclusion Positive

      | "6050_SOL_VALID_START_DATE_lt_Curr_Dt"   | 1                | -1             | 45       |
      | "6050_SOL_VALID_START_DATE_eq_Curr_Dt"   | 0                | -1             | 45       |
      | "6050_SOL_VALID_END_DATE_gt_Curr_Dt"     | 1                | -1             | 45       |
      | "6050_SOL_VALID_END_DATE_eq_Curr_Dt"     | 1                | 0              | 45       |