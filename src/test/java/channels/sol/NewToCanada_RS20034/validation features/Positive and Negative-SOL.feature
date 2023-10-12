Feature: Validate New To Canada-5043 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @NewToCanada @NewToCanada_IH_Validation @5043 @SOL @RS20034
  Scenario Outline: NewTocanada_RS20034_5043_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = NTCtestDataFileName

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTCOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "5043_Validate IH Record fields against Proposition" |

  @NewToCanada @NewToCanada_Positive_TestCases_Validation  @5043 @SOL @RS20034
  Scenario Outline: NewToCanada_RS20034_5043_SOL Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = NTCtestDataFileName
  #    Reading data from Excel sheet
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

#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
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

    * call read('classpath:channels/sol/ReusableScenarios.feature@NTCWelcomeContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                          |
      | "Validating SOL for 5043 - Personal customer"                   |
      | "Validating SOL for 5043 - DNS as N"                            |
      | "Validating SOL for 5043 - DNS as NULL"                         |
      | "Validating SOL for 5043 - Age equal to 18 years"               |
      | "Validating SOL for 5043 - Age greater than 18 years"           |
      | "Validating SOL for 5043 - Marketable Flag as Y"                |
      | "Validating SOL for 5043 - Deceased Flag as N"                  |
      | "Validating SOL for 5043 - Language Code as EN"                 |
      | "Validating SOL for 5043 - Language Code as FR"                 |
      | "Validating SOL for 5043 - Language Code as E"                  |
      | "Validating SOL for 5043 - Language Code as F"                  |
      | "Validating SOL for 5043 - Language Code as small case =en"     |
      | "Validating SOL for 5043 - Language Code as small case =fr"     |
      | "Validating SOL for 5043 - Language Code as small case =e"      |
      | "Validating SOL for 5043 - Language Code as small case =f"      |
      | "Validating SOL for 5043 - IMMGRTN_CAT_CD ! = S"                |
      | "Validating SOL for 5043 - IMMGRTN_CAT_CD is NULL"              |
      | "Validating SOL for 5043 - MCB_IND - Y"                         |
      | "Validating SOL for 5043 - Country Code - CA"                   |
      | "Validating SOL for 5043 - EMPLOYEE_STAFF_F - N"                |
      | "Validating SOL for 5043 - EMPLOYEE_STAFF_F - NULL"             |
      | "Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG = 1"            |
      | "Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE = NTC"        |
      | "Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE = 60th DAY"    |
      | "Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE > 60 and < 70" |
      | "Validating SOL for 5043 - Fee Waiver Expiry Date = 70th DAY"   |
      | "Validating SOL for 5043 - Primary Account Holder - Y"          |
      | "Validating SOL for 5043 - Acct_subsys_id = BB"                 |
      | "Validating SOL for 5043 - Acct_subsys_id = KS"                 |
      | "Validating SOL for 5043 - Acct_subsys_id = AV"                 |

  @NewToCanada @NewToCanada_Negative_TestCases_Validation  @5043 @SOL @RS20043
  Scenario Outline: NewToCanada_RS20034_5043_SOL Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = NTCtestDataFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

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
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML == null

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                   |
      | "N-Validating SOL for 5043 - Non Personal customer"                      |
      | "N-Validating SOL for 5043 - Country Code - other than CA"               |
      | "N-Validating SOL for 5043 - Country Code NULL"                          |
      | "N-Validating SOL for 5043 - DNS as Y"                                   |
      | "N-Validating SOL for 5043 - Age Less than 18 years"                     |
      | "N-Validating SOL for 5043 - Age is NULL"                                |
      | "N-Validating SOL for 5043 - Marketable Flag as N"                       |
      | "N-Validating SOL for 5043 - Marketable Flag as NULL"                    |
      | "N-Validating SOL for 5043 - Deceased Flag as Y"                         |
      | "N-Validating SOL for 5043 - Deceased Flag as NULL"                      |
      | "N-Validating SOL for 5043 - Language Code NE"                           |
      | "N-Validating SOL for 5043 - Language Code K"                            |
      | "N-Validating SOL for 5043 - Language Code NULL"                         |
      | "N-Validating SOL for 5043 - IMMGRTN_CAT_CD is S"                        |
      | "N-Validating SOL for 5043 - IMMGRTN_CAT_CD is S00"                      |
      | "N-Validating SOL for 5043 - MCB_IND - N"                                |
      | "N-Validating SOL for 5043 - MCB_IND - NULL"                             |
      | "N-Validating SOL for 5043 - EMPLOYEE_STAFF_F - Y"                       |
      | "N-Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG - other than 1"        |
      | "N-Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG as NULL"               |
      | "N-Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE - other than NTC"    |
      | "N-Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE as NULL"             |
      | "N-Validating SOL for 5043 - Fee Waiver Expiry Date less than 60 days"   |
      | "N-Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE greater than 70 days" |
      | "N-Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE NULL"                 |
      | "N-Validating SOL for 5043 - Primary Account Holder - N"                 |
      | "N-Validating SOL for 5043 - Primary Account Holder - NULL"              |


  @NewToCanada @NewToCanada_CUST_OPND_DT<7_Negative_TestCases_Validation @5043 @SOL @RS20034
  Scenario Outline: New To Canada_RS20034_5043_SOL Validate <TestID> Negative TestCase CUST_OPND_DT<7 days
    * def testDataFileName = NTCtestDataFileName
  #    Reading data from Excel sheet
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
    * print 'NBAs are'+nbaCode_XML
    * match nbaCode_XML != 'CIE5106'
    * match nbaCode_XML != 'CIE5107'

    Examples:
      | TestID                                                                 |
      | "N-5043_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" |

