@ItradeXsellAlwaysOn_PositiveNegative_Validation_6109
Feature: Validate Itrade Xsell AlwaysOn Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @ItradeXsellAlwaysOn_6109  @ItradeXsellAlwaysOn_6109_Nova_Positive_Validation_withIH_validation @6109 @NOVA @RS23101
  Scenario Outline: ItradeXsellAlwaysOn_6109_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = ItradeXsellAlwaysOnNOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    #     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnSpecificIHValidation')

     # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                       |
      | "6109_NOVA_BASE_Creative_01" |
      | "6109_NOVA_BASE_Creative_02" |
      | "6109_NOVA_BASE_Creative_03" |
      | "6109_NOVA_BASE_Creative_04" |
      | "6109_NOVA_BASE_Creative_05" |
      | "6109_NOVA_BASE_Creative_06" |
      | "6109_NOVA_BASE_Creative_07" |

  @ItradeXsellAlwaysOn_6109  @ItradeXsellAlwaysOn_6109_Nova_Positive_Validation_withoutIH_validation @6109 @NOVA @RS23101

  Scenario Outline: ItradeXsellAlwaysOn_6109_NOVA Validate <TestID> Positive TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = ItradeXsellAlwaysOnNOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

  #    #   # Fetch recorded activity for CID from IH
#    * print "CID before fetching IH is:" +cid
#    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnSpecificIHValidation')

     # Validate the web Response with IH,Proposition
    * call read('classpath:channels/nova/ReusableScenarios.feature@ItradeXsellAlwaysOnOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                               |
      | "6109_NOVA_Seg_01_LANG_CD_eq_fr"                                     |
      | "6109_NOVA_Seg_02_NOT_AML_KYC_eq_NULL"                               |
          # Positive Exclusion Scenarios
      | "6109_NOVA_Seg_01_CUST_OPND_DT_lt_120"                               |
      | "6109_NOVA_Seg_01_CUST_OPND_DT_eq_120"                               |
      | "6109_NOVA_Seg_01_CUST_OPND_DT_eq_NULL"                              |
      | "6109_NOVA_Seg_01_SRC_ACCT_STAT_CD_ne_A"                             |
      | "6109_NOVA_Seg_01_SRC_ACCT_STAT_CD_eq_NULL"                          |
      | "6109_NOVA_Seg_01_ACCT_ODT_gt_91"                                    |
      | "6109_NOVA_Seg_01_ACCT_ODT_gt_NULL"                                  |
      | "6109_NOVA_Seg_01_ACCT_SUBSYS_ID_ne_BB"                              |
      | "6109_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG _ne_Y"                    |
      | "6109_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG _eq_NULL"                 |
      | "6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_01"     |
      | "6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL" |

  @ItradeXsellAlwaysOn_6109  @ItradeXsellAlwaysOn_6109_Nova_NegativeTestCases_Validation @6109 @NOVA @RS23101
  Scenario Outline: ItradeXsellAlwaysOn_6109_NOVA Validate <TestID> Negative TestCases Response Fields

    * def testDataFileName = ItradeXsellAlwaysOnNOVATestData

     # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

  # Tt clears Result fields
    * clearResultFields()

#    #    Validating error response
#    * match responseString == {}

  # Validating error response
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID |
      | "N-6109_NOVA_Seg_04_LANG_CD_eq_NULL"                                                                         |
      | "N-6109_NOVA_Seg_05_PRIM_CNTRY_CD_ne_CA"                                                                     |
      | "N-6109_NOVA_Seg_06_PRIM_CNTRY_CD_ne_NULL"                                                                   |
      | "N-6109_NOVA_Seg_07_CUST_TP_CD_ne_PSNL"                                                                      |
      | "N-6109_NOVA_Seg_01_LANG_CD_eq_ka"                                                                           |
      | "N-6109_NOVA_Seg_02_MRKTBLE_F _ne_Y"                                                                         |
      | "N-6109_NOVA_Seg_03_MRKTBLE_F _eq_NULL"                                                                      |
      | "N-6109_NOVA_Seg_04_NOT_AML_KYC_eq_Y"                                                                        |
      | "N-6109_NOVA_Seg_05_CUST_AGE_eq_18"                                                                          |
      | "N-6109_NOVA_Seg_06_CUST_AGE_eq_11"                                                                          |
      | "N-6109_NOVA_Seg_07_CUST_AGE_eq_NULL"                                                                        |
      | "N-6109_NOVA_Seg_01_ITRADE_MCLEOD_F _ne_N"                                                                   |
      | "N-6109_NOVA_Seg_02_ITRADE_MCLEOD_F _eq_NULL"                                                                |
      | "N-6109_NOVA_Seg_03_ITRADE_XSELL_DECILE_eq_NULL"                                                             |
      | "N-6109_NOVA_Seg_03_INSIGHT_CD _ne_ITRADE_SEGMENT"                                                           |
      | "N-6109_NOVA_Seg_04_CURR_VAL _lt_1"                                                                          |
      | "N-6109_NOVA_Seg_05_CURR_VAL _gt_7"                                                                          |
      | "N-6109_NOVA_Seg_06_CURR_VAL _eq_NULL"                                                                       |
    # Negative Exclusion Scenarios
      | "N-6109_NOVA_Seg_01_CUST_OPND_DT_gt_120_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90_PRIMARY_ACCT_HOLDER_FLAG _eq_Y" |
      | "N-6109_NOVA_Seg_01_ACCT_ODT_eq_90"                                                                          |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_07"                                           |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_08"                                           |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_11"                                           |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12"                                           |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01"                                           |
      | "N-6109_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03"                                           |


