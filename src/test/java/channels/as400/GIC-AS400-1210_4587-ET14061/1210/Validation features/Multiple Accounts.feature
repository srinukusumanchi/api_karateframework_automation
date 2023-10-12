@CIMCAMP-6290 @PositiveNegative_Validation_1210
Feature: Validate GIC - Renewal 1210 Positive and Negative test cases for RFR

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @GICRENEWAL @GICrenewal_MultipleAccounts_Validation_1210 @1210 @AS400 @4T14061
  Scenario Outline: GIC Renewal_1210_ET14061 Validate <TestID> Positive TestCases Response Fields for RFR
    * def testDataFileName = GICtestDataFileName

    * def testId = <TestID>
#    * def testIdAcctDim = <TestID>+'_CRFC1'
     #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcctDim = ReadValueFromTestData("TestID",<TestID>+'_CRFC1',testDataLocation,testDataFileName,"ACCT_DIM")

    * def crfcNumber = karate.get('dataAcctDim.ACCT_CRFC_NUM')
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


#    Clear IH when it goes to control group
 #   * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

#    * call read('classpath:channels/as400/ReusableScenarios.feature@GICContextualOfferValidation_AS400')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                          |
      | "1210_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K" |
#      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON earliest mat_dt" |
#      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON higest maturtiy amount"   |
#      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON lowest certficate number" |