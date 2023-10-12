@PositiveNegative_D2DEarlyEngagementOfferReminderORN_6050
Feature: Validate D2DEarlyEngagementOfferReminderORN Offer-6050 Positive and Negative test cases

  Background: Common for ORN Positive and Negative

   # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_BASE_IH_Validation_6050 @6001 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Validate <TestID> base Positive TestCases Response Fields
    * def testDataFileName = D2DOfferFulfilmentReminderORN
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

# Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DEarlyEngagementOfferReminderIHvalidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DOfferFulfilmentReminderOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "6050_ORN_BASE_01" |

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Positive_TestCases_Validation @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = D2DOfferFulfilmentReminderORN
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DOfferFulfilmentReminderOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                               |
      | "6050_ORN_LANG_CD_eq_fr"                                                             |
      | "6050_ORN_CUST_AGE_eq_18"                                                            |
      | "6050_ORN_EMPLOYEE_STAFF_F_eq_NULL"                                                  |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03"        |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01"        |
      | "6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03"        |
      | "6050_ORN_ACCT_ODT_eq_44days"                                                        |
      | "6050_ORN_ACCT_ODT_eq_50days"                                                        |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAY"                                        |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_BILL"                                       |
      | "6050_ORN_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAT"                                        |
      | "6050_ORN_HAS_CLOSED_CHQ_F_eq_NULL"                                                  |

      #Exclusion Negative
      | "6050_ORN_Creative_1_ExtTable_Curr_Dt_lt_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" |
      | "6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_gt_VALID_END_DATE" |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CODE_ne_RS23073"                              |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"                          |
      | "6050_ORN_Creative_1_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                       |


  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_Negative_TestCases_Validation @6050 @ORN @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = D2DOfferFulfilmentReminderORN
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

#    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * match responseString == {}

    Examples:
      | TestID                                                                                 |
      | "N_6050_ORN_DECEASED_F_eq_Y"                                                           |
      | "N_6050_ORN_DECEASED_F_eq_NULL"                                                        |
      | "N_6050_ORN_CUST_TP_CD_ne_PSNL"                                                        |
      | "N_6050_ORN_PRIM_CNTRY_CD_ne_CA"                                                       |
      | "N_6050_ORN_PRIM_CNTRY_CD_eq_NULL"                                                     |
      | "N_6050_ORN_LANG_CD_ne_en"                                                             |
      | "N_6050_ORN_LANG_CD_ne_fr"                                                             |
      | "N_6050_ORN_LANG_CD_eq_NULL"                                                           |
      | "N_6050_ORN_CUST_AGE_lt_18"                                                            |
      | "N_6050_ORN_CUST_AGE_eq_NULL"                                                          |
      | "N_6050_ORN_EMPLOYEE_STAFF_F_eq_Y"                                                     |
      | "N_6050_ORN_PRV_BNK_IND_eq_Y"                                                          |
      | "N_6050_ORN_PRV_BNK_IND_eq_NULL"                                                       |
      | "N_6050_ORN_HAS_CLOSED_CHQ_F_eq_Y"                                                     |
      | "N_6050_ORN_ACCT_SUBSYS_ID_ne_BB"                                                      |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_NULL"                                                    |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_04"        |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_NULL"      |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_02"        |
      | "N_6050_ORN_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_NULL"      |
      | "N_6050_ORN_SRC_SYS_PRD_CD_eq_NULL"                                                    |
      | "N_6050_ORN_SRC_ACCT_STAT_CD_ne_A"                                                     |
      | "N_6050_ORN_SRC_ACCT_STAT_CD_eq_NULL"                                                  |
      | "N_6050_ORN_ACCT_ODT_lt_44days"                                                        |
      | "N_6050_ORN_ACCT_ODT_gt_50days"                                                        |
      | "N_6050_ORN_ACCT_ODT_eq_NULL"                                                          |
      | "N_6050_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                             |
      | "N_6050_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                          |
      | "N_6050_ORN_CUST_INSIGHT_ACCT_NUM_ne_TargerAccountNumber"                              |
      | "N_6050_ORN_CUST_INSIGHT_ACCT_NUM_eq_NULL"                                             |
      | "N_6050_ORN_INSIGHT_CD_ne_FLG_D2DOFRFULFIL_PAT"                                        |

#       Exclusion Positive
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_eq_VALID_START_DATE_Curr_Dt_lt_VALID_END_DATE" |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_gt_VALID_START_DATE_Curr_Dt_eq_VALID_END_DATE" |
      | "N-6050_ORN_Creative_1_ExtTable_Curr_Dt_eq_VALID_START_DATE_Curr_Dt_eq_VALID_END_DATE" |
