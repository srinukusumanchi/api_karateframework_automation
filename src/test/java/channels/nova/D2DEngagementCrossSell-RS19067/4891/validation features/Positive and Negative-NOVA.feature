@NOVA_CrossSell_PositiveNegative_Validation_4891
Feature: Validate NOVA CrossSell  Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @CrossSell_Nova @CrossSell_Nova_IH_Validation_4891 @4891 @NOVA @RS19067
  Scenario Outline: CrossSell_NOVA_RS19067_4891_NOVA Validate <TestID> IH field values against proposition data
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
      | "4891_Validate IH Record fields against Proposition" |

  @CrossSellNova @CrossSell_Positive_TestCases_Validation_NOVA_4891 @4891 @NOVA @AUTOTESTTOTAL#22
  Scenario Outline: CrossSell_Ultimate_4891_NOVA Validate <TestID> Positive TestCases Response Fields

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


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
      | TestID                                                                                                                      |
#      | "4891_ISSUE = CrossSell and Group = Investment"                                                                             |
      | "4891_DO_NOT_SOLICIT_F= Null"                                                                                               |
#      | "4891_INDV_BRTH_DT_Equal to 18"                                                                                             |
#      | "4891_LANG_CD=E"                                                                                                            |
#      | "4891_LANG_CD=EN"                                                                                                           |
#      | "4891_LANG_CD=F"                                                                                                            |
#      | "4891_LANG_CD=FR"                                                                                                           |
#      | "4891_LANG_CD_LowerCase=e"                                                                                                  |
#      | "4891_LANG_CD_LowerCase=en"                                                                                                 |
#      | "4891_LANG_CD_LowerCase=f"                                                                                                  |
#      | "4891_LANG_CD_LowerCase=fr"                                                                                                 |
#      | "4891_PRD CD- 23, SUB PRD CD -01"                                                                                           |
#      | "4891_PRD CD- 23, SUB PRD CD -03"                                                                                           |
#      | "4891_Account Open Date equal to 28 days"                                                                                   |
#      | "4891_Account Open Date equal to 58 days"                                                                                   |
#      | "4891_BANKRUPTCY_DT-NULL"                                                                                                   |
#      | "4891_MPSA_Prod_CD_BBB_UltimateAcc_2301_4891111901"                                                                         |
#      | "4891_MPSA_SubSysId_AB_UltimateAcc_2301_4891111901"                                                                         |
#      | "4891_MPSA_Status_InActive_UltimateAcc_2301_4891111901"                                                                     |
#      | "4891_MPSA_Prod_CD_BBB_UltimateAcc_2303_4891111901"                                                                         |
#      | "4891_MPSA_SubSysId_AB_UltimateAcc_2303_4891111901"                                                                         |
#      | "4891_MPSA_Status_InActive_UltimateAcc_2303_4891111901"                                                                     |
#      | "4891_NTC_MCB=Y_Arrival Date within 3 years"                                                                                |
#      | "4891_EMPLOYEE_STAFF_F= Y"                                                                                                  |
#      | "4891_Prv_Bnk_Ind= Null"                                                                                                    |
#      | "4891_Prv_Bnk_Ind= Y"                                                                                                       |
#      | "4891_EMPLOYEE_STAFF_F= N"                                                                                                  |
#      | "4891_EMPLOYEE_STAFF_F= NULL"                                                                                               |
#      | "4891_Prv_Bnk_Ind= N"                                                                                                       |
#      | "4891_NOT_AML_KYC !=Y"                                                                                                      |
#      | "4891_NOT_AML_KYC = NULL"                                                                                                   |
#      | "4891_ACCT_SUBSYS_ID != SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"   |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD != Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"   |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = NULL and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"      |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD != 9  and Current Date - ACCT_ODT <= 6 months"   |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = NULL  and Current Date - ACCT_ODT <= 6 months" |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT > 6 months"     |
#      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT = NULL"         |


  @CrossSell_Nova @CrossSell_Negative_TestCases_Validation_4891 @4891 @NOVA @AUTOTESTTOTAL#36
  Scenario Outline: CrossSell_Ultimate_4891_NOVA Validate <TestID> Negative TestCases Response Fields
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
      | TestID                                                                                                                    |
      | "N-4891_PRIM_CNTRY_CD!= CA"                                                                                               |
      | "N-4891_PRIM_CNTRY_CD= Null"                                                                                              |
      | "N-4891_CUST_TP_CD != PSNL"                                                                                               |
      | "N-4891_DO_NOT_SOLICIT_F= Y"                                                                                              |
      | "N-4891_Indv_Brth_Dt Equal to 17"                                                                                         |
      | "N-4891_Indv_Brth_Dt Equal to Null"                                                                                       |
      | "N-4891_Indv_Brth_Dt with in range (1-16)"                                                                                |
      | "N-4891_PRD CD- 01, SUB PRD CD -08"                                                                                       |
      | "N-4891_PRD CD-02, SUB PRD CD -04"                                                                                        |
      | "N-4891_PRD CD- 07, SUB PRD CD -08"                                                                                       |
      | "N-4891_PRD CD-13, SUB PRD CD -12"                                                                                        |
      | "N-4891_PRD CD- 18, SUB PRD CD -02"                                                                                       |
      | "N-4891_PRD CD-19, SUB PRD CD -11"                                                                                        |
      | "N-4891_PRD CD-23, SUB PRD CD -02"                                                                                        |
      | "N-4891_SRC_ACCT_STAT_CD- B"                                                                                              |
      | "N-4891_SRC_ACCT_STAT_CD-Null"                                                                                            |
      | "N-4891_Account Open Date greater than 58 days"                                                                           |
      | "N-4891_Account Open Date equal to Null"                                                                                  |
      | "N-4891_Account Open Date less than 28"                                                                                   |
      | "N-4891_Account Open Date equals to 27"                                                                                   |
      | "N-4891_Account Open Date equals to 59"                                                                                   |
      | "N-4891_Deceased_F= Y"                                                                                                    |
      | "N-4891_Deceased_F= Null"                                                                                                 |
      | "N-4891_LANG_CD= K"                                                                                                       |
      | "N-4891_LANG_CD= NE"                                                                                                      |
      | "N-4891_LANG_CD= Null"                                                                                                    |
      | "N-4891_ACCT_SUBSYS_ID_KS"                                                                                                |
      | "N-4891_MRKTBLE_F = N"                                                                                                    |
      | "N-4891_MRKTBLE_F = NULL"                                                                                                 |
      | "N-4891_BANKRUPTCY_DT is 2020-09-14"                                                                                      |
      | "N-4891_MPSA_Y_UltimateAcc_2301_4891111901"                                                                               |
      | "N-4891_MPSA_Y_UltimateAcc_2303_4891111901"                                                                               |
      | "N-4891_NOT_AML_KYC = Y"                                                                                                  |
      | "N-4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT < 6 months" |
      | "N-4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT = 6 months" |
      | "N_4891_HAS_CLOSED_MPSA_F_Null"                                                                                           |
      | "N_4891_HAS_CLOSED_MPSA_F_Y"                                                                                              |


  #20July 2023 Release
  @CrossSellNova @CrossSell_ExternalTableExclusion_Positive_TestCases_Validation_NOVA_4891 @4891 @NOVA @AUTOTESTTOTAL#22
  Scenario Outline: CrossSell_Ultimate_4891_NOVA Validate <TestID> External Table Exclusion Positive TestCases Response Fields

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


##    Clear IH when it goes to control group
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
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    |
#      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     |


  @CrossSell_Nova @CrossSell_ExternalTableExclusion_Negative_TestCases_Validation_NOVA_4891 @4891 @NOVA @AUTOTESTTOTAL#36
  Scenario Outline: CrossSell_Ultimate_4891_NOVA Validate <TestID> External Table Exclusion Negative TestCases Response Fields
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
      | TestID |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   |


