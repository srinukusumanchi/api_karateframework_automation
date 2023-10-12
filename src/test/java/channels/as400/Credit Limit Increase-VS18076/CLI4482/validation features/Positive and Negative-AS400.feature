@CIMCAMP-418 @PositiveNegative_Validation_4482
Feature: Validate Pre-Approved Credit Limit Increase - Amex CLI - Co-Borrower-4482 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @CreditLimitIncrease @CreditLimitIncreaseAmexCoBorrower_IH_Validation @4482 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Co-Borrower_VS18076_4482_AS400 Validate <TestID> IH field values against proposition data
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
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
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4482_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAmexCLICoBorrower_Positive_TestCases_Validation @4482 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Co-Borrower_VS18076_4482_AS400 Validate <TestID> Positive TestCases Response Fields
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
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                       |
      | "4482_INDV_BRTH_DT_Equal to 18 yrs"                                          |
      | "4482_INDV_BRTH_DT_Equal to 70 yrs"                                          |
      | "4482_Lang Code = E"                                                         |
      | "4482_Lang Code = EN"                                                        |
      | "4482_Lang Code = F"                                                         |
      | "4482_Lang Code = FR"                                                        |
      | "4482_Lang Code small case = en"                                             |
      | "4482_Lang Code small case = fr"                                             |
      | "4482_Lang Code small case = f"                                              |
      | "4482_Lang Code small case = e"                                              |
      | "4482_SRC_ACCT_STAT_CD = 5"                                                  |
      | "4482_DNS_F = Y"                                                             |
      | "4482_DNS_F = NULL"                                                          |
      | "4482_DNS_F = N"                                                             |
      | "4482_PRD CD- AXG, SUB PRD CD -GC & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4482_PRD CD- AXG, SUB PRD CD -GS & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4482_PRD CD- AXS, SUB PRD CD -SC & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4482_PRD CD- AXS, SUB PRD CD -SS & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4482_PRD CD-AXP, SUB PRD CD -PC & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  |
      | "4482_CLI Offer Start Date equal to current date"                            |
      | "4482_CLI Offer Expiry Date equal to current date"                           |
      | "4482_SRC_ACCT_STAT_CD = A"                                                  |
      | "4482_SRC_ACCT_STAT_CD = Open"                                               |
      | "4482_SRC_ACCT_STAT_CD = Active"                                             |
      | "4482_SRC_ACCT_STAT_CD = NULL"                                               |
      | "4482_Indv_Brth_Dt greater than 70"                                          |

  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAmexCLICo-Borrower_Negative_TestCases_Validation @4482 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - Amex CLI - Co-Borrower_VS18076_4482_AS400 Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
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
      | TestID                                                 |
      | "N - 4482_PRIM_CNTRY_CD! = CA"                         |
      | "N - 4482_PRIM_CNTRY_CD = Null"                        |
      | "N - 4482_CUST_TP_CD != PSNL"                          |
      | "N - 4482_CUST_TP_CD =  Null"                          |
      | "N - 4482_Indv_Brth_Dtless than 18"                    |
      | "N - 4482_Indv_Brth_Dt Equal to Null"                  |
      | "N - 4482_Secondary Name is Null"                      |
      | "N - 4482_Deceased_F = Y"                              |
      | "N - 4482_Deceased_F = Null"                           |
      | "N - 4482_LANG_CD = K"                                 |
      | "N - 4482_LANG_CD = NE"                                |
      | "N - 4482_LANG_CD = Null"                              |
      | "N - 4482_MKT_F = N"                                   |
      | "N - 4482_MKT_F = NULL"                                |
      | "N - 4482_PRD CD- AXG, SUB PRD CD -SP"                 |
      | "N - 4482_PRD CD- AXS, SUB PRD CD -SV"                 |
      | "N - 4482_PRD CD- AXP, SUB PRD CD -SS"                 |
      | "N - 4482_CLI_OFR_ST_DT  greater than current date"    |
      | "N - 4482_CLI_OFR_EXP_DT lesser than current date"     |
      | "N - 4482_CLI_OFR_F =A"                                |
      | "N - 4482_CLI_OFR_F = Null"                            |
      | "N - 4482_ACCT_SUBSYS_ID = BB"                         |
      | "N - 4482_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" |
      | "N - 4482_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    |
      | "N - 4482_CLI_OFR_CRNT_F = N"                          |
      | "N - 4482_CLI_OFR_CRNT_F = Null"                       |
      | "N - 4482_CC_STEP_LINK_F  = Y"                         |
      | "N - 4482_CC_STEP_LINK_F  = Null"                      |
      | "N - 4482_CC_ACCT_VIP_IND  = 2"                        |
      | "N - 4482_CC_ACCT_VIP_IND  = 9"                        |
      | "N - 4482_CLI_OFR_ST_DT  null"                         |
      | "N - 4482_CLI_OFR_EXP_DT is null"                      |
      | "N - 4482_PRIMARY_ACCT_HOLDER_FLAG = N"                |
      | "N - 4482_PRIMARY_ACCT_HOLDER_FLAG = Null"             |
