@PACC_PositiveNegative_Validation_5570
Feature: Validate PA CC Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @PACC_NOVA_5570  @PACC_NOVA_5570_Positive_IH_Validation @5570 @NOVA @OP14037
  Scenario Outline: PA CC_5570_NOVA Validate <TestID> Positive TestCases Response Fields
    * def testId = <TestID>

  # Reading data from Excel sheet
    * def testDataFileName = PACCTestDataNOVATestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCOfferValidation_NOVA')
# Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')
#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCULOCOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                            |
      | "5570_NOVA_Customer Not Deceased" |

  @PACC_NOVA_5570  @PACC_NOVA_5570_Positive_Validation @5570 @NOVA @OP14037
  Scenario Outline: PA CC_5570_NOVA Validate <TestID> Positive TestCases Response Fields

  # Reading data from Excel sheet
    * def testDataFileName = PACCTestDataNOVATestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCOfferValidation_NOVA')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                                  |
      | "5570_NOVA_Customer Not Deceased"                                                                                       |
      | "5570_NOVA_CUST_TP_CD = PSNL"                                                                                           |
      | "5570_NOVA_LANG_CD = E"                                                                                                 |
      | "5570_NOVA_LANG_CD = EN"                                                                                                |
      | "5570_NOVA_LANG_CD = F"                                                                                                 |
      | "5570_NOVA_LANG_CD = FR"                                                                                                |
      | "5570_NOVA_LANG_CD = LowerCase_e"                                                                                       |
      | "5570_NOVA_LANG_CD = LowerCase_en"                                                                                      |
      | "5570_NOVA_LANG_CD = LowerCase_f"                                                                                       |
      | "5570_NOVA_LANG_CD = LowerCase_fr"                                                                                      |
      | "5570_NOVA_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD! in (VCL,VLR,VGD,AXG,AXP,AXS,VFF,VFA,VUS) && SRC_ACCT_STAT_CD!=Active" |
      | "5570_NOVA_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                                                 |
      | "5570_NOVA_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                                                   |
      | "5570_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = VCL"                                                                 |
      | "5570_NOVA_PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"                                                              |
      | "5570_NOVA_CLOSEST_TRANSIT_NUM!=NULL"                                                                                   |
      | "5570_NOVA_RESP_TRANSIT_NUM!=NULL"                                                                                      |
      | "5570_NOVA_ASSIGNED_FA_TRANSIT!=NULL"                                                                                   |


  @PACC_NOVA_5570 @PACC_NOVA_5570_Nova_NegativeTestCases_Validation @5570 @NOVA @OP14037 @AUTOTESTTOTAL#
  Scenario Outline: PA CC_5570_NOVA Validate <TestID> Negative TestCases Response Fields

    # Reading data from Excel sheet
    * def testDataFileName = PACCTestDataNOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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

    # It clears Result fields
    * clearResultFields()

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

    # Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                       |
      | "N-5570_NOVA_DECEASED_F=Y"                                                                   |
      | "N-5570_NOVA_DECEASED_F=NULL"                                                                |
      | "N-5570_NOVA_CUST_TP_CD!= PSNL"                                                              |
      | "N-5570_NOVA_LANG_CD = K"                                                                    |
      | "N-5570_NOVA_LANG_CD = NE"                                                                   |
      | "N-5570_NOVA_LANG_CD = NULL"                                                                 |
      | "N-5570_NOVA_FIRST NAME = NULL"                                                              |
      | "N-5570_NOVA_LAST NAME = NULL"                                                               |
      | "N-5570_NOVA_GIVEN NAME = NULL"                                                              |
#      | "N-5570_NOVA_TTL NAME = NULL"                                                                |
      | "N-5570_NOVA_PRIM_ADDR_LINE1 = NULL"                                                         |
      | "N-5570_NOVA_PRIM_PROV_CD = NULL"                                                            |
      | "N-5570_NOVA_PRIM_POST_CD = NULL"                                                            |
      | "N-5570_NOVA_PRIM_CITY_CD = NULL"                                                            |
      | "N-5570_NOVA_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VCL && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VLR && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VGD && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXG && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXP && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFF && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFA && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VUS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_NOVA_PA_CCUL_CUSTOMER.Primary Product Code != VCL"                                   |
      | "N-5570_NOVA_PA_CCUL_CUSTOMER.Primary Sub Product Code != DM"                                |
#      | "N-5570_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = VCL && PA_CCUL_CUSTOMER.Primary Sub Product Code = NULL"           |
#      | "N-5570_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = NULL && PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"            |
#      | "N-5570_NOVA_PA_CCUL_Customer is Blank "                                                                                |
      | "N-5570_NOVA_PA_CCUL_Customer.preapprvd start date  = NULL"                                  |
      | "N-5570_NOVA_PA_CCUL_Customer.preapprvd end date  = NULL"                                    |
