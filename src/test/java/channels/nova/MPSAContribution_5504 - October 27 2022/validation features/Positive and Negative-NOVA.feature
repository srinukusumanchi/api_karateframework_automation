@MPSAContribution_PositiveNegative_Validation_5504_Oct_27_2022
Feature: Validate MPSA Contribution Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @MPSAContribution_5504 @MPSAContribution_5504_Nova_Positive_Scenario1_Scenario2_Base_Validation_Oct_27_2022 @5504 @NOVA  @AUTUTESTTOTAL#4
  Scenario Outline: MPSA Contribution_5504_NOVA Validate <TestID> Positive TestCases Response Fields
    #    Reading data from Excel sheet
    * def testDataFileName = MPSAContributionNovaTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSAContributionOfferValidation_NOVA')
      # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                                                                                  |
#      | "5504_NOVA_Base_01_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                               |
#      | "5504_NOVA_Base_02_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                             |
#      | "5504_NOVA_Base_03_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                        |
#      | "5504_NOVA_Base_04_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                        |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Event_Dt_lt_30_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                        |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_01_MPSA_ODT_lt_X_With_MPSA_Bonus"                                                                     |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_eq_X_With_MPSA_Bonus"                                                                     |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Curr_Val_gt_1_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                       |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_eq_X_With_MPSA_Bonus"                                                                        |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                        |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_01_MPSA_ODT_lt_X_With_MPSA_Bonus"                                                                        |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                     |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_eq_X_With_MPSA_Bonus"                                                                     |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_PAGE_VISIT_PAYROLL_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_No_BB"                                              |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_PAGE_VISIT_PAYROLL_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Ultimate"                                         |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_PAGE_VISIT_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_Preferred"                                        |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_PAGE_VISIT_PAYROLL_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_No_BB"                                            |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Acct_ODT_gt_60"                                                      |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_Acct_ODT_gt_60"                                                         |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_ENG_RS22022_TARGET_CONTROL_CURR_VAL_ne_1"       |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_ENG_RS22022_TARGET_CONTROL_CURR_VAL_eq_NULL"    |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_ne_1_EVENT_DATE_lt_60"    |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_eq_NULL_EVENT_DATE_lt_60" |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_eq_1_EVENT_DATE_gt_60"    |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_eq_1_EVENT_DATE_eq_NULL"  |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_SUBSYS_ID_ne_BB"                                                |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_01"                       |
#      # Added for Feb 02-2023 Rls
#      | "5504_NOVA_INSIGHT_CD_eq_FLG_BALANCE_FUND_RS23010_and_CURR_VAL_eq_Null"                                                                 |
#      | "5504_NOVA_INSIGHT_CD_eq_FLG_BALANCE_FUND_RS23010_and_CURR_VAL_ne_1"                                                                    |
#Added for June 2023 Release
      | "5504_NOVA_VALID_START_DATE_lt_Curr_Dt"                                                                                                 |
      | "5504_NOVA_multiple_Externaltbl_Records"                                                                                                |

  @MPSAContribution_5504 @MPSAContribution_5504_Nova_Positive_Scenario1_Scenario2_Base_Validation_Oct_27_2022_part1 @5504 @NOVA  @AUTUTESTTOTAL#4
  Scenario Outline: MPSA Contribution_5504_NOVA Validate <TestID> Positive TestCases Response Fields  part1
    #    Reading data from Excel sheet
    * def testDataFileName = MPSAContributionNovaTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
#    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSAContributionOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                  |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_04"                                                                               |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_04"                                                                               |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_ACCT_STAT_CD_ne_A_Ultimate"                                                                                              |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_ACCT_STAT_CD_eq_NULL_Preferred"                                                                                          |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_ne_Y_Ultimate"                                                                                      |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL_Preferred"                                                                                  |
#      | "5504_NOVA_Scrio_2_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_eq_35"                                                                                                                         |
#      | "5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_lt_49"                                                                                                                         |
#      | "5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_eq_49"                                                                                                                         |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Curr_Val_gt_1_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Prioritize_Creative_02_Over_03"                                                                                |
#      | "5504_NOVA_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Prioritize_Scenario_1_Cell_Group"                                                                                                    |
#      | "5504_NOVA_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Prioritize_Scenario_1_Cell_Group_Insight_Pointing_to_Scenario_2"                                                                     |
#      | "5504_NOVA_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_Prioritize_Account_Pointed_by_Insight"                                                                                               |
#      | "5504_NOVA_Scrio_1_Seg_01_CUST_AGE_eq_18_DO_NOT_SOLICIT_F_eq_NULL_NOT_AML_KYC_eq_NULL_PHYSICIANS_F_eq_NULL_MD_FINANCIAL_F_eq_NULL_ITRADE_MCLEOD_F_eq_NULL_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL" |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_01_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_91"                                                  |
#      | "5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_91"                                                             |
#      | "5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_13_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_91"                                                             |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_07_SRC_SUB_PRD_CD_eq_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_91"                                                    |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_23_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_91"                                                    |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VGD_SRC_SUB_PRD_CD_eq_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_91"                           |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_UO_SRC_ACCT_STAT_CD_eq_Active_ACCT_ODT_eq_91"                                                                |
#      | "5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_eq_49"                                                                                                                         |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                                                                                               |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                                                                                                  |
#      | "5504_NOVA_Scrio_1_PAYROLL_Seg_04_MPSA_ODT_eq_X_With_MPSA_Bonus"                                                                                                                                |
#      | "5504_NOVA_Scrio_1_PAGE_VISIT_Seg_03_MPSA_ODT_eq_X_With_MPSA_Bonus"                                                                                                                             |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                                                             |
#      | "5504_NOVA_Scrio_1_TAX_REFUND_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                                                             |
#      | "5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_CRNT_BAL_AMT_eq_NULL"                                                                                                                   |
#      | "5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ITRADE_MCLEOD_F_eq_Y"                                                                                                                   |
#Added for June 22nd release 2023
      | "5504_NOVA_VALID_START_DATE_eq_Curr_Dt" |
      | "5504_NOVA_VALID_END_DATE_gt_Curr_Dt"   |
      | "5504_NOVA_VALID_END_DATE_eq_Curr_Dt"   |


  @MPSAContribution_5504 @MPSAContribution_5504_Nova_NegativeTestCases_Validation_Oct_27_2022 @5504 @NOVA @RS21098 @AUTOTESTTOTAL#31
  Scenario Outline: MPSAContribution_5504_NOVA Validate <TestID> Negative TestCases Response Fields
#      Reading data from Excel sheet
    * def testDataFileName = MPSAContributionNovaTestData

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
      | TestID                                          |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Event_Dt_gt_30_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Curr_Val_ne_1_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                                                       |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Curr_Val_eq_NULL_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"                                                                                    |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Curr_Val_ne_1_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                        |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Curr_Val_eq_NULL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Curr_Val_lt_1_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Curr_Val_eq_NULL_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus"                                                                                  |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_ACCT_STAT_CD_ne_Active"                                                                          |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_ACCT_STAT_CD_eq_NULL"                                                                          |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_SUBSYS_ID_ne_UF"                                                                                 |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_NULL"                                                                              |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_ne_BSAMP"                                                                           |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_eq_NULL"                                                                               |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                                       |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                                  |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_BUSINESS_SEGMENT_ne_Retail"                                                                           |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_BUSINESS_SEGMENT_eq_NULL"                                                                            |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_eq_60"                                                                                    |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_lt_60"                                                                                       |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_ODT_eq_NULL"                                                                                    |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_ENG_RS22022_TARGET_CONTROL_CURR_VAL_eq_1"                                     |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_eq_1_EVENT_DATE_lt_60"                                  |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_INSIGHT_CD_eq_FLG_MPSA_CONTRIBUTION_CURR_VAL_eq_1_EVENT_DATE_eq_60"                                  |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_01_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_01_SRC_SUB_PRD_CD_eq_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_01_SRC_SUB_PRD_CD_eq_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_01_SRC_SUB_PRD_CD_eq_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_02_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_02_SRC_SUB_PRD_CD_eq_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                        |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_02_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_02_SRC_SUB_PRD_CD_eq_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                        |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_03_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_19_SRC_SUB_PRD_CD_eq_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_13_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_13_SRC_SUB_PRD_CD_eq_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_13_SRC_SUB_PRD_CD_eq_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_PRD_CD_eq_13_SRC_SUB_PRD_CD_eq_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                                   |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_07_SRC_SUB_PRD_CD_eq_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                          |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_07_SRC_SUB_PRD_CD_eq_12_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                          |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_23_SRC_SUB_PRD_CD_eq_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_89"                          |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_SRC_PRD_CD_eq_23_SRC_SUB_PRD_CD_eq_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90"                          |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VGD_SRC_SUB_PRD_CD_eq_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_ZZ_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VLR_SRC_SUB_PRD_CD_eq_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VLR_SRC_SUB_PRD_CD_eq_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VCL_SRC_SUB_PRD_CD_eq_SV_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VFA_SRC_SUB_PRD_CD_eq_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      # Added for Feb 02-2023 Rls
#      | "N_5504_NOVA_INSIGHT_CD_eq_FLG_BALANCE_FUND_RS23010_and_CURR_VAL_eq_1"                                                                                                  |
      # Added for June 2023 release
      | "N_5504_NOVA_VALID_START_DATE_gt_Curr_Dt"       |
      | "N_5504_NOVA_VALID_END_DATE_lt_Curr_Dt"         |
      | "N_5504_NOVA_CAMPAIGN_CODE_ne_RS21098"          |
      | "N_5504_NOVA_Seg_CAMPAIGN_CELL_CODE_ne_CIE5504" |
      | "N_5504_NOVA_Seg_CAMPAIGN_CELL_CODE_eq_NULL"    |
      | "N_5504_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"      |
      | "N_5504_NOVA_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"   |
      | "N_5504_NOVA_NOVA_CHANNEL_ne_Y"                 |
      | "N_5504_NOVA_NOVA_CHANNEL_eq_NULL"              |


#  @MPSAContribution_5504 @MPSAContribution_5504_Nova_NegativeTestCases_Validation_part1_Oct_27_2022 @5504 @NOVA @RS21098 @AUTOTESTTOTAL#31
#  Scenario Outline: MPSAContribution_5504_NOVA Validate <TestID> Negative TestCases Response Fields part1
##      Reading data from Excel sheet
#    * def testDataFileName = MPSAContributionNovaTestData
#
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID'+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#
#     #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('data.NBACode')
#
#  #     Generate a NOVA SOAP call
#    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#   #    Performing action on JSON request (Post Action)
#    * method post
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.prettyXml(responseString)
#
#      #    It clears Result fields
#    * clearResultFields()
#
#    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
#
#     #    Validating error response
#    * assert (responseStringActual == {})|| (responseStringActual != offerCode)
#
#    Examples:
#      | TestID                                                                                                                                                                  |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VFF_SRC_SUB_PRD_CD_eq_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_AXG_SRC_SUB_PRD_CD_eq_GC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_AXS_SRC_SUB_PRD_CD_eq_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_AXP_SRC_SUB_PRD_CD_eq_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VLR_SRC_SUB_PRD_CD_eq_RC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VFF_SRC_SUB_PRD_CD_eq_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_eq_VGD_SRC_SUB_PRD_CD_eq_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_89" |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_ACCT_SUBSYS_ID_eq_UO_SRC_ACCT_STAT_CD_eq_Active_ACCT_ODT_eq_89"                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Event_Dt_eq_30_Seg_01_MPSA_ODT_eq_X_No_MPSA_Bonus"                                                                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus"                                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_01_MPSA_ODT_gt_X_With_MPSA_Bonus_Non_Matching_UF"                                                                                   |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_01_MPSA_ODT_gt_X_With_MPSA_Bonus_Non_Matching_UF"                                                                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus_Acct_ODT_gt_60"                                                                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus_Ultimate"                                                                                            |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_With_MPSA_Bonus_Curr_Val_eq_NULL_Ultimate"                                                                         |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus_Preferred"                                                                                           |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_gt_X_With_MPSA_Bonus_Curr_Val_eq_NULL_Preferred"                                                                        |
#      | "N_5504_NOVA_Scrio_2_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus_ACCT_ODT_gt_35"                                                                                                 |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_eq_X_No_MPSA_Bonus"                                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_01_MPSA_ODT_eq_X_No_MPSA_Bonus"                                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAGE_VISIT_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus"                                                                                                     |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_01_MPSA_ODT_eq_X_No_MPSA_Bonus"                                                                                                        |
#      | "N_5504_NOVA_Scrio_1_PAYROLL_Seg_01_MPSA_ODT_gt_X_No_MPSA_Bonus"                                                                                                        |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_No_MPSA_Bonus"                                                                                                                |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_gt_49"                                                                                               |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_ODT_lt_35"                                                                                               |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_ACCT_STAT_CD_ne_Active"                                                                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_ACCT_STAT_CD_eq_NULL"                                                                                     |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_SUBSYS_ID_ne_UF"                                                                                         |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_ACCT_SUBSYS_ID_eq_NULL"                                                                                       |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_ne_BSAMP"                                                                                      |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_SRC_SYS_PRD_CD_eq_NULL"                                                                                       |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_BUSINESS_SEGMENT_ne_Retail"                                                                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_BUSINESS_SEGMENT_eq_NULL"                                                                                     |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_CRNT_BAL_AMT_ne_0"                                                                                            |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                                                |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                                             |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_CUST_TP_CD_ne_PSNL"                                                                                  |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_PRIM_CNTRY_CD_ne_CA"                                                                                 |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_PRIM_CNTRY_CD_eq_NULL"                                                                               |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_CUST_AGE_lt_18"                                                                                      |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_CUST_AGE_eq_NULL"                                                                                    |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_LANG_CD_eq_bn"                                                                                       |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_LANG_CD_eq_NULL"                                                                                     |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_DO_NOT_SOLICIT_F_eq_Y"                                                                               |
#      | "N_5504_NOVA_Scrio_1_TAX_REFUND_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus_NOT_AML_KYC_eq_Y"                                                                                    |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_PHYSICIANS_F_eq_Y"                                                                                            |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_MD_FINANCIAL_F_eq_Y"                                                                                          |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                                            |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_DECEASED_F_eq_Y"                                                                                              |
#      | "N_5504_NOVA_Scrio_2_Seg_04_MPSA_ODT_gt_X_With_MPSA_Bonus_DECEASED_F_eq_NULL"                                                                                           |
#
#  @MPSAContribution_5504 @MPSAContribution_5504ACCTODT37   @MPSAContribution_5504_Nova_Positive_Scenario1_Scenario2_ACctODT37_Base_Validation_Oct_27_2022 @5504 @NOVA  @AUTUTESTTOTAL#4
#  Scenario Outline: MPSA Contribution_5504_NOVA Validate <TestID> Positive TestCases Response Fields for scenario with account odt 37 days
#    #    Reading data from Excel sheet
#    * def testDataFileName = MPSAContributionNovaTestData
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#    * def cid = karate.get('data.ID')
#    * print 'CID is '+cid
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
#    # Defining which NBA Code to test (Retriving from excel sheet)
#    * string offerCode = karate.get('data.NBACode')
#    * print 'Offer cod  is '+offerCode
#    # Generate a NOVA SOAP call
#    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
##    # Clear IH when it goes to control group
##    * call clearIH(cid,requestfile,offerCode)
#    # Printing request body in console
#    * print '*********Request**********'+karate.prettyXml(requestfile)
#    #  request (Karate keyword) for sending request string
#    * request requestfile
#    # Performing action on JSON request (Post Action)
#    * method post
#    # Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#    # Printing response body in console
#    * print '***************Response*************'+karate.prettyXml(responseString)
#    # It clears Result fields
#    * clearResultFields()
#    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSAContributionOfferValidation_NOVA')
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#    Examples:
#      | TestID                                                   |
#      | "5504_NOVA_Scrio_2_Seg_01_MPSA_ODT_lt_X_No_MPSA_Bonus"   |
#      | "5504_NOVA_Scrio_2_Seg_02_MPSA_ODT_eq_X_With_MPSA_Bonus" |

#  @MPSAContribution_5504 @MPSAContribution_5504ACCTODT37  @MPSAContribution_5504_Nova_NegativeTestCases_Validation_AcctODT37_Oct_27_2022 @5504 @NOVA @RS21098 @AUTOTESTTOTAL#31
#  Scenario Outline: MPSAContribution_5504_NOVA Validate <TestID> Negative TestCases Response Fields for scenario with account odt 37 days
##      Reading data from Excel sheet
#    * def testDataFileName = MPSAContributionNovaTestData
#
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID'+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#
#     #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('data.NBACode')
#
#  #     Generate a NOVA SOAP call
#    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#   #    Performing action on JSON request (Post Action)
#    * method post
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.prettyXml(responseString)
#
#      #    It clears Result fields
#    * clearResultFields()
#
#    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
#
#     #    Validating error response
#    * assert (responseStringActual == {})|| (responseStringActual != offerCode)
#
#    Examples:
#      | TestID                                                   |
#      | "N_5504_NOVA_Scrio_2_Seg_01_MPSA_ODT_eq_X_No_MPSA_Bonus" |
#
