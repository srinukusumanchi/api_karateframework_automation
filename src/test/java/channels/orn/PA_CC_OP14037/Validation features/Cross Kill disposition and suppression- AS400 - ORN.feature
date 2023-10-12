@PACC_CrossKillDispositions_Validation
Feature: Validate PA CC Cross kill Disposition and Suppression test cases(disposition in AS400 and behaviour in ORN)

  Background: Common for ORN Cross kill Disposition and Suppression

    # Calling API with URL
    Given url baseUrl
    #  Passing Headers for the API
    And configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    And call read('classpath:CommonFunctions.feature')
    And def crossChannelRequestfile = read('classpath:channels/as400/Channel AS400.txt')
    And def dispositionfile = read('classpath:channels/as400/SetDisposition')
    * def requestfile = read('classpath:channels/as400/ChannelORN.txt')


  @PACC @PACC_AS400_ORN_CrossKillDispositionSuppression  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> suppression logic for cross kill dispositions for AS400 and ORN
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
#     Generate a AS400 SOAP call
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_REST_CALL')

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode//text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode//text()")

    * call read('classpath:channels/orn/ReusableScenarios.feature@AS400_Disposition_SOAP_CALL')

    * eval if(cid==karate.get('//ID/text()')?printPassedResult(dispositionCode+' disposition CID',karate.get('//ID/text()')):printFailedResult(dispositionCode+' disposition',cid,karate.get('//ID/text()')));

     #     Generate a MOB JSON call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    When request requestfile
    * print '***************After Disposition Request*************'+karate.pretty(requestfile)
  #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseAfterDispositionString = response
    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(responseAfterDispositionString)
#    Checking offer suppressed in ORN after disposition is done in AS400
    * match responseAfterDispositionString == {}

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                                                |
      | "5570_Perform Decline Disposition in AS400 and offer should NOT display in ORN when Lead scope - ACT" |
      | "5570_Perform Accept Disposition in AS400 and offer should NOT display in ORN when Lead scope - ACT"  |


  @PACC @PACC_AS400_ORN_CrossKillDispositionDisplay  @ORN @OP14037
  Scenario Outline: PA CC_OP14037_5570_ORN Validate <TestID> display logic for cross kill dispositions for AS400 and ORN
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
#     Generate a AS400 SOAP call
    When call read('classpath:channels/orn/ReusableScenarios.feature@AS400_CrossChannel_REST_CALL')

   #    It clears Result fields
    * clearResultFields()

    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode//text()")
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode//text()")

    * call read('classpath:channels/orn/ReusableScenarios.feature@AS400_Disposition_SOAP_CALL')

    * eval if(cid==karate.get('//ID/text()')?printPassedResult(dispositionCode+' disposition CID',karate.get('//ID/text()')):printFailedResult(dispositionCode+' disposition',cid,karate.get('//ID/text()')));

     #     Generate a MOB JSON call after disposition
    When call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    When request requestfile
    * print '***************After Disposition Request*************'+karate.pretty(requestfile)
  #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseAfterDispositionString = response
    #    Printing GET NBA response body after disposition in console
    * print '***************Response after disposition*************'+karate.pretty(responseAfterDispositionString)
#    Checking offer displayed in ORN after disposition is done in AS400
    * match cid == karate.jsonPath(responseAfterDispositionString,"$.cid")


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                        |
#      | "5570_Perform Customer Defer Disposition in AS400 and offer should display in ORN when Lead scope - ACT"      |
      | "5570_Perform Customer Self-Serve Disposition in AS400 and offer should display in ORN when Lead scope - ACT" |
      | "5570_Perform Refer to Other Team Disposition in AS400 and offer should display in ORN when Lead scope - ACT" |
      | "5570_Perform Refer to Sales Disposition in AS400 and offer should display in ORN when Lead scope - ACT"      |
      | "5570_Perform Book Appointment Disposition in AS400 and offer should display in ORN when Lead scope - ACT"    |

