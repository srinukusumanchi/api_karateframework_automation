@CIMCAMP-6290  @CrossKillDispositions_Validation_4587
Feature: Validate GIC renewal-4587 Cross kill Disposition and Suppression test cases

  Background: Common for AS400 Cross kill Disposition and Suppression

     # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/as400/Channel AS400.txt')
    And def dispositionfile = read('classpath:channels/as400/SetDisposition')
    * def crossChannelRequestfileMOB = read('classpath:channels/as400/ChannelNOVA.txt')
    * def crossChannelRequestfileSOL = read('classpath:channels/as400/ChannelSOL.txt')

#Accepted Complete, Decline
  @GICRenewal @GICRenewal_CrossKillDispositionSuppression_4587 @4587 @AS400 @ET14061
  Scenario Outline: GIC Renewal_ET14061_4587_AS400 Validate <TestID> suppression logic for cross kill dispositions
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

#     Generate a AS400 SOAP call
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    When call clearIH(cid,requestfile,offerCode)

#    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    When request requestfile

  #    Performing action on xml request (Post Action)
    And soap action soapAction

  #    Verifying Success with status code 200
    Then status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")


    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_Disposition_SOAP_CALL')

    #    Printing Disposition request body in console
    * print '*********Disposition Request**********'+dispositionfile

#    request (Karate keyword) for sending request string
    When request dispositionfile
  #    Performing action on xml request (Post Action)
    And soap action soapAction_Disposition
  #    Verifying Success with status code 200
    * status 200
    * def responseDispositionString = response
  #    Printing Disposition response body in console
    * print '***************Disposition Response*************'+karate.pretty(responseDispositionString)

    Then eval if(cid==karate.get('//ID/text()')?printPassedResult(karate.get('$data.ResponseCode')+' disposition CID',karate.get('//ID/text()')):printFailedResult(karate.get('$data.ResponseCode')+' disposition',cid,karate.get('//ID/text()')));

    #     Generate a MOB JSON call after disposition
    When call read('classpath:channels/as400/ReusableScenarios.feature@NOVA_CrossChannel_REST_CALL')

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(crossChannelResponseString)
#    Checking offer suppressed in NOVA after Accept disposition is done in AS400
    * match crossChannelResponseString == {}

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                                       |
      | "4587_Perform Decline (DEC) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should not display" |

    # Customer Defer, Customer self service, Refer to other team, Refer to sales,Book Appointment
  @GICRenewal @GICRenewal_CrossKillDispositionDisplay_4587 @4587 @AS400 @ET14061
  Scenario Outline: GICRenewal_ET14061_4587_AS400 Validate <TestID> display logic for cross kill dispositions

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

    * def crossChannel = karate.get('$data.ChannelCode_MOB')
#     Generate a AS400 SOAP call
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode//text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode//text()")

    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_Disposition_SOAP_CALL')
    #    Printing Disposition request body in console
    * print '*********Disposition Request**********'+dispositionfile

#    request (Karate keyword) for sending request string
    * request dispositionfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction_Disposition
  #    Verifying Success with status code 200
    * status 200
    * def responseDispositionString = response
  #    Printing Disposition response body in console
    * print '***************Disposition Response*************'+karate.pretty(responseDispositionString)

    * eval if(cid==karate.get('//ID/text()')?printPassedResult(dispositionCode+' disposition CID',karate.get('//ID/text()')):printFailedResult(dispositionCode+' disposition',cid,karate.get('//ID/text()')));

     #     Generate a MOB JSON call after disposition
    When call read('classpath:channels/as400/ReusableScenarios.feature@NOVA_CrossChannel_REST_CALL')

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(crossChannelResponseString)
#    Checking offer suppressed in NOVA after Accept disposition is done in AS400
    * match cid == karate.jsonPath(crossChannelResponseString,"$.cid")

        # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')
    * call read('classpath:channels/as400/ReusableScenarios.feature@GICRenewalCrossChannelDispositionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0



    Examples:
      | TestID                                                                                                                                |
      | "4587_Perform Accept(ATC) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"                |
      | "4587_Perform Book Appointment(CSE) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"      |
      | "4587_Perform Refer to Sales(RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"        |
      | "4587_Perform Refer to Other Team (RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"  |
      | "4587_Perform Customer Self-Serve (CSE) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should  display" |
      | "4587_Perform Customer Defer (RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"       |
