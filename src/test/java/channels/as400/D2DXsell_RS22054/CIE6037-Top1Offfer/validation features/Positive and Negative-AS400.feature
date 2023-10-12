@PositiveNegative_Top1_Validation_6037
Feature: Validate D2DXSell- 6037 AS400 for Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

     # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

  @D2DXSell @D2DXSell_BASE_Top1_IH_Validation @6037 @AS400 @RS22054
  Scenario Outline: D2DXsell_RS22054_6037_AS400 Validate base test cases with IH field values against proposition data
    * def testDataFileName = D2DXSellTop1AS400TestData
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "6037_AS400_BASE_01_NoMPSA"          |
      | "6037_AS400_BASE_02_MPSA_Bal_lt_30K" |


  @D2DXSell @D2DXSell_positive_with_Out_IH_6037_AS400_Validation @6037 @AS400 @RS22054
  Scenario Outline: D2DXsell_ RS22054_6037_Top1_AS400 Validate <TestID> Positive scenarios without IH validation against proposition data
    * def testDataFileName = D2DXSellTop1AS400TestData
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#
##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                       |
      | "6037_AS400_CUST_AGE_eq_18"                                                                   |
      | "6037_AS400_CUST_AGE_eq_65"                                                                   |
      | "6037_AS400_Not_Active_BB_PROD_HEIR_LEVEL_eq_Chequing Accounts"                               |
      | "6037_AS400_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"             |
      | "6037_AS400_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing Accounts"             |
      | "6037_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "6037_AS400_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "6037_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "6037_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" |
      | "6037_AS400_DNS_eq_Y"                                                                         |
      | "6037_AS400_BASE_02_MPSA_Bal_eq_30K"                                                          |
#      | "6037_AS400_VALID_START_DATE_gt_Curr_Dt"                                                      |
#      | "6037_AS400_VALID_END_DATE_lt_Curr_Dt"                                                        |

  @D2DXSell @D2DXSell_Negative_TestCases_Validation_6037 @6037 @AS400 @RS22054

  Scenario Outline: D2DXsell  RS22054_6037_AS400 Validate Negative TestCases Response Fields
    * def testDataFileName =  D2DXSellTop1AS400TestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')


    # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

#     Printing request body in console
    *  print '*********Request**********'+requestfile

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

#  Validating error response
     * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML == null


    Examples:
      | TestID                                                                                         |
      | "N-6037_AS400_DECEASED_F_eq_Y"                                                                  |
      | "N-6037_AS400_DECEASED_F_eq_NULL"                                                               |
      | "N-6037_AS400_CUST_TP_CD_ne_PSNL"                                                               |
      | "N-6037_AS400_LANG_CD_eq_K"                                                                     |
      | "N-6037_AS400_LANG_CD_eq_NULL"                                                                  |
      | "N-6037_AS400_PRIM_CNTRY_CD_eq_NULL"                                                            |
      | "N-6037_AS400_PRIM_CNTRY_CD_ne_CA"                                                              |
      | "N-6037_AS400_MKTBL_eq_N"                                                                       |
      | "N-6037_AS400_MKTBL_eq_NULL"                                                                    |
      | "N-6037_AS400_NOT_AML_KYC_eq_Y"                                                                 |
      | "N-6037_AS400_ITRADE_MCLEOD_F_eq_Y"                                                             |
      | "N-6037_AS400_EMPLOYEE_STAFF_F_eq_Y"                                                            |
      | "N-6037_AS400_HAS_CLOSED_CHQ_F_eq_Y"                                                            |
      | "N_6037_AS400_CUST_AGE_gt_65"                                                                   |
      | "N_6037_AS400_CUST_AGE_lt_18"                                                                   |
      | "N_6037_AS400_CUST_AGE_eq_NULL"                                                                 |
      | "N_6037_AS400_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"             |
      | "N_6037_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" |
      | "N_6037_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" |





