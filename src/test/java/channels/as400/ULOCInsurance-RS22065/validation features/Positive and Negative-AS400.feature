@PositiveNegative_Validation_5761
Feature: Validate ULOC Insurance-5761 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @ULOCInsurance @ULOCInsurance_IH_Validation_5761 @5761 @AS400 @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400 Validate <TestID> IH field values against proposition data
    * def testDataFileName = ULOCINSAs400TestData
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

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCInsuranceOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                      |
      | "5761_AS400_BASE_01_Seg_01" |


  @ULOCInsurance @ULOCInsurance_Positive_TestCases_Validation_5761 @5761 @AS400 @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ULOCINSAs400TestData
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

    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCInsuranceContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                        |
      | "5761_AS400_Seg_01_DO_NOT_SOLICIT_F_eq_NULL_EMPLOYEE_STAFF_F_eq_NULL"                         |
      | "5761_AS400_Seg_01_CUST_AGE_eq_22"                                                            |
      | "5761_AS400_Seg_01_CUST_AGE_eq_60"                                                            |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RG_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_CS_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE_INS_STATUS_DESC_eq_Wavied" |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_SP_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_LI_INS_STATUS_DESC_eq_Wavied"  |
      | "5761_AS400_Seg_01_CRNT_BAL_AMT_eq_1dot2_x_CR_CRD_LMT_AMT"                                    |
      | "5761_AS400_Seg_01_CRNT_BAL_AMT_eq_0"                                                       |
      | "5761_AS400_Seg_01_CREDIT_ARREARS_DAYS_eq_60"                                                 |
      | "5761_AS400_Seg_01_CREDIT_ARREARS_DAYS_eq_NULL"                                               |
      | "5761_AS400_Seg_01_CR_CRD_LMT_AMT_gt_500"                                                     |
      | "5761_AS400_Seg_01_CR_CRD_LMT_AMT_lt_50000"                                                   |
      | "5761_AS400_Seg_01_CR_CRD_LMT_AMT_eq_50000"                                                   |


  @ULOCInsurance @ULOCInsurance_Negative_TestCases_Validation_5761 @5761 @AS400 @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400 Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = ULOCINSAs400TestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

#    # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

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
      | TestID                                                                  |
      | "N_5761_AS400_Seg_01_DECEASED_F_ne_N"                                   |
      | "N_5761_AS400_Seg_01_DECEASED_F_eq_NULL"                                |
      | "N_5761_AS400_Seg_01_CUST_TP_CD_ne_PSNL"                                |
      | "N_5761_AS400_Seg_01_PRIM_CNTRY_CD_ne_CA"                               |
      | "N_5761_AS400_Seg_01_PRIM_CNTRY_CD_eq_NULL"                             |
      | "N_5761_AS400_Seg_01_MRKTBLE_F_ne_Y"                                    |
      | "N_5761_AS400_Seg_01_MRKTBLE_F_eq_NULL"                                 |
      | "N_5761_AS400_Seg_01_DO_NOT_SOLICIT_F_eq_Y"                             |
      | "N_5761_AS400_Seg_01_LANG_CD_eq_Y"                                      |
      | "N_5761_AS400_Seg_01_LANG_CD_eq_NULL"                                   |
      | "N_5761_AS400_Seg_01_CUST_AGE_eq_17"                                    |
      | "N_5761_AS400_Seg_01_CUST_AGE_eq_65"                                    |
      | "N_5761_AS400_Seg_01_CUST_AGE_eq_NULL"                                  |
      | "N_5761_AS400_Seg_01_ACCT_SUBSYS_ID_ne_KS"                              |
      | "N_5761_AS400_Seg_01_ACCT_SUBSYS_ID_eq_NULL"                            |
      | "N_5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"    |
      | "N_5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_NULL"  |
      | "N_5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RG"   |
      | "N_5761_AS400_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N_5761_AS400_Seg_01_SRC_ACCT_STAT_CD_ne_Open"                          |
      | "N_5761_AS400_Seg_01_SRC_ACCT_STAT_CD_eq_NULL"                          |
      | "N_5761_AS400_Seg_01_CRNT_BAL_AMT_lt_0"                                 |
      | "N_5761_AS400_Seg_01_CRNT_BAL_AMT_eq_NULL"                              |
      | "N_5761_AS400_Seg_01_CRNT_BAL_AMT_gt_1dot2_x_CR_CRD_LMT_AMT"            |
      | "N_5761_AS400_Seg_01_CREDIT_ARREARS_DAYS_gt_60"                         |
      | "N_5761_AS400_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                     |
      | "N_5761_AS400_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                  |
      | "N_5761_AS400_Seg_01_INS_STATUS_DESC_Invalid"                           |
      | "N_5761_AS400_Seg_01_INS_STATUS_DESC_eq_NULL"                           |
      | "N_5761_AS400_Seg_01_CR_CRD_LMT_AMT_gt_50000"                           |
      | "N_5761_AS400_Seg_01_CR_CRD_LMT_AMT_eq_NULL"                            |
#      | "N_5761_AS400_Seg_01_ACCT_ODT_eq_NULL"                                   |


  @ULOCInsurance @ULOCInsurance_Prioritization_IH_Validation_5761 @5761 @AS400 @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400_prioritization Validate <TestID> IH field values against proposition data for prioritization
    * def testDataFileName = ULOCINSAs400TestData
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

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCInsuranceOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                    |
      | "5761_AS400_Seg_03_1_2_3_4_Valid"         |
      | "5761_AS400_Seg_03_1_Invalid_2_3_4_Valid" |
      | "5761_AS400_Seg_01_3_4_Valid"             |
      | "5761_AS400_Seg_01_4_4_Valid"             |
      | "5761_AS400_Seg_01_3_4_Diff_ODT"          |