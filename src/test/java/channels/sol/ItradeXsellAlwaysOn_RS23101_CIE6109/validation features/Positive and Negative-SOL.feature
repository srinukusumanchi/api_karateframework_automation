@PositiveNegative_D2DEarlyEngagementOfferReminderSOL_6050
Feature: Validate D2DEarlyEngagementOfferReminderSOL Offer-6050 Positive and Negative test cases

  Background:  Common for SOL Positive and Negative

  # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_BASE_IH_Validation_6050 @6001 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Validate <TestID> base Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@D2DEarlyEngagementOfferReminderSOLIHvalidation')
#     Validate the web Response with IH,Proposition
    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DEngagementOfferReminderFulfillmentSOL')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "6050_SOL_BASE_01" |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_Positive_TestCases_Validation @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DEngagementOfferReminderFulfillmentSOL')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                        |
      | "6050_SOL_LANG_CD_eq_fr"                                                      |
      | "6050_SOL_CUST_AGE_eq_18"                                                     |
      | "6050_SOL_EMPLOYEE_STAFF_F_eq_NULL"                                           |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "6050_SOL_ACCT_ODT_eq_44days"                                                 |
      | "6050_SOL_ACCT_ODT_eq_50days"                                                 |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAY"                                 |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_BILL"                                |
      | "6050_SOL_INSIGHT_CD_eq_FLG_D2DOFRFULFIL_PAT"                                 |
      | "6050_SOL_HAS_CLOSED_CHQ_F_eq_NULL"                                           |

      #Exclusion Positive

      | "N_6050_SOL_VALID_START_DATE_gt_Curr_Dt"     |
      | "N_6050_SOL_VALID_END_DATE_lt_Curr_Dt"       |
      | "N_6050_SOL_CAMPAIGN_CODE_ne_RS23073"        |
      | "N_6050_SOL_CAMPAIGN_CELL_CODE_FLAG_ne_N"    |
      | "N_6050_SOL_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" |


  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_Negative_TestCases_Validation @6050 @SOL @RS23073
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML == null

    Examples:
      | TestID                                                                            |
      | "N_6050_SOL_DECEASED_F_eq_Y"                                                      |
      | "N_6050_SOL_DECEASED_F_eq_NULL"                                                   |
      | "N_6050_SOL_CUST_TP_CD_ne_PSNL"                                                   |
      | "N_6050_SOL_PRIM_CNTRY_CD_ne_CA"                                                  |
      | "N_6050_SOL_PRIM_CNTRY_CD_eq_NULL"                                                |
      | "N_6050_SOL_LANG_CD_ne_en"                                                        |
      | "N_6050_SOL_LANG_CD_ne_fr"                                                        |
      | "N_6050_SOL_LANG_CD_eq_NULL"                                                      |
      | "N_6050_SOL_CUST_AGE_lt_18"                                                       |
      | "N_6050_SOL_CUST_AGE_eq_NULL"                                                     |
      | "N_6050_SOL_EMPLOYEE_STAFF_F_eq_Y"                                                |
      | "N_6050_SOL_PRV_BNK_IND_eq_Y"                                                     |
      | "N_6050_SOL_PRV_BNK_IND_eq_NULL"                                                  |
      | "N_6050_SOL_HAS_CLOSED_CHQ_F_eq_Y"                                                |
      | "N_6050_SOL_ACCT_SUBSYS_ID_ne_BB"                                                 |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_NULL"                                               |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_04"   |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_02"   |
      | "N_6050_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N_6050_SOL_SRC_SYS_PRD_CD_eq_NULL"                                               |
      | "N_6050_SOL_SRC_ACCT_STAT_CD_ne_A"                                                |
      | "N_6050_SOL_SRC_ACCT_STAT_CD_eq_NULL"                                             |
      | "N_6050_SOL_ACCT_ODT_lt_44days"                                                   |
      | "N_6050_SOL_ACCT_ODT_gt_50days"                                                   |
      | "N_6050_SOL_ACCT_ODT_eq_NULL"                                                     |
      | "N_6050_SOL_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                        |
      | "N_6050_SOL_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                     |
      | "N_6050_SOL_CUST_INSIGHT_ACCT_NUM_ne_TargerAccountNumber"                         |
      | "N_6050_SOL_CUST_INSIGHT_ACCT_NUM_eq_NULL"                                        |
      | "N_6050_SOL_INSIGHT_CD_ne_FLG_D2DOFRFULFIL_PAT"                                   |

      #Exclusion Negative

      | "6050_SOL_VALID_START_DATE_lt_Curr_Dt"   |
      | "6050_SOL_VALID_START_DATE_eq_Curr_Dt"   |
      | "6050_SOL_VALID_END_DATE_gt_Curr_Dt"     |
      | "6050_SOL_VALID_END_DATE_eq_Curr_Dt"     |

