@CIMCAMP-406  @CIEPROG-122

Feature: Validate D2DEngagement-VisaDebit-4368 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @D2DEngagementVisaDebit @D2DEngagement_VisaDebit_IH_Validation @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
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
      | "4368_Validate IH Record fields against Proposition" |

  @D2DEngagementVisaDebit @D2DEngagementVisaDebit_Positive_TestCases_Validation  @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
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
      | "4368_ISSUE = Engagement and Group = D2D"    |
      | "4368_CUST_TP_CD=PSNL"                       |
      | "4368_PRIM_CNTRY_CD= CA"                     |
      | "4368_DO_NOT_SOLICIT_F=N"                    |
      | "4368_DO_NOT_SOLICIT_F= Null"                |
      | "4368_INDV_BRTH_DT_Greater than 16"          |
      | "4368_INDV_BRTH_DT_Equal to 16"              |
      | "4368_Deceased_F=N"                          |
      | "4368_LANG_CD=E"                             |
      | "4368_LANG_CD_LowerCase=e"                   |
      | "4368_LANG_CD=EN"                            |
      | "4368_LANG_CD_LowerCase=en"                  |
      | "4368_LANG_CD=F"                             |
      | "4368_LANG_CD_LowerCase=f"                   |
      | "4368_LANG_CD=FR"                            |
      | "4368_LANG_CD_LowerCase=fr"                  |
      | "4368_Prv_Bnk_Ind=N"                         |
      | "4368_EMPLOYEE_STAFF_F=N"                    |
      | "4368_EMPLOYEE_STAFF_F=NULL"                 |
      | "4368_SRC_ACCT_STAT_CD-A"                    |
      | "4368_ACCT_SUBSYS_ID_BB"                     |
      | "4368_PRD CD- 01, SUB PRD CD -01"            |
      | "4368_PRD CD- 01, SUB PRD CD -02"            |
      | "4368_PRD CD- 01, SUB PRD CD -03"            |
      | "4368_PRD CD- 01, SUB PRD CD -04"            |
      | "4368_PRD CD- 02, SUB PRD CD -01"            |
      | "4368_PRD CD- 02, SUB PRD CD -02"            |
      | "4368_PRD CD- 02, SUB PRD CD -03"            |
      | "4368_PRD CD- 13, SUB PRD CD -01"            |
      | "4368_PRD CD- 13, SUB PRD CD -03"            |
      | "4368_PRD CD- 13, SUB PRD CD -07"            |
      | "4368_PRD CD- 13, SUB PRD CD -08"            |
      | "4368_PRD CD- 07, SUB PRD CD -11"            |
      | "4368_PRD CD- 07, SUB PRD CD -12"            |
      | "4368_PRD CD- 19, SUB PRD CD -01"            |
      | "4368_PRD CD- 19, SUB PRD CD -02"            |
      | "4368_PRD CD- 19, SUB PRD CD -03"            |
      | "4368_PRD CD- 19, SUB PRD CD -04"            |
      | "4368_PRD CD- 19, SUB PRD CD -07"            |
      | "4368_PRD CD- 19, SUB PRD CD -08"            |
      | "4368_PRD CD- 23, SUB PRD CD -01"            |
      | "4368_PRD CD- 23, SUB PRD CD -03"            |
      | "4368_Account Open Date equal to 56 days"    |
      | "4368_Account Open Date equal to 75 days"    |
      | "4368_Account Open Date >= 56 and <=75 days" |
      | "4368_LAST_VD_VPOS_TXN_TMSTMP = NULL"        |
      | "4368_LAST_VD_OPOS_TXN_TMSTMP = NULL"        |

  @D2DEngagementVisaDebit @D2DEngagementVisaDebit_Negative_TestCases_Validation  @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
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
      | "N-4368_PRIM_CNTRY_CD!= CA"                |
      | "N-4368_PRIM_CNTRY_CD= Null"               |
      | "N-4368_CUST_TP_CD != PSNL"                |
      | "N-4368_CUST_TP_CD =  Null"                |
      | "N-4368_DO_NOT_SOLICIT_F= Y"               |
      | "N-4368_Indv_Brth_Dt Equal to 15"          |
      | "N-4368_Indv_Brth_Dt Equal to Null"        |
      | "N-4368_Indv_Brth_Dt with in range (1-14)" |
      | "N-4368_PRD CD- 01, SUB PRD CD -08"        |
      | "N-4368_PRD CD-02, SUB PRD CD -04"         |
      | "N-4368_PRD CD- 07, SUB PRD CD -08"        |
      | "N-4368_PRD CD-13, SUB PRD CD -12"         |
      | "N-4368_PRD CD- 18, SUB PRD CD -02"        |
      | "N-4368_PRD CD-19, SUB PRD CD -11"         |
      | "N-4368_PRD CD-23, SUB PRD CD -02"         |
      | "N-4368_SRC_ACCT_STAT_CD- B"               |
      | "N-4368_SRC_ACCT_STAT_CD-Null"             |
      | "N-4368_Account Open Date equal to Null"   |
      | "N-4368_Deceased_F= Y"                     |
      | "N-4368_Deceased_F= Null"                  |
      | "N-4368_LANG_CD= K"                        |
      | "N-4368_LANG_CD= NE"                       |
      | "N-4368_LANG_CD= Null"                     |
      | "N-4368_EMPLOYEE_STAFF_F= Y"               |
      | "N-4368_ACCT_SUBSYS_ID_KS"                 |
      | "N-4368_Prv_Bnk_Ind= Null"                 |
      | "N-4368_Prv_Bnk_Ind= Y"                    |
      | "N-4368_PRD CD- 18, SUB PRD CD -01"        |
      | "N-4368_PRD CD- 18, SUB PRD CD -07"        |
      | "N-4368_PRD CD- 18, SUB PRD CD -03"        |


  @D2DEngagementVisaDebit @D2DEngagementVisaDebit_Negative_TestCasesACCT_ODT_Validation  @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement Visa Debit_RS18040_4368_SOL Validate <TestID> Negative TestCase on Acct_odt
  #    Reading data from Excel sheet
    * def testDataFileName = VisaDebittestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

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

    # Verify 4368 offer code should not come in response
    * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
#    * def nbaCode_XML = karate.get('//Offers/NBACode/text()')
#    * match offerCode_Excel != nbaCode_XML


    Examples:
      | TestID                                          |
      | "N-4368_Account Open Date greater than 75 days" |
      | "N-4368_Account Open Date less than 56"         |
      | "N-4368_Account Open Date equals to 55"         |
      | "N-4368_Account Open Date equals to 76"         |