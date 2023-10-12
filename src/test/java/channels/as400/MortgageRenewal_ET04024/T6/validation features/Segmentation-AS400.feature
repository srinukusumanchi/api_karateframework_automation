@PositiveNegative_Validation_1430
Feature: Validate Mortgage - Renewal 1430 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @MortgageRENEWAL @Mortgagerenewal_Segmentation_Positive_TestCases_Validation_1430 @1430 @AS400 @4T14061
  Scenario Outline: Mortgage Renewal_1430_ET14061 Validate <TestID> offer displays for Positive Segmentation
    * def testDataFileName = MortgageRenewalFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcctDim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM")
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = karate.get('dataAcctDim.ACCT_NUM')
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


#    Clear IH when it goes to control group
 #   * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                           |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                                        |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                                        |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                                             |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                                             |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_Count <2"                                                                                                                                        |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                                        |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                                        |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                                             |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                                             |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_Count <2"                                                                                                                                        |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                      |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                      |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                           |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                           |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2"                                                                                                                      |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                               |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000"                       |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                               |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000"                       |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT  has Value AND AMORTIZATION_REMAIN Between 6 to 26"                        |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000" |

  @MortgageRenewal @MortgageRenewal_Segmentation_Negative_TestCases_Validation_1430 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewal_ET14061_1430_AS400 Validate <TestID> offer not displays for Negative Segmentation
    * def testDataFileName = MortgageRenewalFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

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
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * match nbaCode_XML == null

    Examples:
      | TestID                                                                                                                                                                                        |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2"                                         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                 |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                                        |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"                                       |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                                       |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"                |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                 |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  = NULL And MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >= 20000 and Count <=2" |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                  |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                 |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                                           |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26"                                                                      |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6"                                                                       |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000"                                   |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2"                                              |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                                           |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26"                                                                      |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6"                                                                       |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000"                                   |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2"                                              |