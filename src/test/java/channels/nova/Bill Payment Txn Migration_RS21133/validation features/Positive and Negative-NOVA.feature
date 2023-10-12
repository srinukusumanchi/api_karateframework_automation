@BillPaymentTxn_validation_5616
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4480 Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @BillPaymentTxnMigration @5616 @NOVA @RS21133 @5616_validation_IH_positive
  Scenario Outline: Bill Payment Txn Migration_RS21133_5616_NOVA Validation of IH for positive test cases
  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = BillPaymentTxnNOVATestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestOfferValidationWithIH')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                        |
      | "5616_CUST_TP_CD=PSNL"                                        |

  @BillPaymentTxnMigration @5616 @NOVA @RS21133 @5616_validation_positive
  Scenario Outline: Bill Payment Txn Migration_RS21133_5616_NOVA Validation of positive test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = BillPaymentTxnNOVATestData

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
      | TestID                                                        |
      | "5616_CUST_TP_CD=PSNL"                                        |
      | "5616_Primary Country Cd = CA(KS Acc_<90 days)"               |
      | "5616_CUST_AGE =18(AC Acc_<90 days)"                          |
      | "5616_CUST_AGE >18(KS Acc_ODT>90 days)"                       |
      | "5616_LANG_CD in Capital Letter =E(AC Acc_ODT>90 days)"       |
      | "5616_LANG_CD in Capital Letter =EN"                          |
      | "5616_LANG_CD in Capital Letter =F"                           |
      | "5616_LANG_CD in Capital Letter =FR"                          |
      | "5616_LANG_CD in Small Letter = e"                            |
      | "5616_LANG_CD in Small Letter = en"                           |
      | "5616_LANG_CD in Small Letter = f"                            |
      | "5616_LANG_CD in Small Letter = fr"                           |
      | "5616_DO_NOT_SOLICIT_F = N"                                   |
      | "5616_DO_NOT_SOLICIT_F = NULL"                                |
      | "5616_MRKTBLE_F = Y"                                          |
      | "5616_DECEASED_F=N"                                           |
      | "5616_MOB_LAST_LOGIN_DT = 90 days"                            |
      | "5616_SOL_LAST_LOGIN_DT = 90 days"                            |
      | "5616_MOB_LAST_LOGIN_DT < 90 days"                            |
      | "5616_SOL_LAST_LOGIN_DT < 90 days"                            |
      | "5616_MOB_LAST_LOGIN_DT > 90 days"                            |
      | "5616_SOL_LAST_LOGIN_DT > 90 days"                            |
      | "5616_MOB_SOL_LAST_LOGIN_DT = NULL"                           |
      | "5616_MOB_SOL_LAST_LOGIN_DT > 90 days"                        |
      | "5616_ACCT_ODT = NULL"                                        |
      | "5616_CUST_INSIGHTS.INSIGHT_CD = FLG_Bill_Payment_Prediction" |
      | "5616_CUST_INSIGHTS.CURR_VAL = 1"                             |
      | "5616_EVENT_DATE - Current Date =7 days"                      |
      | "5616_EVENT_DATE - Current Date < 7 days"                     |
      | "5616_ACCT_ODT < 90_Inactive"                                 |

  @BillPaymentTxnMigration @5616 @NOVA @RS21133 @5616_validation_negative
  Scenario Outline: Bill Payment Txn Migration_RS21133_5616_NOVA Validation of negative test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = BillPaymentTxnNOVATestData
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
      | TestID                                                           |
      | "N_5616_CUST_TP_CD!=PSNL"                                        |
      | "N_5616_Primary Country Cd! = CA"                                |
      | "N_5616_Primary Country Cd = NULL"                               |
      | "N_5616_CUST_AGE =17"                                            |
      | "N_5616_CUST_AGE = NULL"                                         |
      | "N_5616_LANG_CD in Capital Letter = K"                           |
      | "N_5616_LANG_CD in Capital Letter = NE"                          |
      | "N_5616_LANG_CD in Capital Letter = NULL"                        |
      | "N_5616_DO_NOT_SOLICIT_F = Y"                                    |
      | "N_5616_MRKTBLE_F = N"                                           |
      | "N_5616_MRKTBLE_F = NULL"                                        |
      | "N_5616_DECEASED_F= Y"                                           |
      | "N_5616_DECEASED_F= NULL"                                        |
      | "N_5616_PRD_CD=01,SUB_PRD_CD=01_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=01,SUB_PRD_CD=02_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=01,SUB_PRD_CD=03_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=01,SUB_PRD_CD=04_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=02,SUB_PRD_CD=01_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=02,SUB_PRD_CD=02_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=02,SUB_PRD_CD=03_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=01_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=02_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=03_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=04_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=07_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=19,SUB_PRD_CD=08_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=13,SUB_PRD_CD=01_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=13,SUB_PRD_CD=03_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=13,SUB_PRD_CD=07_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=13,SUB_PRD_CD=08_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=07,SUB_PRD_CD=11_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=07,SUB_PRD_CD=12_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=23,SUB_PRD_CD=01_ACCT_ODT<=90 days"               |
      | "N_5616_PRD_CD=23,SUB_PRD_CD=03_ACCT_ODT<=90 days"               |
      | "N_5616_CUST_INSIGHTS.INSIGHT_CD! = FLG_Bill_Payment_Prediction" |
      | "N_5616_CUST_INSIGHTS.CURR_VAL! = 1"                             |
      | "N_5616_EVENT_DATE - Current Date > days"                        |

