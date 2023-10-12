@MPSACrossSell_PositiveNegative_Validation_5467
Feature: Validate MPSA CrossSell Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @MPSACrossSell_5467 @MPSACrossSell_5467_Nova_Positive_Validation_1 @5467 @NOVA  @AUTUTESTTOTAL#78
  Scenario Outline: MPSA Cross Sell_5467_NOVA Validate <TestID> Positive TestCases Response Fields for part1

  #    Reading data from Excel sheet
    * def testDataFileName = MPSACrossSellNovaTestData

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


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSACrossSellOfferValidation_NOVA')
#   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                             |
#      | "5467_CUST_TP_CD=PSNL,5467_Primary Country Cd = CA,5467_MRKTBLE_F = Y,5467_Customer Not Decease"                                                                                                                                                                                      |
#      | "5467_CUST_AGE >18"                                                                                                                                                                                                                                                                   |
#      | "5467_CUST_AGE=18"                                                                                                                                                                                                                                                                    |
#      | "5467_LANG_CD in small case_en"                                                                                                                                                                                                                                                       |
#      | "5467_LANG_CD in small case_fr"                                                                                                                                                                                                                                                       |
#      | "5467_NOT_AML_KYC = N"                                                                                                                                                                                                                                                                |
#      | "5467_NOT_AML_KYC = NULL"                                                                                                                                                                                                                                                             |
#      | "5467_ACCT_ODT>90"                                                                                                                                                                                                                                                                    |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                                                 |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                                                                                                 |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                                                                                                 |
#      | "5467_PRD CODE=01  SUB PRD CD=01"                                                                                                                                                                                                                                                     |
#      | "5467_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                                                                                                                                     |
#      | "5467_PRD CODE=AXP SUB PRD CD=PC"                                                                                                                                                                                                                                                     |
#      | "5467_PRD CODE=VLR SUB PRD CD=RC"                                                                                                                                                                                                                                                     |
#      | "5467_PRD CODE=VFF SUB PRD CD=TR"                                                                                                                                                                                                                                                     |
#      | "5467_PRD CODE=VGD SUB PRD CD=RG"                                                                                                                                                                                                                                                     |
#      | "5467_ACCT_ODT = NULL"                                                                                                                                                                                                                                                                |
#      | "5467_PRD CD = 01 SUB PRD CD = 07"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                                                                                                                                    |
#      | "5467_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                                                                                                                                    |
#      | "5467_SRC_ACCT_STAT_CD! =  A"                                                                                                                                                                                                                                                         |
#      | "5467_SRC_ACCT_STAT_CD! = Open"                                                                                                                                                                                                                                                       |
#      | "5467_SRC_ACCT_STAT_CD = NULL"                                                                                                                                                                                                                                                        |
#      | "5467_PHYSICIANS_F = NULL"                                                                                                                                                                                                                                                            |
#      | "5467_MD_FINANCIAL_F = NULL"                                                                                                                                                                                                                                                          |
#      | "5467_ITRADE_MCLEOD_F = NULL"                                                                                                                                                                                                                                                         |
#      | "5467_DEDICATED_INVSTMNT_ADVISOR_F = NULL"                                                                                                                                                                                                                                            |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account"                                                                                                                                                                                                                       |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account"                                                                                                                                                                                                                  |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account"                                                                                                                                                                                                                      |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred"                                                                                                                                                                                                            |
#      | "5467_SRC_SYS_PRD_CD != BSAMP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"                                                                                                                                                                                                 |
#      | "5467_SRC_SYS_PRD_CD = BSAMP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"                                                                                                                                                                                                 |
#      | "5467_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"                                                                                                                                                                                                  |

# ## Added for april 13 2023 rel ## Removed DNS for inbound
#      | "5467_DO_NOT_SOLICIT_F = Y"    |
#      | "5467_DO_NOT_SOLICIT_F = NULL" |
#      | "5467_DO_NOT_SOLICIT_F = N"    |
#
#     ## Added for april 13 2023 rel ## Trigger4 with External input table
#      | "5467_Trigger4"                                             |
#      | "5467_Current Date_eq_VALID_START_DATE"                     |
#      | "5467_VALID_END_DATE_eq_Current Date"                       |
#  ## TRIGGER5
#      | "5467_Trigger5"                                         |
#      | "5467_EV_RT_HISA_XSELL _eq_DSS_Name_MPSA_Xsell_RS21097" |
#      | "5467_EV_RT_HISA_XSELL_gt_DSS_Name_MPSA_Xsell_RS21097"  |

## Added for JUNE 22 2023 REL Exclusion Scenarios
      | "5467_NOVA_Trigger4_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"         |
      | "5467_NOVA_Trigger4_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"      |
      | "5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_lt_Curr_Dt"            |
      | "5467_NOVA_Trigger4_ExtTable_ExtTable_VALID_START_DATE_gt_Curr_Dt" |
      | "5467_NOVA_Trigger4_ExtTable_ExtTable_CAMPAIGN_CODE_ne_RS21097"    |


  @MPSACrossSell_5467 @MPSACrossSell_5467_Nova_Positive_Validation @5467 @NOVA  @AUTUTESTTOTAL#78
  Scenario Outline: MPSA Cross Sell_5467_NOVA Validate <TestID> Positive TestCases Response Fields for part2

  #    Reading data from Excel sheet
    * def testDataFileName = MPSACrossSellNovaTestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSACrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                                |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                                |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD =FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1)  AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"                                                                                                               |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL! = 1)  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1)"                                                                                                             |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And ACCT_SUBSYS_ID != BB"                                                                                                                                                                                              |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And SRC_ACCT_STAT_CD != A"                                                                                                                                                                                             |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                                                                                                                     |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And ACCT_SUBSYS_ID != BB"                                                                                                                                                                                         |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And SRC_ACCT_STAT_CD != A"                                                                                                                                                                                        |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                                                                                                                |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And ACCT_SUBSYS_ID != BB"                                                                                                                                                                                             |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And SRC_ACCT_STAT_CD != A"                                                                                                                                                                                            |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                                                                                                                    |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And ACCT_SUBSYS_ID != BB"                                                                                                                                                                                   |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And SRC_ACCT_STAT_CD != A"                                                                                                                                                                                  |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                                                                                                          |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                                                            |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                                                       |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                                                           |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                                                 |
#      | "5467_NOVA_05_07_with Ultimate_Preferred_Account_MCB_IND != Y"                                                                                                                                                                                                                        |
#      | "5467_NOVA_05_07_with Ultimate_Preferred_Account_MCB_IND = Y"                                                                                                                                                                                                                         |
#      | "5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_CONTROL and CURR_VAL!=1"                                                                                                                                                                                                                 |
#      | "5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                                                                                                                |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days" |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days" |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                                                                  |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"                                                                                  |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                                                                    |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                                                                    |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"                                                                                    |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"                                                                                    |
#      | "5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                                                                                                                                                     |
#      | "5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"                                                                                                                                                                     |

  @MPSACrossSell_5467 @MPSACrossSell_5467_Nova_NegativeTestCases_Validation @5467 @NOVA @RS21097 @AUTOTESTTOTAL#70
  Scenario Outline: MPSACrossSell_5467_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = MPSACrossSellNovaTestData

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
      | TestID                                                                                       |
#      | "N-5467_CUST_TP_CD != PSNL"                                                                                                                            |
#      | "N-5467_Primary Country Cd != CA"                                                                                                                      |
#      | "N-5467_Primary Country Cd = NULL"                                                                                                                     |
#      | "N-5467_CUST_AGE < 18"                                                                                                                                 |
#      | "N-5467_CUST_AGE = NULL"                                                                                                                               |
#      | "N-5467_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                 |
#      | "N-5467_LANG_CD = NULL"                                                                                                                                |
#      | "N-5467_MRKTBLE_F = N"                                                                                                                                 |
#      | "N-5467_MRKTBLE_F = NULL"                                                                                                                              |
#      | "N-5467_NOT_AML_KYC = Y"                                                                                                                               |
#      | "N-5467_Customer Decease - Y"                                                                                                                          |
#      | "N-5467_Customer Decease - NULL"                                                                                                                       |
#      | "N-5467_ACCT_ODT < 90 Days"                                                                                                                            |
#      | "N-5467_ACCT_ODT = 90 Days"                                                                                                                            |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                               |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                               |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                             |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL => 1"                                                                |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"                                                                  |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = NULL"                                                               |
#      | "N-5467_PHYSICIANS_F = Y"                                                                                                                              |
#      | "N-5467_MD_FINANCIAL_F = Y"                                                                                                                            |
#      | "N-5467_ITRADE_MCLEOD_F = Y"                                                                                                                           |
#      | "N-5467_DEDICATED_INVSTMNT_ADVISOR_F = Y"                                                                                                              |
#      | "N-5467_PRD CD = 01 SUB PRD CD = 04 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = 02 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = 19 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = 13 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = 07 SUB PRD CD = 11 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = 23 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  |
#      | "N-5467_PRD CD = VGD SUB PRD CD = NF And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = ZZ And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = SS And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VLR SUB PRD CD = RG And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VLR SUB PRD CD = NF And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = DM And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = RG And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = NF And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VCL SUB PRD CD = SV And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VFA SUB PRD CD = A1 And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VFF SUB PRD CD = F1 And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = AXG SUB PRD CD = GC And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = AXS SUB PRD CD = SC And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = AXP SUB PRD CD = PC And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VLR SUB PRD CD = RC And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VFF SUB PRD CD = TR And Acct_odt<=90"                                                                                                 |
#      | "N-5467_PRD CD = VGD SUB PRD CD = RG And Acct_odt<=90"                                                                                                 |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account"                                              |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And ACCT_SUBSYS_ID != BB"                     |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And SRC_ACCT_STAT_CD != A"                    |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And PRIMARY_ACCT_HOLDER_FLAG != Y"            |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account"                                         |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account"                                             |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred"                                   |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And ACCT_SUBSYS_ID != BB"                |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And SRC_ACCT_STAT_CD != A"               |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"       |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And ACCT_SUBSYS_ID != BB"                    |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And SRC_ACCT_STAT_CD != A"                   |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"           |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And ACCT_SUBSYS_ID != BB"          |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And SRC_ACCT_STAT_CD != A"         |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And PRIMARY_ACCT_HOLDER_FLAG != Y" |
#      | "N-5467_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                  |
#      | "N-5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_CONTROL and CURR_VAL=1"                                                                                 |
#      | "N-5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1"                                                                                |
#      | "N-5467_INSIGHT_CD != FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                   |
#      | "N-5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL != 1 and CURRENT_DATE - EVENT_DATE < 30 days"                                   |
#      | "N-5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE > 30 days"                                    |
#      | "N_5467_HAS_CLOSED_MPSA_F !=  N"                                                                                                                       |
#      | "N_5467_HAS_CLOSED_MPSA_F =  NULL"                                                                                                                     |

    ## Added for april 13 2023 rel ## Trigger4 with External input table
#      | "N_5467_Trigger4_CAMPAIGN_CODE_ne_RS21097"                    |
#      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_ne_5467"                  |
#      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_eq_NULL"                  |
#      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_FLAG_eq_N"                |
#      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"             |
#      | "N_5467_Trigger4_Current Date_lt_VALID_START_DATE"            |
#      | "N_5467_Trigger4_VALID_END_DATE_lt_Current Date"              |
#      | "N_5467_Trigger4_NOVA_CHANNEL_eq_N"                           |
#      | "N_5467_Trigger4_NOVA_CHANNEL_eq_NULL"                        |
#      | "N_5467_Trigger4_CAMPAIGN_CELL_DESC_eq_NULL"                  |
#    ##Trigger5
#      | "N_5467_Trigger5_EV_RT_HISA_XSELL _lt_DSS_MPSA_Xsell_RS21097" |
#      | "N_5467_Trigger5_EV_RT_HISA_XSELL_eq_NULL"                    |

  ## Added for JUNE 22 2023 REL Exclusion Scenarios
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_gt_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y"   |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_eq_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y"   |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_START_DATE_lt_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y" |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_START_DATE_eq_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y" |
      | "N_5467_NOVA_multiple_Externaltbl_Records"                                                   |
