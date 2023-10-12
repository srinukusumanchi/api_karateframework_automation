@PACC_PositiveNegative_Validation_5575
Feature: Validate PA CC Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/ORN/ChannelORN.txt')

  @PACC_ORN_5575  @PACC_ORN_5575_Positive_Validation @5575 @ORN @OP14037
  Scenario Outline: PA CC_5575_ORN Validate <TestID> Positive TestCases Response Fields

  # Reading data from Excel sheet
    * def testDataFileName = PACCORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


#  #    Clear IH when it goes to control group
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

    * call read('classpath:channels/orn/ReusableScenarios.feature@PACCOfferValidation_ORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                                 |
      | "5575_ORN_Customer Not Deceased"                                                                                       |
      | "5575_ORN_CUST_TP_CD = PSNL"                                                                                           |
      | "5575_ORN_LANG_CD = E"                                                                                                 |
      | "5575_ORN_LANG_CD = EN"                                                                                                |
      | "5575_ORN_LANG_CD = F"                                                                                                 |
      | "5575_ORN_LANG_CD = FR"                                                                                                |
      | "5575_ORN_LANG_CD = LowerCase_e"                                                                                       |
      | "5575_ORN_LANG_CD = LowerCase_en"                                                                                      |
      | "5575_ORN_LANG_CD = LowerCase_f"                                                                                       |
      | "5575_ORN_LANG_CD = LowerCase_fr"                                                                                      |
      | "5575_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD! in (VCL,VLR,VGD,AXG,AXP,AXS,VFF,VFA,VUS) && SRC_ACCT_STAT_CD!=Active" |
      | "5575_ORN_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                                                 |
      | "5575_ORN_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                                                   |
      | "5575_ORN_PA_CCUL_CUSTOMER.Primary Product Code = VCL"                                                                 |
      | "5575_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code = ZZ"                                                              |
      | "5575_ORN_CLOSEST_TRANSIT_NUM!=NULL"                                                                                   |
      | "5575_ORN_RESP_TRANSIT_NUM!=NULL"                                                                                      |
      | "5575_ORN_ASSIGNED_FA_TRANSIT!=NULL"                                                                                   |


  @PACC_ORN_5575 @PACC_ORN_5575_ORN_NegativeTestCases_Validation @5575 @ORN @OP14037
  Scenario Outline: PA CC_5575_ORN Validate <TestID> Negative TestCases Response Fields

    # Reading data from Excel sheet
    * def testDataFileName = PACCORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

    # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

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
      | TestID                                                                                      |
      | "N-5575_ORN_DECEASED_F=Y"                                                                   |
      | "N-5575_ORN_DECEASED_F=NULL"                                                                |
      | "N-5575_ORN_CUST_TP_CD!= PSNL"                                                              |
      | "N-5575_ORN_LANG_CD = K"                                                                    |
      | "N-5575_ORN_LANG_CD = NE"                                                                   |
      | "N-5575_ORN_LANG_CD = NULL"                                                                 |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VCL && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VLR && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VGD && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXG && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXP && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFF && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFA && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VUS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5575_ORN_PA_CCUL_CUSTOMER.Primary Product Code != VCL"                                   |
      | "N-5575_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code != ZZ"                                |
      | "N-5575_ORN_PA_CCUL_Customer.preapprvd start date  > current date"                          |
      | "N-5575_ORN_PA_CCUL_Customer.preapprvd end date  < current date"                            |
      | "N-5575_ORN_FIRST NAME = NULL"                                                              |
      | "N-5575_ORN_LAST NAME = NULL"                                                               |
      | "N-5575_ORN_GIVEN NAME = NULL"                                                              |
      | "N-5575_ORN_PRIM_ADDR_LINE1 = NULL"                                                         |
      | "N-5575_ORN_PRIM_PROV_CD = NULL"                                                            |
      | "N-5575_ORN_PRIM_POST_CD = NULL"                                                            |
      | "N-5575_ORN_PRIM_CITY_CD = NULL"                                                            |
      | "N-5575_ORN_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" |
      | "N-5575_ORN_PA_CCUL_Customer is Blank"                                                      |

