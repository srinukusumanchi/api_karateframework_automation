@RS22111_NTBAdvicePlus @5822 @PositiveAndNegative_TestDataValidation_5822
Feature: Validate NTBAdvicePlus Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @NTBAdvicePlus @NTBAdvicePlus_IH_SOL_Validation @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = NTBAdvicePlustestDataFileName

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcct_Dim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM");
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   # It clears Result fields
    * clearResultFields()
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTBAdvicePlusContextualOfferValidation')
   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@NTBAdvicePlusOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID             |
      | "5822_SOL_BASE_01" |

  @NTBAdvicePlus @NTBAdvicePlus_Positive_SOL_Validation @5822 @SOL @RS22111 @retest_testdatavalidation_RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Validate <TestID> Positive field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = NTBAdvicePlustestDataFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcct_Dim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM");
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

    * call read('classpath:channels/sol/ReusableScenarios.feature@NTBAdvicePlusContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                          |
#      | "5822_SOL_LANG_CD_eq_fr"                                                                                                                       |
#      | "5822_SOL_CUST_AGE_eq_18"                                                                                                                      |
#      | "5822_SOL_CUST_OPND_DT_eq_120"                                                                                                                 |
#      | "5822_SOL_ARRV_DT_eq_1825_days" |
#      | "5822_SOL_DO_NOT_SOLICIT_F_eq_NULL"                                                                                                            |
#      | "5822_SOL_NOT_AML_KYC_eq_NULL"                                                                                                                 |
#      | "5822_SOL_ACCT_ODT_eq_50"                                                                                                                      |
#      | "5822_SOL_ACCT_ODT_eq_51"                                                                                                                      |
#      | "5822_SOL_ACCT_ODT_eq_79"                                                                                                                      |
#      | "5822_SOL_ACCT_ODT_eq_80"                                                                                                                      |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CreditCards"                                                                                                    |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_HighInterestSavingsAccounts"                                                                                    |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CashTermDeposit"                                                                                                |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CashDemandDeposit"                                                                                              |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_UnsecuredLending"                                                                                               |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_SecureLinesOfCredit"                                                                                            |
#      | "5822_SOL_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                       |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                     |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                       |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                         |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_ne_09_ACCT_ODT_lt_180days_AFIL"                                       |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_NULL_ACCT_ODT_lt_180days_AFIL"                                     |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_gt_180days_AFIL"                                       |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_NULL_AFIL"                                          |
#      | "5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_D2D_HISA_UL_SRC_ACCT_STAT_CD_ne_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"   |



  @NTBAdvicePlus @NTBAdvicePlus_SOL_Negative_Validation @5822 @SOL @RS22111 @retest_testdatavalidation_RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Validate <TestID> Negative field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = NTBAdvicePlustestDataFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def dataAcct_Dim = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,"ACCT_DIM");
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
    * match nbaCode_XML != offerCode

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                            |
#      | "N_5822_SOL_DECEASED_F_eq_Y"                                                                                                                   |
#      | "N_5822_SOL_DECEASED_F_eq_Null"                                                                                                                |
#      | "N_5822_SOL_CUST_TP_CD_ne_PSNL"                                                                                                                |
#      | "N_5822_SOL_PRIM_CNTRY_CD_ne_CA"                                                                                                               |
#      | "N_5822_SOL_PRIM_CNTRY_CD_eq_NULL"                                                                                                             |
#      | "N_5822_SOL_CUST_AGE_lt_18"                                                                                                                    |
#      | "N_5822_SOL_CUST_AGE_eq_NULL"                                                                                                                  |
#      | "N_5822_SOL_LANG_CD_eq_bn"                                                                                                                     |
#      | "N_5822_SOL_Lang_CD_eq_NULL"                                                                                                                   |
#      | "N_5822_SOL_NOT_AML_KYC_eq_Y"                                                                                                                  |
#      | "N_5822_SOL_CUST_OPND_DT_gt_120_days"                                                                                                          |
#      | "N_5822_SOL_CUST_OPND_DT_eq_NULL"                                                                                                              |
#      | "N_5822_SOL_ASSIGNED_FA_TRANSIT_ne_NULL"                                                                                                       |
#      | "N_5822_SOL_MAPP_TMRRW_LAST_SESS_DT_ne_NULL"                                                                                                   |
#      | "N_5822_SOL_ACCT_ODT_eq_49"                                                                                                                    |
#      | "N_5822_SOL_ACCT_ODT_eq_81"                                                                                                                    |
#      | "N_5822_SOL_ACCT_ODT_eq_NULL"                                                                                                                  |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"                                     |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_180days_AFIL"                                     |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"   |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_DD_HISA_SLC_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans" |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CDD_SLC_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"  |
#      | "N_5822_SOL_MCB_IND_ne_Y"         |
#      | "N_5822_SOL_MCB_IND_eq_NULL"      |
#      | "N_5822_SOL_ARRV_DT_gt_1825_days" |
#      | "N_5822_SOL_ARRV_DT_gt_1826_days" |
#      | "N_5822_SOL_ARRV_DT_eq_NULL"      |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_ne_BB"                                                                                                              |
      | "N_5822_SOL_ACCT_SUBSYS_ID_BB_PROD_CD_eq_07_SUBPROD_CD_eq_11" |
      | "N_5822_SOL_ACCT_SUBSYS_ID_BB_PROD_CD_eq_07_SUBPROD_CD_eq_12" |





