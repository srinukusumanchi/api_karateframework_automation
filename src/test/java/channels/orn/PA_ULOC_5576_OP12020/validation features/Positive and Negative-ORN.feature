@PAULOC_PositiveNegative_Validation_5576
Feature: Validate PA ULOC Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
    # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @PAULOC_ORN_5576  @PAULOC_ORN_5576_Positive_Validation @5576 @ORN @OP12020 @AUTOTESTTOTAL#
  Scenario Outline: PA ULOC_5576_ORN Validate <TestID> Positive TestCases Response Fields

  # Reading data from Excel sheet
    * def testDataFileName = PAULOCTestDataORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    * def pacculsheetdata = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,paULOCPACCSheetName);
    * def preApprovedStartDate = karate.get('pacculsheetdata.PRIMARY_PREAPPROVED_START_DATE')
#    * def preApprovedStartDate = '2021-09-01'
    * def preApprovedEndDate = karate.get('pacculsheetdata.PRIMARY_PREAPPROVED_END_DATE')
    * def primaryProductCode = karate.get('pacculsheetdata.PRIMARY_PRODUCT_CODE')
    * def primarySubProductCode = karate.get('pacculsheetdata.PRIMARY_SUB_PRODUCT_CODE')


#    * def startDate = '9/1/2021'
#    * def EndDate = '2/28/2022'


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

    * call read('classpath:channels/orn/ReusableScenarios.feature@PAULOCOfferValidation_ORN')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                               |
      | "5576_ORN_Customer Not Deceased"                                                     |
      | "5576_ORN_CUST_TP_CD = PSNL"                                                         |
      | "5576_ORN_LANG_CD = E"                                                               |
      | "5576_ORN_LANG_CD = EN"                                                              |
      | "5576_ORN_LANG_CD = F"                                                               |
      | "5576_ORN_LANG_CD = FR"                                                              |
      | "5576_ORN_LANG_CD = LowerCase_e"                                                     |
      | "5576_ORN_LANG_CD = LowerCase_en"                                                    |
      | "5576_ORN_LANG_CD = LowerCase_f"                                                     |
      | "5576_ORN_LANG_CD = LowerCase_fr"                                                    |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = INE" |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = CS"  |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = VIC and SRC_SYS_SUB_PRD_CD = RG"  |
      | "5576_ORN_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                               |
      | "5576_ORN_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                 |
      | "5576_ORN_PA_CCUL_CUSTOMER.Primary Product Code = VIC"                               |
      | "5576_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code = RG"                            |
      | "5576_ORN_PA_CCUL_CUSTOMER.PA_ULOC_LIMIT != NULL"                                    |
      | "5576_ORN_CLOSEST_TRANSIT_NUM!=NULL"                                                 |
      | "5576_ORN_RESP_TRANSIT_NUM!=NULL"                                                    |
      | "5576_ORN_ASSIGNED_FA_TRANSIT!=NULL"                                                 |

  @PAULOC_ORN_5576 @PAULOC_ORN_5576_Nova_NegativeTestCases_Validation @5576 @ORN @OP12020 @AUTOTESTTOTAL#
  Scenario Outline: PA ULOC_5576_ORN Validate <TestID> Negative TestCases Response Fields

    # Reading data from Excel sheet
    * def testDataFileName = PAULOCTestDataORNTestData

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
      | "N-5576_ORN_DECEASED_F=Y"                                                                   |
      | "N-5576_ORN_DECEASED_F=NULL"                                                                |
      | "N-5576_ORN_CUST_TP_CD!= PSNL"                                                              |
      | "N-5576_ORN_LANG_CD = K"                                                                    |
      | "N-5576_ORN_LANG_CD = NE"                                                                   |
      | "N-5576_ORN_LANG_CD = NULL"                                                                 |
      | "N-5570_ORN_FIRST NAME = NULL"                                                              |
      | "N-5570_ORN_LAST NAME = NULL"                                                               |
#      | "N-5570_ORN_GIVEN NAME = NULL"                                                              |
      | "N-5570_ORN_PRIM_ADDR_LINE1 = NULL"                                                         |
      | "N-5570_ORN_PRIM_PROV_CD = NULL"                                                            |
      | "N-5570_ORN_PRIM_POST_CD = NULL"                                                            |
      | "N-5570_ORN_PRIM_CITY_CD = NULL"                                                            |
      | "N-5570_ORN_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is INE"     |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is CS"      |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is VIC and SRC_SYS_SUB_PRD_CD is RG"      |
      | "N-5576_ORN_PA_CCUL_CUSTOMER.Primary Product Code != VIC"                                   |
      | "N-5576_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code != RG"                                |
      | "N-5576_ORN_PA_CCUL_Customer.preapprvd start date  = After The Present Date"                |
      | "N-5576_ORN_PA_CCUL_Customer.preapprvd end date  = Before The Present Date"                 |
