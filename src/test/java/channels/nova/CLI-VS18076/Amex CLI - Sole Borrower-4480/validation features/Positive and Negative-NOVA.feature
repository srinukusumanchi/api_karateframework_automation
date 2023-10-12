@CIMCAMP-418 @PositiveNegative_Validation_4480
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4480 Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @CreditLimitIncrease @CreditLimitIncreaseAmexSoloBorrower_IH_Validation_ORN @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Validate <TestID> IH field values against proposition data
    * def testDataFileName = CLItestDataFileName
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

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4480_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAmexCLISoleBorrower_Positive_TestCases_Validation @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@CLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                       |
      | "4480_ISSUE = Engagement and Group = Unsecured Lending"      |
      | "4480_CUST_TP_CD = PSNL"                                     |
      | "4480_PRIM_CNTRY_CD = CA"                                    |
      | "4480_INDV_BRTH_DT_Equal to 18 yrs"                          |
      | "4480_INDV_BRTH_DT_Greater than 18 yrs"                      |
      | "4480_INDV_BRTH_DT_Less than 70 yrs"                         |
      | "4480_INDV_BRTH_DT_Equal to 70 yrs"                          |
      | "4480_MKT_F = Y"                                             |
      | "4480_Deceased_F = N"                                        |
      | "4480_Lang Code = E"                                         |
      | "4480_Lang Code = EN"                                        |
      | "4480_Lang Code = F"                                         |
      | "4480_Lang Code = FR"                                        |
      | "4480_Lang Code Small Case = en"                             |
      | "4480_Lang Code Small Case  = fr"                            |
      | "4480_PRIMARY_ACCT_HOLDER_FLAG = Y"                          |
      | "4480_SRC_ACCT_STAT_CD = 5"                                  |
      | "4480_ACCT_SUBSYS_ID = KS"                                   |
      | "4480_CLI_OFR_F =  Z"                                        |
      | "4480_PRD CD- AXG, SUB PRD CD -GC & CC_SCNRY_CUST_ID = Null" |
      | "4480_PRD CD- AXG, SUB PRD CD -GS & CC_SCNRY_CUST_ID = Null" |
      | "4480_PRD CD- AXS, SUB PRD CD -SC & CC_SCNRY_CUST_ID = Null" |
      | "4480_PRD CD- AXS, SUB PRD CD -SS & CC_SCNRY_CUST_ID = Null" |
      | "4480_PRD CD-AXP, SUB PRD CD -PC & CC_SCNRY_CUST_ID = Null"  |
      | "4480_CLI Offer Start Date Less than current date"           |
      | "4480_CLI Offer Start Date equal to current date"            |
      | "4480_CLI Offer Expiry Date greater than current date"       |
      | "4480_CLI Offer Expiry Date equal to current date"           |
      | "4480_CLI_APRVD_CR_LMT greater than CR_CRD_LMT_AMT"          |
      | "4480_CLI_OFR_CRNT_F = Y"                                    |
      | "4480_CC_STEP_LINK_F  = N"                                   |
      | "4480_CC_ACCT_VIP_IND  = 1"                                  |
      | "4480_SRC_ACCT_STAT_CD = A"                                  |
      | "4480_SRC_ACCT_STAT_CD = Open"                               |
      | "4480_SRC_ACCT_STAT_CD = Active"                             |
      | "4480_SRC_ACCT_STAT_CD = NULL"                               |
      | "4480_Indv_Brth_Dt greater than 70"                          |

  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAmexCLISoleBorrower_Negative_TestCases_Validation @4480 @NOVA @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_NOVA Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

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

#    Validating error response
    * match responseString == {}

    Examples:
      | TestID                                                 |
      | "N - 4480_PRIM_CNTRY_CD! = CA"                         |
      | "N - 4480_PRIM_CNTRY_CD = Null"                        |
      | "N - 4480_CUST_TP_CD != PSNL"                          |
      | "N - 4480_CUST_TP_CD =  Null"                          |
      | "N - 4480_Indv_Brth_Dtless than 18"                    |
      | "N - 4480_Indv_Brth_Dt Equal to Null"                  |
      | "N - 4480_Deceased_F = Y"                              |
      | "N - 4480_Deceased_F = Null"                           |
      | "N - 4480_LANG_CD = K"                                 |
      | "N - 4480_LANG_CD = NE"                                |
      | "N - 4480_LANG_CD = Null"                              |
      | "N - 4480_MKT_F = N"                                   |
      | "N - 4480_MKT_F = NULL"                                |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SP"                 |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SV"                 |
      | "N - 4480_PRD CD- VCL, SUB PRD CD -SS"                 |
      | "N - 4480_CLI_OFR_ST_DT  greater than current date"    |
      | "N - 4480_CLI_OFR_EXP_DT lesser than current date"     |
      | "N - 4480_CLI_OFR_F =A"                                |
      | "N - 4480_CLI_OFR_F = Null"                            |
      | "N - 4480_ACCT_SUBSYS_ID = BB"                         |
      | "N - 4480_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" |
      | "N - 4480_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    |
      | "N - 4480_CLI_OFR_CRNT_F = N"                          |
      | "N - 4480_CLI_OFR_CRNT_F = Null"                       |
      | "N - 4480_CC_STEP_LINK_F  = Y"                         |
      | "N - 4480_CC_STEP_LINK_F  = Null"                      |
      | "N - 4480_CC_ACCT_VIP_IND  = 2"                        |
      | "N - 4480_CC_ACCT_VIP_IND  = 9"                        |
      | "N - 4480_CLI_OFR_ST_DT  null"                         |
      | "N - 4480_CLI_OFR_EXP_DT is null"                      |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = N"                |
      | "N - 4480_PRIMARY_ACCT_HOLDER_FLAG = Null"             |
