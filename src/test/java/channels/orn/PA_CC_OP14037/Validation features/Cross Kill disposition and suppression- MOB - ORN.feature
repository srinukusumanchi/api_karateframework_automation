@PACC_CrossKillDispositions_Validation
Feature: Validate PA CC Cross kill Disposition and Suppression test cases(disposition in ORN and behaviour in other channels)

  Background: Common for ORN Cross kill Disposition and Suppression

  # Calling API with URL
    Given url baseUrl
  # Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    And def dispositionfile = read('classpath:channels/orn/SetDisposition.json')
    * def crossChannelRequestfileMOB = read('classpath:channels/orn/ChannelNOVA.txt')

  @PACC @PACC_CrossKillDispositionSuppression_MOB_ORN  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> suppression logic for cross kill dispositions for MOB and ORN
    * def testDataFileName = PACCORNTestData
    # Reading data from Excel sheet
    Given def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')
    # Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    # Generate a NOVA REST call
    When call read('classpath:channels/orn/ReusableScenarios.feature@NOVA_CrossChannel_REST_CALL')
    # Printing response body in console
    * print '***************Response*************'+karate.pretty(crossChannelResponseString)
    # It clears Result fields
    * clearResultFields()
    * def responseTrackingCode_JSON = karate.jsonPath(crossChannelResponseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * call read('classpath:channels/orn/ReusableScenarios.feature@NOVA_Disposition_REST_CALL')
    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));
    # Generate a ORN REST call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Success with status code 200
    Then status 200
    * def afterDispositionResponseString = response
    # Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)
    * match afterDispositionResponseString == {}
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                                                       |
      | "5570_Perform Accept completed Disposition in MOB and offer should NOT display in ORN when Lead scope - ACT" |

  @PACC @PACC_CrossKillDispositionDisplay_MOB_ORN  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> display logic for cross kill dispositions for MOB and ORN
    * def testDataFileName = PACCORNTestData
    # Reading data from Excel sheet
    Given def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')
    # Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    # Generate a NOVA REST call
    When call read('classpath:channels/orn/ReusableScenarios.feature@NOVA_CrossChannel_REST_CALL')
    # Printing response body in console
    * print '***************Response*************'+karate.pretty(crossChannelResponseString)
    # It clears Result fields
    * clearResultFields()
    * def responseTrackingCode_JSON = karate.jsonPath(crossChannelResponseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * call read('classpath:channels/orn/ReusableScenarios.feature@NOVA_Disposition_REST_CALL')
    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));
    # Generate a ORN REST call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Success with status code 200
    Then status 200
    * def afterDispositionResponseString = response
    # Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)

    * match cid == karate.jsonPath(afterDispositionResponseString,"$.cid")
    * def responseString = afterDispositionResponseString

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                     |
      | "5570_Perform Viewed Disposition in MOB and offer should display in ORN when Lead scope - ACT"             |
      | "5570_Perform Accept in Progress Disposition in MOB and offer should display in ORN when Lead scope - ACT" |
