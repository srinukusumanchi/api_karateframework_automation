@PositiveNegative_Validation_5762
Feature: Validate ULOC Insurance-5762 Positive and Negative test cases

  Background: Common for NOVA Positive and Negative

   # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @ULOCInsurance @ULOCInsurance_IH_NOVA_5762_Validation @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Validate <TestID> IH field values against proposition data
    * def testDataFileName = ULOCINSNovaTestData
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

  #     Generate a NOVA REST call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                     |
      | "5762_NOVA_BASE_01_Seg_01" |


  @ULOCInsurance @ULOCInsurance_Positive_TestCases_5762_Validation @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ULOCINSNovaTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a NOVA REST call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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

    #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceContextualOfferValidation')
# Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceOfferValidationWithIH')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                            |
      | "5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL_EMPLOYEE_STAFF_F_eq_NULL"                              |
      | "5762_NOVA_Seg_01_CUST_AGE_eq_22"                                                                 |
      | "5762_NOVA_Seg_01_CUST_AGE_eq_60"                                                                 |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RG_INS_STATUS_DESC_eq_Wavied"       |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_LifeOnly"     |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_CS_INS_STATUS_DESC_eq_Disability"   |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE_INS_STATUS_DESC_eq_DisAndLife"  |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_DisJL"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL_INS_STATUS_DESC_eq_DisLifeAndCI" |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_SP_INS_STATUS_DESC_eq_LifeAndCI"    |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_LI_INS_STATUS_DESC_eq_LifeDisAndJL" |
      | "5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_1dot2_x_CR_CRD_LMT_AMT"                                         |
      | "5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_0"                                                              |
      | "5762_NOVA_Seg_01_ACCT_ODT_eq_50"                                                                 |
      | "5762_NOVA_Seg_01_ACCT_ODT_gt_50"                                                                 |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_500"                                                          |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_lt_50000"                                                        |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_50000"                                                        |


  @ULOCInsurance @ULOCInsurance_Negative_TestCases_5762_Validation @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = ULOCINSNovaTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
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
#    * def responseString = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                 |
      | "N_5762_NOVA_Seg_01_DECEASED_F_ne_N"                                   |
      | "N_5762_NOVA_Seg_01_DECEASED_F_eq_NULL"                                |
      | "N_5762_NOVA_Seg_01_CUST_TP_CD_ne_PSNL"                                |
      | "N_5762_NOVA_Seg_01_PRIM_CNTRY_CD_ne_CA"                               |
      | "N_5762_NOVA_Seg_01_PRIM_CNTRY_CD_eq_NULL"                             |
      | "N_5762_NOVA_Seg_01_MRKTBLE_F_ne_Y"                                    |
      | "N_5762_NOVA_Seg_01_MRKTBLE_F_eq_NULL"                                 |
      | "N_5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_Y"                             |
#      | "N_5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL"                          |
      | "N_5762_NOVA_Seg_01_LANG_CD_eq_Y"                                      |
      | "N_5762_NOVA_Seg_01_LANG_CD_eq_NULL"                                   |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_17"                                    |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_65"                                    |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_NULL"                                  |
      | "N_5762_NOVA_Seg_01_EMPLOYEE_STAFF_F_eq_Y"                             |
      | "N_5762_NOVA_Seg_01_ACCT_SUBSYS_ID_ne_KS"                              |
      | "N_5762_NOVA_Seg_01_ACCT_SUBSYS_ID_eq_NULL"                            |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"    |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_NULL"  |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RG"   |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N_5762_NOVA_Seg_01_SRC_ACCT_STAT_CD_ne_Open"                          |
      | "N_5762_NOVA_Seg_01_SRC_ACCT_STAT_CD_eq_NULL"                          |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_lt_0"                                 |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_NULL"                              |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_gt_1dot2_x_CR_CRD_LMT_AMT"            |
#      | "N_5762_NOVA_Seg_01_CREDIT_ARREARS_DAYS_gt_60"                         |
      | "N_5762_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                     |
      | "N_5762_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                  |
      | "N_5762_NOVA_Seg_01_INS_STATUS_DESC_Invalid"                           |
      | "N_5762_NOVA_Seg_01_INS_STATUS_DESC_eq_NULL"                           |
      | "N_5762_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_50000"                           |
      | "N_5762_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_NULL"                            |
      | "N_5762_NOVA_ACCT_ODT_lt_50"                                           |
#      | "N_5762_NOVA_ACCT_ODT_eq_NULL"                                         |
      | "N_5762_NOVA_NoInsight"                                                |
      | "N_5762_NOVA_INSIGHT_CD_ne_FLG_LOC_INS_ABANDON_APP"                    |
      | "N_5762_NOVA_CURR_VAL_ne_1"                                            |
      | "N_5762_NOVA_CURR_VAL_eq_null"                                         |
      | "N_5762_NOVA_EVENT_DT_eq_null"                                         |
      | "N_5762_NOVA_EVENT_DT_gt_30"                                           |


  @ULOCInsurance @ULOCInsurance_IH_Prioritization_5762_Validation @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Validate <TestID> IH field values against proposition data for prioritization
    * def testDataFileName = ULOCINSNovaTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = <Acct_Num>
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
# Json response validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceContextualOfferValidation')
   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                     | Acct_Num                  |
      | "5762_NOVA_prioritization" | "00000009826329133672591" |