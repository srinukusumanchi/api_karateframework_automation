Feature: Validate GIC Renewal-1210 Cross kill Disposition and Suppression test cases

  Background: Common for NOVA Cross kill Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    And def dispositionfile = read('classpath:channels/nova/SetDisposition.json')
    * def crossChannelRequestfile = read('classpath:channels/nova/Channel AS400.txt')

#Accepted Complete, Decline
  @GICRenewal @GICRenewal_CrossKillDispositionSuppression_1210 @1210 @NOVA @ET14061
  Scenario Outline: GIC Renewal_ET14061_1210_NOVA Validate <TestID> suppression logic for cross kill dispositions
    * def testDataFileName = GICtestDataFileName
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

#     Generate a NOVA REST call
    When call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


    #    Clear IH when it goes to control group
    When call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));
    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/nova/ReusableScenarios.feature@AS400_CrossChannel_SOAP_CALL')

    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * print 'NBA Code is '+nbaCode_XML
    * match nbaCode_XML == null

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                         |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=ALL then offer should not display"        |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=DEC then offer should not display"        |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=TP3 or ACT then offer should not display" |
      | "1210_Perform Viewed(VWD)  disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=DEC then offer should not display"                 |




    # Customer Defer, Customer self service, Refer to other team, Refer to sales,Book Appointment
  @GICRenewal @GICRenewal_CrossKillDispositionDisplay_1210 @1210 @NOVA @ET14061
  Scenario Outline: GIC Renewal_ET14061_1210_NOVA Validate <TestID> display logic for cross kill dispositions
    * def testDataFileName = GICtestDataFileName
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
#     Generate a NOVA REST call
    When call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_Disposition_REST_CALL')

    * eval if(cid==karate.jsonPath(responseDispositionString,"$.id_value")?printPassedResult(dispositionCode+' disposition CID',karate.jsonPath(responseDispositionString,"$.id_value")):printFailedResult(dispositionCode+' disposition',cid,karate.jsonPath(responseDispositionString,"$.id_value")));

    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/nova/ReusableScenarios.feature@AS400_CrossChannel_SOAP_CALL')

#    Checking offer displayed in SOAP
    * match cid ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
        # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

    And call read('classpath:channels/nova/ReusableScenarios.feature@GICCrossChannelDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                           |
      | "1210_Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=TP3 or ACT then offer should display" |
      | "1210_Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=ALL then offer should display"        |
