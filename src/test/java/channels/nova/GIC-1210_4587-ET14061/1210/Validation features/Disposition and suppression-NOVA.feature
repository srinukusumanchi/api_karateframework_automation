@CIMCAMP-6290  @Dispositions_Validation_1210
Feature: Validate GIC Renewal-1210 Disposition and Suppression test cases

  Background: Common for NOVA Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    And def dispositionfile = read('classpath:channels/nova/SetDisposition.json')


    #Accepted Complete
    # Viewed
  @GICRenewal @GICRenewal_DispositionDisplay_NOVA_1210 @1210 @NOVA @ET14061
  Scenario Outline: GIC Renewal_ET14061_1210_NOVA Validate <TestID> display logic for dispositions


        # Reading data from Excel sheet

    * def testDataFileName = GICtestDataFileName

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

#     Generate a NOVA REST call
    When call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
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

#    * call read('classpath:channels/nova/ReusableScenarios.feature@GICContextualOfferValidation_NOVA')


    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]

    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));

    #     Generate a NOVA REST call after disposition
    When call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL_AfterDisposition')

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

      # Fetch recorded activity for CID from IH
    And call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/nova/ReusableScenarios.feature@GICDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                |
      | "1210_Perform Accept Completed Disposition and offer should display when Lead scope - ACT" |
      | "1210_Perform Viewed Disposition and offer should display when Lead scope - ACT"           |
