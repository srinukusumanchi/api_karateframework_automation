@TFSACrossSell_PositiveNegative_Validation_5464
Feature: Validate TFSA CrossSell Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @TFSACrossSell_5464 @TFSACrossSell_5464_Nova_Positive_IH_Validation @5464 @NOVA @RS21091  @AUTOTESTTOTAL#1
  Scenario Outline: TFSA Cross Sell_5464_NOVA Validate <TestID> IH for Positive TestCases
  #    Reading data from Excel sheet
    * def testDataFileName = TFSACrossSellNovaTestData

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
      | TestID                                                                                                                                                                                                                                                   |
      | "5464_CUST_TP_CD=PSNL,5464_Primary Country Cd = CA,5464_CUST_AGE >18,5464_DO_NOT_SOLICIT_F = Y,5464_MRKTBLE_F = Y,5464_NOT_AML_KYC = N,CUST_OPNT_DT > 90 days,5464_Customer Not Decease,5464_ACCT_ODT>90"                                                |
      # Added for Mar 25 2023 - External Table
      | "5464_NOVA_multiple_Externaltbl_Records"                                                                                                                                                                                                                 |
      | "5464_NOVA_VALID_END_DATE_eq_Curr_Dt"                                                                                                                                                                                                                    |

  @TFSACrossSell_5464 @TFSACrossSell_5464_Nova_Positive_Validation @5464 @NOVA @RS21091  @AUTOTESTTOTAL#40
  Scenario Outline: TFSA Cross Sell_5464_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = TFSACrossSellNovaTestData

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
      | "5464_CUST_TP_CD=PSNL,5464_Primary Country Cd = CA,5464_CUST_AGE >18,5464_DO_NOT_SOLICIT_F = N,5464_MRKTBLE_F = Y,5464_NOT_AML_KYC = N,CUST_OPNT_DT > 90 days,5464_Customer Not Decease,5464_ACCT_ODT>90"                                                |
      | "5464_CUST_AGE=18"                                                                                                                                                                                                                                       |
      | "5464_LANG_CD in EN"                                                                                                                                                                                                                                     |
      | "5464_LANG_CD in E"                                                                                                                                                                                                                                      |
      | "5464_LANG_CD in F"                                                                                                                                                                                                                                      |
      | "5464_LANG_CD in FR"                                                                                                                                                                                                                                     |
      | "5464_LANG_CD in small case_e"                                                                                                                                                                                                                           |
      | "5464_LANG_CD in small case_en"                                                                                                                                                                                                                          |
      | "5464_LANG_CD in small case_f"                                                                                                                                                                                                                           |
      | "5464_LANG_CD in small case_fr"                                                                                                                                                                                                                          |
      | "5464_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                                                                           |
      | "5464_NOT_AML_KYC = NULL"                                                                                                                                                                                                                                |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                                                    |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                    |
      | "5464_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                                                                        |
      | "5464_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                                                                        |
      | "5464_PLN_ACCT_CD_MASTER != TFSA and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"                                                                                                                                                                 |
      | "5464_PLN_ACCT_CD_MASTER = TFSA  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                                                 |
      | "5464_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"                                                                                                                                                                  |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                                  |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                   |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1"                                                                                 |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"                                                                                    |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL ! = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"                                                                                 |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1" |
      | "5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"  |
      | "5464_PRD CD = 02 SUB PRD CD = 05"                                                       |
      | "5464_PRD CD = 19 SUB PRD CD = 05"                                                       |
      | "5464_PRD CD = 13 SUB PRD CD = 05"                                                       |
      | "5464_PRD CD = 07 SUB PRD CD = 01"                                                       |
      | "5464_PRD CD = 23 SUB PRD CD = 02"                                                       |
      | "5464_PRD CD = VGD SUB PRD CD= AB"                                                       |
      | "5464_PRD CD = VCL SUB PRD CD= BC"                                                       |
      | "5464_PRD CD = VLR SUB PRD CD= CD"                                                       |
      | "5464_SRC_ACCT_STAT_CD! =  A"                                                            |
      | "5464_SRC_ACCT_STAT_CD! = Open"                                                          |
      | "5464_SRC_ACCT_STAT_CD = NULL"                                                           |
# Added for Mar 25 2023 - External Table
      | "5464_NOVA_VALID_START_DATE_lt_Curr_Dt"                                                                                                                                                                                                                  |
      | "5464_NOVA_VALID_START_DATE_eq_Curr_Dt"                                                                                                                                                                                                                  |
      | "5464_NOVA_VALID_END_DATE_gt_Curr_Dt"                                                                                                                                                                                                                    |



  @TFSACrossSell_5464 @TFSACrossSell_5464_Nova_NegativeTestCases_Validation @5464 @NOVA @RS21091  @AUTOTESTTOTAL#28
  Scenario Outline: TFSACrossSell_5464_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = TFSACrossSellNovaTestData

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
      | "N-5464_CUST_TP_CD != PSNL "                                                               |
      | "N-5464_Primary Country Cd != CA"                                                          |
      | "N-5464_Primary Country Cd = NULL"                                                         |
      | "N-5464_CUST_AGE < 18"                                                                     |
      | "N-5464_CUST_AGE = NULL"                                                                   |
      | "N-5464_LANG_CD NOT in (EN, E, FR, F)"                                                     |
      | "N-5464_LANG_CD = NULL"                                                                    |
      | "N-5464_MRKTBLE_F = N"                                                                     |
      | "N-5464_MRKTBLE_F = NULL"                                                                  |
      | "N-5464_NOT_AML_KYC = Y"                                                                   |
      | "N-5464_CUST_OPNT_DT < 90 days"                                                            |
      | "N-5464_CUST_OPNT_DT = 90 days"                                                            |
      | "N-5464_CUST_OPNT_DT = NULL"                                                               |
      | "N-5464_Customer Decease - Y"                                                              |
      | "N-5464_Customer Decease - NULL"                                                           |
      | "N-5464_ACCT_ODT < 90 Days"                                                                |
      | "N-5464_ACCT_ODT = 90 Days"                                                                |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"   |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"   |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = FLG_TFSA_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL" |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL => 1"    |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL < 1"      |
      | "N-5464_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_TFSA and CUST_INSIGHTS.CURR_VAL = NULL"   |
      | "N-5464_PLN_ACCT_CD_MASTER = TFSA and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"   |

        # Added for Mar 25 2023 - External Table

      | "N_5464_NOVA_VALID_START_DATE_gt_Curr_Dt"                                                  |
      | "N_5464_NOVA_VALID_END_DATE_lt_Curr_Dt"                                                    |
      | "N_5464_NOVA_CAMPAIGN_CODE_ne_RS21091"                                                     |
      | "N_5464_NOVA_Seg_CAMPAIGN_CELL_CODE_ne_CIE5464"                                            |
      | "N_5464_NOVA_Seg_CAMPAIGN_CELL_CODE_eq_NULL"                                               |
      | "N_5464_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                                 |
      | "N_5464_NOVA_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                                              |
      | "N_5464_NOVA_NOVA_CHANNEL_ne_Y"                                                            |
      | "N_5464_NOVA_NOVA_CHANNEL_eq_NULL"                                                         |
