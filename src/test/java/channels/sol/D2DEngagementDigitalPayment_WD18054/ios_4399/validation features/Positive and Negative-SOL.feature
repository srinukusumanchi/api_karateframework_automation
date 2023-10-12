Feature: Validate D2D Engagement-DigitalPayment-4399 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @D2DEngagementDigitalPayment @D2DEngagement_DigitalPayment_IH_Validation @4399 @SOL @WD18054
  Scenario Outline: D2D Engagement-DigitalPayment_WD18054_4399_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = DigitalPaymenttestDataFileName
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

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4399_Validate IH Record fields against Proposition" |

  @D2DEngagementDigitalPayment @D2DEngagementDigitalPayment_ios_Positive_TestCases_Validation  @4399 @SOL @WD18054
  Scenario Outline: D2D Engagement-DigitalPayment_WD18054_4399_SOL Validate <TestID> Positive TestCases Response Fields part1
  #    Reading data from Excel sheet
    * def testDataFileName = DigitalPaymenttestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def creativeId = karate.get('data.CreativeId')
    * print 'Creative Id is : '+creativeId

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')




  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "4399_ISSUE=EngagementandGroup=D2D" |
      | "4399_CUST_TP_CD=PSNL"              |
      | "4399_PRIM_CNTRY_CD=CA"             |
      | "4399_DO_NOT_SOLICIT_F=N"           |
      | "4399_DO_NOT_SOLICIT_F=NULL"        |
      | "4399_CUST.AGE Greater than 16"     |
      | "4399_CUST.AGE _Equal to 16"        |
      | "4399_Deceased_F=N"                 |
      | "4399_LANG_CD=E"                    |
      | "4399_LANG_CD=EN"                   |
      | "4399_LANG_CD=F"                    |
      | "4399_LANG_CD=FR"                   |
      | "4399_LANG_CD small case =e"        |
      | "4399_LANG_CD small case =en"       |
      | "4399_LANG_CD small case =f"        |
      | "4399_LANG_CD small case =fr"       |
      | "4399_Prv_Bnk_Ind=N"                |
      | "4399_EMPLOYEE_STAFF_F=N"           |
      | "4399_EMPLOYEE_STAFF_F=Null"        |
      | "4399_ACCT_SUBSYS_ID = BB"          |
      | "4399_SRC_ACCT_STAT_CD = A"         |
      | "4399_PRD CD- 01, SUB PRD CD -01"   |
      | "4399_PRD CD- 01, SUB PRD CD -02"   |
      | "4399_PRD CD- 01, SUB PRD CD -03"   |
      | "4399_PRD CD- 01, SUB PRD CD -04"   |
      | "4399_PRD CD- 02, SUB PRD CD -01"   |
      | "4399_PRD CD- 02, SUB PRD CD -02"   |


  @D2DEngagementDigitalPayment @D2DEngagementDigitalPayment_ios_Positive_TestCases_Validation  @4399 @SOL @WD18054
  Scenario Outline: D2D Engagement-DigitalPayment_WD18054_4399_SOL Validate <TestID> Positive TestCases Response Fields part2
  #    Reading data from Excel sheet
    * def testDataFileName = DigitalPaymenttestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def creativeId = karate.get('data.CreativeId')
    * print 'Creative Id is : '+creativeId

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')



  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                      |
      | "4399_PRD CD- 02, SUB PRD CD -03"                           |
      | "4399_PRD CD- 07, SUB PRD CD -11"                           |
      | "4399_PRD CD- 07, SUB PRD CD -12"                           |
      | "4399_PRD CD- 13, SUB PRD CD -01"                           |
      | "4399_PRD CD- 13, SUB PRD CD -03"                           |
      | "4399_PRD CD- 13, SUB PRD CD -07"                           |
      | "4399_PRD CD- 13, SUB PRD CD -08"                           |
      | "4399_PRD CD- 19, SUB PRD CD -01"                           |
      | "4399_PRD CD- 19, SUB PRD CD -02"                           |
      | "4399_PRD CD- 19, SUB PRD CD -03"                           |
      | "4399_PRD CD- 19, SUB PRD CD -04"                           |
      | "4399_PRD CD- 19, SUB PRD CD -07"                           |
      | "4399_PRD CD- 19, SUB PRD CD -08"                           |
      | "4399_PRD CD- 23, SUB PRD CD -01"                           |
      | "4399_PRD CD- 23, SUB PRD CD -03"                           |
      | "4399_Account Open Date equal to 63 days"                   |
      | "4399_Account Open Date equal to 80 days"                   |
      | "4399_Account Open Date > 63 and < 80"                      |
      | "4399_LAST_APPLE_PAY_TXN_TMSTMP = NULL"                     |
      | "4399_LAST_APPLE_PAY_TXN_TMSTMP not within last 3 months"   |
      | "4399_LAST_ANDROID_PAY_TXN_TMSTMP = NULL"                   |
      | "4399_LAST_ANDROID_PAY_TXN_TMSTMP not within last 3 months" |
      | "4399_LAST_SAMSUNG_PAY_TXN_TMSTMP = NULL"                   |
      | "4399_LAST_SAMSUNG_PAY_TXN_TMSTMP not within last 3 months" |
      | "4399_LAST_SCOTIA_PAY_TXN_TMSTMP = NULL"                    |
      | "4399_LAST_SCOTIA_PAY_TXN_TMSTMP not within last 3 months"  |
      | "4399_Device_Tp=ios"                                        |

  @D2DEngagementDigitalPayment @D2DEngagementDigitalPayment_ios_Negative_TestCases_Validation  @4399 @SOL @WD18054
  Scenario Outline: D2D Engagement-DigitalPayment_WD18054_4399_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = DigitalPaymenttestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

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
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * match nbaCode_XML == null


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                    |
      | "N-4399_PRIM_CNTRY_CD!=CA"                                |
      | "N-4399_PRIM_CNTRY_CD=Null"                               |
      | "N-4399_CUST_TP_CD != PSNL"                               |
      | "N-4399_CUST_TP_CD =  Null"                               |
      | "N-4399_DO_NOT_SOLICIT_F = Y"                             |
      | "N-4399_CUST.AGE_Equal to 15"                             |
      | "N-4399_CUST.AGE Equal to Null"                           |
      | "N-4399_CUST.AGE with in range (1-16)"                    |
      | "N-4399_Deceased_F = Y"                                   |
      | "N-4399_Deceased_F = Null"                                |
      | "N-4399_Prv_Bnk_Ind=Y"                                    |
      | "N-4399_Prv_Bnk_Ind=Null"                                 |
      | "N-4399_EMPLOYEE_STAFF_F=Y"                               |
      | "N-4399_LANG_CD = K"                                      |
      | "N-4399_LANG_CD = NE"                                     |
      | "N_4399_LANG_CD=Null"                                     |
      | "N-4399_ACCT_SUBSYS_ID = KS"                              |
      | "N-4399_ACCT_SUBSYS_ID = Null"                            |
      | "N-4399_PRD CD-01, SUB PRD CD -05"                        |
      | "N-4399_PRD CD-02, SUB PRD CD -04"                        |
      | "N-4399_PRD CD-07, SUB PRD CD -08"                        |
      | "N-4399_PRD CD-13, SUB PRD CD -12"                        |
      | "N-4399_PRD CD-18, SUB PRD CD -01"                        |
      | "N-4399_PRD CD-18, SUB PRD CD -07"                        |
      | "N-4399_PRD CD-18, SUB PRD CD -03"                        |
      | "N-4399_PRD CD-19, SUB PRD CD -11"                        |
      | "N-4399_PRD CD-23, SUB PRD CD -02"                        |
      | "N-4399_SRC_ACCT_STAT_CD != A"                            |
      | "N-4399_SRC_ACCT_STAT_CD-Null"                            |
      | "N-4399_Account Open Date less than 63 days"              |
      | "N-4399_Account Open Date greater than 80 days"           |
      | "N-4399_Account Open Date equal to Null"                  |
      | "N_4399_LAST_APPLE_PAY_TXN_TMSTMP within last 3 months"   |
      | "N_4399_LAST_ANDROID_PAY_TXN_TMSTMP within last 3 months" |
      | "N_4399_LAST_SAMSUNG_PAY_TXN_TMSTMP within last 3 months" |
      | "N_4399_LAST_SCOTIA_PAY_TXN_TMSTMP within last 3 months"  |
      | "N_4399_Device_Tp != ios"                                 |
      | "N_4399_Device_Tp = Null"                                 |