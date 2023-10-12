@CIMCAMP-404 @CIEPROG-120

Feature: Validate D2D Engagement-InteracFlash-4367 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @D2DEngagementInteracFlash @D2DEngagement_InteracFlash_IH_Validation @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = InteractestDataFileName
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
      | "4367_Validate IH Record fields against Proposition" |

  @D2DEngagementInteracFlash @D2DEngagementInteracFlash_Positive_TestCases_Validation  @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Validate <TestID> Positive TestCases Response Fields Part1
  #    Reading data from Excel sheet
    * def testDataFileName = InteractestDataFileName
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
      | TestID                                    |
      | "4367_ISSUE = Engagement and Group = D2D" |
      | "4367_CUST_TP_CD=PSNL"                    |
      | "4367_PRIM_CNTRY_CD= CA"                  |
      | "4367_DO_NOT_SOLICIT_F=N"                 |
      | "4367_DO_NOT_SOLICIT_F= Null"             |
      | "4367_INDV_BRTH_DT_Greater than 16"       |
      | "4367_INDV_BRTH_DT_Equal to 16"           |
      | "4367_Deceased_F=N"                       |
      | "4367_LANG_CD=E"                          |
      | "4367_LANG_CD_LowerCase=e"                |
      | "4367_LANG_CD=EN"                         |
      | "4367_LANG_CD_LowerCase=en"               |
      | "4367_LANG_CD=F"                          |
      | "4367_LANG_CD_LowerCase=f"                |
      | "4367_LANG_CD=FR"                         |
      | "4367_LANG_CD_LowerCase=fr"               |
      | "4367_Prv_Bnk_Ind=N"                      |
      | "4367_EMPLOYEE_STAFF_F=N"                 |
      | "4367_EMPLOYEE_STAFF_F=NULL"              |
      | "4367_SRC_ACCT_STAT_CD-A"                 |
      | "4367_ACCT_SUBSYS_ID_BB"                  |
      | "4367_PRD CD- 01, SUB PRD CD -01"         |
      | "4367_PRD CD- 01, SUB PRD CD -02"         |

  @D2DEngagementInteracFlash @D2DEngagementInteracFlash_Positive_TestCases_Validation  @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Validate <TestID> Positive TestCases Response Fields Part2
  #    Reading data from Excel sheet
    * def testDataFileName = InteractestDataFileName
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
      | TestID                                       |
      | "4367_PRD CD- 01, SUB PRD CD -03"            |
      | "4367_PRD CD- 01, SUB PRD CD -04"            |
      | "4367_PRD CD- 02, SUB PRD CD -01"            |
      | "4367_PRD CD- 02, SUB PRD CD -02"            |
      | "4367_PRD CD- 02, SUB PRD CD -03"            |
      | "4367_PRD CD- 13, SUB PRD CD -01"            |
      | "4367_PRD CD- 13, SUB PRD CD -03"            |
      | "4367_PRD CD- 13, SUB PRD CD -07"            |
      | "4367_PRD CD- 13, SUB PRD CD -08"            |
      | "4367_PRD CD- 07, SUB PRD CD -11"            |
      | "4367_PRD CD- 07, SUB PRD CD -12"            |
      | "4367_PRD CD- 19, SUB PRD CD -01"            |
      | "4367_PRD CD- 19, SUB PRD CD -02"            |
      | "4367_PRD CD- 19, SUB PRD CD -03"            |
      | "4367_PRD CD- 19, SUB PRD CD -04"            |
      | "4367_PRD CD- 19, SUB PRD CD -07"            |
      | "4367_PRD CD- 19, SUB PRD CD -08"            |
      | "4367_PRD CD- 23, SUB PRD CD -01"            |
      | "4367_PRD CD- 23, SUB PRD CD -03"            |
      | "4367_Account Open Date equal to 49 days"    |
      | "4367_Account Open Date equal to 68 days"    |
      | "4367_Account Open Date >= 49 and <=68 days" |
      | "4367_LAST_FLASH_TXN_DT = NULL"              |

  @D2DEngagementInteracFlash @D2DEngagementInteracFlash_Negative_TestCases_Validation  @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = InteractestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
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
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                     |
      | "N-4367_PRIM_CNTRY_CD!= CA"                |
      | "N-4367_PRIM_CNTRY_CD= Null"               |
      | "N-4367_CUST_TP_CD != PSNL"                |
      | "N-4367_CUST_TP_CD =  Null"                |
      | "N-4367_DO_NOT_SOLICIT_F= Y"               |
      | "N-4367_Indv_Brth_Dt Equal to 15"          |
      | "N-4367_Indv_Brth_Dt Equal to Null"        |
      | "N-4367_Indv_Brth_Dt with in range (1-14)" |
      | "N-4367_PRD CD- 01, SUB PRD CD -08"        |
      | "N-4367_PRD CD-02, SUB PRD CD -04"         |
      | "N-4367_PRD CD- 07, SUB PRD CD -08"        |
      | "N-4367_PRD CD-13, SUB PRD CD -12"         |
      | "N-4367_PRD CD- 18, SUB PRD CD -02"        |
      | "N-4367_PRD CD-19, SUB PRD CD -11"         |
      | "N-4367_PRD CD-23, SUB PRD CD -02"         |
      | "N-4367_SRC_ACCT_STAT_CD- B"               |
      | "N-4367_SRC_ACCT_STAT_CD-Null"             |
      | "N-4367_Account Open Date equal to Null"   |
      | "N-4367_Deceased_F= Y"                     |
      | "N-4367_Deceased_F= Null"                  |
      | "N-4367_EMPLOYEE_STAFF_F= Y"               |
      | "N-4367_ACCT_SUBSYS_ID_KS"                 |
      | "N-4367_Prv_Bnk_Ind= Null"                 |
      | "N-4367_Prv_Bnk_Ind= Y"                    |
      | "N-4367_LANG_CD= K"                        |
      | "N-4367_LANG_CD= NE"                       |
      | "N-4367_LANG_CD= Null"                     |
      | "N-4367_PRD CD- 18, SUB PRD CD -01"        |
      | "N-4367_PRD CD- 18, SUB PRD CD -07"        |
      | "N-4367_PRD CD- 18, SUB PRD CD -03"        |

  @D2DEngagementInteracFlash @D2DEngagementInteracFlash_Negative_TestCases_ACCT_ODT_Validation  @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement InteracFlash_RS18039_4367_SOL Validate <TestID> Negative TestCase on acct odt
  #    Reading data from Excel sheet
    * def testDataFileName = InteractestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode_Excel = karate.get('data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
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
  #    Verfiying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

    #    Validating error response
    * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                          |
      | "N-4367_Account Open Date greater than 68 days" |
      | "N-4367_Account Open Date less than 49"         |
      | "N-4367_Account Open Date equals to 48"         |
      | "N-4367_Account Open Date equals to 69"         |

