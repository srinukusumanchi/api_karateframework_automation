@CIMCAMP-418 @PositiveNegative_Validation_6090
Feature: Validate ULOCCLI - VISA CLI - Sole Borrower-6090 Positive and Negative test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6090 @6090 @NOVA @RS23043
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6090_NOVA Validate <TestID> IH field values Base Line against proposition data
    * def testDataFileName = ULOCCLINovaTestData6090
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6090_NOVA_BASE_Creative_01" |
      | "6090_NOVA_BASE_Creative_02" |


  @ULOCCLI @ULOCCLI_Positive_TestCases_Validation_6090 @6090 @NOVA @RS23043 @validation_mar_162023
  Scenario Outline: ULOCCLI - RS23043_6090_NOVA Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ULOCCLINovaTestData6090
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0



    Examples:
      | TestID                                                                                               |
      | "6090_NOVA_Creative_1_CUST_AGE_eq_18"                                                                |
      | "6090_NOVA_Creative_1_LANG_CD_eq_fr"                                                                 |
      | "6090_NOVA_Creative_2_CC_VIP_IND_eq_NULL"                                                            |
      | "6090_NOVA_Creative_1_Curr_Dt_eq_CLI_OFR_ST_DT"                                                      |
      | "6090_NOVA_Creative_2_Curr_Dt_gt_CLI_OFR_ST_DT"                                                      |
      | "6090_NOVA_Creative_1_CLI_APRVD_CR_LMT_gt_CR_CRD_LMT_AMT"                                            |
      | "6090_NOVA_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Same_Product"      |
      | "6090_NOVA_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Different_Product" |

  @ULOCCLI @ULOCCLI_Negative_TestCases_Validation_6090 @6090 @NOVA @RS23043
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6090_NOVA Validate <TestID> of Negative TestCases Response Fields
    * def testDataFileName = ULOCCLINovaTestData6090
    #    Reading data from Excel sheet
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
      | TestID                                                                                                       |
      | "N-6090_NOVA_Creative_1_CUST_AGE_lt_18"                                                                      |
      | "N-6090_NOVA_Creative_1_CUST_AGE_eq_NULL"                                                                    |
      | "N-6090_NOVA_Creative_1_DECEASED_ne_N"                                                                       |
      | "N-6090_NOVA_Creative_1_DECEASED_eq_NULL"                                                                    |
      | "N-6090_NOVA_Creative_1_LANG_CD_ne_fr"                                                                       |
      | "N-6090_NOVA_Creative_1_LANG_CD_eq_NULL"                                                                     |
      | "N-6090_NOVA_Creative_2_CUST_TP_CD_ne_PSNL"                                                                  |
      | "N-6090_NOVA_Creative_2_PRIM_CNTRY_CD _ne_CA"                                                                |
      | "N-6090_NOVA_Creative_2_PRIM_CNTRY_CD _eq_NULL"                                                              |
      | "N-6090_NOVA_Creative_2_CC_VIP_IND_eq_2"                                                                     |
      | "N-6090_NOVA_Creative_2_CC_VIP_IND_eq_9"                                                                     |
      | "N-6090_NOVA_Creative_2_MRKTBLE_F_ne_Y"                                                                      |
      | "N-6090_NOVA_Creative_2_MRKTBLE_F_ne_NULL"                                                                   |
      | "N-6090_NOVA_Creative_2_INDV_FRST_NM_eq_NULL"                                                                |
      | "N-6090_NOVA_Creative_2_INDV_LAST_NM_eq_NULL"                                                                |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_ne_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_ne_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_ne_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_ne_RL"   |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL" |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RL"  |
      | "N-6090_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N-6090_NOVA_CLI_OFR_F_ne_Z"                                                                                 |
      | "N-6090_NOVA_CLI_OFR_F_eq_NULL"                                                                              |
      | "N-6090_NOVA_CLI_OFR_CRNT_F_ne_Y"                                                                            |
      | "N-6090_NOVA_CLI_OFR_CRNT_F_eq_NULL"                                                                         |
      | "N-6090_NOVA_Curr_Dt_lt_CLI_OFR_ST_DT"                                                                       |
      | "N-6090_NOVA_Curr_Dt_gt_CLI_OFR_EXP_DT"                                                                      |
      | "N-6090_NOVA_CLI_OFR_ST_DT_eq_NULL"                                                                          |
      | "N-6090_NOVA_CLI_OFR_EXP_DT_eq_NULL"                                                                         |
      | "N-6090_NOVA_CLI_APRVD_CR_LMT_lt_CR_CRD_LMT_AMT"                                                             |
      | "N-6090_NOVA_CLI_APRVD_CR_LMT_eq_CR_CRD_LMT_AMT"                                                             |
      | "N-6090_NOVA_CLI_APRVD_CR_LMT_eq_NULL"                                                                       |
      | "N-6090_NOVA_CC_SCNRY_CUST_ID_NOT_Null"                                                                      |
      | "N-6090_NOVA_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                       |
      | "N-6090_NOVA_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                    |