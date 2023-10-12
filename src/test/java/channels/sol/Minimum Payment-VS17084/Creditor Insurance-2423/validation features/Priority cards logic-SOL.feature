@PriorityCards_Validation_2423
Feature: Validate Creditor Insurance-2423 Priority cards test cases


  Background: Common for SOL Positive and Negative

  # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @CreditorInsurance @CreditorInsurance_PriorityCards @2423 @SOL @VS17084
  Scenario Outline: Creditor Insurance_VS17084_2423_SOL Validate <TestID> Response Fields for Priority cards logic
  #    Reading data from Excel sheet
    * def testDataFileName = CrediitorInsurancetestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def dataAcctDim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM")
    * def acct_num = karate.get('$dataAcctDim.ACCT_NUM')
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 3(VCL,NF) has higher credit limit than Priority 1(VLR,RG) for Account 1"                        |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 3(VCL,SV) for Account 1"                        |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 3(VGD,NF) has equal credit limit for Account 1"                                   |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 3(VGD,RG) has higher credit limit than Priority 2(VLR,NF) for Account 1"                        |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 3(VGD,SP) for Account 1"                        |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) and 3(VCL,SS) has equal credit limit for Account 1"                                   |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 1(VLR,RG) for Account 1"                        |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 2(VLR,NF) for Account 1"                        |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 2(VLR,NF) has equal credit limit for Account 1"                                   |
      | "2423_Priority-3(VCL,ZZ)  offer returns when Priority 3(VCL,ZZ) has highest credit limit than Priority 3(VCL,RG) for Account 1"                       |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 2(VLR,NF) has highest credit limit than Priority 1(VLR,RG) and Priority 3(VFF,TR) for Account 2" |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 1(VLR,RG), Priority 2(VLR,NF) and Priority 3(VFF,TS) has equal credit limit for Account 1"       |