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


  @MortgageRenewal @MortgageRenewal_IH_Validation_1430 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage RENEWAL_ET14061_1430_AS400 Validate <TestID> IH field values
    * def testDataFileName = MortgageRenewalFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcctDim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM")
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = karate.get('dataAcctDim.ACCT_NUM')
    * print "account number is " + acct_num

    * print "test id is" +TestID

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "1430_Validate IH Record fields against Proposition" |

  @MortgageRENEWAL @Mortgagerenewal_Positive_TestCases_Validation_1430 @1430 @AS400 @4T14061
  Scenario Outline: Mortgage Renewal_1430_ET14061 Validate <TestID> Positive response fields
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
      | TestID                                                                                                                                                   |
      | "AS400_LANG_CD = E"                                                                                                                                      |
      | "AS400_LANG_CD = EN"                                                                                                                                     |
      | "AS400_LANG_CD = F"                                                                                                                                      |
      | "AS400_LANG_CD = FR"                                                                                                                                     |
      | "AS400_LANG_CD_LowerCase = e"                                                                                                                            |
      | "AS400_LANG_CD_LowerCase = en"                                                                                                                           |
      | "AS400_LANG_CD_LowerCase = f"                                                                                                                            |
      | "AS400_LANG_CD_LowerCase = fr"                                                                                                                           |
      | "AS400_CR_RSK_IND != (D,E)"                                                                                                                              |
      | "AS400_CR_RSK_IND = NULL"                                                                                                                                |
      | "AS400_RENEW_LIMITED_F = 0"                                                                                                                              |
      | "AS400_RENEW_LIMITED_F >2"                                                                                                                               |
      | "AS400_CASHBACK_F  = N"                                                                                                                                  |
      | "AS400_CASHBACK_F  = NULL"                                                                                                                               |
      | "AS400_MORT_NOT_FRCLSR_F = Y"                                                                                                                            |
      | "AS400_MORT_NOT_FRCLSR_F = NULL"                                                                                                                         |
      | "AS400_MORT_PB_TRANSIT_REGION = 2"                                                                                                                       |
      | "AS400_MORT_PB_TRANSIT_REGION = 3"                                                                                                                       |
      | "AS400_MORT_PB_TRANSIT_REGION = 4"                                                                                                                       |
      | "AS400_MORT_PB_TRANSIT_REGION = 5"                                                                                                                       |
      | "AS400_MORT_PB_TRANSIT_REGION = 6"                                                                                                                       |
      | "AS400_MORT_PB_TRANSIT_REGION = 7"                                                                                                                       |
      | "AS400_MORT_ARREARS_MONTHS < 0"                                                                                                                          |
      | "AS400_INTEREST_RATE = 0"                                                                                                                                |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN"                                                                          |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS"                                                            |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS < 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS"                                                            |
      | "AS400_MORT_FUND_CODE !=(1900, 1901, 1902, 1912, 1916, 1922)"                                                                                            |
      | "AS400_MORT_FUND_CODE !=(1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600) and SERV_TRNST_NUM != 12088"                                   |
      | "AS400_MORT_COMM_TYPE = Residential"                                                                                                                     |
      | "AS400_ACCT_NUM = 23 Digit Numeric Value"                                                                                                                |
      | "AS400_IP_AR_RELATN_TYPE_CD = SOL"                                                                                                                       |
      | "AS400_IP_AR_RELATN_TYPE_CD = BOR"                                                                                                                       |
      | "AS400_ACCT_SUBSYS_ID = UO"                                                                                                                              |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2"                     |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  =26 and CRNT_BAL_AMT >=20000 and Count <=2"                     |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >20000 and Count <=2"                     |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT =20000 and Count <=2"                     |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <2"                     |
      | "AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6"                         |
      | "AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000" |
      | "CoBorrower_AS400_NONSOL_BANKRUPTCY_DT= NULL_COB"                                                                                                        |
      | "CoBorrower_AS400_NONSOL_BANKRUPTCY_DT= NULL_COS"                                                                                                        |
      | "AS400_NONSOL_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower"                                                                          |
      | "AS400_NONSOL_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower"                                                                          |
      | "AS400_Deceased_F = N for COB"                                                                                                                           |
      | "AS400_Deceased_F = N for COS"                                                                                                                           |
      | "AS400_T6_NONSOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count=2"                                                                                       |
      | "AS400_T6_SOL_MOB_LAST_LOGIN_DT_Count=2"                                                                                                                 |
      | "AS400_T6_SOL_SOL_LAST_LOGIN_DT_Count=2"                                                                                                                 |
      | "AS400_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2"                                                                                               |
      | "AS400_T6_SOLX_MOB_LAST_LOGIN_DT_Count>2"                                                                                                                |
      | "AS400_T6_SOLX_SOL_LAST_LOGIN_DT_Count>2"                                                                                                                |
      | "AS400_T6_SOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"                                                                                              |
      | "AS400_T6_NONSOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2"                                                                                      |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1"                                                          |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1"                                                          |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1"                                                              |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1"                                                              |

  @MortgageRenewal @MortgageRenewal_Negative_TestCases_Validation_1430 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewal_ET14061_1430_AS400 Validate <TestID> Negative response fields
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
      | TestID                                                                                                                                                      |

      | "N-AS400_Primary Customer_BANKRUPTCY_DT != NULL_SOL"                                                                                                        |
      | "N-AS400_Primary Customer_BANKRUPTCY_DT != NULL_BOR"                                                                                                        |
      | "N-AS400_CUST_TP_CD != PSNL"                                                                                                                                |
      | "N-AS400_CUST_TP_CD = NULL"                                                                                                                                 |
      | "N-AS400_Deceased_F = Y"                                                                                                                                    |
      | "N-AS400_Deceased_F = NULL"                                                                                                                                 |
      | "N-AS400_LANG_CD = K"                                                                                                                                       |
      | "N-AS400_LANG_CD = NE"                                                                                                                                      |
      | "N-AS400_LANG_CD = NULL"                                                                                                                                    |
      | "N-AS400_CR_RSK_IND = D"                                                                                                                                    |
      | "N-AS400_CR_RSK_IND = E"                                                                                                                                    |
      | "N-AS400_RENEW_LIMITED_F = 1"                                                                                                                               |
      | "N-AS400_RENEW_LIMITED_F = 2"                                                                                                                               |
      | "N-AS400_CASHBACK_F  = Y"                                                                                                                                   |
      | "N-AS400_MORT_NOT_FRCLSR_F = N"                                                                                                                             |
      | "N-AS400_SRC_SYS_PRD_CD = 911"                                                                                                                              |
      | "N-AS400_SRC_SYS_PRD_CD = 931"                                                                                                                              |
      | "N-AS400_SRC_SYS_PRD_CD = 951"                                                                                                                              |
      | "N-AS400_INTEREST_RATE < 0"                                                                                                                                 |
      | "N-AS400_AMORTIZATION_REMAIN < 6"                                                                                                                           |
      | "N-AS400_MORT_PB_TRANSIT_REGION!= (2,3,4,5,6,7)"                                                                                                            |
      | "N-AS400_MORT_ARREARS_MONTHS > 0"                                                                                                                           |
      | "N-AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL"                                                                                                         |
      | "N-AS400_MORT_FUND_CODE = 1901"                                                                                                                             |
      | "N-AS400_MORT_FUND_CODE = 1902"                                                                                                                             |
      | "N-AS400_MORT_FUND_CODE = 1912"                                                                                                                             |
      | "N-AS400_MORT_FUND_CODE = 1916"                                                                                                                             |
      | "N-AS400_MORT_FUND_CODE = 1922"                                                                                                                             |
      | "N-AS400_MORT_FUND_CODE = 1904 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         |
      | "N-AS400_MORT_FUND_CODE = 1905 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         |
      | "N-AS400_MORT_FUND_CODE = 1910 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         |
      | "N-AS400_MORT_FUND_CODE = 1924 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         |
      | "N-AS400_SRC_ACCT_STAT_CD = NULL"                                                                                                                           |
      | "N-AS400_SRC_ACCT_STAT_CD = OPEN"                                                                                                                           |
      | "N-AS400_MORT_COMM_TYPE != Residential"                                                                                                                     |
      | "N-AS400_MORT_COMM_TYPE = NULL"                                                                                                                             |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = BLANK"                                                                                                                      |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = NULL"                                                                                                                       |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = Zero"                                                                                                                       |
      | "N-AS400_ACCT_SUBSYS_ID != UO"                                                                                                                              |
      | "N-AS400_INDV_FRST_NM = NULL"                                                                                                                               |
      | "N-AS400_INDV_LAST_NM = NULL"                                                                                                                               |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"             |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                    |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2"                    |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has some value and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6"                       |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN > 26"                                                   |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN < 6"                                                    |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT > 20000" |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And Count < 2"            |
      | "N-AS400_MAT_DT - Current Date >6"                                                                                                                          |
      | "N-CoBorrower_AS400_NONSOL_BANKRUPTCY_DT=! NULL_COB"                                                                                                        |
      | "N-CoBorrower_AS400_NONSOL_BANKRUPTCY_DT=! NULL_COS"                                                                                                        |
      | "N-AS400_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB"                                                                                   |
      | "N-AS400_Deceased_F = Y for COB"                                                                                                                            |
      | "N-AS400_Deceased_F = Y for COS"                                                                                                                            |
      | "N-AS400_T6_SOL_MOB_LAST_LOGIN_DT_Count>2"                                                                                                                  |
      | "N-AS400_T6_SOL_SOL_LAST_LOGIN_DT_Count>2"                                                                                                                  |
      | "N-AS400_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"                                                                                                |
      | "N-AS400_T6_SOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2"                                                                                          |
      | "N-AS400_T6_NONSOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2"                                                                                        |