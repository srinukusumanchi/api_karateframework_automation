@RRSPFund_PositiveNegative_Validation_5502
Feature: Validate RRSP Fund Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @RRSPFund_5502  @RRSPFund_5502_Nova_IH_Positive_Validation @5502 @NOVA @RS21094  @AUTOTESTTOTAL#42
  Scenario Outline: RRSP Fund_5502_NOVA Validate <TestID> Positive TestCases Response Fields and IH Validation

  #    Reading data from Excel sheet
    * def testDataFileName = RRSPFundNovaTestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@RRSPCrossSellOfferValidation_NOVA')

     #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                                                                   |
      | "5502_CUST_TP_CD=PSNL,5502_Primary Country Cd = CA,5502_CUST_AGE >18,5502_DO_NOT_SOLICIT_F = Y,5502_MRKTBLE_F = Y,5502_NOT_AML_KYC = N,5502_Customer Not Decease"                                                                                        |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                                                    |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT  and CUST_INSIGHTS.CURR_VAL = 1"                                                                                 |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"                                                                                 |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1) OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1"                                                                                   |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"                                                                                  |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1" |
      | "5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT  and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1" |
      | "5502_NOVA_VALID_START_DATE_lt_Curr_Dt"                                                                                                                                                                                                                  |
      | "5502_NOVA_VALID_START_DATE_eq_Curr_Dt"                                                                                                                                                                                                                  |
      | "5502_NOVA_multiple_Externaltbl_Records"                                                                                                                                                                                                                 |



  @RRSPFund_5502  @RRSPFund_5502_Nova_Positive_Validation @5502 @NOVA @RS21094  @AUTOTESTTOTAL#42
  Scenario Outline: RRSP Fund_5502_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = RRSPFundNovaTestData

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
      | TestID                                                                                                                                                                                                                                                   |
      | "5502_CUST_AGE=18"                                                                                                                                                                                                                                       |
      | "5502_CUST_AGE = 70"                                                                                                                                                                                                                                     |
      | "5502_LANG_CD in E"                                                                                                                                                                                                                                      |
      | "5502_LANG_CD in EN"                                                                                                                                                                                                                                     |
      | "5502_LANG_CD in F"                                                                                                                                                                                                                                      |
      | "5502_LANG_CD in FR"                                                                                                                                                                                                                                     |
      | "5502_LANG_CD in small case_e"                                                                                                                                                                                                                           |
      | "5502_LANG_CD in small case_en"                                                                                                                                                                                                                          |
      | "5502_LANG_CD in small case_f"                                                                                                                                                                                                                           |
      | "5502_LANG_CD in small case_fr"                                                                                                                                                                                                                          |
      | "5502_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                                                                           |
      | "5502_NOT_AML_KYC = NULL"                                                                                                                                                                                                                                |
      | "5502_CUST_OPND_DT > 90 days"                                                                                                                                                                                                                            |
      | "5502_ACCT_ODT > 90 days"                                                                                                                                                                                                                                |
      | "5502_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                                                                        |
      | "5502_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                                                                        |
      | "5502_PLN_ACCT_CD_MASTER = RRSP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                                                   |
      | "5502_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5502_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5502_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5502_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                                                                                                       |
      | "5502_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                                                                                                       |
      | "5502_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                                                                                                       |
      | "5502_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                                                                                                       |
      | "5502_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                                                                                                       |
      | "5502_SRC_ACCT_STAT_CD! =  A"                                                                                                                                                                                                                            |
      | "5502_SRC_ACCT_STAT_CD! = Open"                                                                                                                                                                                                                          |
      | "5502_SRC_ACCT_STAT_CD = NULL"                                                                                                                                                                                                                           |
      | "5502_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                                                                      |
      #Added for Jan 5th 2023 release
      | "5502_MD_FINANCIAL_F_ne_Y"                                                                                                                                                                                                                                |
      | "5502_ITRADE_MCLEOD_F_ne_Y"                                                                                                                                                                                                                               |
      | "5502_DEDICATED_INVSTMNT_ADVISOR_F_ne_Y"                                                                                                                                                                                                                  |
      | "5502_MD_FINANCIAL_F_eq_NULL"                                                                                                                                                                                                                             |
      | "5502_ITRADE_MCLEOD_F_eq_NULL"                                                                                                                                                                                                                            |
      | "5502_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                                                                                                                                                                               |
      | "5502_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_ne_1"                                                                                                                                                                                          |
      | "5502_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_NULL"                                                                                                                                                                                      |
#Added for June 8th 2023 release
      | "5502_NOVA_VALID_END_DATE_gt_Curr_Dt"                                                                                                                                                                                                                    |
      | "5502_NOVA_VALID_END_DATE_eq_Curr_Dt"                                                                                                                                                                                                                    |


  @RRSPFund_5502 @RRSPFund_5502_Nova_NegativeTestCases_Validation @5502 @NOVA @RS21094  @AUTOTESTTOTAL#37
  Scenario Outline: RRSP  Fund_5502_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = RRSPFundNovaTestData

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
      | "N-5502_INSIGHT_CD!=FLG_RRSP_CONTRIBUTION and CURR_VAL!=0"                                 |
      | "N-5502_CUST_TP_CD != PSNL"                                                                |
      | "N-5502_Primary Country Cd != CA"                                                          |
      | "N-5502_Primary Country Cd = NULL"                                                         |
      | "N-5502_CUST_AGE < 18"                                                                     |
      | "N-5502_CUST_AGE > 70"                                                                     |
      | "N-5502_CUST_AGE = NULL"                                                                   |
      | "N-5502_LANG_CD NOT in (EN, E, FR, F)"                                                     |
      | "N-5502_LANG_CD = NULL"                                                                    |
      | "N-5502_MRKTBLE_F = N"                                                                     |
      | "N-5502_MRKTBLE_F = NULL"                                                                  |
      | "N-5502_NOT_AML_KYC = Y"                                                                   |
      | "N-5502_CUST_OPNT_DT < 90 days"                                                            |
      | "N-5502_CUST_OPNT_DT = 90 days"                                                            |
      | "N-5502_CUST_OPNT_DT = NULL"                                                               |
      | "N-5502_Customer Decease - Y"                                                              |
      | "N-5502_Customer Decease - NULL"                                                           |
      | "N-5502_ACCT_ODT < 90 Days"                                                                |
      | "N-5502_ACCT_ODT = 90 Days"                                                                |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD != FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"    |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1"      |
      | "N-5502_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL = NULL"   |
      | "N-5502_PLN_ACCT_CD_MASTER != RRSP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" |
      | "N-5502_PLN_ACCT_CD_MASTER = RRSP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" |
      | "N-5502_PLN_ACCT_CD_MASTER = RRSP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  |
      | "N-5502_PRIMARY_ACCT_HOLDER_FLAG = N"                                                      |
      | "N-5502_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                   |
      | "N-5502_INSIGHT_CD!=FLG_RRSP_CONTRIBUTION and CURR_VAL=0"                                  |
      | "N-5502_INSIGHT_CD=FLG_RRSP_CONTRIBUTION and CURR_VAL!=0"                                  |
    #    Added for Jan 5th 2023 release
      | "N-5502_MD_FINANCIAL_F_eq_Y"                                                               |
      | "N-5502_ITRADE_MCLEOD_F_eq_Y"                                                               |
      | "N-5502_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                 |
      | "N-5502_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_1"                          |
#Added for June 8th 2023 Release
      | "N_5502_NOVA_VALID_START_DATE_gt_Curr_Dt"                                                  |
      | "N_5502_NOVA_VALID_END_DATE_lt_Curr_Dt"                                                    |
      | "N_5502_NOVA_CAMPAIGN_CODE_ne_RS21094"                                                     |
      | "N_5502_NOVA_Seg_CAMPAIGN_CELL_CODE_ne_CIE5502"                                            |
      | "N_5502_NOVA_Seg_CAMPAIGN_CELL_CODE_eq_NULL"                                               |
      | "N_5502_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                                 |
      | "N_5502_NOVA_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                                              |
      | "N_5502_NOVA_NOVA_CHANNEL_ne_Y"                                                            |
      | "N_5502_NOVA_NOVA_CHANNEL_eq_NULL"                                                         |

