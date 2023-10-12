@TFSAFund_PositiveNegative_Validation_5501
Feature: Validate TFSA Fund Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @TFSAFund_5501  @TFSAFund_5501_ORN_Positive_IH_Validation @5501 @ORN @RS21092  @AUTOTESTTOTAL#39
  Scenario Outline: TFSA Fund_5501_IH_ORN Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundORNTestData

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

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                                                                   |
      | "5501_CUST_TP_CD=PSNL,5501_Primary Country Cd = CA,5501_CUST_AGE >18,5501_DO_NOT_SOLICIT_F = Y,5501_MRKTBLE_F = Y,5501_NOT_AML_KYC = N,CUST_OPNT_DT > 90 days,5501_Customer Not Decease,5501_ACCT_ODT>90"                                                |
      | "5501_ORN_VALID_START_DATE_lt_Curr_Dt"                                                                                                                                                                                                                  |
      | "5501_ORN_VALID_START_DATE_eq_Curr_Dt"                                                                                                                                                                                                                  |
      | "5501_ORN_multiple_Externaltbl_Records"                                                                                                                                                                                                                 |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                                                    |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                  |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1"                                                                                 |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"                                                                                    |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL ! = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                 |
      | "5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"  |

  @TFSAFund_5501  @TFSAFund_5501_ORN_Positive_Validation @5501 @ORN @RS21092  @AUTOTESTTOTAL#39
  Scenario Outline: TFSA Fund_5501_ORN Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundORNTestData

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
      | TestID                                                                                                                                                                                                                                                   |
      | "5501_CUST_AGE=18"                                                                                                                                                                                                                                       |
      | "5501_LANG_CD in E"                                                                                                                                                                                                                                      |
      | "5501_LANG_CD in EN"                                                                                                                                                                                                                                     |
      | "5501_LANG_CD in F"                                                                                                                                                                                                                                      |
      | "5501_LANG_CD in FR"                                                                                                                                                                                                                                     |
      | "5501_LANG_CD in small case_e"                                                                                                                                                                                                                           |
      | "5501_LANG_CD in small case_en"                                                                                                                                                                                                                          |
      | "5501_LANG_CD in small case_f"                                                                                                                                                                                                                           |
      | "5501_LANG_CD in small case_fr"                                                                                                                                                                                                                          |
      | "5501_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                                                                           |
      | "5501_NOT_AML_KYC = NULL"                                                                                                                                                                                                                                |
      | "5501_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                                                                        |
      | "5501_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                                                                        |
      | "5501_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                                                   |
      | "5501_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5501_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5501_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                                                                                                       |
      | "5501_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                                                                                                       |
      | "5501_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                                                                                                       |
      | "5501_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                                                                                                       |
      | "5501_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                                                                                                       |
      | "5501_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                                                                                                       |
      | "5501_SRC_ACCT_STAT_CD! =  A"                                                                                                                                                                                                                            |
      | "5501_SRC_ACCT_STAT_CD!  Open"                                                                                                                                                                                                                           |
      | "5501_SRC_ACCT_STAT_CD = NULL"                                                                                                                                                                                                                           |
      | "5501_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                                                                      |
#Adde for Jan 5th 2023 release
      | "5501_MD_FINANCIAL_F_ne_Y"                                                                                                                                                                                                                               |
      | "5501_ITRADE_MCLEOD_F_ne_Y"                                                                                                                                                                                                                               |
      | "5501_DEDICATED_INVSTMNT_ADVISOR_F_ne_Y"                                                                                                                                                                                                                  |
      | "5501_MD_FINANCIAL_F_eq_NULL"                                                                                                                                                                                                                             |
      | "5501_ITRADE_MCLEOD_F_eq_NULL"                                                                                                                                                                                                                            |
      | "5501_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                                                                                                                                                                               |
      | "5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_ne_1"                                                                                                                                                                                          |
      | "5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_NULL"                                                                                                                                                                                       |
#Added for June 8th 2023 release
      | "5501_ORN_VALID_END_DATE_gt_Curr_Dt"                                                                                                                                                                                                                    |
      | "5501_ORN_VALID_END_DATE_eq_Curr_Dt"                                                                                                                                                                                                                    |

  @TFSAFund_5501 @TFSAFund_5501_ORN_NegativeTestCases_Validation @5501 @ORN @RS21092  @AUTOTESTTOTAL#36
  Scenario Outline: TFSA Fund_5501_ORN Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundORNTestData

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
      | TestID                                                                                     |
      | "N-5501_PLN_ACCT_CD_MASTER != TFSA and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" |
      | "N-5501_PLN_ACCT_CD_MASTER = TFSA  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" |
      | "N-5501_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  |
      | "N-5501_CUST_TP_CD != PSNL"                                                                |
      | "N-5501_Primary Country Cd != CA"                                                          |
      | "N-5501_Primary Country Cd = NULL"                                                         |
      | "N-5501_CUST_AGE < 18"                                                                     |
      | "N-5501_CUST_AGE = NULL"                                                                   |
      | "N-5501_LANG_CD NOT in (EN, E, FR, F)"                                                     |
      | "N-5501_LANG_CD = NULL"                                                                    |
      | "N-5501_MRKTBLE_F = N"                                                                     |
      | "N-5501_MRKTBLE_F = NULL"                                                                  |
      | "N-5501_NOT_AML_KYC = Y"                                                                   |
      | "N-5501_CUST_OPNT_DT < 90 days"                                                            |
      | "N-5501_CUST_OPNT_DT = 90 days"                                                            |
      | "N-5501_CUST_OPNT_DT = NULL"                                                               |
      | "N-5501_Customer Decease - Y"                                                              |
      | "N-5501_Customer Decease - NULL"                                                           |
      | "N-5501_ACCT_ODT < 90 Days"                                                                |
      | "N-5501_ACCT_ODT = 90 Days"                                                                |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"    |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"      |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL = NULL"   |
      | "N-5501_CUST_INSIGHTS.INSIGHT_CD = NULL and CUST_INSIGHTS.CURR_VAL = NULL"                 |
      | "N-5501_PRIMARY_ACCT_HOLDER_FLAG = N"                                                      |
      | "N-5501_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                   |
      | "N-5501_INSIGHT_CD!=FLG_TFSA_CONTRIBUTION and CURR_VAL=0"                                  |
      | "N-5501_INSIGHT_CD=FLG_TFSA_CONTRIBUTION and CURR_VAL!=0"                                  |
      | "N-5501_INSIGHT_CD!=FLG_TFSA_CONTRIBUTION and CURR_VAL!=0"                                 |
#    Added for Jan 5th 2023 release
      | "N-5501_MD_FINANCIAL_F_eq_Y"                                                                |
      | "N-5501_ITRADE_MCLEOD_F_eq_Y"                                                               |
      | "N-5501_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                  |
      | "N-5501_INSIGHT_CD_eq_FLG_WINTERINV_RS22124_CONTROL_CURR_VAL_eq_1"                          |
#Added for June 8th 2023 Release
      | "N_5501_ORN_VALID_START_DATE_gt_Curr_Dt"                                                  |
      | "N_5501_ORN_VALID_END_DATE_lt_Curr_Dt"                                                    |
      | "N_5501_ORN_CAMPAIGN_CODE_ne_RS21092"                                                     |
      | "N_5501_ORN_Seg_CAMPAIGN_CELL_CODE_ne_CIE5501"                                            |
      | "N_5501_ORN_Seg_CAMPAIGN_CELL_CODE_eq_NULL"                                               |
      | "N_5501_ORN_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                                 |
      | "N_5501_ORN_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                                              |
      | "N_5501_ORN_ORN_CHANNEL_ne_Y"                                                            |
      | "N_5501_ORN_ORN_CHANNEL_eq_NULL"                                                         |
