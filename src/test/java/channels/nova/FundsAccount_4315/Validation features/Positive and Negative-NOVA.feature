@CIMCAMP-6290 @PositiveNegative_Validation_4315
Feature: Validate Funds Account_4315 Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @FundsAccount @FundsAccount_Positive_TestCases_Validation_NOVA_4315 @4315 @NOVA @RS18023
  Scenario Outline: Funds Account_RS18022_4315_NOVA Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet

    * def testDataFileName = FundsAccountDataFileName

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
      | TestID                                |
      | "4315_PRIM_CNTRY_CD= CA"              |
      | "4315_CUST_TP_CD=PSNL"                |
      | "4315_DO_NOT_SOLICIT_F=N"             |
      | "4315_DO_NOT_SOLICIT_F=NULL"          |
      | "4315_LANG_CD=E"                      |
      | "4315_LANG_CD=EN"                     |
      | "4315_LANG_CD=F"                      |
      | "4315_LANG_CD=FR"                     |
      | "4315_LANG_CD_lowerCase=e"            |
      | "4315_LANG_CD_lowerCase=en"           |
      | "4315_LANG_CD_lowerCase=f"            |
      | "4315_LANG_CD_lowerCase=fr"           |
      | "4315_INDV_BRTH_DT_Equal to 16"       |
      | "4315_INDV_BRTH_DT_greater than 16"   |
      | "4315_Prv_Bnk_Ind = N"                |
      | "4315_Deceased_F = N"                 |
      | "4315_Employee_Staff_F = N"           |
      | "4315_Employee_Staff_F = NULL"        |
      | "4315_INDV_BRTH_DT_Equal is not NULL" |
      | "4315_PRD CD-01, SUB PRD CD -01"      |
      | "4315_PRD CD-01, SUB PRD CD -02"      |
      | "4315_PRD CD-01, SUB PRD CD -03"      |
      | "4315_PRD CD-01, SUB PRD CD -04"      |
      | "4315_PRD CD-02, SUB PRD CD -01"      |
      | "4315_PRD CD-02, SUB PRD CD -02"      |
      | "4315_PRD CD-02, SUB PRD CD -03"      |
      | "4315_PRD CD-07, SUB PRD CD -11"      |
      | "4315_PRD CD-07, SUB PRD CD -12"      |
      | "4315_PRD CD-13, SUB PRD CD -01"      |
      | "4315_PRD CD-13, SUB PRD CD -03"      |
      | "4315_PRD CD-13, SUB PRD CD -07"      |
      | "4315_PRD CD-13, SUB PRD CD -08"      |
      | "4315_PRD CD-19, SUB PRD CD -01"      |
      | "4315_PRD CD-19, SUB PRD CD -02"      |
      | "4315_PRD CD-19, SUB PRD CD -03"      |
      | "4315_PRD CD-19, SUB PRD CD -04"      |
      | "4315_PRD CD-19, SUB PRD CD -07"      |
      | "4315_PRD CD-19, SUB PRD CD -08"      |
      | "4315_PRD CD-23, SUB PRD CD -01"      |
      | "4315_PRD CD-23, SUB PRD CD -03"      |
      | "4315_SRC_ACCT_STAT_CD = A"           |
      | "4315_ACCT_SUBSYS_ID = BB"            |
      | "4315_ACCT_ODT is  =14 days"          |
      | "4315_ACCT_ODT is  =20 days"          |
      | "4315_ACCT_ODT is  =30 days"          |
      | "4315_CRNT_BAL_AMT is >0"             |


  @FundsAccount @FundsAccount_Negative_TestCases_Validation_4315 @4315 @NOVA @RS18022
  Scenario Outline: Funds Account_RS18022_4315_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = FundsAccountDataFileName

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

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
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                 |
      | "N-4315_PRIM_CNTRY_CD!= CA"                                            |
      | "N-4315_PRIM_CNTRY_CD= NULL"                                           |
      | "N-4315_CUST_TP_CD=Non_PSNL"                                           |
      | "N-4315_CUST_TP_CD=NULL"                                               |
      | "N-4315_DO_NOT_SOLICIT_F=Y"                                            |
      | "N-4315_INDV_BRTH_DT_Less than 16"                                     |
      | "N-4315_INDV_BRTH_DT_Equal = NULL"                                     |
      | "N-4315 - Prv_Bnk_Ind = Y"                                             |
      | "N-4315 - Prv_Bnk_Ind = NULL"                                          |
      | "N-4315_LANG_CD= K"                                                    |
      | "N-4315_LANG_CD= NE"                                                   |
      | "N-4315_LANG_CD= A"                                                    |
      | "N-4315_LANG_CD= RF"                                                   |
      | "N-4315_LANG_CD= NULL"                                                 |
      | "N-4315 - Deceased_F = Y"                                              |
      | "N-4315 - Deceased_F = NULL"                                           |
      | "N-4315 - Employee_Staff_F = Y"                                        |
      | "N-4315_SRC_SYS_PRD_CD =03"                                            |
      | "N-4315_PRD CD-01, SUB PRD CD -05"                                     |
      | "N-4315_PRD CD-02, SUB PRD CD -04"                                     |
      | "N-4315_PRD CD-07, SUB PRD CD -10"                                     |
      | "N-4315_PRD CD-13, SUB PRD CD -02"                                     |
      | "N-4315_PRD CD-18, SUB PRD CD -06"                                     |
      | "N-4315_PRD CD-19, SUB PRD CD -09"                                     |
      | "N-4315_PRD CD-23, SUB PRD CD -04"                                     |
      | "N-4315_SRC_ACCT_STAT_CD = B"                                          |
      | "N-4315_SRC_ACCT_STAT_CD = NULL"                                       |
      | "N-4315_ACCT_SUBSYS_ID = KS"                                           |
      | "N-4315_CRNT_BAL_AMT is NULL"                                          |
      | "N-4315_PRD CD-18, SUB PRD CD -01"                                     |
      | "N-4315_PRD CD-18, SUB PRD CD -03"                                     |
      | "N-4315_PRD CD-18, SUB PRD CD -07"                                     |
      | "N-4315_Account Open Date greater than 30 days"                        |
      | "N-4315_ACCT_ODT is  less than 14 days"                                |
      | "N-4315_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" |
      | "N-4315_CRNT_BAL_AMT is <0"                                            |
      | "N-4315_CRNT_BAL_AMT is =0"                                            |