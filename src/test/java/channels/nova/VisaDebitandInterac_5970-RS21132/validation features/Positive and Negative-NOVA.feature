@VisaDebitandInterac_PositiveNegative_Validation_5970
Feature: Validate VisaDebitandInterac Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_Base_Validation @5970 @NOVA  @AUTUTESTTOTAL#4
  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Base IH validation and Response Fields
    #    Reading data from Excel sheet
    * def testDataFileName = VisaDebitandInteracNovaTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                       |
      | "5970_NOVA_BASE_Creative_01" |
      | "5970_NOVA_BASE_Creative_02" |
      | "5970_NOVA_BASE_Creative_03" |
      | "5970_NOVA_BASE_Creative_04" |


  @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_Positive_Scenario @5970 @NOVA
  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Positive TestCases Response Fields
    #    Reading data from Excel sheet
    * def testDataFileName = VisaDebitandInteracNovaTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
#    #   # Fetch recorded activity for CID from IH
#    * print "CID before fetching IH is:" +cid
#    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#
##     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                         |
#      | "5970_NOVA_Creative_01_CUST_AGE_eq_18"                                         |
#      | "5970_NOVA_Creative_01_CUST_AGE_eq_75"                                         |
#      | "5970_NOVA_Creative_02_LANG_CD_eq_fr"                                          |
#      | "5970_NOVA_Creative_03_DO_NOT_SOLICIT_F_eq_NULL"                               |
#      | "5970_NOVA_Creative_04_NOT_AML_KYC_eq_NULL"                                    |
#      | "5970_NOVA_Creative_01_ACCT_ODT_gt_60"                                         |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_01"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_02"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_03"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_04"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_01"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_02"          |
#      | "5970_NOVA_Creative_01_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_03"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_01"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_02"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_03"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_04"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_07"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_08"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_01"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_07"          |
#      | "5970_NOVA_Creative_02_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_08"          |
#      | "5970_NOVA_Creative_03_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_11"          |
#      | "5970_NOVA_Creative_03_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12"          |
#      | "5970_NOVA_Creative_04_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01"          |
#      | "5970_NOVA_Creative_04_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03"          |
      | "5970_NOVA_Creative_01_CASH_BR_WITHDRAWAL_eq_DSS_VPOS_OPOS_FLASH_CHIP_gt_90"    |
      | "5970_NOVA_Creative_01_CASH_ABM_WITHDRAWAL_eq_DSS_VPOS_OPOS_FLASH_CHIP_eq_NULL" |
      | "5970_NOVA_Creative_01_CASH_BR_WITHDRAWAL_eq_DSS_CASH_ABM_WITHDRAWAL_eq_DSS"     |
#      | "5970_NOVA_Creative_02_VPOS_OPOS_FLASH_gt_90_CHIP_eq_30"                       |
#      | "5970_NOVA_Creative_02_VPOS_OPOS_FLASH_eq_NULL_CHIP_eq_30"                     |
#      | "5970_NOVA_Creative_03_VPOS_eq_30_FLASH_gt_90"                                 |
#      | "5970_NOVA_Creative_03_OPOS_eq_30_FLASH_gt_90"                                 |
#      | "5970_NOVA_Creative_03_VPOS_eq_30_OPOS_eq_30_FLASH_eq_NULL"                    |
#      | "5970_NOVA_Creative_04_VPOS_gt_90_OPOS_gt_90_FLASH_eq_30"                      |
#      | "5970_NOVA_Creative_04_VPOS_eq_NULL_OPOS_eq_NULL_FLASH_eq_30"                  |


  @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_NegativeTestCases_Validation @5970 @NOVA @RS21132
  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Negative TestCases Response Fields
#    Reading data from Excel sheet
    * def testDataFileName = VisaDebitandInteracNovaTestData
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
      | TestID                                                                         |
      | "N_5970_NOVA_Creative_01_CUST_AGE_lt_18"                                       |
      | "N_5970_NOVA_Creative_01_CUST_AGE_gt_75"                                       |
      | "N_5970_NOVA_Creative_02_LANG_CD_eq_bn"                                        |
      | "N_5970_NOVA_Creative_02_LANG_CD_eq_NULL"                                      |
      | "N_5970_NOVA_Creative_03_DO_NOT_SOLICIT_F_eq_Y"                                |
      | "N_5970_NOVA_Creative_04_NOT_AML_KYC_eq_Y"                                     |
      | "N_5970_NOVA_Creative_01_DECEASED_F_ne_N"                                      |
      | "N_5970_NOVA_Creative_01_DECEASED_F_eq_NULL"                                   |
      | "N_5970_NOVA_Creative_02_CUST_TP_CD_ne_PSNL"                                   |
      | "N_5970_NOVA_Creative_02_PRIM_CNTRY_CD_ne_CA"                                  |
      | "N_5970_NOVA_Creative_03_PRIM_CNTRY_CD_eq_NULL"                                |
      | "N_5970_NOVA_Creative_03_MRKTBLE_F_ne_Y"                                       |
      | "N_5970_NOVA_Creative_04_MRKTBLE_F_eq_NULL"                                    |
      | "N_5970_NOVA_Creative_04_INDV_FRST_NM_eq_NULL"                                 |
      | "N_5970_NOVA_Creative_04_INDV_LAST_NM_eq_NULL"                                 |
      | "N_5970_NOVA_Creative_01_ACCT_ODT_eq_60"                                       |
      | "N_5970_NOVA_Creative_01_ACCT_ODT_lt_60"                                       |
      | "N_5970_NOVA_Creative_04_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_02"        |
      | "N_5970_NOVA_Creative_04_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_NULL"      |
      | "N_5970_NOVA_Creative_04_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_02"      |
      | "N_5970_NOVA_Creative_03_ACCT_SUBSYS_ID_ne_BB"                                 |
      | "N_5970_NOVA_Creative_03_ACCT_SUBSYS_ID_eq_NULL"                               |
      | "N_5970_NOVA_Creative_03_SRC_ACCT_STAT_CD_ne_A"                                |
      | "N_5970_NOVA_Creative_03_SRC_ACCT_STAT_CD_eq_NULL"                             |
      | "N_5970_NOVA_Creative_03_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                        |
      | "N_5970_NOVA_Creative_03_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                     |
      | "N_5970_NOVA_Creative_03_VPOS_lt_30_FLASH_lt_30"                               |
      | "N_5970_NOVA_Creative_03_VPOS_eq_30_FLASH_eq_30"                               |
      | "N_5970_NOVA_Creative_03_OPOS_lt_30_FLASH_lt_30"                               |
      | "N_5970_NOVA_Creative_03_OPOS_eq_30_FLASH_eq_30"                               |
      | "N_5970_NOVA_Creative_01_CASH_WITHDRAWAL_gt_30_VPOS_OPOS_FLASH_CHIP_gt_90"     |
      | "N_5970_NOVA_Creative_01_CASH_WITHDRAWAL_eq_NULL_VPOS_OPOS_FLASH_CHIP_eq_NULL" |


  @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_Positive_multiple_account_Scenario @5970 @NOVA
  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Positive nultiple account TestCases Response Fields
    #    Reading data from Excel sheet
    * def testDataFileName = VisaDebitandInteracNovaTestData
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId
    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
    # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')
    # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)
    # Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)
    #  request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Sucess with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)
    # It clears Result fields
    * clearResultFields()
#    #   # Fetch recorded activity for CID from IH
#    * print "CID before fetching IH is:" +cid
#    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#
##     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracOfferValidation_NOVA')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                                                                       |
      | "5970_NOVA_Creative_01_2_BB_Primary_ACCT_ODT_gt_60_CashWithdr_lt_30_Secon_ACCT_ODT_gt_60_CashWithdr_eq_NULL_2_AC"            |
      | "5970_NOVA_Creative_01_2_BB_Primary_ACCT_ODT_gt_60_CashWithdr_lt_30_Secon_NOT_ACTIVE_ACCT_ODT_lt_60_CashWithdr_eq_NULL_2_AC" |
      | "5970_NOVA_Creative_01_2_BB_2_AC_Primary_VPOS_OPOS_FLASH_CHIP_gt_90_Secon_VPOS_OPOS_FLASH_CHIP_lt_90"                        |
      | "5970_NOVA_Creative_02_2_BB_2_AC_Primary_CHIP_lt_30_VPOS_OPOS_FLASH_eq_NULL_Secon_CHIP_eq_NULL_VPOS_OPOS_FLASH_eq_NULL"      |
      | "5970_NOVA_Creative_02_2_BB_2_AC_Primary_CHIP_lt_30_VPOS_OPOS_FLASH_eq_NULL_Secon_CHIP_eq_NULL_VPOS_OPOS_FLASH_lt_90"        |
      | "5970_NOVA_Creative_03_2_BB_2_AC_Primary_VPOS_OPOS_lt_30_FLASH_eq_NULL_Secon_VPOS_OPOS_eq_NULL_FLASH_eq_NULL"                |
      | "5970_NOVA_Creative_03_2_BB_2_AC_Primary_VPOS_OPOS_lt_30_FLASH_eq_NULL_Secon_VPOS_OPOS_lt_30_FLASH_lt_90"                    |
      | "5970_NOVA_Creative_04_2_BB_2_AC_Primary_VPOS_OPOS_eq_NULL_FLASH_lt_30_Secon_VPOS_OPOS_eq_NULL_FLASH_eq_NULL"                |
      | "5970_NOVA_Creative_04_2_BB_2_AC_Primary_VPOS_OPOS_eq_NULL_FLASH_lt_30_Secon_VPOS_OPOS_lt_90_FLASH_lt_30"                    |
      | "5970_NOVA_Creative_01_2_BB_ANY_Primary_CashBRWithdr_lt_30_2_AC_ALL_Primary_VPOS_OPOS_FLASH_CHIP_gt_90"                      |
      | "5970_NOVA_Creative_01_2_BB_ANY_Primary_CashABMWithdr_lt_30_2_AC_ALL_Primary_VPOS_OPOS_FLASH_CHIP_gt_90"                     |
      | "5970_NOVA_Creative_02_2_BB_2_AC_ANY_Primary_CHIP_lt_30_ALL_Primary_VPOS_OPOS_FLASH_gt_90"                                   |
      | "5970_NOVA_Creative_03_2_BB_2_AC_ANY_Primary_VPOS_lt_30_ALL_Primary_FLASH_gt_90"                                             |
      | "5970_NOVA_Creative_03_2_BB_2_AC_ANY_Primary_OPOS_lt_30_ALL_Primary_FLASH_gt_90"                                             |
      | "5970_NOVA_Creative_04_2_BB_2_AC_ANY_Primary_FLASH_lt_30_ALL_Primary_VPOS_OPOS_gt_90"                                        |
      |"5970_NOVA_Creative_01_2_BB_1_Eligible_Prod_ACCT_ODT_gt_60_1_Other_Prod_ACCT_ODT_lt_60_2_AC_ALL_Primary"                      |
      |"5970_NOVA_Creative_01_1_BB_ACCT_ODT_gt_60_1_KS_ACCT_ODT_lt_60_2_AC_ALL_Primary"                                              |



    @VisaDebitandInterac_5970 @VisaDebitandInterac_5970_Nova_Negative_multipleaccounts @TestCases_Validation  @5970 @NOVA @RS21132

  Scenario Outline: VisaDebitandInterac_5970_NOVA Validate <TestID> Negative multiple accounts TestCases Response Fields
#    Reading data from Excel sheet
    * def testDataFileName = VisaDebitandInteracNovaTestData
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
      | TestID                                                                                                                  |
      | "N_5970_NOVA_Creative_01_2_BB_Primary_ACCT_ODT_gt_60_CashWithdr_lt_30_Secon_ACCT_ODT_eq_60_CashWithdr_eq_NULL_2_AC"     |
      | "N_5970_NOVA_Creative_01_2_BB_Primary_ACCT_ODT_gt_60_CashWithdr_eq_NULL_Secon_ACCT_ODT_gt_60_CashWithdr_lt_30_2_AC"     |
      | "N_5970_NOVA_Creative_01_2_BB_2_AC_Primary_VPOS_OPOS_FLASH_CHIP_lt_90_Secon_VPOS_OPOS_FLASH_CHIP_gt_90"                 |
      | "N_5970_NOVA_Creative_02_2_BB_2_AC_Primary_CHIP_gt_30_VPOS_OPOS_FLASH_eq_NULL_Secon_CHIP_lt_30_VPOS_OPOS_FLASH_eq_NULL" |
      | "N_5970_NOVA_Creative_02_2_BB_2_AC_Primary_CHIP_lt_30_VPOS_OPOS_FLASH_lt_90_Secon_CHIP_eq_NULL_VPOS_OPOS_FLASH_eq_NULL" |
      | "N_5970_NOVA_Creative_03_2_BB_2_AC_Primary_VPOS_OPOS_eq_NULL_FLASH_eq_NULL_Secon_VPOS_OPOS_lt_30_FLASH_eq_NULL"         |
      | "N_5970_NOVA_Creative_03_2_BB_2_AC_Primary_VPOS_OPOS_lt_30_FLASH_lt_90_Secon_VPOS_OPOS_lt_30_FLASH_eq_NULL"             |
      | "N_5970_NOVA_Creative_04_2_BB_2_AC_Primary_VPOS_OPOS_eq_NULL_FLASH_eq_NULL_Secon_VPOS_OPOS_eq_NULL_FLASH_lt_30"         |
      | "N_5970_NOVA_Creative_04_2_BB_2_AC_Primary_VPOS_OPOS_lt_90_FLASH_lt_30_Secon_VPOS_OPOS_eq_NULL_FLASH_lt_30"             |
      | "N_5970_NOVA_Creative_01_2_BB_ANY_Primary_CashBRWithdr_lt_30_2_AC_NOT_ALL_Primary_VPOS_gt_90"                           |
      | "N_5970_NOVA_Creative_01_2_BB_ANY_Primary_CashBRWithdr_lt_30_2_AC_NOT_ALL_Primary_OPOS_gt_90"                           |
      | "N_5970_NOVA_Creative_01_2_BB_ANY_Primary_CashBRWithdr_lt_30_2_AC_NOT_ALL_Primary_FLASH_gt_90"                          |
      | "N_5970_NOVA_Creative_01_2_BB_ANY_Primary_CashBRWithdr_lt_30_2_AC_NOT_ALL_Primary_CHIP_gt_90"                           |
      | "N_5970_NOVA_Creative_02_2_BB_2_AC_ANY_Primary_CHIP_lt_30_NOT_ALL_Primary_VPOS_gt_90"                                   |
      | "N_5970_NOVA_Creative_02_2_BB_2_AC_ANY_Primary_CHIP_lt_30_NOT_ALL_Primary_OPOS_gt_90"                                   |
      | "N_5970_NOVA_Creative_02_2_BB_2_AC_ANY_Primary_CHIP_lt_30_NOT_ALL_Primary_FLASH_gt_90"                                  |
      | "N_5970_NOVA_Creative_03_2_BB_2_AC_ANY_Primary_VPOS_lt_30_NOT_ALL_Primary_FLASH_gt_90"                                  |
      | "N_5970_NOVA_Creative_03_2_BB_2_AC_ANY_Primary_OPOS_lt_30_NOT_ALL_Primary_FLASH_gt_90"                                  |
      | "N_5970_NOVA_Creative_04_2_BB_2_AC_ANY_Primary_FLASH_lt_30_NOT_ALL_Primary_VPOS_gt_90"                                  |
      | "N_5970_NOVA_Creative_04_2_BB_2_AC_ANY_Primary_FLASH_lt_30_NOT_ALL_Primary_OPOS_gt_90"                                  |
