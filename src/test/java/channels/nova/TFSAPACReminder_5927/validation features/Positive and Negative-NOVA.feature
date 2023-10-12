@TFSAFund_PositiveNegative_Validation_5927
Feature: Validate TFSA Fund Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @TFSAContributionValidation_5927  @TFSAFund_5927_Nova_Positive_Base_Validation @5927 @NOVA @RS21092  @AUTOTESTTOTAL#39 @Sanity-NOVA
  Scenario Outline: TFSA Fund_5927_NOVA Validate <TestID> Base Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundContributionNovaTestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSAContributionValidation_Nova')
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
      | "5927_Base_01" |
      | "5927_Base_02" |

  @TFSAContributionValidation_5927  @TFSAFund_5927_Nova_Positive_Validation @5927 @NOVA @RS21092  @AUTOTESTTOTAL#39
  Scenario Outline: TFSA Fund_5927_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundContributionNovaTestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSAContributionValidation_Nova')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                      |
      | "5927_CUST_AGE_eq_18"                                                                                       |
      | "5927_LANG_CD_eq_e"                                                                                         |
      | "5927_LANG_CD_eq_en"                                                                                        |
      | "5927_LANG_CD_eq_f"                                                                                         |
      | "5927_LANG_CD_eq_fr"                                                                                        |
      | "5927_LANG_CD_eq_cap_E"                                                                                     |
      | "5927_LANG_CD_eq_cap_EN"                                                                                    |
      | "5927_LANG_CD_eq_cap_F"                                                                                     |
      | "5927_LANG_CD_eq_cap_FR"                                                                                    |
      | "5927_DO_NOT_SOLICIT_eq_Null"                                                                               |
      | "5927_NOT_AML_KYC_eq_Null"                                                                                  |
      | "5927_MD_FINANCIAL_F_eq_ Null"                                                                              |
      | "5927_ITRADE_MCLEOD_F_eq_Null"                                                                              |
      | "5927_DEDICATED_INVSTMNT_ADVISOR_F_eq_Null"                                                                 |
      | "5927_PLN_ACCT_CD_MASTER_eq_TFSA_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_eq_Active_PIC_PAC_F_eq_0"            |
      | "5927_Current date-ACCT_ODT=BusinessDSS1"                                                                   |
      | "5927_Current date-ACCT_ODT>BusinessDSS1"                                                                   |
      | "5927_Current date-ACCT_ODT<BusinessDSS2"                                                                   |
      | "5927-Current date-ACCT_ODT=BusinessDSS2"                                                                   |
      | "5927_PRIMARY_ACCT_HOLDER_FLAG_eq_Y"                                                                        |
      | "5927_INDV_FRST_NM_ne_NULL"                                                                                 |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_Lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        |
      | "5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    |
      | "5501_5927_ifeligibleforbothoffersthen_prioritise5927"                                                      |
      | "5927_5927032303_5927012302_prioritise_5927012302"                                                          |

  @TFSAContributionValidation_5927  @TFSAFund_5927_Nova_Negative_Validation @5927 @NOVA @RS21092  @AUTOTESTTOTAL#39
  Scenario Outline: TFSA Fund_5927_NOVA Validate <TestID> Negative TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = TFSAFundContributionNovaTestData

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
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                     |
      | "N-5927_CUST_TP_CD_ne_PSNL"                                                                                |
      | "N-5927_Primary Country Cd_ne_ CA"                                                                         |
      | "N-5927_Primary Country Cd_eq_NULL"                                                                        |
      | "N-5927_DECEASED_F_ne_N"                                                                                   |
      | "N-5927_DECEASED_F_eq_NULL"                                                                                |
      | "N-5927_CUST_AGE_lt_ 18"                                                                                   |
      | "N-5927_CUST_AGE_eq_NULL"                                                                                  |
      | "N-5927_LANG_CD_ne_en_e_fr_f_E_EN"                                                                         |
      | "N-5927_LANG_CD_eq_NULL"                                                                                   |
      | "N-5927_MRKTBLE_F_ne_Y"                                                                                    |
      | "N-5927_MRKTBLE_F_eq_NULL"                                                                                 |
      | "N-5927_NOT_AML_KYC_eq_Y"                                                                                  |
      | "N-5927_MD_FINANCIAL_F_eq_Y"                                                                               |
      | "N-5927_ITRADE_MCLEOD_F_eq_Y"                                                                              |
      | "N-5927_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                                 |
      | "N-5927_PLN_ACCT_CD_MASTER_ne_TFSA"                                                                        |
      | "N-5927_PLN_ACCT_CD_MASTER_eq_NULL"                                                                        |
      | "N-5927_ACCT_SUBSYS_ID_ne_UF"                                                                              |
      | "N-5927_ACCT_SUBSYS_ID_eq_NULL"                                                                            |
      | "N_5927_SRC_ACCT_STAT_CD_eq_ NULL"                                                                         |
      | "N-5927_SRC_ACCT_STAT_CD_ne_Active"                                                                        |
      | "N-5927_PIC_PAC_F_ne_0"                                                                                    |
      | "N-5927_PIC_PAC_F_eq_NULL"                                                                                 |
      | "N-5927_ACCT_ODT_eq_NULL"                                                                                  |
      | "N-5927_5927_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                                |
      | "N-5927_5927_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                             |
      | "N-5927_5927_INDV_FRST_NM_eq_NULL"                                                                         |
      | "N-5927_5927_INDV_Last_NM_eq_NULL"                                                                         |
      | "N-5927_Currentdate-ACCT_ODT>BusinessDSS2"                                                                 |
      | "N-5927_Currentdate-ACCT_ODT<BusinessDSS1"                                                                 |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" |
      | "N-5927_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" |
##Added for 02 march 2023 rel
      | "N_5927_PLN_ACCT_DLR_ne_BNS"                                                                               |
      | "N_5927_PLN_ACCT_DLR_ne_SSI"                                                                               |
      | "N_5927_PLN_ACCT_DLR_eq_NULL"                                                                              |
#Added for June8th 2023 release for external table exclusion
      | "N_5927_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                                                 |