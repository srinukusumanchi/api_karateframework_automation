@CIMCAMP-418  @CrossKillDispositions_Validation_4479_ORN
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Cross kill Disposition and Suppression test cases

  Background: Common for ORN Cross kill Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    And def dispositionfile = read('classpath:channels/orn/SetDisposition.json')
    * def crossChannelRequestfile = read('classpath:channels/orn/Channel AS400.txt')

#Accepted Complete, Decline
  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_CrossKillDispositionSuppression_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> suppression logic for cross kill dispositions
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    Given def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#     Generate a ORN REST call
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


#    #    Clear IH when it goes to control group
#    When call clearIH(cid,requestfile,offerCode)

#    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    When request requestfile

   #    Performing action on JSON request (Post Action)
    * method post

  #    Verifying Success with status code 200
    Then status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]

    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));
    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_SOAP_CALL')

    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * print 'NBA Code is '+nbaCode_XML
    * match nbaCode_XML == null

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                          |
      | "4479_Perform Viewed Disposition  in MOB and offer should not display in AS400 when Lead scope - DEC"           |
      | "4479_Perform Accept Completed Disposition  in MOB and offer should not display in AS400 when Lead scope - ALL" |
      | "4479_Perform Accept Completed Disposition  in MOB and offer should not display in AS400 when Lead scope - ACT" |
      | "4479_Perform Accept Completed Disposition  in MOB and offer should not display in AS400 when Lead scope - DEC" |

    # Customer Defer, Customer self service, Refer to other team, Refer to sales,Book Appointment
  @CreditLimitIncrease @CreditLimitIncreaseVISASolo_CrossKillDispositionDisplay_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> display logic for cross kill dispositions
    * def testDataFileName = CLItestDataFileName
      # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print 'Offer code is '+offerCode

    * def crossChannel = karate.get('$data.ChannelCode_AS400')
#     Generate a ORN REST call
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

#    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    When request requestfile

   #    Performing action on JSON request (Post Action)
    * method post

  #    Verifying Success with status code 200
    Then status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

    #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]

    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));

    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_SOAP_CALL')

#    Checking offer displayed in SOAP
    * match cid ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
#        # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#    And call read('classpath:channels/orn/ReusableScenarios.feature@CLICrossChannelDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                            |
      | "4479_Perform Viewed Disposition  in MOB and offer should display in AS400 when Lead scope - ALL" |
      | "4479_Perform Viewed Disposition  in MOB and offer should display in AS400 when Lead scope - ACT" |
