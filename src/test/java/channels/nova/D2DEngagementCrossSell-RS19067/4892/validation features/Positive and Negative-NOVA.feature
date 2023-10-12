@NOVA_CrossSell_PositiveNegative_Validation_4892
Feature: Validate NOVA CrossSell  Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @CrossSell_Nova @CrossSell_Nova_IH_Validation_4892 @4892 @NOVA @RS19067
  Scenario Outline: CrossSell_NOVA_RS19067_4892_NOVA Validate <TestID> IH field values against proposition data
    * def testDataFileName = CrossSellNOVAtestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellNovaOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
#      | "4892_Validate IH Record fields against Proposition" |

  @CrossSellNova @CrossSell_Positive_TestCases_Validation_NOVA_4892 @4892 @NOVA @AUTOTESTTOTAL#22
  Scenario Outline: CrossSell_Ultimate_4892_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = CrossSellNOVAtestDataFileName

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                        |
#      | "4892_ISSUE = CrossSell and Group = Investment"                               |
#      | "4892_DO_NOT_SOLICIT_F= Null"                                                 |
#      | "4892_INDV_BRTH_DT_Equal to 18"                                               |
#      | "4892_LANG_CD=E"                                                              |
#      | "4892_LANG_CD=EN"                                                             |
#      | "4892_LANG_CD=F"                                                              |
#      | "4892_LANG_CD=FR"                                                             |
#      | "4892_LANG_CD_LowerCase=e"                                                    |
#      | "4892_LANG_CD_LowerCase=en"                                                   |
#      | "4892_LANG_CD_LowerCase=f"                                                    |
#      | "4892_LANG_CD_LowerCase=fr"                                                   |
#      | "4892_PRD CD- 13, SUB PRD CD -01"                                             |
#      | "4892_PRD CD- 13, SUB PRD CD -03"                                             |
#      | "4892_PRD CD- 13, SUB PRD CD -07"                                             |
#      | "4892_PRD CD- 13, SUB PRD CD -08"                                             |
#      | "4892_Account Open Date equal to 28 days"                                     |
#      | "4892_Account Open Date equal to 58 days"                                     |
#      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1301_4892111901"                          |
#      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1301_4892111901"                          |
#      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1301_4892111901"                      |
#      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1303_4892111901"                          |
#      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1303_4892111901"                          |
#      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1303_4892111901"                      |
#      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1307_4892111901"                          |
#      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1307_4892111901"                          |
#      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1307_4892111901"                      |
#      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1308_4892111901"                          |
#      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1308_4892111901"                          |
#      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1308_4892111901"                      |
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=01"          |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=01"        |
#      | "4892_N-NTC_MCB=N_Arrival Date greater than 3 years_PRD CD=13_SUB PRD CD=03"  |
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=03"          |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=07"        |
#      | "4892_N-NTC_MCB=Y_Arrival Date  greater than 3 years_PRD CD=13_SUB PRD CD=07" |
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=08"          |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=08"        |
#      | "N-4892_ARRV_DT = 5 years"                                                    |
      | "N-4892_ARRV_DT > 5 years"                                           |
#      | "N-4892_MCB_IND = NULL"                                                       |
#      | "N-4892_Account>1"                                                            |
#      | "N-4892_MultipleAccounts_Active_Non-Active"                                   |
#      | "N-4892_ARRV_DT_eq_NULL"                                                    |

  @CrossSell_Nova @CrossSell_Negative_TestCases_Validation_4892 @4892 @NOVA @AUTOTESTTOTAL#36
  Scenario Outline: CrossSell_Ultimate_4892_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = CrossSellNOVAtestDataFileName

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
      | TestID                                          |
      | "N-4892_PRIM_CNTRY_CD!= CA"                     |
      | "N-4892_PRIM_CNTRY_CD= Null"                    |
      | "N-4892_CUST_TP_CD != PSNL"                     |
#      | "N-4892_CUST_TP_CD =  Null"                     |
      | "N-4892_DO_NOT_SOLICIT_F= Y"                    |
      | "N-4892_Indv_Brth_Dt Equal to 17"               |
      | "N-4892_Indv_Brth_Dt Equal to Null"             |
      | "N-4892_Indv_Brth_Dt with in range (1-16)"      |
      | "N-4892_PRD CD- 01, SUB PRD CD -08"             |
      | "N-4892_PRD CD-02, SUB PRD CD -04"              |
      | "N-4892_PRD CD- 07, SUB PRD CD -08"             |
      | "N-4892_PRD CD-13, SUB PRD CD -12"              |
      | "N-4892_PRD CD- 18, SUB PRD CD -02"             |
      | "N-4892_PRD CD-19, SUB PRD CD -11"              |
      | "N-4892_PRD CD-23, SUB PRD CD -02"              |
      | "N-4892_SRC_ACCT_STAT_CD- B"                    |
      | "N-4892_SRC_ACCT_STAT_CD-Null"                  |
      | "N-4892_Account Open Date greater than 58 days" |
      | "N-4892_Account Open Date equal to Null"        |
      | "N-4892_Account Open Date less than 28"         |
      | "N-4892_Account Open Date equal to 27"          |
      | "N-4892_Account Open Date equal to 59"          |
      | "N-4892_Deceased_F= Y"                          |
      | "N-4892_Deceased_F= Null"                       |
      | "N-4892_LANG_CD= K"                             |
      | "N-4892_LANG_CD= NE"                            |
      | "N-4892_LANG_CD= Null"                          |
      | "N-4892_EMPLOYEE_STAFF_F= Y"                    |
      | "N-4892_ACCT_SUBSYS_ID_KS"                      |
      | "N-4892_Prv_Bnk_Ind= Null"                      |
      | "N-4892_Prv_Bnk_Ind= Y"                         |
      | "N-4892_MRKTBLE_F = N"                          |
      | "N-4892_MRKTBLE_F = NULL"                       |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1301_4892111901"    |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1303_4892111901"    |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1307_4892111901"    |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1308_4892111901"    |

#20July 2023 Release
  @CrossSellNova @CrossSell_ExternalTableExclusion_Positive_TestCases_Validation_NOVA_4892 @4892 @NOVA @AUTOTESTTOTAL#22
  Scenario Outline: CrossSell_Ultimate_4892_NOVA Validate <TestID> External Table Exclusion Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = CrossSellNOVAtestDataFileName

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                              |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     |

  @CrossSell_Nova @CrossSell_ExternalTableExclusion_Negative_TestCases_Validation_NOVA_4892 @4892 @NOVA @AUTOTESTTOTAL#36
  Scenario Outline: CrossSell_Ultimate_4892_NOVA Validate <TestID> External Table Exclusion Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = CrossSellNOVAtestDataFileName

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
      | TestID                                                            |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"   |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"   |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt" |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt" |


