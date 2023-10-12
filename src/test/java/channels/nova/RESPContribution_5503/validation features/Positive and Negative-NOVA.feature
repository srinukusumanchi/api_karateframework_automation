@RESPContribution_PositiveNegative_Validation_5503
Feature: Validate RESP Contribution Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @RESPContribution_5503 @RESPContribution_5503_NOVA_Positive_IH_Validation @5503 @NOVA  @AUT0TESTTOTAL#35
  Scenario Outline: RESP Contribution_5503_NOVA Validate <TestID> Positive TestCases Response and IH Fields

  #    Reading data from Excel sheet
    * def testDataFileName = RESPContributionNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')

  # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                                                                           |
      | "5503_CUST_TP_CD=PSNL,5503_Primary Country Cd = CA,5503_CUST_AGE >18,5503_DO_NOT_SOLICIT_F = Y,5503_MRKTBLE_F = Y,5503_NOT_AML_KYC = N,5503_Customer Not Decease"                                                                                                |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                            |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                                                            |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                            |
      | "5503_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                                                           |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"   |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1)"    |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL >=  1)" |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"  |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"  |


  @RESPContribution_5503 @RESPContribution_5503_NOVA_Positive_Validation @5503 @NOVA  @AUT0TESTTOTAL#35
  Scenario Outline: RESP Contribution_5503_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = RESPContributionNOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "5503_CUST_AGE=18"                 |
      | "5503_LANG_CD in E"                |
      | "5503_LANG_CD in EN"               |
      | "5503_LANG_CD in F"                |
      | "5503_LANG_CD in FR"               |
      | "5503_LANG_CD in small case_e"     |
      | "5503_LANG_CD in small case_en"    |
      | "5503_LANG_CD in small case_f"     |
      | "5503_LANG_CD in small case_fr"    |
      | "5503_DO_NOT_SOLICIT_F = NULL"     |
      | "5503_NOT_AML_KYC = NULL"          |
      | "5503_CUST_OPND_DT > 90 days"      |
      | "5503_ACCT_ODT > 90 days"          |
      | "5503_PRD CD = 02 SUB PRD CD = 05" |
      | "5503_PRD CD = 19 SUB PRD CD = 05" |
      | "5503_PRD CD = 13 SUB PRD CD = 05" |
      | "5503_PRD CD = 07 SUB PRD CD = 01" |
      | "5503_PRD CD = 23 SUB PRD CD = 02" |
      | "5503_PRD CD = VGD SUB PRD CD= AB" |
      | "5503_PRD CD = VCL SUB PRD CD= BC" |
      | "5503_PRD CD = VLR SUB PRD CD= CD" |
      | "5503_PRD CODE=01  SUB PRD CD=01"  |
      | "5503_PRD CODE=VGD SUB PRD CD=NF"  |
      | "5503_SRC_ACCT_STAT_CD! =  A"      |
      | "5503_SRC_ACCT_STAT_CD! = Open"    |

  @RESPContribution_5503 @RESPContribution_5503_NOVA_NegativeTestCases_Validation @5503 @NOVA @RS21096  @AUTUTESTTOTAL#32
  Scenario Outline: RESPContribution_5503_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = RESPContributionNOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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
      | TestID                                                                                     |
      | "N-5503_PLN_ACCT_CD_MASTER != RESP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" |
      | "N-5503_PLN_ACCT_CD_MASTER = RESP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" |
      | "N-5503_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  |
      | "N-5503_CUST_TP_CD != PSNL"                                                                |
      | "N-5503_Primary Country Cd != CA"                                                          |
      | "N-5503_Primary Country Cd = NULL"                                                         |
      | "N-5503_CUST_AGE < 18"                                                                     |
      | "N-5503_CUST_AGE = NULL"                                                                   |
      | "N-5503_LANG_CD NOT in (EN, E, FR, F)"                                                     |
      | "N-5503_LANG_CD = NULL"                                                                    |
      | "N-5503_MRKTBLE_F = N"                                                                     |
      | "N-5503_MRKTBLE_F = NULL"                                                                  |
      | "N-5503_NOT_AML_KYC = Y"                                                                   |
      | "N-5503_CUST_OPNT_DT < 90 days"                                                            |
      | "N-5503_CUST_OPNT_DT = 90 days"                                                            |
      | "N-5503_CUST_OPNT_DT = NULL"                                                               |
      | "N-5503_Customer Decease - Y"                                                              |
      | "N-5503_Customer Decease - NULL"                                                           |
      | "N-5503_ACCT_ODT < 90 Days"                                                                |
      | "N-5503_ACCT_ODT = 90 Days"                                                                |
      | "N-5503_SRC_ACCT_STAT_CD = NULL"                                                           |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"    |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"      |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL = NULL"   |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL!= 1"    |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL != 0"  |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0"  |
      | "N-5503_PRIMARY_ACCT_HOLDER_FLAG = N"                                                      |
      | "N-5503_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                   |
