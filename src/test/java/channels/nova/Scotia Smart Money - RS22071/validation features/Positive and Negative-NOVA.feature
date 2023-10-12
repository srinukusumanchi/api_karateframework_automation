@SSM_PositiveNegative_Validation_5796
Feature: Validate Scotia Smart Money Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @ScotiaSmartMoney_5796  @SSM_5796_Nova_IH_Validation @5796 @NOVA @RS22071
  Scenario Outline: ScotiaSmartMoney_5796_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation
  #    Reading data from Excel sheet
    * def testDataFileName = ScotiaSmartMoneyNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
    * def cellGroup = karate.get('$data.CellGroup')
    * print "cell group is :" +cellGroup
   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSMOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID              |
      | "5796_NOVA_BASE_01" |


  @ScotiaSmartMoney_5796  @SSM_5796_Nova_Positive_Validation @5796 @NOVA @RS22071
  Scenario Outline: ScotiaSmartMoney_5796_NOVA Validate <TestID> Positive TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = ScotiaSmartMoneyNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSMSpecificOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                                     |
      | "5796_NOVA_Seg_01_LANG_CD_eq_fr"                                                                                            |
      | "5796_NOVA_CUST_AGE_eq_18"                                                                                                  |
      | "5796_NOVA_DO_NOT_SOLICIT_F_eq_NULL"                                                                                        |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"                                             |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_01_VFB"                                                                |
      | "5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_14_AXG"                                                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_45"                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_50"                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_45"                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_lt_50"                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50"                                |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_eq_365"                               |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_lt_365"                               |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50_FLG_SSM_LAST_CLICK_EVTDT_gt_45" |
      | "5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_and_CURR_VAL_eq_1_and_CURRENTDATE_EVENT_DATE_gt_50_FLG_SSM_LAST_CLICK_ne_1"        |
      | "5796_NOVA_1_elig_acct_1_nonelig_acct"                                                                                     |


  @ScotiaSmartMoney_5796  @SSM_5796_Nova_Negative_Validation @5796 @NOVA @RS22071
  Scenario Outline: ScotiaSmartMoney_5796_NOVA Validate <TestID> Negative TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = ScotiaSmartMoneyNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    #* print 'TestID' + data
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
   # * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

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

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                                          |
      | "N_5796_NOVA_DECEASED_F_eq_Y"                                                                                  |
      | "N_5796_NOVA_DECEASED_F_eq_NULL"                                                                               |
      | "N_5796_NOVA_CUST_TP_CD_not_PSNL"                                                                               |
      | "N_5796_NOVA_Lang_CD_eq_bn"                                                                                     |
      | "N_5796_NOVA_Lang_CD_eq_NULL"                                                                                   |
      | "N_5796_NOVA_CUST_AGE_eq_16"                                                                                    |
      | "N_5796_NOVA_CUST_AGE_eq_NULL"                                                                                  |
      | "N_5796_NOVA_PRIM_CNTRY_CD_eq_Not-CA"                                                                           |
      | "N_5796_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                                             |
      | "N_5796_NOVA_MRKTBLE_F_eq_N"                                                                                    |
      | "N_5796_NOVA_MRKTBLE_F_eq_NULL"                                                                                 |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_14"                                                                              |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_17"                                                                              |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_VFB"                                                                             |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_BLV"                                                                             |
      | "N_5796_NOVA_SRC_SYS_PRD_CD_in_OverDraft"                                                                       |
      | "N_5796_NOVA_DO_NOT_SOLICIT_F_eq_Y"                                                                             |
      | "N_5796_NOVA_CURR_VAL_not_eq_1"                                                                                 |
      | "N_5796_NOVA_CURR_VAL_eq_NULL"                                                                                  |
      | "N_5796_NOVA_DO_NOT_SOLICIT_F_eq_Y"                                                                             |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_CURR_VAL_eq_1_CURRENTDATE-EVENT_DATE_lt_45"                           |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_CURR_VAL_eq_1_CURRENTDATE-EVENT_DATE_gt_365"                          |
      | "N_5796_NOVA_ACCT_SUBSYS_ID_eq_BB_KS_SRC_SYS_PRD_CD_eq_17_BLV"                                                  |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK"                                                                  |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_CURR_VAL_eq_1_CURRENTDATE-EVENT_DATE_lt_45"                       |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_gt_45"   |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_lt_45"   |
      | "N_5796_NOVA_INSIGHT_CD_eq_FLG_SSM_ENROLL_EVENT_DATE_gt_45_INSIGHT_CD_eq_FLG_SSM_LAST_CLICK_EVENT_DATE_eq_NULL" |

