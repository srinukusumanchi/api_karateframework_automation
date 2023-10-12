@RESPCrossSell_PositiveNegative_Validation_5466
Feature: Validate RESP CrossSell Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @RESPCrossSell_5466 @RESPCrossSell_5466_ORN_Positive_IH_Validation @5466 @ORN @RS21097  @AUTOTESTTOTAL#1
  Scenario Outline: RESP Cross Sell_5466_ORN Validate <TestID> IH for Positive TestCases
  #    Reading data from Excel sheet
    * def testDataFileName = RESPCrossSellORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print 'data is '+data
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


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

    * call read('classpath:channels/orn/ReusableScenarios.feature@RESPCrossSellOfferValidation_ORN')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                                                                                                                                         |
      | "5466_CUST_TP_CD=PSNL,5466_Primary Country Cd = CA,5466_CUST_AGE >18,5466_DO_NOT_SOLICIT_F = Y,5466_MRKTBLE_F = Y,5466_NOT_AML_KYC = N,5466_Customer Not Decease"                                                              |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                          |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                          |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                          |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE > 30 days OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                                                        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                  |
      | "5466_CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1"                                                                                          |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                         |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"                                                          |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1" |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"  |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days"                                                                                                                                                                    |


  @RESPCrossSell_5466 @RESPCrossSell_5466_ORN_Positive_Validation @5466 @ORN  @AUT0TESTTOTAL#43 @RS21097
  Scenario Outline: RESP Cross Sell_5466_ORN Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = RESPCrossSellORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


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

    * call read('classpath:channels/orn/ReusableScenarios.feature@TFSACrossSellOfferValidation_ORN')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                                         |
      | "5466_CUST_AGE=18"                                                                                                                                                                                                             |
      | "5466_LANG_CD in E"                                                                                                                                                                                                            |
      | "5466_LANG_CD in EN"                                                                                                                                                                                                           |
      | "5466_LANG_CD in F"                                                                                                                                                                                                            |
      | "5466_LANG_CD in FR"                                                                                                                                                                                                           |
      | "5466_LANG_CD in small case_e"                                                                                                                                                                                                 |
      | "5466_LANG_CD in small case_en"                                                                                                                                                                                                |
      | "5466_LANG_CD in small case_f"                                                                                                                                                                                                 |
      | "5466_LANG_CD in small case_fr"                                                                                                                                                                                                |
      | "5466_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                                                 |
      | "5466_NOT_AML_KYC = NULL"                                                                                                                                                                                                      |
      | "5466_CUST_OPND_DT > 90 days"                                                                                                                                                                                                  |
      | "5466_ACCT_ODT > 90 days"                                                                                                                                                                                                      |
      | "5466_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                                              |
      | "5466_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                                              |
      | "5466_PLN_ACCT_CD_MASTER != RESP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"                                                                                                                                       |
      | "5466_PLN_ACCT_CD_MASTER = RESP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                       |
      | "5466_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"                                                                                                                                        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE = 30 days"                                                                                                                                                                         |
      | "5466_PRD CD = 02 SUB PRD CD = 05"                                                                                        |
      | "5466_PRD CD = 19 SUB PRD CD = 05"                                                                                        |
      | "5466_PRD CD = 13 SUB PRD CD = 05"                                                                                        |
      | "5466_PRD CD = 07 SUB PRD CD = 01"                                                                                        |
      | "5466_PRD CD = 23 SUB PRD CD = 02"                                                                                        |
      | "5466_PRD CD = VGD SUB PRD CD= AB"                                                                                        |
      | "5466_PRD CD = VCL SUB PRD CD= BC"                                                                                        |
      | "5466_PRD CD = VLR SUB PRD CD= CD"                                                                                        |
      | "5466_SRC_ACCT_STAT_CD! =  A"                                                                                             |
      | "5466_SRC_ACCT_STAT_CD! = Open"                                                                                           |
      | "5466_SRC_ACCT_STAT_CD = NULL"                                                                                            |


  @RESPCrossSell_5466 @RESPCrossSell_5466_ORN_NegativeTestCases_Validation @5466 @ORN @RS21097  @AUTUTESTTOTAL#27
  Scenario Outline: RESPCrossSell_5466_ORN Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = RESPCrossSellORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a ORN SOAP call
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

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                                                      |
      | "N-5466_CUST_TP_CD != PSNL "                                                                                                |
      | "N-5466_Primary Country Cd != CA"                                                                                           |
      | "N-5466_Primary Country Cd = NULL"                                                                                          |
      | "N-5466_CUST_AGE < 18"                                                                                                      |
      | "N-5466_CUST_AGE = NULL"                                                                                                    |
      | "N-5466_LANG_CD NOT in (EN, E, FR, F)"                                                                                      |
      | "N-5466_LANG_CD = NULL"                                                                                                     |
      | "N-5466_MRKTBLE_F = N"                                                                                                      |
      | "N-5466_MRKTBLE_F = NULL"                                                                                                   |
      | "N-5466_NOT_AML_KYC = Y"                                                                                                    |
      | "N-5466_CUST_OPNT_DT < 90 days"                                                                                             |
      | "N-5466_CUST_OPNT_DT = 90 days"                                                                                             |
      | "N-5466_CUST_OPNT_DT = NULL"                                                                                                |
      | "N-5466_Customer Decease - Y"                                                                                               |
      | "N-5466_Customer Decease - NULL"                                                                                            |
      | "N-5466_ACCT_ODT < 90 Days"                                                                                                 |
      | "N-5466_ACCT_ODT = 90 Days"                                                                                                 |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                     |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"                                       |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL = NULL"                                    |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                    |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL!= 1"                                     |
      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                  |
      | "N-5466_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                    |
      | "N-5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE > 30 days"                                                                    | 


