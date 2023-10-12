@Dispositions_Validation_1430
Feature: Validate Mortgage Renewals AS400-1430 Disposition and Suppression test cases

  Background: Common for AS400 Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def requestfile = read('classpath:channels/as400/Channel AS400.txt')
    And def dispositionfile = read('classpath:channels/as400/SetDisposition')


#Accepted Complete (ALL,DEL,ACT), Decline (ACT), Refer to other team(DEC), Refer to sales (DEC)
#  Book appointment(ALL,DEL,ACT), Customer self service(ALL,DEL,ACT) customer defer(DEC)
  @MortgageRenewal @MortgageRenewal_DispositionSuppression @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals_ET04024_1430_AS400 Validate <TestID> suppression logic for dispositions
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

#     Generate a AS400 SOAP call
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
    When call clearIH(cid,requestfile,offerCode)

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

    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL_AfterDisposition')

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request afterDispositionRequestfile

    # Performing action on xml request (Post Action)
    And soap action soapAction

  #    Verifying Success with status code 200
    Then status 200
    * def afterDispositionResponseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)

    Then match null == karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    # Fetch recorded activity for CID from IH
    And call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

    Then call read('classpath:channels/as400/ReusableScenarios.feature@MortgageDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                              |
      | "1430_Perform Accept Disposition and offer should not display when Lead scope - ALL"                |
      | "1430_Perform Accept Disposition and offer should not display when Lead scope - ACT"                |
      | "1430_Perform Accept Disposition and offer should not display when Lead scope - DEC"                |
      | "1430_Perform Decline Disposition and offer should not display when Lead scope - ACT"               |
      | "1430_Perform Refer to other team Disposition and offer should not display when Lead scope - DEC"   |
      | "1430_Perform Refer to Sales Disposition and offer should not display when Lead scope - DEC"        |
      | "1430_Perform Book appointment Disposition and offer should not display when Lead scope - ALL"      |
      | "1430_Perform Book appointment Disposition and offer should not display when Lead scope - ACT"      |
      | "1430_Perform Book appointment Disposition and offer should not display when Lead scope - DEC"      |
      | "1430_Perform Customer Self Service Disposition and offer should not display when Lead scope - ALL" |
      | "1430_Perform Customer Self Service Disposition and offer should not display when Lead scope - ACT" |
      | "1430_Perform Customer Self Service Disposition and offer should not display when Lead scope - DEC" |
      | "1430_Perform Customer Defer Disposition and offer should not display when Lead scope - DEC"        |


    # Decline (ALL,DEC), Refer to other team(ALL,ACT), Refer to sales (ALL,ACT), Customer Defer(ALL,ACT)
  @MortgageRenewal @MortgageRenewal_DispositionDisplay @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals_VS18076_1430_AS400 Validate <TestID> display logic for dispositions
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

#     Generate a AS400 SOAP call
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")

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

    #     Generate a AS400 SOAP call after disposition
    When call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL_AfterDisposition')

    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request afterDispositionRequestfile

    # Performing action on xml request (Post Action)
    * soap action soapAction

  #    Verifying Success with status code 200
    * status 200
    * def afterDispositionResponseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(afterDispositionResponseString)

    * match cid == karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageContextualOfferValidation')

      # Fetch recorded activity for CID from IH
    And call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                         |
      | "1430_Perform Decline Disposition and offer should display when Lead scope - ALL"              |
      | "1430_Perform Decline Disposition and offer should display when Lead scope - DEC"              |
      | "1430_Perform Refer to other team Disposition and offer should display  when Lead scope - ALL" |
      | "1430_Perform Refer to other team Disposition and offer should display when Lead scope - ACT"  |
      | "1430_Perform Refer to Sales Disposition and offer should display when Lead scope - ALL"       |
      | "1430_Perform Refer to Sales Disposition and offer should display when Lead scope - ACT"       |
      | "1430_Perform Customer Defer Disposition and offer should display when Lead scope - ALL"       |
      | "1430_Perform Customer Defer Disposition and offer should display when Lead scope - ACT"       |