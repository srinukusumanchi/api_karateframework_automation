@CIMCAMP-418 @HighestApprovedCreditandLowestAccount_Validation_4479_ORN
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 for Highest credit limit and lowest account number test cases

  Background: Common for ORN Highest credit limit and lowest account number

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

   # Highest Credit limit - VISA Solo and Amex Solo - Scenario -1
   # Highest Credit limit - VISA Solo and VISA Solo - Scenario -2
  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLISoleBorrower_HighestCredit_Validation_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> Highest approved credit limit testCases response fields
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

  #     Generate a ORN REST call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


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
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                               |
      | "4479_Highest approved credit limit shows offer for Visa solo borrower_Scenario-1"   |
      | "4479_Highest approved credit limit shows offer for Visa-1 solo borrower_Scenario-2" |

       # Lowest Account Number - VISA Solo and Amex Solo - Scenario -1
       # Lowest Account Number - VISA Solo and VISA Solo - Scenario -2
  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLISoleBorrower_LowestAccountNumber_Validation_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> Lowest account number testCases response fields
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

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.pretty(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
#    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                          |
      | "4479_Lowest account number shows offer when amount is tie for Visa solo borrower_Scenario-1"   |
      | "4479_Lowest account number shows offer when amount is tie for Visa-1 solo borrower_Scenario-2" |