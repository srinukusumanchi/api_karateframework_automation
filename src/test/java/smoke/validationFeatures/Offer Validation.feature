@Smoke_Validation
Feature: Validation of Sanity scenarios for all channels

  Background: SOL Sanity
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

##########################SOL#############################
  @D2D @SOL @Sanity-SOL
  Scenario Outline: D2D Engagement Welcome SOL Validate <TestID> for sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
    * print '***************Request XML*************'+karate.prettyXml(requestfile)
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Excel = offerCode
    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                            |
      | "4330_D2D Welcome_BBA"            |
      | "4331_D2D Welcome_BBP"            |
      | "4332_D2D Welcome_ScotiaOne"      |
      | "4334_D2D Welcome_StudentBanking" |
      | "4658_D2D Welcome_Ultimate"       |
      | "5821_SOL_D2DWelcome_NTB"         |

  @D2D_Sanity @SOL @Sanity-SOL
  Scenario Outline: D2D Engagement SOL Validate <TestID> for sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

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

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Excel = offerCode
    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                      |
      | "4235_D2D Digital Adoption" |
      | "4315_Fund Account"         |
      | "4316_Bill Payment"         |
      | "4380_Bill Payment"         |
      | "4363_Reward Reinforcement" |
      | "4364_Reward Reinforcement" |
      | "4366_Reward Reinforcement" |
      | "4891_CrossSell"            |
      | "4892_CrossSell"            |
      | "4893_CrossSell"            |
      | "4894_CrossSell"            |
      | "4367_InteracFlash"         |
      | "4368_Visa Debit"           |
      | "4399_Digital Payment"      |
      | "4400_Digital Payment"      |
      | "4401_Digital Payment"      |

  @NewToCanada @NewToCanada_Validation_Sanity @5043 @SOL @RS20034 @Sanity-SOL
  Scenario Outline: NewTocanada_RS20034_5043_SOL Validate <TestID> IH field values against proposition data

    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')
    # Reading data from Excel sheet

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')
  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
   #    It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTCWelcomeContextualOfferValidation')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID     |
      | "5043_NTC" |

  @SCCP_SOL @SOL @Sanity-SOL
  Scenario Outline: Creditor Insurance Initial offer 2423 SOL Validate <TestID> for sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Excel = offerCode
    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));

    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "2423_Creditor Insurance SOL" |

  @CreditorInsuranceRetargeting_Sanity  @5648 @SOL @VS17084 @Sanity-SOL
  Scenario Outline: Creditor Insurance Retargeting offer_5648 Validate<TestID> for Sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceRetargetingSOLOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "5648_Creditor Insurance SOL" |

#Adde SOL SPSP to BVT
  @SPSP_Loan_Repay_Positive_Scenarios_withoutIHValidation_SOL @5701 @SOL @RS20027 @Sanity-SOL
  Scenario Outline: SPSP Loan Repay - RS20027_5701_SOL Validate <TestID> web response against proposition data
    #* def testDataFileName = SPSP_Loan_RepaySOLFileName
    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')
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
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/SOL/ReusableScenarios.feature@SOL_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile

 #  Performing action on xml request (Get Action)
    * soap action soapAction

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the SOL soap Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID          |
      | "5701_SPSP_SOL" |

  @NTBAdvicePlus @NTBAdvicePlus_IH_Validation @5822 @SOL @RS22111 @Sanity-SOL
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Validate <TestID> IH field values against proposition data
    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcct_Dim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM");

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')
  #    Printing request body in console
    * print '*********Request**********'+requestfile

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTBAdvicePlusContextualOfferValidation')
   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTBAdvicePlusOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                           |
      | "5822_SOL_NTBAdvicePlus_BASE_01" |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL_BASE_Sanity_IH_Validation_6050 @6001 @SOL @RS23073 @Sanity-SOL
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Validate <TestID> base Positive TestCases Response Fields
  #    Reading data from Excel sheet
#    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@D2DEarlyEngagementOfferReminderSOLIHvalidation')
#     Validate the web Response with IH,Proposition
    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DEngagementOfferReminderFulfillmentSOL')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "6050_SOL_BASE_01" |


  @ItradeXsellAlwaysOn_6109  @ItradeXsellAlwaysOn_6109_SOL_Positive_BASE_Sanity_Validation_withoutIH_validation @6109 @SOL8 @RS23101 @Sanity-SOL
  Scenario Outline: ItradeXsellAlwaysOn_6109_SOL Validate <TestID> Positive TestCases Response Fields with IH validation

    #    Reading data from Excel sheet
#    * def testDataFileName = ItradeXsellAlwaysOnSOLTestData

    * url baseUrl
    #  Passing Headers for the API
#    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
#    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

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
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+requestfile

   # It clears Result fields
    * clearResultFields()

        # Validate the SOL soap Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

##     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/sol/ReusableScenarios.feature@ItradeXsellAlwaysOnSpecificIHValidation')

#    Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@OfferValidationWithIH')

     # Validate the web Response with IH,Proposition
    * call read('classpath:channels/sol/ReusableScenarios.feature@ItradeXsellAlwaysOnOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                      |
      | "6109_SOL_BASE_Creative_01" |
      | "6109_SOL_BASE_Creative_02" |
      | "6109_SOL_BASE_Creative_03" |
      | "6109_SOL_BASE_Creative_04" |
      | "6109_SOL_BASE_Creative_05" |
      | "6109_SOL_BASE_Creative_06" |
      | "6109_SOL_BASE_Creative_07" |

  @SSI_Fund_SANITY_Positive_Scenarios_withIHValidation @6233 @SOL @RS23174 @Sanity-SOL
  Scenario Outline: SSI Fund - RS23174_6233_SOL Validate <TestID> IH field values against proposition data
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

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
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+requestfile

   # It clears Result fields
    * clearResultFields()

        # Validate the SOL soap Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@SSIFundContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

##     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/sol/ReusableScenarios.feature@ItradeXsellAlwaysOnSpecificIHValidation')

#    Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@SSIFundOfferValidationWithIH')

#     # Validate the web Response with IH,Proposition
#    * call read('classpath:channels/sol/ReusableScenarios.feature@ItradeXsellAlwaysOnOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "6233_SOL_BASE_Seg_01" |

  @SSI_PAC_SANITY_Positive_Scenarios_withIHValidation @6234 @SOL @RS23175 @Sanity-SOL
  Scenario Outline: SSI PAC - RS23175_6234_SOL Validate <TestID> IH field values against proposition data
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

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

  #    Verfiying Sucess with status code 200
    * status 200

    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+requestfile


   # It clears Result fields
    * clearResultFields()


    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@SSIPACOfferValidationWithIH')

    # Validate the SOL rest Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@SSIPACContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "6234_SOL_BASE_Seg_01" |


##########################End of SOL#############################

  ##########################AS400#############################

  @CLI @AS400 @Sanity-AS400
  Scenario Outline: Credit limit increase AS400 Validate <TestID> for sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
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

    #    Verifying NBA Code with XML and Proposition sheet
#    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
#    * def nbaCode_Excel = offerCode
#    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "4479_Credit Limit Increase_AS400" |
      | "4480_Credit Limit Increase_AS400" |
      | "4481_Credit Limit Increase_AS400" |
      | "4482_Credit Limit Increase_AS400" |

  @SCCP_Sanity_AS400 @AS400 @Sanity-AS400
  Scenario Outline: Creditor Insurance AS400 Validate <TestID> for sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
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

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Excel = offerCode
    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));

    * call read('classpath:channels/as400/ReusableScenarios.feature@CreditorInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                          |
      | "2423_Creditor Insurance AS400" |

  @ReturnMail_Sanity @AS400 @Sanity-AS400
  Scenario Outline: Return Mail AS400 Validate <TestID> for sanity

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
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

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Excel = offerCode
    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));

    * call read('classpath:channels/as400/ReusableScenarios.feature@ReturnMailContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                   |
      | "4186_Return Mail_AS400" |

  @PA_ULOC_Smoke_AS400_Positive_TestCases_Validation @5576 @AS400 @OP12020 @Sanity-AS400
  Scenario Outline: PA_ULOC_OP12020_5576_AS400 Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

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
    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@PAULOC_AS400_Validation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID               |
      | "5576_AS400_PA_ULOC" |

  @PACC_AS400 @5570 @5571 @5572 @5573 @5574 @5575 @AS400 @OP14037 @Sanity-AS400
  Scenario Outline: PA Credit Cards_OP14037_5570_5571_5572_5573_5574_5575_AS400 Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

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
    * call clearIH(cid,requestfile,offerCode)

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

#   #    It clears Result fields
#    * clearResultFields()

    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID            |
      | "5570_AS400_PACC" |
      | "5571_AS400_PACC" |
      | "5572_AS400_PACC" |
      | "5573_AS400_PACC" |
      | "5574_AS400_PACC" |
      | "5575_AS400_PACC" |
      | "4354_AS400_PACC" |

  @D2DXSell @D2DXSell_BASE_AS400_Validation @5747 @AS400 @RS22054 @Sanity-AS400
  Scenario Outline: D2DXsell_RS22054_5747_AS400 Validate base test cases for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

 #   * def testDataFileName = D2DXSellAS400TestData
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

  # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                            |
      | "5747_AS400_BASE_01_NewMO"                                        |
      | "5747_AS400_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" |
      | "5747_AS400_BASE_03_MPSA_Bal_gt_30K"                              |
      | "5747_AS400_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                |
      | "5747_AS400_BASE_09_Trig_2"                                       |
      | "5747_AS400_BASE_08_Trig_2"                                       |


  @D2DXSell @D2DXSell_BASE_Top1_AS400_Smoke_Validation @6037 @AS4008 @RS22054 @Sanity-AS400
  Scenario Outline: D2DXsell_RS22054_6037_AS400 Validate base test cases with IH field values against proposition data
# Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

 #   * def testDataFileName = D2DXSellAS400TestData
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


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "6037_AS400_BASE_01_NoMPSA"          |
      | "6037_AS400_BASE_02_MPSA_Bal_lt_30K" |


  @ODP @ODP_Validation_Sanity_5787 @5787 @AS400 @OP13028 @Sanity-AS400
  Scenario Outline: ODP_OP13028_5787_AS400 Validate <TestID> against proposition data for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print "Offer code is "+ offerCode

   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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

    #     Validationg PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ODPContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID           |
      | "5787_AS400_ODP" |

  @ULOCInsurance @ULOCInsurance_Validation_5761 @5761 @AS400 @RS22065 @Sanity-AS400
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400 Validate <TestID> against proposition data for Sanity
#    * def testDataFileName = ULOCINSAs400TestData
        # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                      |
      | "5761_AS400_ULOC_Insurance" |

  @ProactiveDormancy @ProactiveDormancy_BASE_IH_Validation @5805 @AS400 @ZZ22087 @Sanity-AS400
  Scenario Outline: ProactiveDormancy_ZZ22087_5805_AS400 Validate base test cases with IH field values against proposition data
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
    * print "Test Id is:" + testId
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ProactiveDormancyOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "5805_CSE_ProActiveDormancy" |

  @MissingAndInvalid_Email_Validation @InvalidEmail_Sanity_Validation @5778 @AS400 @RS22069 @Sanity-AS400
  Scenario Outline: Invalid Email_RS22069_5778_5779_Base_AS400 Validate <TestID> IH field values against proposition data for Sanity
    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@MissingInvalidEmailOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                           |
      | "5778_AS400_MissingInvalidEmail" |
      | "5779_AS400_MissingInvalidEmail" |

  @D2DNearPrimacy_AS400_6185 @D2DNearPrimacy_AS400_6185_Sanity_Validation @6185 @6186 @6187 @6188 @AS400 @RS23147 @Sanity-AS400
  Scenario Outline: D2DNearPrimacy_6185_AS400 Validate <TestID> Positive TestCases Response Fields with IH validation

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

  # Reading data from Excel sheet
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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@D2DXsellSneakPeakOfferValidation_AS400')

#        Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#         Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCULOCOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                        |
      | "6185_AS400_BASE_Creative_01" |
      | "6186_AS400_BASE_Creative_01" |
      | "6187_AS400_BASE_Creative_01" |
      | "6188_AS400_BASE_Creative_01" |

  @ULOCCLI @ULOCCLISoloBorrower_BASE_IH_Validation_6001_Sanity_Validation @6001 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI Sole Borrower_RS23043_6001_AS400 Validate <TestID> IH field values Base Line against proposition data

     # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "6001_AS400_BASE_Creative_01" |
      | "6001_AS400_BASE_Creative_02" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6002_Sanity_Validation @6002 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6002_AS400 Validate <TestID> IH field values against proposition data

      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "6002_AS400_BASE_Creative_01" |
      | "6002_AS400_BASE_Creative_02" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6090_Sanity_Validation @6090 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6090_AS400 Validate <TestID> IH field values Base Line against proposition data


      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

#      Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                        |
      | "6090_AS400_BASE_Creative_01" |
      | "6090_AS400_BASE_Creative_02" |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_6218_Sanity_Validation @6218 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI CoBorrower_RS23043_6218_AS400 Validate <TestID> IH field values Base Line against proposition data


      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "6218_AS400_BASE_Creative_01" |
      | "6218_AS400_BASE_Creative_02" |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_6219_Sanity_Validation @6219 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI - CoBorrower_RS23043_6219_AS400 Validate <TestID> IH field values against proposition data

       # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                        |
      | "6219_AS400_BASE_Creative_01" |
      | "6219_AS400_BASE_Creative_02"  |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_6220_Sanity_Validation @6220 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOCCLI - CoBorrower_RS23043_6220_AS400 Validate <TestID> IH field values Base Line against proposition data

      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

#      Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                        |
      | "6220_AS400_BASE_Creative_01" |
      | "6220_AS400_BASE_Creative_02" |
#
#  @GIC @AS400 @Sanity-AS400
#  Scenario Outline: GIC AS400 Validate <TestID> for sanity
#    # Calling API with URL
#    * url baseUrl
#
#    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
#
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#    * def dataAcctDim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM")
#
#    * def cid = karate.get('data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * def crfcNumber = karate.get('dataAcctDim.ACCT_CRFC_NUM')
#    * print "CRFC Number is " + crfcNumber
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('data.NBACode')
#
#  #     Generate a AS400 SOAP call
#    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
#
#  #    Printing request body in console
#    * print '*********Request**********'+karate.prettyXml(requestfile)
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action soapAction
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.prettyXml(responseString)
#
#   #    It clears Result fields
#    * clearResultFields()
#
#     #    Verifying NBA Code with XML and Proposition sheet
#    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
#    * def nbaCode_Excel = offerCode
#    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));
#
#    * call read('classpath:channels/as400/ReusableScenarios.feature@GICContextualOfferValidation_AS400')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#
#    Examples:
#      | TestID |
#      | "1210_GIC Renewal_AS400" |
#      | "4587_GIC Renewal_AS400" |

#  @MortgageRenewal @AS400 @Sanity-AS400
#  Scenario Outline: Mortgage Renewal AS400 Validate <TestID> for sanity
#    # Calling API with URL
#    * url baseUrl
#
#    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
#
#    #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('$data.TestID')
#  #    Defining which NBA Code to test (Retrieving from excel sheet)
#    * def offerCode = karate.get('$data.NBACode')
#
#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')
#
#  #     Generate a AS400 SOAP call
#    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action soapAction
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#   # It clears Result fields
#    * clearResultFields()
#
#    #    Verifying NBA Code with XML and Proposition sheet
#    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
#    * def nbaCode_Excel = offerCode
#    * eval if(nbaCode_XML==nbaCode_Excel?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Excel));
#
#    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageContextualOfferValidation')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#    Examples:
#      | TestID                             |
#      #      | "1430_Mortgage_AS400"              |

##########################End of AS400#############################

   ##########################NOVA#############################

  @CLI @NOVA @Sanity-NOVA
  Scenario Outline: Credit Limit Increase NOVA Validate <TestID> for sanity
      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
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
    * print 'Offer code  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Excel = offerCode
    * eval if(pyName_JSON==offerCode_Excel?printPassedResult('NBA Code',pyName_JSON):printFailedResult('NBA Code',pyName_JSON,offerCode_Excel));

    * call read('classpath:channels/nova/ReusableScenarios.feature@CLIContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                            |
      | "4479_Credit Limit Increase_NOVA" |
      | "4480_Credit Limit Increase_NOVA" |

  @SCCP_Sanity @NOVA @Sanity-NOVA
  Scenario Outline: Creditor Insurance NOVA Validate <TestID> for sanity
      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
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
    * print 'Offer code  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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
    * print '***************Response*************'+karate.pretty(responseString)

   #    It clears Result fields
    * clearResultFields()

    #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Excel = offerCode
    * eval if(pyName_JSON==offerCode_Excel?printPassedResult('NBA Code',pyName_JSON):printFailedResult('NBA Code',pyName_JSON,offerCode_Excel));

    * call read('classpath:channels/nova/ReusableScenarios.feature@CreditorInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                         |
      | "2423_Creditor Insurance NOVA" |

  @CreditorInsuranceRetargetingNova  @5648 @NOVA @VS17084 @Sanity-NOVA
  Scenario Outline: Creditor Insurance Retargeting Nova_VS17084_5648_NOVA Validate <TestID> Positive TestCases Response Fields
  # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  # Generate a AS400 SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
  # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
  # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
  # request (Karate keyword) for sending request string
    * request requestfile
  # Performing action on JSON request (Post Action)
    * method post
  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
  # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@CreditorInsuranceRetargetingNovaOfferValidation')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                         |
      | "5648_Creditor Insurance NOVA" |

  @TFSAMPSARRSPRESPSUPPCardCrossSell_NoIH @NOVA @Sanity-NOVA2
  Scenario Outline: TFSA, MPSA, RESP, RRSP and Supplementary Card Cross Sell_5464_5465_5466_5467_54688_NOVA Validate <TestID> Positive TestCases Response Fields

      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                         |
      | "5464_TFSA_CrossSell_NOVA"     |
      | "5466_RESP_CrossSell_NOVA"     |
      | "5465_RRSP_CrossSell_NOVA"     |
      | "5467_MPSA_CrossSell_NOVA"     |
      | "5468_SuppCard_CrossSell_NOVA" |
      | "5501_TFSA_Fund_NOVA"          |
      | "5503_RESP_Fund_NOVA"          |
      | "5502_RRSP_Fund_NOVA"          |
      | "5504_MPSA_Fund_NOVA"          |

  @D2DWelcome_Nova_Sanity @NOVA @Sanity-NOVA @4430 @4331 @4332 @4334 @4658
  Scenario Outline: D2DWelcome_BBA_BBP_ScotiaLine_SBAP_Ultimate_4330_4331_4332_4334_4658_NOVA Validate <TestID> Positive TestCases Response Fields For Creative 01 and 02

      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                           |
#      | "4330_BBA_NOVA"                  |
      | "4331_BBP_NOVA"                  |
      | "4332_ScotiaOne_NOVA"            |
      | "4334_SBAP_NOVA"                 |
      | "4658_Ultimate_NOVA"             |
      | "4658_Ultimate_NOVA"             |
      | "4332_ScotiaOne_4332092102_NOVA" |
#      | "4334_SBAP_4334092102_NOVA"      |
      | "5821_NOVA_D2DWelcome_NTB"       |

  @FundAccount_Nova @NOVA @Sanity-NOVA @4315
  Scenario Outline: Funds Account_RS18022_4315_NOVA Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@FundsAccountContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "4315_FundAccount_NOVA" |

  @BillPayment_NOVA @NOVA @Sanity-NOVA @4380
  Scenario Outline: Bill Payment_4380_NOVA Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@BillPaymentContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                             |
      | "4380_BillPayment_Nova"                            |
      | "4380_CUST_OPND_DT<90_NTCCreative_4380072102_NOVA" |

  @PAULOC_5576_NO_IH_NOVA @NOVA @Sanity-NOVA @5576
  Scenario Outline: PA ULOC_5576_NOVA Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@PAULOCOfferValidation_NOVA')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID              |
      | "5576_NOVA_PA_ULOC" |

  @PACC_NOVA @5570 @5571 @5572 @5573 @5574 @5575 @NOVA @OP14037 @Sanity-NOVA
  Scenario Outline: PA CC_5570_5571_5572_5573_5574_5575_NOVA Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCOfferValidation_NOVA')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID           |
      | "5570_NOVA_PACC" |
      | "5571_NOVA_PACC" |
      | "5572_NOVA_PACC" |
      | "5573_NOVA_PACC" |
      | "5574_NOVA_PACC" |
      | "5575_NOVA_PACC" |
      | "4354_NOVA_PACC" |

  @CrossSellNova_Smoke @4891 @4892 @4893 @4894 @NTCCreative @NOVA @Sanity-NOVA
  Scenario Outline: CrossSell_4891_4892_4893_4894_NOVA Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                            |
      | "4892_CrossSell_NTCCreative_NOVA" |
      | "4894_CrossSell_NTCCreative_NOVA" |
      | "4891_CrossSell_NOVA"             |
      | "4892_CrossSell_NOVA"             |
      | "4893_CrossSell_NOVA"             |
      | "4894_CrossSell_NOVA"             |

  @VisaVisaDebitAcq @5615  @RS21132  @NOVA @Sanity-NOVA1  @BillPaymentTxn  @5616 @RS21133
  Scenario Outline: D2D Engagement_5614_5615_5616_5619_NOVA Validate positive test cases<TestID> for Sanity

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "5616_BillPaymentTxn"   |
      | "5615_VisaDebitAcq"     |
      | "5614_ODP RightSizing"  |
      | "5619_NTCCreditHistory" |

  @SPSP_Loan_Repay_Positive_Scenarios_withoutIHValidation @5701 @NOVA @RS20027 @Sanity-NOVA1
  Scenario Outline: SPSP Loan Repay - RS20027_5701_NOVA Validate <TestID> web response for Sanity
    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

   # * def testDataFileName = SPSP_Loan_RepayNOVAFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID           |
      | "5701_SPSP_NOVA" |

  @TravelInsurance_5715_Sanity  @TravelInsurance_5715_Nova_Positive_Validation_Sanity @5715 @NOVA @RS22049 @Sanity-NOVA1
  Scenario Outline: TravelInsurance_5715_NOVA Validate <TestID> Positive TestCases Response Fields for Sanity
    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@TravelInsuranceSpecificOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                       |
      | "5715_NOVA_Travel_Insurance" |

  @InsuranceReminder_5784_Sanity   @5784 @NOVA @RS22075 @Sanity-NOVA1
  Scenario Outline: InsuranceReminder_5784_NOVA Validate <TestID> Positive TestCases Response Fields for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    # Reading data from Excel sheet

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
    * def cellGroup = karate.get('$data.CellGroup')
    * print "cell group is :" +cellGroup
   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for insurance Reminder specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@InsuranceReminderSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                             |
      | "5784_NOVA_InsuranceClaimReminder" |

  @ScotiaSmartMoney_5796  @SSM_5796_Nova_IH_Validation @5796 @NOVA @RS22071 @Sanity-NOVA1
  Scenario Outline: ScotiaSmartMoney_5796_NOVA Validate <TestID> Positive TestCases Response for sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
    * def cellGroup = karate.get('$data.CellGroup')
    * print "cell group is :" +cellGroup
   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                  |
      | "5796_NOVA_SSMAlwaysOn" |

  @ULOCInsurance @ULOCInsurance_IH_NOVA_5761_Validation @5761 @NOVA @RS22065 @Sanity-NOVA1
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Validate positive test case for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA REST call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                     |
      | "5761_NOVA_ULOC_Insurance" |
      | "5762_NOVA_ULOC_Insurance" |

  @D2DXSell @D2DXSell_Smoke_IH_Validation_NOVA @5747 @NOVA @RS22054 @Sanity-NOVA1
  Scenario Outline: D2DXsell_RS22054_5747_NOVA Validate base test cases with IH field values against proposition data for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    # Reading data from Excel sheet
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('$data.TestID')
    * print "Test ID is " + testId
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print "Offer Code is " + offerCode

   # Report database records in cucumber report
   * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)


  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()
    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                           |
      | "5747_NOVA_BASE_01_NewMO"                                        |
#      | "5747_NOVA_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" |
#      | "5747_NOVA_BASE_03_MPSA_Bal_gt_30K"                              |
#      | "5747_NOVA_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                |
#      | "5747_NOVA_BASE_Seg_07_Trig_13_MAT_DT_eq_8months"                |
#      #Added for March 30th 2023 release
#      | "5747_NOVA_BASE_09_Trig_2"                                       |
#      | "5747_NOVA_BASE_10_Trig_2"                                       |
#      | "5747_NOVA_BASE_08_Trig_2"                                       |
#      | "5747_NOVA_BASE_11_Trig_2"                                       |

  @D2DXSell @D2DXSell_Smoke_IH_5748_Smoke_Validation @5748 @NOVA @RS22054 @Sanity-NOVA1
  Scenario Outline: D2DXsell_RS22054_5748_NOVA Validate base test cases with IH field values against proposition data
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    # Reading data from Excel sheet
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
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)


  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "5748_NOVA_BASE_Preferred_Ultimate" |
      | "5748_NOVA_BASE_Other_Abandon"      |




  @D2DXSell @D2DXSell_BASE_Top1_IH_NOVA_Validation @6037 @NOVA @RS22054 @Sanity-NOVA1
  Scenario Outline: D2DXsell_RS22054_6037_NOVA Validate base test cases with IH field values against proposition data
     # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    # Reading data from Excel sheet
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
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)


  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "6037_NOVA_BASE_01_NoMPSA"          |
      | "6037_NOVA_BASE_02_MPSA_Bal_lt_30K" |


  @NTB_AdvicePlus_Nova @NTB_AdvicePlus_5822_Nova_IH_Validation @5822 @NOVA @RS22111 @Sanity-NOVA2
  Scenario Outline: NTB_AdvicePlus_Nova_RS22111_5822_NOVA Validate <TestID> IH field values against proposition data for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * print "Data record is:" + data

    * def cid = karate.get('$data.ID')
    * print "CID is "+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

#    #   # Fetch recorded activity for CID from IH
#    * print "CID before fetching IH is:" +cid

     # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                    |
      | "5822_NOVA_NTBAdvicePlus" |

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_Validation @5839 @NOVA @RS22116 @Sanity-NOVA2
  Scenario Outline: MPSA Welcome Bonus_5839_NOVA Validate <TestID> IH for Base Positive TestCases for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                       |
      | "5839_NOVA_MPSAWelcomeBonus" |

  @TFSA_RRSP_Remainder_Sanity  @TFSARRSPFund_5927_5955_NOVA_Sanity_Validation @5955 @NOVA @RS21094 @5927 @RS21092 @Sanity-NOVA
  Scenario Outline: RRSP_TFSA_Fund_RS21094_RS21092_5955_5927_NOVA Validate <TestID> Positive TestCases Response Fields for Sanity
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/nova/ReusableScenarios.feature@RRSPContributionValidation_Nova')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                  |
      | "5927_TFSAPACRemainder" |
      | "5955_RRSPPACRemainder" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6001 @6001 @NOVA @RS23043  @Sanity-NOVA2
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6001_NOVA Validate <TestID> IH field values Base Line against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6001_NOVA_BASE_Creative_01" |
      | "6001_NOVA_BASE_Creative_02" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_NOVA_Validation_6002 @6002 @NOVA @RS23043  @Sanity-NOVA2
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6002_NOVA Validate <TestID> IH field values against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6002_NOVA_BASE_Creative_01" |
      | "6002_NOVA_BASE_Creative_02" |


  @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_Base_Validation @5970 @NOVA @Sanity-NOVA2 @AUTUTESTTOTAL#4
  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Base IH validation and Response Fields
    #    Reading data from Excel sheet
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                       |
      | "5970_NOVA_BASE_Creative_01" |
      | "5970_NOVA_BASE_Creative_02" |
      | "5970_NOVA_BASE_Creative_03" |
      | "5970_NOVA_BASE_Creative_04" |

  @D2DEarlyEngagementOfferReminderNOVA @D2DEarlyEngagementOfferReminderNOVA_Sanity_BASE_IH_Validation_6050 @6001 @NOVA @RS23073 @Sanity-NOVA2
  Scenario Outline: D2DEarlyEngagementOfferReminderNOVA_RS23073_6050_NOVA Validate <TestID> base Positive TestCases Response Fields
#    * def testDataFileName = D2DOfferFulfilmentReminderNOVA
    #    Reading data from Excel sheet
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

# Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DEarlyEngagementOfferReminderIHvalidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DOfferFulfilmentReminderOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID              |
      | "6050_NOVA_BASE_01" |


  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_NOVA_Validation_6090_Sanity @6090 @NOVA @RS23043 @Sanity-NOVA2
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6090_NOVA Validate <TestID> IH field values Base Line against proposition data
#    * def testDataFileName = ULOCCLINovaTestData6090
    #    Reading data from Excel sheet
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6090_NOVA_BASE_Creative_01" |
      | "6090_NOVA_BASE_Creative_02" |

  @InternationalMoneyTransfer_6087  @InternationalMoneyTransfer_6087_Nova_Positive_Validation_withIH_validation @6087 @NOVA @RS23094 @Sanity-NOVA2

  Scenario Outline: InternationalMoneyTransfer_6087_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
#    * def testDataFileName = InternationalMoneyTransferNOVATestData
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')


#    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
#    * def cellGroup = karate.get('$data.CellGroup')
#    * print "cell group is :" +cellGroup
#   # Report database records in cucumber report
#    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

       # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#
#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@IMTSpecificIHValidation')

#    #     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@@IMTControlValidation')
    * def cid_Control = subString(cid,13,14)
    * print "Cid_control" + cid_Control
    * string validation_scenario = read('classpath:channels/nova/LatestContextual_val.feature')
    * print 'Validation_scenario is:'+ validation_scenario
    * if (cid_Control != '0') karate.call(validation_scenario)
#    # Validate the NOVA rest Response against DB and Proposition data
#    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID |
#      |"6087_NOVA_BASE_Seg_01"|
#      |"6087_NOVA_BASE_Seg_02"|
#      |"6087_NOVA_BASE_Seg_03"|
      |"6087_NOVA_BASE_Seg_04"|
#      |"6087_NOVA_BASE_Seg_05"|

  @ItradeXsellAlwaysOn_6109  @ItradeXsellAlwaysOn_6109_Nova_Positive_Sanity_Validation_withoutIH_validation @6109 @NOVA8 @RS23101 @Sanity-NOVA1
  Scenario Outline: ItradeXsellAlwaysOn_6109_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
#    * def testDataFileName = ItradeXsellAlwaysOnNOVATestData

    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#
#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    #     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnSpecificIHValidation')
#
     # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                       |
      | "6109_NOVA_BASE_Creative_01" |
      | "6109_NOVA_BASE_Creative_02" |
      | "6109_NOVA_BASE_Creative_03" |
      | "6109_NOVA_BASE_Creative_04" |
      | "6109_NOVA_BASE_Creative_05" |
      | "6109_NOVA_BASE_Creative_06" |
      | "6109_NOVA_BASE_Creative_07" |

  @D2DNearPrimacy_NOVA_6185 @D2DNearPrimacy_NOVA_6185_Positive_Validation_withIH_validation @6185 @6186 @6187 @6188 @NOVA @RS23147 @Sanity-NOVA2
  Scenario Outline: D2DNearPrimacy_6185_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


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

    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DXsellSneakPeakOfferValidation_NOVA')
# Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCULOCOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                       |
      | "6185_NOVA_BASE_Creative_01" |
      | "6186_NOVA_BASE_Creative_01" |
      | "6187_NOVA_BASE_Creative_01" |
      | "6188_NOVA_BASE_Creative_01" |

  #  @GIC @NOVA @Sanity-NOVA
#  Scenario Outline: GIC NOVA Validate <TestID> for sanity
#      # Calling API with URL
#    * url baseUrl
#
#    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
#  #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * string offerCode = karate.get('data.NBACode')
#    * print 'Offer code  is '+offerCode
#  #     Generate a NOVA SOAP call
#    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
#
#
##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
#    * print '*********Request**********'+karate.prettyXml(requestfile)
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on JSON request (Post Action)
#    * method post
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#   #    It clears Result fields
#    * clearResultFields()
#
#    #    Verifying PY Name with JSON and Proposition sheet
#    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
#    * def offerCode_Excel = offerCode
#    * eval if(pyName_JSON==offerCode_Excel?printPassedResult('NBA Code',pyName_JSON):printFailedResult('NBA Code',pyName_JSON,offerCode_Excel));
#
#    * call read('classpath:channels/nova/ReusableScenarios.feature@GICContextualOfferValidation_NOVA')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#    Examples:
#      | TestID |
#      | "1210_GIC Renewal_NOVA" |
#      | "4587_GIC Renewal_NOVA" |


#  @MortgageRenewal @NOVA @Sanity-NOVA
#  Scenario Outline: Mortgage Renewal NOVA Validate <TestID> for sanity
#      # Calling API with URL
#    * url baseUrl
#
#    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
#  #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * string offerCode = karate.get('data.NBACode')
#    * print 'Offer code  is '+offerCode
#  #     Generate a NOVA SOAP call
#    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
#
#
##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
#    * print '*********Request**********'+karate.prettyXml(requestfile)
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on JSON request (Post Action)
#    * method post
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#   #    It clears Result fields
#    * clearResultFields()
#
#    #    Verifying PY Name with JSON and Proposition sheet
#    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
#    * def offerCode_Excel = offerCode
#    * eval if(pyName_JSON==offerCode_Excel?printPassedResult('NBA Code',pyName_JSON):printFailedResult('NBA Code',pyName_JSON,offerCode_Excel));
#
#    * call read('classpath:channels/as400/validation_gic.feature@GICContextualOfferValidation_NOVA')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#    Examples:
#      | TestID                            |
#      | "1430_Mortgage_NOVA"              |
#      | "4862_Mortgage_NOVA"              |
#      | "4864_Mortgage_NOVA"              |
#      | "4866_Mortgage_NOVA"              |
#      | "4870_Mortgage_NOVA"              |

  @SSI_Fund_SANITY_Positive_Scenarios_withIHValidation @6233 @NOVA @RS23174 @Sanity-NOVA2
  Scenario Outline: SSI Fund - RS23174_6233_NOVA Validate <TestID> IH field values against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIFundOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIFundContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "6233_NOVA_BASE_Seg_01" |


  @SSI_PAC_SANITY_Positive_Scenarios_withIHValidation @6234 @NOVA @RS23175 @Sanity-NOVA2
  Scenario Outline: SSI PAC - RS23175_6234_NOVA Validate <TestID> IH field values against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIPACOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIPACContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "6234_NOVA_BASE_Seg_01" |



  ##########################End of NOVA####################################

  ###########################ORN###########################################
  @PACC_ORN_Sanity  @PACC_ORN_Positive_Validation  @ORN @OP14037 @Sanity-ORN
  Scenario Outline: PA CC_ORN Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

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

    * call read('classpath:channels/orn/ReusableScenarios.feature@PACCOfferValidation_ORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID          |
      | "5570_ORN_PACC" |
      | "5571_ORN_PACC" |
      | "5572_ORN_PACC" |
      | "5573_ORN_PACC" |
      | "5574_ORN_PACC" |
      | "5575_ORN_PACC" |
      | "4354_ORN_PACC" |

  @PAULOC_ORN_5576_Sanity  @PAULOC_ORN_5576_Positive_Validation_Sanity @5576 @ORN @OP12020 @Sanity-ORN
  Scenario Outline: PA ULOC_5576_ORN Validate <TestID> Positive TestCases Response Fields

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    * def pacculsheetdata = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,paULOCPACCSheetName);
    * def preApprovedStartDate = karate.get('pacculsheetdata.PRIMARY_PREAPPROVED_START_DATE')
    * def preApprovedEndDate = karate.get('pacculsheetdata.PRIMARY_PREAPPROVED_END_DATE')
    * def primaryProductCode = karate.get('pacculsheetdata.PRIMARY_PRODUCT_CODE')
    * def primarySubProductCode = karate.get('pacculsheetdata.PRIMARY_SUB_PRODUCT_CODE')
  # Report database records in cucumber report
#    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer code is '+offerCode
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

    * call read('classpath:channels/orn/ReusableScenarios.feature@PAULOCOfferValidation_ORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "5576_ORN_PA_ULOC" |

  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLISoleBorrower_Positive_TestCases_Validation_ORN @4479 @ORN @VS18076 @Sanity-ORN
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> Positive TestCases Response Fields
    # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    #  Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
  # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #  Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
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
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                           |
      | "4479_Credit Limit Increase_ORN" |
      | "4480_Credit Limit Increase_ORN" |

  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_ORN_IH_Validation @5468 @ORN @RS21099 @Sanity-ORN
  Scenario Outline: Supplementary card Cross Sell_5468_ORN Validate <TestID> Positive TestCases Response Fields with IH validation

    # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
    * def cellGroup = karate.get('$data.CellGroup')
    * print "cell group is :" +cellGroup
   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@SuppCardsOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/orn/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_ORN')

#    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "5468_ORN_BASE_01" |
      | "5468_ORN_BASE_02" |


  @TFSACrossSell_5464 @TFSACrossSell_5464_ORN_Positive_withoutIH_Validation @5464 @ORN @RS21091 @Sanity-ORN
  Scenario Outline: TFSA Cross Sell_5464_ORN Validate <TestID> IH for Positive TestCases
  #    Reading data from Excel sheet
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

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

    * call read('classpath:channels/orn/ReusableScenarios.feature@TFSACrossSellOfferValidation_ORN')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID             |
      | "5464_ORN_BASE_01" |


  @RRSPCrossSell_5465 @RRSPCrossSell_5465_ORN_Positive_withoutIH_Validation @5465 @ORN @RS21093 @Sanity-ORN
  Scenario Outline: RRSP Cross Sell_5465_ORN Validate <TestID> IH for Positive TestCases
  #    Reading data from Excel sheet
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print 'data is '+data
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

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

    * call read('classpath:channels/orn/ReusableScenarios.feature@RRSPCrossSellOfferValidation_ORN')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID             |
      | "5465_ORN_BASE_01" |

  @RESPCrossSell_5466 @RESPCrossSell_5466_ORN_Positive_withoutIH_Validation @5466 @ORN @RS21091 @Sanity-ORN
  Scenario Outline: RESP Cross Sell_5466_ORN Validate <TestID> IH for Positive TestCases
  #    Reading data from Excel sheet
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

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

    * call read('classpath:channels/orn/ReusableScenarios.feature@TFSACrossSellOfferValidation_ORN')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID             |
      | "5466_ORN_BASE_01" |


  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6001_sanity @6001 @ORN @RS23043 @Sanity-ORN
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6001_ORN Validate <TestID> IH field values Base Line against proposition data
#    * def testDataFileName = ULOCCLIORNTestData6001
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIContextualOfferValidationORN')

#   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIOfferValidationWithIHORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6001_ORN_BASE_Creative_01" |
      | "6001_ORN_BASE_Creative_02" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_IH_Validation_6002_sanity @6002 @ORN @RS23043 @Sanity-ORN
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6002_ORN Validate <TestID> IH field values against proposition data
#    * def testDataFileName = ULOCCLIORNTestData6002
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIContextualOfferValidationORN')

#   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIOfferValidationWithIHORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                       |
      | "6002_ORN_BASE_Creative_01" |
      | "6002_ORN_BASE_Creative_02" |

  @ULOCCLI @ULOCCLIVISASoloBorrower_BASE_withoutIH_Validation_6090_ORN_sanity @6090 @ORN @RS23043 @Sanity-ORN
  Scenario Outline: ULOCCLI - Sole Borrower_RS23043_6090_ORN Validate <TestID> IH field values Base Line against proposition data
#    * def testDataFileName = ULOCCLIORNTestData6090
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIContextualOfferValidationORN')

#   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
##     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@ULOCCLIOfferValidationWithIHORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                       |
      | "6090_ORN_BASE_Creative_01" |
      | "6090_ORN_BASE_Creative_02" |


  @InternationalMoneyTransfer_6087  @InternationalMoneyTransfer_6087_ORN_Positive_Validation_withoutIH_validation @6087 @ORN @RS23094 @Sanity-ORN

  Scenario Outline: InternationalMoneyTransfer_6087_ORN Validate <TestID> Positive TestCases Response Fields with IH validation

#  #    Reading data from Excel sheet
#    * def testDataFileName = InternationalMoneyTransferORNTestData

    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')


    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')


#    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
#    * def cellGroup = karate.get('$data.CellGroup')
#    * print "cell group is :" +cellGroup
#   # Report database records in cucumber report
#    #* call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
##     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@IMTSpecificIHValidation')
#
##    #     Validating IPT and PST records which are recorded in IH
##    * call read('classpath:channels/orn/ReusableScenarios.feature@@IMTControlValidation')
    * def cid_Control = subString(cid,13,14)
    * print "Cid_control" + cid_Control
    * string validation_scenario = read('classpath:channels/orn/LatestContextual_val.feature')
    * print 'Validation_scenario is:'+ validation_scenario
    * if (cid_Control != '0') karate.call(validation_scenario)
#    # Validate the ORN rest Response against DB and Proposition data
#    * call read('classpath:channels/orn/ReusableScenarios.feature@LatestContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                 |
      | "6087_ORN_BASE_Seg_01" |
      | "6087_ORN_BASE_Seg_02" |
      | "6087_ORN_BASE_Seg_03" |
      | "6087_ORN_BASE_Seg_04" |
      | "6087_ORN_BASE_Seg_05" |


  @TFSARRSPRESPFund @ORN @Sanity-ORN
  Scenario Outline: TFSARRSPRESPFUND_5501_5502_5503_ORN Validate <TestID> Positive TestCases Response Fields

      # Calling API with URL
    * url baseUrl

    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
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

    * call read('classpath:channels/orn/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                         |
#      | "5467_MPSA_CrossSell_ORN"     |
      | "5501_TFSA_Fund_ORN"          |
      | "5503_RESP_Fund_ORN"          |
      | "5502_RRSP_Fund_ORN"          |
#      | "5504_MPSA_Fund_ORN"          |


  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_BASE_IH_Validation_6050 @6001 @ORN @RS23073 @Sanity-ORN
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Validate <TestID> base sanity Positive TestCases Response Fields
#    * def testDataFileName = D2DOfferFulfilmentReminderORN
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

#   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
#
## Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DEarlyEngagementOfferReminderIHvalidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DOfferFulfilmentReminderOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "6050_ORN_BASE_01" |

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_ORN_Validation @5839 @ORN @RS22116 @Sanity-ORN
  Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> IH for Base Positive TestCases
    # Reading data from Excel sheet
#    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_ORN')
##    # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
##    # Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidationWithIH')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID              |
      | "5839_ORN_BASE_01" |

  @SSI_Fund_SANITY_Positive_Scenarios_withIHValidation @6233 @ORN @RS23174 @Sanity-ORN
  Scenario Outline: SSI Fund - RS23174_6233_ORN Validate <TestID> IH field values against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/ORN/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/ORN/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIFundOfferValidationWithIH')

    # Validate the ORN rest Response against DB and Proposition data
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIFundContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                 |
      | "6233_ORN_BASE_Seg_01" |

  @SSI_PAC_SANITY_BASE_Scenarios_withIHValidation @6234 @ORN @RS23175 @Sanity-ORN
  Scenario Outline: SSI PAC - RS23175_6234_ORN Validate <TestID> IH field values against proposition data
    * url baseUrl
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/ORN/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/ORN/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIPACOfferValidationWithIH')

    # Validate the ORN rest Response against DB and Proposition data
    * call read('classpath:channels/ORN/ReusableScenarios.feature@SSIPACContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                  |
      | "6234_ORN_BASE_Seg_01" |


  ##########################End of ORN#####################################

  ##################Validation of turned off offers#########################
  @D2D @SOL @Sanity-SOL
  Scenario Outline: Validation of turned off offers<TestID> in SOL
    * url baseUrl
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')
  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  # Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')
  # request (Karate keyword) for sending request string
    * request requestfile
  # Performing action on xml request (Post Action)
    * soap action soapAction
  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
  # It clears Result fields
    * clearResultFields()
  #  Validating error response
  # * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
  # Verify TURNED OFF offers  code should not come in response
    * def nbaCode_XML = karate.get('//Offers/NBACode/text()')
    * match nbaCode_XML != offerCode
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                      |
      | "4363_Reward Reinforcement" |
      | "4364_Reward Reinforcement" |
      | "4366_Reward Reinforcement" |
      | "4891_CrossSell"            |
      | "4892_CrossSell"            |
      | "4893_CrossSell"            |
      | "4894_CrossSell"            |
      | "4367_InteracFlash"         |
      | "4368_Visa Debit"           |
      | "4399_Digital Payment"      |
      | "4400_Digital Payment"      |
      | "4401_Digital Payment"      |

  @GIC @MORTGAGE   @AS400 @Sanity-AS400
  Scenario Outline: Validation of turned off offers<TestID> in AS400
  # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
  # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  # Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
  # Printing request body in console
    * print '*********Request**********'+requestfile
  # request (Karate keyword) for sending request string
    * request requestfile
  # Performing action on xml request (Post Action)
    * soap action soapAction
  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
  # It clears Result fields
    * clearResultFields()
  # Validating error response
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML != offerCode

    Examples:
      | TestID                   |
      | "1210_GIC Renewal_AS400" |
      | "4587_GIC Renewal_AS400" |
      | "1430_Mortgage_AS400"    |

  @GIC @MORTGAGE @NOVA @Sanity-NOVA
  Scenario Outline: Validation of turned off offers<TestID> in nova
      # Calling API with URL
    * url baseUrl
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
  #  Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #  Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
  #  Printing request body in console
    * print '*********Request**********'+requestfile
  #  request (Karate keyword) for sending request string
    * request requestfile
  # Performing action on JSON request (Post Action)
    * method post
  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
  # It clears Result fields
    * clearResultFields()
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
  # Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                  |
      | "1210_GIC Renewal_NOVA" |
      | "4587_GIC Renewal_NOVA" |
      | "1430_Mortgage_NOVA"    |
      | "4862_Mortgage_NOVA"    |
      | "4864_Mortgage_NOVA"    |
      | "4866_Mortgage_NOVA"    |
      | "4870_Mortgage_NOVA"    |

  ##################End of Validation of turned off offers###################