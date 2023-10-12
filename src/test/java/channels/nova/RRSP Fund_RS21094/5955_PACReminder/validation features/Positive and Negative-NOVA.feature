@RRSPFund_PositiveNegative_Validation_5955
Feature: Validate RRSP Fund remainder Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @RRSPPACReminderValidation_5955  @RRSPFund_5955_Nova_Positive_Base_Validation @5955 @NOVA @RS21094
  Scenario Outline: RRSP Fund_5955_NOVA Validate <TestID> Positive TestCases Response Fields and IH 

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@RRSPContributionValidation_Nova')
  # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

  # Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionReminderOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID         |
      | "5955_BASE_01" |
      | "5955_BASE_02" |

  @RRSPContributionValidation_5955  @RRSPFund_5955_Nova_Positive_Validation @5955 @NOVA @RS21094
  Scenario Outline: RRSP Fund_5955_NOVA Validate <TestID> Positive TestCases Response Fields

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@RRSPContributionValidation_Nova')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                      |
      | "5955_CUST_AGE_eq_18"                                                                                       |
      | "5955_LANG_CD_eq_e"                                                                                         |
      | "5955_LANG_CD_eq_en"                                                                                        |
      | "5955_LANG_CD_eq_f"                                                                                         |
      | "5955_LANG_CD_eq_fr"                                                                                        |
      | "5955_LANG_CD_eq_capital_E"                                                                                 |
      | "5955_LANG_CD_eq_capital_EN"                                                                                |
      | "5955_LANG_CD_eq_capital_F"                                                                                 |
      | "5955_LANG_CD_eq_capital_FR"                                                                                |
      | "5955_DO_NOT_SOLICIT_F_eq_NULL"                                                                             |
      | "5955_NOT_AML_KYC_eq_NULL"                                                                                  |
      | "5955_MD_FINANCIAL_F_eq_NULL"                                                                               |
      | "5955_ITRADE_MCLEOD_F_eq_NULL"                                                                              |
      | "5955_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                                 |
      | "5955_PLN_ACCT_CD_MASTER_eq_RRSP_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_eq_Active_PIC_PAC_F_eq_0"            |
      | "5955_Currentdate-ACCT_ODT=BusinessDSS1"                                                                    |
      | "5955_Currentdate-ACCT_ODT>BusinessDSS1"                                                                    |
      | "5955_Currentdate-ACCT_ODT=BusinessDSS2"                                                                    |
      | "5955_Currentdate-ACCT_ODT<BusinessDSS2"                                                                    |
      | "5955_PRIMARY_ACCT_HOLDER_FLAG_eq_Y"                                                                        |
      | "5955_INDV_FRST_NM_ne_NULL"                                                                                 |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_Lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5955_5955032303_5955012302_prioritise_5955012302"                                                          |
      | "5502_5955_ifeligibleforbothoffersthen prioritise5955"                                                      |

  @RRSPContributionValidation_5955  @RRSPFund_5955_Nova_Negative_Validation @5955 @NOVA @RS21094
  Scenario Outline: RRSP Fund_5955_NOVA Validate <TestID> Negative TestCases Response Fields

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
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                     |
      | "N-5955_CUST_TP_CD_ne_PSNL"                                                                                |
      | "N-5955_PRIM_CNTRY_CD_ne_CA"                                                                               |
      | "N-5955_PRIM_CNTRY_CD_eq_NULL"                                                                             |
      | "N-5955_DECEASED_F_ne_N"                                                                                   |
      | "N-5955_DECEASED_F_eq_NULL"                                                                                |
      | "N-5955_CUST_AGE_eq_NULL"                                                                                  |
      | "N-5955_CUST_AGE_lt_18"                                                                                    |
      | "N-5955_LANG_CD_ne_e_en_f_fr_E_EN_F_FR"                                                                    |
      | "N-5955_LANG_CD_eq_NULL"                                                                                   |
      | "N-5955_MRKTBLE_F_ne_Y"                                                                                    |
      | "N-5955_MRKTBLE_F_eq_NULL"                                                                                 |
      | "N-5955_NOT_AML_KYC_eq_Y"                                                                                  |
      | "N-5955_MD_FINANCIAL_F_eq_Y"                                                                               |
      | "N-5955_ITRADE_MCLEOD_F_eq_Y"                                                                              |
      | "N-5955_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                                 |
      | "N-5955_PLN_ACCT_CD_MASTER_ne_RRSP"                                                                        |
      | "N-5955_PLN_ACCT_CD_MASTER_eq_NULL"                                                                        |
      | "N-5955_ACCT_SUBSYS_ID_ne_UF"                                                                              |
      | "N-5955_ACCT_SUBSYS_ID_eq_NULL"                                                                            |
      | "N-5955_SRC_ACCT_STAT_CD_ne_Active"                                                                        |
      | "N-5955_SRC_ACCT_STAT_CD_eq_NULL"                                                                          |
      | "N-5955_PIC_PAC_F_ne_0"                                                                                    |
      | "N-5955_PIC_PAC_F_eq_NULL"                                                                                 |
      | "N-5955_ACCT_ODT_eq_NULL"                                                                                  |
      | "N-5955_Currentdate-ACCT_ODT<BusinessDSS1"                                                                 |
      | "N-5955_Currentdate-ACCT_ODT>BusinessDSS2"                                                                 |
      | "N-5955_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                                     |
      | "N-5955_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                                  |
      | "N-5955_INDV_FRST_NM_eq_NULL"                                                                              |
      | "N-5955_INDV_LAST_NM_eq_NULL"                                                                              |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
          ##Added on march 02 2023 rel
      | "N_5955_PLN_ACCT_DLR_ne_BNS"                                                                               |
      | "N_5955_PLN_ACCT_DLR_ne_SSI"                                                                               |
      | "N_5955_PLN_ACCT_DLR_eq_NULL"                                                                              |
#Added for June 8th 2023 rleease for exteranl table addition
      | "N_5955_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                                                 |
