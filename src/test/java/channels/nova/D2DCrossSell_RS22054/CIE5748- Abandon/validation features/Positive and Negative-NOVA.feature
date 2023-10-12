@PositiveNegative_Validation_5748
Feature: Validate D2DXSell- 5748 NOVA for Positive and Negative test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @D2DXSell @D2DXSell_BASE_IH_5748_Validation @5748 @NOVA @RS22054
  Scenario Outline: D2DXsell_RS22054_5748_NOVA Validate base test cases with IH field values against proposition data
    * def testDataFileName = D2DXSellNovaTestData
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
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')


##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "5748_NOVA_BASE_Preferred_Ultimate" |
      | "5748_NOVA_BASE_Other_Abandon"      |


  @D2DXSell @D2DXSell_positive_with_Out_IH_Validation_5748 @5748 @NOVA @RS22054
  Scenario Outline: D2DXsell_ RS22054_5748_NOVA Validate Positive scenarios without IH validation against proposition data
    * def testDataFileName = D2DXSellNovaTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#   # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#
##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                      |
#      | "5748_NOVA_CUST_AGE_eq_18_CUST_DIM"                                                         |
#      | "5748_NOVA_CUST_AGE_eq_65_CUST_DIM"                                              |
#      | "5748_NOVA_Not_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts"    |
#      | "5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts" |
#      | "5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing_Accounts" |
#      | "5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_2"                      |
#      | "5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_4"                      |
#      | "5748_NOVA_Physician_Flag"                                                       |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5748_NOVA_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" |
      | "5748_NOVA_DNS_eq_Y"                                                                        |

  @D2DXSell @D2DXSell_Negative_TestCases_Validation_5748 @5748 @NOVA @RS22054

  Scenario Outline: D2DXsell  RS22054_5748_NOVA Validate Negative TestCases Response Fields
    * def testDataFileName = D2DXSellNovaTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

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
    * print '***************Response*************'+karate.pretty(responseString)

    * clearResultFields()

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                        |
#      | "N-5748_NOVA_DECEASED_F_eq_Y"                                                      |
#      | "N-5748_NOVA_DECEASED_F_eq_NULL"                                                   |
#      | "N-5748_NOVA_CUST_TP_CD_ne_PSNL"                                                   |
#      | "N-5748_NOVA_LANG_CD_eq_K"                                                         |
#      | "N-5748_NOVA_LANG_CD_eq_NULL"                                                      |
#      | "N-5748_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                |
#      | "N-5748_NOVA_PRIM_CNTRY_CD_ne_CA"                                                  |
#      | "N-5748_NOVA_MKTBL_eq_N"                                                           |
#      | "N-5748_NOVA_MKTBL_eq_NULL"                                                        |
#      | "N-5748_NOVA_NOT_AML_KYC_eq_Y"                                                     |
#      | "N-5748_NOVA_ITRADE_MCLEOD_F_eq_Y"                                                 |
#      | "N-5748_NOVA_EMPLOYEE_STAFF_F_eq_Y"                                                |
#      | "N-5748_NOVA_HAS_CLOSED_CHQ_F_eq_Y"                                                |
#      | "N_5748_NOVA_CUST_AGE_gt_65"                                                       |
#      | "N_5748_NOVA_CUST_AGE_lt_18"                                                       |
#      | "N_5748_NOVA_CUST_AGE_eq_NULL"                                                     |
#      | "N_5748_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing_Accounts" |
#      | "N_5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_ne_1_2_3_4"                |
#      | "N_5748_NOVA_INSIGHT_CD_eq_FLG_D2D_ABANDON_APP_CURR_VAL_eq_NULL"                   |
#      | "N_5748_NOVA_INSIGHT_CD_ne_FLG_D2D_ABANDON_APP_CURR_VAL_eq_1"                      |
#      | "N_5748_NOVA_INSIGHT_CD_EVENT_DT_eq_NULL"                                          |
#      | "N_5748_NOVA_INSIGHT_CD_EVENT_DT_gt_21"                                            |
      | "N_5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" |
      | "N_5748_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" |

