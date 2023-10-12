Feature: Validate PA CC Disposition and Suppression test cases

  Background: Common for ORN Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    And def dispositionfile = read('classpath:channels/orn/SetDisposition.json')


#Accepted Complete
  @PACC @PACC_DispositionSuppression_ORN @5570  @orn @OP14037
  Scenario Outline: PA CC_OP14037_5570_5571_5572_5573_5574_5575_4354_ORN Validate <TestID> suppression logic for dispositions
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

    #     Generate a MOB REST call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL_AfterDisposition')

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request afterDispositionRequestfile

     #    Performing action on JSON request (Post Action)
    * method post

  #    Verifying Success with status code 200
    Then status 200
    * def afterDispositionResponseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)

    * match afterDispositionResponseString == {}

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                     |
      | "5570_ORN_ACT_Disposition" |
      | "5571_ORN_ACT_Disposition" |
      | "5572_ORN_ACT_Disposition" |
      | "5573_ORN_ACT_Disposition" |
      | "5574_ORN_ACT_Disposition" |
      | "5575_ORN_ACT_Disposition" |
      | "4354_ORN_ACT_Disposition" |



    # Viewed
  @PACC @PACC_DispositionDisplay_ORN  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_5571_5572_5573_5574_5575_4354__ORN Validate <TestID> display logic for dispositions
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

#     Generate a ORN REST call
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

#    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile

  #    Performing action on JSON request (Post Action)
    * method post

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]

    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));

    #     Generate a ORN REST call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL_AfterDisposition')

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request afterDispositionRequestfile

  #    Performing action on JSON request (Post Action)
    * method post

  #    Verifying Success with status code 200
    * status 200
    * def afterDispositionResponseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)

    * match cid == karate.jsonPath(afterDispositionResponseString,"$.cid")
    * def responseString = afterDispositionResponseString
#    * call read('classpath:channels/orn/ReusableScenarios.feature@PACCOfferValidation_ORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                     |
      | "5570_ORN_VWD_Disposition" |
      | "5570_ORN_ATP_Disposition" |
      | "5571_ORN_VWD_Disposition" |
      | "5571_ORN_ATP_Disposition" |
      | "5572_ORN_VWD_Disposition" |
      | "5572_ORN_ATP_Disposition" |
      | "5573_ORN_VWD_Disposition" |
      | "5573_ORN_ATP_Disposition" |
      | "5574_ORN_VWD_Disposition" |
      | "5574_ORN_ATP_Disposition" |
      | "5575_ORN_VWD_Disposition" |
      | "5575_ORN_ATP_Disposition" |
      | "4354_ORN_VWD_Disposition" |
      | "4354_ORN_ATP_Disposition" |
