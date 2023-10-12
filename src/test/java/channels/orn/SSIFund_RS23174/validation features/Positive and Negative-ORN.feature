@SSI_Fund_ORN @PositiveNegative_Validation_6233
Feature: Validate SSI Fund offer 6233 Positive and Negative test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/ORN/ChannelORN.txt')


  @SSI_Fund_Positive_Scenarios_withIHValidation @6233 @ORN @RS23174
  Scenario Outline: SSI Fund - RS23174_6233_ORN Validate <TestID> IH field values against proposition data
    * def testDataFileName = SSIFUNDORNTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/ORN/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ORN_REST_CALL')

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
    * call read('classpath:channels/ORN/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIFundOfferValidationWithIH')

    # Validate the ORN rest Response against DB and Proposition data
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIFundContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                 |
      | "6233_ORN_BASE_Seg_01" |


  @SSI_Fund_Positive_Scenarios_withoutIHValidation @6233 @ORN @RS23174
  Scenario Outline: SSI Fund - RS23174_6233_ORN Validate <TestID> web response against proposition data
    * def testDataFileName = SSIFUNDORNTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    #* call read('classpath:channels/ORN/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ORN_REST_CALL')

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

   # Validate the ORN rest Response against DB and Proposition data
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIFundContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                     |
      | "6233_ORN_Creative_01_LANG_CD_eq_EN"                                                                       |
      | "6233_ORN_Creative_01_LANG_CD_eq_F"                                                                        |
      | "6233_ORN_Creative_01_LANG_CD_eq_FR"                                                                       |
      | "6233_ORN_Creative_01_ITRADE_MCLEOD_F_eq_NULL"                                                             |
      | "6233_ORN_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RRS"     |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RSS"     |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REF"     |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REI"     |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_TFSA_SRC_SYS_SUB_PRD_CD_BNSCSVTF_eq_SRC_SYS_PRD_CD_eq_TFS"     |
      | "6233_ORN_Creative_01_ACCT_ODT_eq_10"                                                                      |
#      | "6233_ORN_Creative_01_NRS_RRSP "                                                                           |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180" |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180" |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_181" |
#      | "6233_ORN_Creative_01_NRS_RRSP_RRSP"                                                                       |
#      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP"                                                                  |
#      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP_RESP"                                                             |
#      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP_RESP_TFSA"                                                        |

  @SSI_Fund_ORN_Validation_6233_Negative_TestCases_Validation @6233 @ORN @RS23174
  Scenario Outline: SSI_Fund_ORN_Validation_6233_Negative_TestCases_Validation Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = SSIFUNDORNTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print 'testid'+data
    * def cid = karate.get('data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/ORN/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ORN_REST_CALL')

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
      | TestID                                                                                                       |
      | "N-6233_ORN_Creative_01_DECEASED_F_eq_Y"                                                                     |
      | "N-6233_ORN_Creative_01_DECEASED_F_eq_NULL"                                                                  |
      | "N-6233_ORN_Creative_01_CUST_TP_CD_eq_ABCD"                                                                  |
      | "N-6233_ORN_Creative_01_PRIM_CNTRY_CD_eq_IN"                                                                 |
      | "N-6233_ORN_Creative_01_PRIM_CNTRY_CD_eq_NULL"                                                               |
      | "N-6233_ORN_Creative_01_CUST_AGE_eq_NULL"                                                                    |
      | "N-6233_ORN_Creative_01_LANG_CD_eq_KA"                                                                       |
      | "N-6233_ORN_Creative_01_MRKTBLE_F_eq_N"                                                                      |
      | "N-6233_ORN_Creative_01_MRKTBLE_F_eq_NULL"                                                                   |
      | "N-6233_ORN_Creative_01_ITRADE_MCLEOD_F_eq_Y"                                                                |
      | "N-6233_ORN_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                   |
      | "N-6233_ORN_Creative_01_INDV_FRST_NM_eq_NULL"                                                                |
      | "N-6233_ORN_Creative_01_INDV_LAST_NM_eq_NULL"                                                                |
      | "N-6233_ORN_Creative_01_PLN_ACCT_DLR_ne_SSI"                                                                 |
      | "N-6233_ORN_Creative_01_PLN_ACCT_DLR_eq_NULL"                                                                |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_ne_UF"                                                                |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_NULL"                                                              |
      | "N-6233_ORN_Creative_01_SRC_ACCT_STAT_CD_ne_Active"                                                          |
      | "N-6233_ORN_Creative_01_SRC_ACCT_STAT_CD_eq_NULL"                                                            |
      | "N-6233_ORN_Creative_01_PLAN_SPOT_BALANCE_eq_1"                                                              |
      | "N-6233_ORN_Creative_01_ACCT_ODT_gt_10"                                                                      |
      | "N-6233_ORN_Creative_01_ACCT_ODT_eq_NULL"                                                                    |
      | "N-6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_LIF_SRC_SYS_SUB_PRD_CD_eq_BNSCSVRG_SRC_SYS_PRD_CD_eq_BNSCSVRG" |
      | "N-6233_ORN_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                                       |
      | "N-6233_ORN_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                    |
      | "N-6233_ORN_Creative_01_IP_AR_RELATN_TYPE_CD_ne_ANN_OR_OWN"                                                         |
      | "N-6233_ORN_Creative_01_IP_AR_RELATN_TYPE_CD_eq_NULL"                                                        |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180" |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_179" |