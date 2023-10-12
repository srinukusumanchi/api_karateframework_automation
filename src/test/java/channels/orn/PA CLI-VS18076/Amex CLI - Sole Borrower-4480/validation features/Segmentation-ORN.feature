@CIMCAMP-418 @Segmentation_4480
Feature: Validate Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower-4480 Segmentation test cases

  Background: Common for ORN Segmentation

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAMEXCLISoleBorrower_Segmentation_TestCases_Validation @4480 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - AMEX CLI - Sole Borrower_VS18076_4480_ORN Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

     # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                     |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-1"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login is NULL,KS_Scenario-2"   |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login < 30days,KS_Scenario-3"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login < 30days,KS_Scenario-4"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login < 30days,KS_Scenario-5"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login > 30days,KS_Scenario-6"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login is NULL,KS_Scenario-7"   |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login > 30days,KS_Scenario-8"  |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login is NULL,KS_Scenario-9"   |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-10" |
      | "4480_DNS=Y,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-11"                                         |
      | "4480_DNS=Y,PRIM_PROV_CD=Non-Quebec,No ScotiaCard"                                                         |
      | "4480_DNS=Y,PRIM_PROV_CD=Quebec,No ScotiaCard"                                                             |
      | "4480_DNS=Y,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-12"                                             |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-13"                                         |
      | "4480_DNS=N,PRIM_PROV_CD=Non-Quebec,No ScotiaCard"                                                         |
      | "4480_DNS=N,PRIM_PROV_CD=Quebec,No ScotiaCard"                                                             |
      | "4480_DNS=N,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-14"                                             |