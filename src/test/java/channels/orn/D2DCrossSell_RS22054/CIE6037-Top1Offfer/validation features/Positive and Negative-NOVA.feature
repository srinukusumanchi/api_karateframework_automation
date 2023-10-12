@PositiveNegative_Top1_Validation_6037
Feature: Validate D2DXSell- 6037 NOVA for Positive and Negative test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @D2DXSell @D2DXSell_BASE_Top1_IH_NOVA_Validation @6037 @NOVA @RS22054
  Scenario Outline: D2DXsell_RS22054_6037_NOVA Validate base test cases with IH field values against proposition data
    * def testDataFileName = D2DXSellTop1NovaTestData
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


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "6037_NOVA_BASE_01_NoMPSA"          |
     | "6037_NOVA_BASE_02_MPSA_Bal_lt_30K" |


  @D2DXSell @D2DXSell_positive_with_Out_IH_NOVA_6037_Validation @6037 @NOVA @RS22054
  Scenario Outline: D2DXsell_ RS22054_6037_Top1_NOVA Validate <TestID> Positive scenarios without IH validation against proposition data
    * def testDataFileName = D2DXSellTop1NovaTestData
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
      | TestID                                                                                       |
      | "6037_NOVA_CUST_AGE_eq_18"                                                                   |
#      | "6037_NOVA_CUST_AGE_eq_65"                                                                   |
#      | "6037_NOVA_Not_Active_BB_PROD_HEIR_LEVEL_eq_Chequing Accounts"                               |
#      | "6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"             |
#      | "6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing Accounts"             |
#      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
#      | "6037_NOVA_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
#      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
#      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" |
#      | "6037_NOVA_DNS_eq_Y"                                                                         |
#      | "6037_NOVA_BASE_02_MPSA_Bal_eq_30K"                                                          |
#      | "6037_NOVA_VALID_START_DATE_gt_Curr_Dt"                                                      |
#      | "6037_NOVA_VALID_END_DATE_lt_Curr_Dt"                                                        |

  @D2DXSell @D2DXSell_Negative_TestCases_NOVA_Validation_6037 @6037 @NOVA @RS22054

  Scenario Outline: D2DXsell  RS22054_6037_NOVA Validate Negative TestCases Response Fields
    * def testDataFileName =  D2DXSellTop1NovaTestData
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
    * def creative_id = karate.get('data.CreativeId')

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

    * def responseStringActual = responseString == '{}' ? {} : (karate.jsonPath(responseString,"$.offers[0].offerCode"))

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                         |
      | "N-6037_NOVA_DECEASED_F_eq_Y"                                                                  |
      | "N-6037_NOVA_DECEASED_F_eq_NULL"                                                               |
      | "N-6037_NOVA_CUST_TP_CD_ne_PSNL"                                                               |
      | "N-6037_NOVA_LANG_CD_eq_K"                                                                     |
      | "N-6037_NOVA_LANG_CD_eq_NULL"                                                                  |
      | "N-6037_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                            |
      | "N-6037_NOVA_PRIM_CNTRY_CD_ne_CA"                                                              |
      | "N-6037_NOVA_MKTBL_eq_N"                                                                       |
      | "N-6037_NOVA_MKTBL_eq_NULL"                                                                    |
      | "N-6037_NOVA_NOT_AML_KYC_eq_Y"                                                                 |
      | "N-6037_NOVA_ITRADE_MCLEOD_F_eq_Y"                                                             |
      | "N-6037_NOVA_EMPLOYEE_STAFF_F_eq_Y"                                                            |
      | "N-6037_NOVA_HAS_CLOSED_CHQ_F_eq_Y"                                                            |
      | "N_6037_NOVA_CUST_AGE_gt_65"                                                                   |
      | "N_6037_NOVA_CUST_AGE_lt_18"                                                                   |
      | "N_6037_NOVA_CUST_AGE_eq_NULL"                                                                 |
      | "N_6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"             |
      | "N_6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" |
      | "N_6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" |





