@VisaDebitAcq_validation_5615
Feature: Validate Visa Debit Acq-5615 Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @VisaVisaDebitAcq @5615 @NOVA @RS21132 @5615_validation_IH_positive
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Validation of IH for positive test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData

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
      | TestID                 |
      | "5615_CUST_TP_CD=PSNL" |


  @VisaVisaDebitAcq @5615 @NOVA @RS21132 @5615_validation_positive
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Validation of positive test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData

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
      | TestID                                                                                                                 |
      | "5615_CUST_TP_CD=PSNL"                                                                                                 |
      | "5615_Primary Country Cd = CA"                                                                                         |
      | "5615_CUST_AGE =16"                                                                                                    |
      | "5615_CUST_AGE >16"                                                                                                    |
      | "5615_LANG_CD in Capital Letter =E"                                                                                    |
      | "5615_LANG_CD in Capital Letter =EN"                                                                                   |
      | "5615_LANG_CD in Capital Letter =F"                                                                                    |
      | "5615_LANG_CD in Capital Letter =FR"                                                                                   |
      | "5615_LANG_CD in Small Letter = e"                                                                                     |
      | "5615_LANG_CD in Small Letter = en"                                                                                    |
      | "5615_LANG_CD in Small Letter = f"                                                                                     |
      | "5615_LANG_CD in Small Letter = fr"                                                                                    |
      | "5615_DO_NOT_SOLICIT_F = N"                                                                                            |
      | "5615_DO_NOT_SOLICIT_F = NULL"                                                                                         |
      | "5615_PRIMARY_ACCT_HOLDER_FLAG=Y"                                                                                      |
      | "5615_MRKTBLE_F = Y"                                                                                                   |
      | "5615_DECEASED_F=N"                                                                                                    |
      | "5615_ACCT_ODT = NULL"                                                                                                 |
      | "5615_ACCT_ODT < 90 and SRC_ACCT_STAT_CD!=A"                                                                           |
      | "5615_INSIGHT_CD = FLG_CC_Online_Purchase_30D and CUST_INSIGHTS.CURR_VAL = 0"                                          |
      | "5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CUST_INSIGHTS.CURR_VAL = 1 and EVENT_DATE = 21 days of current date" |
      | "5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CUST_INSIGHTS.CURR_VAL = 1 and EVENT_DATE < 21 days of current date" |
      | "5615_PROD_HIER_LEVEL_4 = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A"                          |
      | "5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05"               |
      | "5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with 600"                                        |
      | "5615_5615012201_INSIGHT_MOB & SOL LOGIN < 90 DAYS_NO MOBILE WALLET TRANSACTION"                                       |
      | "5615_5615012201_INSIGHT_MOB & SOL LOGIN = 90 DAYS_NO MOBILE WALLET TRANSACTION"                                       |
      | "5615_5615012202_MOB & SOL LOGIN < 90 DAYS_NO MOBILE WALLET TRANSACTION"                                               |
      | "5615_5615012202_MOB & SOL LOGIN = 90 DAYS_NO MOBILE WALLET TRANSACTION"                                               |
      | "5615_5615012203_mob and sol > 90)"                                                                                    |
      | "5615_5615012203_mob and sol = null)"                                                                                  |
      | "5615_5615012203_LAST_APPLE_PAY_TXN_TMSTMP   is NOT null"                                                              |
      | "5615_5615012203_LAST_ANDROID_PAY_TXN_TMSTMP is NOT null"                                                              |
      | "5615_5615012203_LAST_SAMSUNG_PAY_TXN_TMSTMP is NOT null"                                                              |
      | "5615_5615012203_LAST_SCOTIA_PAY_TXN_TMSTMP  is NOT null"                                                              |
      | "5615_LAST_VD_VPOS_TXN_TMSTMP >90 days && LAST_VD_OPOS_TXN_TMSTMP = NULL from current date"                            |
      | "5615_LAST_VD_OPOS_TXN_TMSTMP > 90 days && LAST_VD_VPOS_TXN_TMSTMP =NULL from current date"                            |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN >90 and no mobile wallet transaction"                                  |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN <90 had mobile wallet transaction"                                     |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN =90 had mobile wallet transaction"                                     |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN >90 and no mobile wallet transaction"                                  |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN <90 had mobile wallet transaction"                                     |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN =90 had mobile wallet transaction"                                     |


  @VisaVisaDebitAcq @5615 @NOVA @RS21132 @5615_validation_negative
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Validation of negative test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
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
      | TestID                                                                                                         |
      | "N_5615_CUST_TP_CD!=PSNL"                                                                                      |
      | "N_5615_Primary Country Cd! = CA"                                                                              |
      | "N_5615_Primary Country Cd = NULL"                                                                             |
      | "N_5615_CUST_AGE =15"                                                                                          |
      | "N_5615_CUST_AGE = NULL"                                                                                       |
      | "N_5615_LANG_CD in Capital Letter = K"                                                                         |
      | "N_5615_LANG_CD in Capital Letter = NE"                                                                        |
      | "N_5615_LANG_CD in Capital Letter = NULL"                                                                      |
      | "N_5615_DO_NOT_SOLICIT_F = Y"                                                                                  |
      | "N_5615_MRKTBLE_F = N"                                                                                         |
      | "N_5615_MRKTBLE_F = NULL"                                                                                      |
      | "N_5615_DECEASED_F= Y"                                                                                         |
      | "N_5615_DECEASED_F= NULL"                                                                                      |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=04_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=04_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=07_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=08_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=07_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=08_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=07,SUB_PRD_CD=11_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=07,SUB_PRD_CD=12_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=23,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRD_CD=23,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                             |
      | "N_5615_PRIMARY_ACCT_HOLDER_FLAG = N"                                                                          |
      | "N_5615_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                                       |
      | "N_5615_INSIGHT_CD ! = FLG_CC_Online_Purchase_30D and CURR_VAL = 0"                                            |
      | "N_5615_INSIGHT_CD  = FLG_CC_Online_Purchase_30D and CURR_VAL ! = 0"                                           |
      | "N_5615_INSIGHT_CD != Flg_Visa_Debit_Txn_Last_7D and CURR_VAL = 1 and EVENT_DATE<= 21 days"                    |
      | "N_5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CURR_VAL != 1 and EVENT_DATE<= 21 days"                    |
      | "N_5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CURR_VAL = 1 and EVENT_DATE > 21 days"                     |
      | "N_5615_PROD_HIER_LEVEL_4 ! = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A"              |
      | "N_5615_PROD_HIER_LEVEL_4  = Chequing Accounts AND ACCT_SUBSYS_ID ! = BB AND SRC_ACCT_STAT_CD = A"             |
      | "N_5615_PROD_HIER_LEVEL_4  = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD ! = A"             |
      | "N_5615_ACCT_SUBSYS_ID ! = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05"   |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD ! = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05"   |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD ! = 05 AND SRC_SYS_SUB_PRD_CD = 05"   |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD ! = 05"   |
      | "N_5615_ACCT_SUBSYS_ID ! = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with 600"                            |
      | "N_5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD ! = A and SCD_NUM starts with 600"                            |
      | "N_5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with ! 600"                            |
      | "N_5615_5615012201_Digitally Active and had no mobile wallet transaction and no insight"                       |
      | "N_5615_5615012202_Digitally Active and had no mobile wallet transaction and no insight"                       |
      | "N_5615_5615012201_5615012201_Digitally Active and had no mobile wallet transaction device tp!=ios or android" |
      | "N_5615_5615012203_MOB && SOL_LOGIN >  90 and had mobile wallet transaction and no insight"                    |
      | "N_5615_5615012203_INSIGHT _MOB && SOL_LOGIN = 90 and had no mobile wallet transaction"                        |
      | "N_5615_5615012203_INSIGHT _MOB && SOL_LOGIN < 90 and had no mobile wallet transaction"                        |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP and LAST_VD_OPOS_TXN_TMSTMP > 90 days and had insight"              |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP < 90"                                                               |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP = 90"                                                               |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP < 90"                                                               |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP = 90"                                                               |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP>90 days && LAST_VD_OPOS_TXN_TMSTMP < 90 days"                       |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP>90 days && LAST_VD_VPOS_TXN_TMSTMP < 90 days"                       |


