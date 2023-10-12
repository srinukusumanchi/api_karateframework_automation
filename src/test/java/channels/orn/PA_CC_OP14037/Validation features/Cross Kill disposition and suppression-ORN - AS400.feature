@PACC_CrossKillDispositions_Validation
Feature: Validate PA CC Cross kill Disposition and Suppression test cases(disposition in ORN and behaviour in other channels)

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

  @PACC @PACC_CrossKillDispositionSuppression_ORN_AS400 @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> suppression logic for cross kill dispositions for ORN and AS400
    * def testDataFileName = PACCORNTestData
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

    #    Printing Disposition request body in console
    * print '*********Disposition Request**********'+dispositionfile
    Then eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(karate.get('$data.ResponseCode')+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(karate.get('$data.ResponseCode')+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));

    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_REST_CALL')

    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * print 'NBA Code is '+nbaCode_XML
    * match nbaCode_XML == null

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                            |
      | "5570_Perform Viewed Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC"             |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC" |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - ALL"   |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - ACT"   |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC"   |

  @PACC @PACC_CrossKillDispositionDisplay_ORN_AS400  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> display logic for cross kill dispositions for ORN and AS400
    * def testDataFileName = PACCORNTestData
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
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_REST_CALL')

#    Checking offer displayed in SOAP
    * match cid ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                        |
      | "5570_Perform Viewed Disposition  in ORN and offer should display in AS400 when Lead scope - ALL"             |
      | "5570_Perform Viewed Disposition  in ORN and offer should display in AS400 when Lead scope - ACT"             |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should display in AS400 when Lead scope - ALL" |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should display in AS400 when Lead scope - ACT" |


