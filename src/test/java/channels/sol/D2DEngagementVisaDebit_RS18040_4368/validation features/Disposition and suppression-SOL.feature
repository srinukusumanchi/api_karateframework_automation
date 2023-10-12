@CIMCAMP-406  @CIEPROG-122
Feature: Validate D2DEngagement-VisaDebit-4368 Disposition and Suppression test cases

  Background: Common for SOL Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/sol/ChannelSOL.txt')
    And def dispositionfile = read('classpath:channels/sol/SetDisposition')

  #Accepted Complete (ATC), Deleted (DEL)
  @D2DEngagementVisaDebit @D2DEngagementVisaDebit_ATC_DEL_Disposition  @4368 @SOL @18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Validate <TestID> accept,delete disposition & suppression logic

  # Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
    Given def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Generate a SOL SOAP call
    When call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


  # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  # request (Karate keyword) for sending request string
    When request requestfile

  #    Performing action on xml request (Post Action)
    And soap action soapAction

  #    Verfiying Success with status code 200
    Then status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")


    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_Disposition_SOAP_CALL')

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

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request requestfile

    # Performing action on xml request (Post Action)
    And soap action soapAction

  #    Verfiying Success with status code 200
    Then status 200
    * def responseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(responseString)

    Then match null == karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    # Fetch recorded activity for CID from IH
    And call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

    Then call read('classpath:channels/sol/ReusableScenarios.feature@D2DDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                         |
      | "4368_Perform Accept Disposition and offer should not display" |
      | "4368_Perform Delete Disposition and offer should not display" |



  # Viewed(VWD), Reminder Me Later(RML), No Thank You (NTY), Accepted in Progress (ATP)
  @D2DEngagementVisaDebit @D2DEngagementVisaDebit_VWD_RML_NTY_ATP_Disposition @4368  @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Validate <TestID> view or remind me later or no thank you or accept in progress disposition & suppression logic
    # Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid
    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

#    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile

  #    Performing action on xml request (Post Action)
    * soap action soapAction

  #    Verfiying Success with status code 200
    * status 200
    * def responseString = response

    #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")

    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_Disposition_SOAP_CALL')
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

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    * request requestfile

    # Performing action on xml request (Post Action)
    * soap action soapAction

  #    Verfiying Success with status code 200
    * status 200
    * def responseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(responseString)

    * match cid == karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')

      # Fetch recorded activity for CID from IH
    And call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                   |
      | "4368_Perform Viewed Disposition and offer should display"               |
      | "4368_Perform Remind me later Disposition and offer should display"      |
      | "4368_Perform Accepted In Progress Disposition and offer should display" |
      | "4368_Perform No Thank You Disposition and offer should display"         |