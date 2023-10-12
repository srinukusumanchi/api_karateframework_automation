@CIEPROG-50 @PositiveNegative_Validation_4658
Feature: Validate D2D Engagement Welcome-Ultimate-4658 Disposition and Suppression test cases

  Background: Common for SOL Positive and Negative

  # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @D2DWelcome @D2DEngagementWelcomeUltimate_IH_Validation @4658 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-Ultimate_RS17103_4658_SOL Validate <TestID> IH field values against proposition data
  # Reading data from Excel sheet
    * def testDataFileName = WelcometestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string outcome = 'PST'
    * print 'Channel outcome is '+outcome
    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
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
  #    Verifying Sucess with status code 200
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
      | "4658_Validate IH Record fields against Proposition" |

  @D2DWelcome @D2DEngagementWelcomeUltimate_Positive_TestCases_Validation @4658 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-Ultimate_RS17103_4658_SOL Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = WelcometestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID'+cid

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

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                |
      | "4658_DO_NOT_SOLICIT_F= Null"                         |
      | "4658_INDV_BRTH_DT_Equal to 16"                       |
      | "4658_LANG_CD=E"                                      |
      | "4658_LANG_CD=EN"                                     |
      | "4658_LANG_CD=F"                                      |
      | "4658_LANG_CD=FR"                                     |
      | "4658_LANG_CD_LowerCase=e"                            |
      | "4658_LANG_CD_LowerCase=en"                           |
      | "4658_LANG_CD_LowerCase=f"                            |
      | "4658_LANG_CD_LowerCase=fr"                           |
      | "4658_EMPLOYEE_STAFF_F=NULL"                          |
      | "4658_PRD CD- 23, SUB PRD CD -01"                     |
      | "4658_PRD CD- 23, SUB PRD CD -03"                     |
      | "4658_Account Open Date equal to 30 days"             |
      | "4658_Multiple BB Accounts for Account -1 4658 offer" |

  @D2DWelcome @D2DEngagementWelcomeUltimate_Negative_TestCases_Validation @4658 @SOL @RS17103

  Scenario Outline: D2D Engagement Welcome-Ultimate_RS17103_4658_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = WelcometestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

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
  #    Verifying Sucess with status code 200
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
      | "N-4658_PRIM_CNTRY_CD!= CA"                |
      | "N-4658_PRIM_CNTRY_CD= Null"               |
      | "N-4658_CUST_TP_CD != PSNL"                |
      | "N-4658_CUST_TP_CD =  Null"                |
      | "N-4658_DO_NOT_SOLICIT_F= Y"               |
      | "N-4658_Indv_Brth_Dt Equal to 15"          |
      | "N-4658_Indv_Brth_Dt Equal to Null"        |
      | "N-4658_Indv_Brth_Dt with in range (1-14)" |
      | "N-4658_PRD CD- 23, SUB PRD CD -02"        |
      | "N-4658_PRD CD-22, SUB PRD CD -03"         |
      | "N-4658_SRC_ACCT_STAT_CD- B"               |
      | "N-4658_SRC_ACCT_STAT_CD-Null"             |
      | "N-4658_Account Open Date equal to Null"   |
      | "N-4658_Deceased_F= Y"                     |
      | "N-4658_Deceased_F= Null"                  |
      | "N-4658_LANG_CD= K"                        |
      | "N-4658_LANG_CD= NE"                       |
      | "N-4658_LANG_CD= A"                        |
      | "N-4658_LANG_CD= RF"                       |
      | "N-4658_LANG_CD= Null"                     |
      | "N-4658_EMPLOYEE_STAFF_F= Y"               |
      | "N-4658_ACCT_SUBSYS_ID_KS"                 |
      | "N-4658_Prv_Bnk_Ind= Null"                 |
      | "N-4658_Prv_Bnk_Ind= Y"                    |

  @D2DWelcome @D2DEngagementWelcomeUltimate_ACCTODT>30_Negative_TestCases_Validation @4658 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-Ultimate_RS17103_4658_SOL Validate <TestID> Negative TestCase acct odt>30 days
  #    Reading data from Excel sheet
    * def testDataFileName = WelcometestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode_Excel = karate.get('data.NBACode')

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
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

    # Verify 4334 offer code should not come in response
    * def nbaCode_XML = karate.get('//Offers/NBACode/text()')
    * match offerCode_Excel != nbaCode_XML


    Examples:
      | TestID                                          |
      | "N-4658_Account Open Date greater than 30 days" |

  @D2DWelcome @D2DEngagementWelcomeUltimate_CUST_OPND_DT<7_Negative_TestCases_Validation @4658 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-Ultimate_RS17103_4658_SOL Validate <TestID> Negative TestCase CUST_OPND_DT<7 days
  #    Reading data from Excel sheet
    * def testDataFileName = WelcometestDataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

     #  Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

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
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #  It clears Result fields
    * clearResultFields()

    # Verify 4330 offer code should not come in response
    * def nbaCode_XML = karate.get('//Offers/NBACode/text()')
    * match nbaCode_XML != 'CIE5106'
    * match nbaCode_XML != 'CIE5107'

    Examples:
      | TestID                                                                 |
      | "N-4658_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" |