Feature: Validate New To Canada - 5043 Disposition and Suppression test cases

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
  @NewToCanada @NewToCanada_ATC_DEL_Disposition  @5043 @SOL @RS20034
  Scenario Outline: NewTocanada_RS20034_5043_SOL Validate <TestID> accept,delete disposition & suppression logic
    * def testDataFileName = NTCtestDataFileName
  #    Reading data from Excel sheet
    Given def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string dispositionCode = karate.get('$data.ResponseCode')
    * print 'Disposition going to perform is '+dispositionCode
    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#     Generate a SOL SOAP call
    When call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')



#    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
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

    Then call read('classpath:channels/sol/ReusableScenarios.feature@NTCDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                         |
      | "5043_Perform Accept Disposition and offer should not display" |
      | "5043_Perform Delete Disposition and offer should not display" |



    # Viewed(VWD), Reminder Me Later(RML), No Thank You (NTY), Accepted in Progress (ATP)
  @NewToCanada @NewToCanada_VWD_RML_NTY_ATP_Disposition @5043  @SOL @RS20034
  Scenario Outline: New To Canada_RS20034_5043_SOL Validate <TestID> view or remind me later or no thank you or accept in progress disposition & suppression logic
    * def testDataFileName = NTCtestDataFileName
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

#     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

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

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response

    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(responseString)

    * match cid == karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

      # Fetch recorded activity for CID from IH
    And call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/sol/ReusableScenarios.feature@NTCOfferValidationWithIH')

    * call read('classpath:channels/sol/ReusableScenarios.feature@NTCDispositionOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                   |
      | "5043_Perform Viewed Disposition and offer should display"               |
      | "5043_Perform Remind me later Disposition and offer should display"      |
      | "5043_Perform Accepted In Progress Disposition and offer should display" |
      | "5043_Perform No Thank You Disposition and offer should display"         |