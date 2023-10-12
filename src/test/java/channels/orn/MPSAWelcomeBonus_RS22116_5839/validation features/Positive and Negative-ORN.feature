@MPSAWelcomeBonus_PositiveNegative_Validation_5839
Feature: Validate MPSA Welcome Bonus Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_ORN_Validation @5839 @ORN @RS22116 @Sanity-ORN
  Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> IH for Base Positive TestCases
    # Reading data from Excel sheet
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_ORN')
#    # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#    # Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidationWithIH')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID              |
      | "5839_ORN_BASE_01" |


  @MPSAWelcomeBonus @MPSAWelcomeBonus_Positive_ORN_Validation @5839 @ORN @RS22116
  Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> Positive TestCases
    # Reading data from Excel sheet
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_ORN')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                  |
      | "5839_ORN_CUST_AGE_eq_18"                                              |
      | "5839_ORN_LANG_CD_eq_fr"                                               |
      | "5839_ORN_NOT_AML_KYC_eq_NULL"                                         |
      | "5839_ORN_MD_FINANCIAL_F_eq_NULL"                                      |
      | "5839_ORN_ITRADE_MCLEOD_F_eq_NULL"                                     |
      | "5839_ORN_ITRADE_MCLEOD_F_eq_Y"                                        |
      | "5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                        |
      | "5839_ORN_DO_NOT_SOLICIT_F_eq_NULL"                                    |
      | "5839_ORN_ACCT_ODT_eq_30"                                              |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_ne_1"    |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_NULL" |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_ne_1"     |
      | "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_NULL"  |


  @MPSAWelcomeBonus @MPSAWelcomeBonus_Negative_ORN_Validation @5839 @ORN @RS22116
  Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> Negative TestCases
    # Reading data from Excel sheet
    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # Printing request body in console
    * print '*********Request**********'+requestfile
    # request (Karate keyword) for sending request string
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
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
    # Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                 |
      | "N_5839_ORN_DECEASED_F_eq_Y"                                          |
      | "N_5839_ORN_DECEASED_F_eq_NULL"                                       |
      | "N_5839_ORN_CUST_TP_CD_ne_PSNL"                                       |
#      | "N_5839_ORN_CUST_TP_CD_eq_NULL"                                       |
      | "N_5839_ORN_PRIM_CNTRY_CD_ne_CA"                                      |
      | "N_5839_ORN_PRIM_CNTRY_CD_eq_NULL"                                    |
      | "N_5839_ORN_CUST_AGE_lt_18"                                           |
      | "N_5839_ORN_CUST_AGE_eq_NULL"                                         |
      | "N_5839_ORN_LANG_CD_ne_en_fr"                                         |
      | "N_5839_ORN_LANG_CD_eq_NULL"                                          |
      | "N_5839_ORN_NOT_AML_KYC_eq_Y"                                         |
      | "N_5839_ORN_MD_FINANCIAL_F_eq_Y"                                      |
      | "N_5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                        |
      | "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_Y"                                   |
      | "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_NULL"                                |
      | "N_5839_ORN_MRKTBLE_F_n_eq_Y"                                         |
      | "N_5839_ORN_MRKTBLE_F_eq_NULL"                                        |
      | "N_5839_ORN_DO_NOT_SOLICIT_F_eq_Y"                                    |
      | "N_5839_ORN_SRC_ACCT_STAT_CD_ne_Active"                               |
      | "N_5839_ORN_SRC_ACCT_STAT_CD_eq_NULL"                                 |
      | "N_5839_ORN_ACCT_SUBSYS_ID_ne_UF"                                     |
      | "N_5839_ORN_ACCT_SUBSYS_ID_eq_NULL"                                   |
      | "N_5839_ORN_SRC_SYS_PRD_CD_ne_BSAMP"                                  |
      | "N_5839_ORN_SRC_SYS_PRD_CD_eq_NULL"                                   |
      | "N_5839_ORN_ACCT_ODT_eq_0"                                            |
      | "N_5839_ORN_ACCT_ODT_gt_30"                                           |
      | "N_5839_ORN_ACCT_ODT_eq_NULL"                                         |
      | "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                            |
      | "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                         |
      | "N_5839_ORN_INSIGHT_CD_ne_MPSA_WELCOME_BONUS"                         |
#      | "N_5839_ORN_INSIGHT_CD_eq_NULL"                                       |
#      | "N_5839_ORN_CURR_VAL_ne_1"                                            |
      | "N_5839_ORN_CURR_VAL_eq_NULL"                                         |
      | "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_1" |
      | "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_1"  |

