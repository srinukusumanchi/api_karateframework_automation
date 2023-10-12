@NOVA_NTB_5822_IHPositiveNegative_Validation
Feature: Validate NOVA NTB Advice Plus 5822 IH Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @NTB_AdvicePlus_Nova @NTB_AdvicePlus_5822_Nova_IH_Validation @5822 @NOVA @RS22111
  Scenario Outline: NTB_AdvicePlus_Nova_RS22111_5822_NOVA Validate <TestID> IH field values against proposition data
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * print "Data record is:" + data

    * def cid = karate.get('$data.ID')
    * print "CID is "+cid

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

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@NTBAdvicePlusOfferValidationWithIH')

     # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID              |
#      | "5822_NOVA_BASE_01" |
#      | "5822_NOVA_BASE_02" |
      | "5822_NOVA_BASE_05" |
      | "5822_NOVA_BASE_06" |


  @NTB_Adviceplus_5822 @NTB_AdvicePlus_Positive_TestCases_Validation_NOVA_5822 @5822 @NOVA @AUTOTESTTOTAL#
  Scenario Outline: NTB_AdvicePlus_5822_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = NTB_AdvicePlus_NOVATestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@NTBAdvicePlusContextualOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                           |
#      | "5822_NOVA_LANG_CD_eq_fr"                                                                                                                      |
#      | "5822_NOVA_CUST_AGE_eq_18"                                                                                                                     |
#      | "5822_NOVA_CUST_OPND_DT_eq_120"                                                                                                                |
#      | "5822_NOVA_ARRV_DT_eq_1825_days" |
#      | "5822_NOVA_DO_NOT_SOLICIT_F_eq_NULL"                                                                                                           |
#      | "5822_NOVA_NOT_AML_KYC_eq_NULL"                                                                                                                |
#      | "5822_NOVA_ACCT_ODT_eq_50"                                                                                                                     |
#      | "5822_NOVA_ACCT_ODT_eq_51"                                                                                                                     |
#      | "5822_NOVA_ACCT_ODT_eq_59"                                                                                                                     |
#      | "5822_NOVA_ACCT_ODT_eq_60"                                                                                                                     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CreditCards"                                                                                                   |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_HighInterestSavingsAccounts"                                                                                   |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CashTermDeposit"                                                                                               |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CashDemandDeposit"                                                                                             |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_UnsecuredLending"                                                                                              |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_SecureLinesOfCredit"                                                                                           |
#      | "5822_NOVA_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                      |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                    |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                      |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                        |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_ne_09_ACCT_ODT_lt_180days_AFIL"                                      |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_NULL_ACCT_ODT_lt_180days_AFIL"                                    |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_gt_180days_AFIL"                                      |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_NULL_AFIL"                                         |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_ne_Y_Lending_Investing_Loans"    |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_ne_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"    |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL_Lending_Investing_Loans" |
#      | "5822_NOVA_MCB_IND_ne_Y"         |
#      | "5822_NOVA_MCB_IND_eq_NULL"      |
#      | "5822_NOVA_ARRV_DT_gt_1825_days" |
#      | "5822_NOVA_ARRV_DT_gt_1826_days" |
#      | "5822_NOVA_ARRV_DT_eq_NULL"      |
      | "5822_NOVA_Seg_05_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" |
      | "5822_NOVA_Seg_06_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" |

  @NTB_AdvicePlus_5822_Nova @NTB_AdvicePlus_Negative_TestCases_Validation_5822 @5822 @NOVA @AUTOTESTTOTAL#
  Scenario Outline: NTB_AdvicePlus_5822_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = NTB_AdvicePlus_NOVATestData

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
#      | "N_5822_NOVA_DECEASED_F_eq_Y"                                                                                                                 |
#      | "N_5822_NOVA_DECEASED_F_eq_Null"                                                                                                              |
#      | "N_5822_NOVA_CUST_TP_CD_ne_PSNL"                                                                                                              |
#      | "N_5822_NOVA_PRIM_CNTRY_CD_ne_CA"                                                                                                             |
#      | "N_5822_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                                                                           |
#      | "N_5822_NOVA_CUST_AGE_lt_18"                                                                                                                  |
#      | "N_5822_NOVA_CUST_AGE_eq_NULL"                                                                                                                |
#      | "N_5822_NOVA_LANG_CD_eq_bn"                                                                                                                   |
#      | "N_5822_NOVA_Lang_CD_eq_NULL"                                                                                                                 |
#      | "N_5822_NOVA_NOT_AML_KYC_eq_Y"                                                                                                                |
#      | "N_5822_NOVA_CUST_OPND_DT_gt_120_days"                                                                                                        |
#      | "N_5822_NOVA_CUST_OPND_DT_eq_NULL"                                                                                                            |
#      | "N_5822_NOVA_ASSIGNED_FA_TRANSIT_ne_NULL"                                                                                                     |
#      | "N_5822_NOVA_MAPP_TMRRW_LAST_SESS_DT_ne_NULL"                                                                                                 |
#      | "N_5822_NOVA_ACCT_ODT_eq_49"                                                                                                                  |
#      | "N_5822_NOVA_ACCT_ODT_eq_81"                                                                                                                  |
#      | "N_5822_NOVA_ACCT_ODT_eq_NULL"                                                                                                                |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                   |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_180days_AFIL"                                   |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans" |
