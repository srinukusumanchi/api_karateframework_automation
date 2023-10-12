@NTCCredit_validation_5619
Feature: Validate NTC Credit Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @NTCCredit_NOVA @5619 @NOVA @RS2098A @5619_validation_IH_positive
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Validation of IH for positive test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCCreditNovaTestData

  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

  # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@NTCCreditHistoryOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                   |
#      | "5619_NOVA_Customer Not Deceased"                        |

  @NTCCredit_NOVA @5619 @NOVA @RS2098A @5619_validation_positive @AUTOTESTTTAL#17
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Validation of positive test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCCreditNovaTestData

  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

  # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                   |
#      | "5619_NOVA_Customer Not Deceased"                        |
#      | "5619_NOVA_CUST_AGE=18"                                  |
#      | "5619_NOVA_LANG_CD=E"                                    |
#      | "5619_NOVA_LANG_CD=EN"                                   |
#      | "5619_NOVA_LANG_CD=e_LowerCase"                          |
#      | "5619_NOVA_LANG_CD=en_LowerCase"                         |
#      | "5619_NOVA_DO_NOT_SOLICIT_F=NULL"                        |
#      | "5619_NOVA_MCB_IND = Y"                                  |
      | "5619_NOVA_ARR_DT LT 5 years"                            |
#      | "5619_NOVA_13_01"                                        |
#      | "5619_NOVA_13_03"                                        |
#      | "5619_NOVA_13_07"                                        |
#      | "5619_NOVA_13_08"                                        |
#      | "5619_NOVA_07_11"                                        |
#      | "5619_NOVA_07_12"                                        |
#      | "5619_NOVA_Acct_Odt_GE_30_TO_LE_60"                      |
#      | "5619_NOVA_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A" |
      | "5619_NOVA_ARR_DT_eq_5years"    |


  @NTCCredit_NOVA @5619 @NOVA @RS2098A @5619_validation_negative @AUTOTESTTOTAL#38
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Validation of negative test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCCreditNovaTestData
  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

  # Tt clears Result fields
    * clearResultFields()

  # Validating error response
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                            |
#      | "N-5619_NOVA_2_BBAccounts_0711_0201"              |
#      | "N-5619_NOVA_2_BBAccounts_1301_0101"              |
#      | "N-5619_NOVA_Deceased=Y"                          |
#      | "N-5619_NOVA_Deceased=NULL"                       |
#      | "N-5619_NOVA_CUST_TP_CD!=PSNL"                    |
#      | "N-5619_NOVA_PRIM_CNTRY_CD!=CA"                   |
#      | "N-5619_NOVA_PRIM_CNTRY_CD=NULL"                  |
#      | "N-5619_NOVA_CUST_AGE=NULL"                       |
#      | "N-5619_NOVA_CUST_AGE<18"                         |
#      | "N-5619_NOVA_LANG_CD=G"                           |
#      | "N-5619_NOVA_LANG_CD=NULL"                        |
#      | "N-5619_NOVA_DO_NOT_SOLICIT_F=Y"                  |
#      | "N-5619_NOVA_MRKTBLE_F=N"                         |
#      | "N-5619_NOVA_MRKTBLE_F=NULL"                      |
#      | "N-5619_NOVA_MCB_IND = N"                         |
#      | "N-5619_NOVA_MCB_IND = NULL"                      |
#      | "N-5619_NOVA_ARR_DT GT 5 years"                   |
      | "N-5619_NOVA_ARR_DT_1827days" |
#      | "N-5619_NOVA_ACCT_SUBSYS_ID!=BB"                  |
#      | "N-5619_NOVA_SRC_ACCT_STAT_CD!=A"                 |
#      | "N-5619_NOVA_ACCT_ODT < 30 days"                  |
#      | "N-5619_NOVA_ACCT_ODT > 60 days"                  |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=01" |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=02" |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=03" |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=04" |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=01" |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=02" |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=03" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=01" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=02" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=03" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=04" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=07" |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=08" |
#      | "N-5619_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=01" |
#      | "N-5619_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=03" |
#      | "N-5619_NOVA_SRC_PRD_CD=13 and SRC_SUB_PRD_CD=02" |
#      | "N-5619_NOVA_SRC_PRD_CD=07 and SRC_SUB_PRD_CD=01" |
#      | "N-5619_NOVA_ARR_DT_eq_NULL"    |
