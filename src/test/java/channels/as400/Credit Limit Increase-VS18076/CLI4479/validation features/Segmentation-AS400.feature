@Segmentation_Validation_4479
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Segmentation test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_Segmentation_Validation @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_AS400 Validate <TestID> for Segmentation test case
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIContextualOfferValidation')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                     |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-1"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login is NULL,KS_Scenario-2"   |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login < 30days,KS_Scenario-3"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login < 30days,KS_Scenario-4"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login < 30days,KS_Scenario-5"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login > 30days,KS_Scenario-6"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login is NULL,KS_Scenario-7"   |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login > 30days,KS_Scenario-8"  |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login is NULL,KS_Scenario-9"   |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-10" |
      | "4479_DNS=Y,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-11"                                         |
      | "4479_DNS=Y,PRIM_PROV_CD=Non-Quebec,No ScotiaCard"                                                         |
      | "4479_DNS=Y,PRIM_PROV_CD=Quebec,No ScotiaCard"                                                             |
      | "4479_DNS=Y,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-12"                                             |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-13"                                         |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,No ScotiaCard"                                                         |
      | "4479_DNS=N,PRIM_PROV_CD=Quebec,No ScotiaCard"                                                             |
      | "4479_DNS=N,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-14"                                             |



