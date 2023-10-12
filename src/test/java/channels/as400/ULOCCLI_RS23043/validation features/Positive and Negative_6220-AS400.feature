@CIMCAMP-2384 @PositiveNegative_Validation_6220
Feature: Validate ULOCCLI - CoBorrower-6220 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_6220 @6220 @AS400 @RS23043
  Scenario Outline: ULOCCLI - CoBorrower_RS23043_6220_AS400 Validate <TestID> IH field values Base Line against proposition data
    * def testDataFileName = ULOCCLIAS400TestData6220

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


  #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

 #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

#      Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                        |
      | "6220_AS400_BASE_Creative_01" |
      | "6220_AS400_BASE_Creative_02" |


  @ULOCCLI @ULOCCLICoBorrower_Positive_TestCases_Validation_6220 @6220 @AS400 @RS23043 @validation_mar_162023
  Scenario Outline: ULOCCLI CoBorrower- RS23043_6220_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ULOCCLIAS400TestData6220

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


  #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

 #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                |
      | "6220_AS400_Creative_1_CUST_AGE_eq_18"                                                                |
      | "6220_AS400_Creative_1_LANG_CD_eq_fr"                                                                 |
      | "6220_AS400_Creative_2_CC_VIP_IND_eq_NULL"                                                            |
      | "6220_AS400_Creative_1_Curr_Dt_eq_CLI_OFR_ST_DT"                                                      |
      | "6220_AS400_Creative_2_Curr_Dt_gt_CLI_OFR_ST_DT"                                                      |
      | "6220_AS400_Creative_1_CLI_APRVD_CR_LMT_gt_CR_CRD_LMT_AMT"                                            |
      | "6220_AS400_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Same_Product"      |
      | "6220_AS400_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Different_Product" |

  @ULOCCLI @ULOCCLICoBorrower_Negative_TestCases_Validation_6220 @6220 @AS400 @RS23043
  Scenario Outline: ULOCCLI - CoBorrower_RS23043_6220_AS400 Validate <TestID> of Negative TestCases Response Fields
    * def testDataFileName = ULOCCLIAS400TestData6220

      #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML == null

    Examples:
      | TestID                                                                                                        |
      | "N-6220_AS400_Creative_1_CUST_AGE_lt_18"                                                                      |
      | "N-6220_AS400_Creative_1_CUST_AGE_eq_NULL"                                                                    |
      | "N-6220_AS400_Creative_1_DECEASED_ne_N"                                                                       |
      | "N-6220_AS400_Creative_1_DECEASED_eq_NULL"                                                                    |
      | "N-6220_AS400_Creative_1_LANG_CD_ne_fr"                                                                       |
      | "N-6220_AS400_Creative_1_LANG_CD_eq_NULL"                                                                     |
      | "N-6220_AS400_Creative_2_CUST_TP_CD_ne_PSNL"                                                                  |
      | "N-6220_AS400_Creative_2_PRIM_CNTRY_CD _ne_CA"                                                                |
      | "N-6220_AS400_Creative_2_PRIM_CNTRY_CD _eq_NULL"                                                              |
      | "N-6220_AS400_Creative_2_CC_VIP_IND_eq_2"                                                                     |
      | "N-6220_AS400_Creative_2_CC_VIP_IND_eq_9"                                                                     |
      | "N-6220_AS400_Creative_2_MRKTBLE_F_ne_Y"                                                                      |
      | "N-6220_AS400_Creative_2_MRKTBLE_F_ne_NULL"                                                                   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_ne_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_ne_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_ne_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_ne_RL"   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL" |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL"   |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RL"  |
      | "N-6220_AS400_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N-6220_AS400_CLI_OFR_F_ne_Z"                                                                                 |
      | "N-6220_AS400_CLI_OFR_F_eq_NULL"                                                                              |
      | "N-6220_AS400_CLI_OFR_CRNT_F_ne_Y"                                                                            |
      | "N-6220_AS400_CLI_OFR_CRNT_F_eq_NULL"                                                                         |
      | "N-6220_AS400_Curr_Dt_lt_CLI_OFR_ST_DT"                                                                       |
      | "N-6220_AS400_Curr_Dt_gt_CLI_OFR_EXP_DT"                                                                      |
      | "N-6220_AS400_CLI_OFR_ST_DT_eq_NULL"                                                                          |
      | "N-6220_AS400_CLI_OFR_EXP_DT_eq_NULL"                                                                         |
      | "N-6220_AS400_CLI_APRVD_CR_LMT_lt_CR_CRD_LMT_AMT"                                                             |
      | "N-6220_AS400_CLI_APRVD_CR_LMT_eq_CR_CRD_LMT_AMT"                                                             |
      | "N-6220_AS400_CLI_APRVD_CR_LMT_eq_NULL"                                                                       |
      | "N-6218_AS400_CC_SCNRY_CUST_ID_eq_Null"                                                                       |
      | "N-6220_AS400_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                       |
      | "N-6220_AS400_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                    |