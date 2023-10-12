@PositiveNegative_Validation_5787
Feature: Validate ODP-5787 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @ODP @ODP_IH_Validation_Sanity_5787 @5787 @AS400 @OP13028
  Scenario Outline: ODP_OP13028_5787_AS400 Validate <TestID> IH field values against proposition data
    * def testDataFileName = ODPAs400TestData
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
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

#  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
    * request requestfile
#  #    Performing action on xml request (Post Action)
    * soap action soapAction
#  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
#  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
#
#   # It clears Result fields
    * clearResultFields()

    #     Validationg PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ODPContextualOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ODPOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID               |
      | "5787_BASE SCENARIO" |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_ACCT_SUBSYS_ID = BB and ACCT_DIM.SRC_ACCT_STAT_CD = A"         |



  @ODP @ODP_Positive_TestCases_Validation_5787 @5787 @AS400 @OP13028
  Scenario Outline: ODP_OP13028_5787_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ODPAs400TestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@ODPContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                           |
#      | "5787_CC_VIP_IND =NULL or not in (2, 9)"                                                                                                         |
#      | "5787_CUST_AGE = 18"                                                                                                                             |
#      | "5787_CUST_AGE = 70"                                                                                                                             |
#      | "5787_LANG_CD = en"                                                                                                                             |
#      | "5787_LANG_CD = fr"                                                                                                                             |
#      | "5787_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SCD_NUM != NULL"                                                                          |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PRIMARY_ACCT_HOLDER_FLAG = Y"                                                             |
#      | "5787_SRC_SYS_PRD_CD = 01 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 01 and SRC_SYS_SUB_PRD_CD = 02"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 01 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 01 and SRC_SYS_SUB_PRD_CD = 04"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 02 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 02 and SRC_SYS_SUB_PRD_CD = 02"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 02 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 02"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 04"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 06"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 07"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 08"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 09"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 11"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 12"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 18"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 07 and SRC_SYS_SUB_PRD_CD = 19"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 12 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 12 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 12 and SRC_SYS_SUB_PRD_CD = 07"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 12 and SRC_SYS_SUB_PRD_CD = 08"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 13 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 13 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 13 and SRC_SYS_SUB_PRD_CD = 07"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 13 and SRC_SYS_SUB_PRD_CD = 08"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 02"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 04"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 07"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 19 and SRC_SYS_SUB_PRD_CD = 08"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 23 and SRC_SYS_SUB_PRD_CD = 01"                                                                                           |
#      | "5787_SRC_SYS_PRD_CD = 23 and SRC_SYS_SUB_PRD_CD = 03"                                                                                           |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_PA_ODP_LIMIT > 0"                                                                                |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada_DOES NOT have an Ultimate account_PRIM_PROV_CD != QC"                             |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada + Ultimate Account Holders_ACCT_SUBSYS_ID = BB and ACCT_DIM.SRC_ACCT_STAT_CD = A" |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 01"              |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 03"              |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada + Ultimate Account Holders_JOINT_ACCT_FLAG = N"                                   |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Rest of Canada + Ultimate Account Holders_PRIMARY_ACCT_HOLDER_FLAG = Y"                          |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec_DOES NOT have an Ultimate account_PRIM_PROV_CD = QC"                                      |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_ACCT_SUBSYS_ID = BB and ACCT_DIM.SRC_ACCT_STAT_CD = A"         |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 01"                      |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 03"                      |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_JOINT_ACCT_FLAG = N"                                           |
#      | "5787_PreapprovedCustomer_PA_TU_FILE_DT != null_Quebec + Ultimate Account Holders_PRIMARY_ACCT_HOLDER_FLAG = Y"                                  |
#      | "5787_PayrollCustomer_Not eligible for Preapproved segment_PA_ODP_LIMIT = 0"                                                                     |
#      | "5787_PayrollCustomer_Not eligible for Preapproved segment_PA_ODP_LIMIT < 0"                                                                     |
#      | "5787_PayrollCustomer_PAC_PAYRL_F = 1"                                                                                                           |
#      | "5787_PayrollCustomer_FICO_SCORE >600"                                                                                                           |
#      | "5787_PayrollCustomer_FICO_SCORE =600"                                                                                                           |
#      | "5787_PayrollCustomer_CR_RSK_IND = A"                                                                                                           |
#      | "5787_PayrollCustomer_CR_RSK_IND = B"                                                                                                           |
#      | "5787_PayrollCustomer_CR_RSK_IND = C"                                                                                                           |
#      | "5787_PayrollCustomer_Rest of Canada_DOES NOT have an Ultimate account_PRIM_PROV_CD != QC"                                                       |
#      | "5787_PayrollCustomer_Rest of Canada + Ultimate Account Holders_ACCT_SUBSYS_ID = BB and ACCT_DIM.SRC_ACCT_STAT_CD = A"                           |
#      | "5787_PayrollCustomer_Rest of Canada + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 01"                                        |
#      | "5787_PayrollCustomer_Rest of Canada + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 03"                                        |
#      | "5787_PayrollCustomer_Rest of Canada + Ultimate Account Holders_JOINT_ACCT_FLAG = N"                                                             |
#      | "5787_PayrollCustomer_Rest of Canada + Ultimate Account Holders_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                    |
#      | "5787_PayrollCustomer_Quebec_DOES NOT have an Ultimate account_PRIM_PROV_CD = QC"                                                                |
#      | "5787_PayrollCustomer_Quebec + Ultimate Account Holders_ACCT_SUBSYS_ID = BB and ACCT_DIM.SRC_ACCT_STAT_CD = A"                                   |
#      | "5787_PayrollCustomer_Quebec + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 01"                                                |
#      | "5787_PayrollCustomer_Quebec + Ultimate Account Holders_SRC_PRD_CD = 23 and SRC_SUB_PRD_CD in 03"                                                |
#      | "5787_PayrollCustomer_Quebec + Ultimate Account Holders_JOINT_ACCT_FLAG = N"                                                                     |
#      | "5787_PayrollCustomer_Quebec + Ultimate Account Holders_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                            |
#      | "5787_CC File_MC_ELIG_F != N"                                                                                                                    |
#      | "5787_CC File_MC_ELIG_F = NULL"                                                                                                                  |
#      | "5787_CC FILE_INDV_TTL_NM , INDV_FRST_NM , INDV_LAST_NM  ,GIVEN_NAME !=  NULL"                                                                   |
#      | "5787_CC FILE_PRIM_ADDR_LINE_1 , PRIM_ADDR_LINE_2 , PRIM_CITY_NM , PRIM_PROV_CD , PRIM_POST_CD =  NULL"                                          |
#      | "5787_CC File_ASSIGNED_FA_TRANSIT_ne_NULL"                                                                                                       |
#      | "5787_CC File_RESP_TRNST_NUM_is_Valid"                                                                                                           |
#      | "5787_CC File_RESP_TRNST_NUM_is_InValid_CLOSEST_TRANSIT_NUM_ne_NULL"                                                                             |
#      | "5787_CC File_RESP_TRNST_NUM_eq_NULL_CLOSEST_TRANSIT_NUM_ne_NULL"                                                                                |
#      | "5787_Current Date - ARRV_DT < 1095 Days and IMMGRTN_CAT_CD in (EN2 ,C2 , C1 , NV5 , PV2 , SE2 , SW1)"                                           |
#      | "5787_Current Date - ARRV_DT > 1095 Days and IMMGRTN_CAT_CD NOT in (EN2 ,C2 , C1 , NV5 , PV2 , SE2 , SW1)"                                       |
#      | "5787_ACCT_SUBSYS_ID != BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 = Chequing Accounts and OV_DRAFT_LMT_AMT > 0"                          |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD != A and PROD_HIER_LEVEL_4 = Chequing Accounts and OV_DRAFT_LMT_AMT > 0"                          |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 != Chequing Accounts and OV_DRAFT_LMT_AMT > 0"                          |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 = Chequing Accounts and OV_DRAFT_LMT_AMT < 0"                           |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 = Chequing Accounts and OV_DRAFT_LMT_AMT = 0"                           |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD != A and PROD_HIER_LEVEL_4 = Chequing Accounts and IP_AR_RELATN_TYPE_CD in (JNT , JN1)"           |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 != Chequing Accounts and IP_AR_RELATN_TYPE_CD in (JNT , JN1)"           |
#      | "5787_ACCT_SUBSYS_ID != BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 = Chequing Accounts and IP_AR_RELATN_TYPE_CD in (JNT , JN1)"           |
#      | "5787_ACCT_SUBSYS_ID = BB and SRC_ACCT_STAT_CD = A and PROD_HIER_LEVEL_4 = Chequing Accounts and IP_AR_RELATN_TYPE_CD  not in (JNT , JN1)"       |