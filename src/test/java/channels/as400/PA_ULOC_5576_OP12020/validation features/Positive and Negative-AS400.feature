@PA_ULOC_AS400_PositiveNegative_Validation_5576
Feature: Validate PA ULOC AS400-5576 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

  @PA_ULOC_AS400 @PA_ULOC_AS400_Positive_TestCases_Validation @5576 @AS400 @OP12020
  Scenario Outline: PA_ULOC_OP12020_5576_AS400 Validate <TestID> Positive TestCases Response Fields

    * def testDataFileName = PAULOCTestDataAS400FileName
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


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@PAULOC_AS400_Validation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                         |
      | "5576_AS400_Customer Not Deceased"                                                             |
      | "5576_AS400_offer should return only 5 days after file delivery date in scheduler table"       |
      | "5576_AS400_CUST_TP_CD = PSNL"                                                                 |
      | "5576_AS400_LANG_CD = E"                                                                       |
      | "5576_AS400_LANG_CD = EN"                                                                      |
      | "5576_AS400_LANG_CD = F"                                                                       |
      | "5576_AS400_LANG_CD = FR"                                                                      |
      | "5576_AS400_LANG_CD = LowerCase_e"                                                             |
      | "5576_AS400_LANG_CD = LowerCase_en"                                                            |
      | "5576_AS400_LANG_CD = LowerCase_f"                                                             |
      | "5576_AS400_LANG_CD = LowerCase_fr"                                                            |
      | "5576_AS400_CLOSEST_TRANSIT_NUM !=NULL or RESP_TRNST_NUM !=NULL or ASSIGNED_FA_TRANSIT !=NULL" |
      | "5576_AS400_PRIM_ADDR_LINE_1 !=NULL && PRIM_PROV_CD !=NULL"                                    |
      | "5576_AS400_PRIM_CITY_NM !=NULL && PRIM_POST_CD !=NULL"                                        |
      | "5576_AS400_INDV_FRST_NM !=NULL && INDV_LAST_NM !=NULL && GIVEN_NAME!=NULL"                    |
      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = INE"         |
      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = CS"          |
      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = VIC and SRC_SYS_SUB_PRD_CD = RG"          |
      | "5576_AS400_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                       |
      | "5576_AS400_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                         |
      | "5576_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VIC"                                       |
      | "5576_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code = RG"                                    |
      | "5576_AS400_PA_CCUL_CUSTOMER.Coexist_Preapproved_End_Date !=NULL"                              |
      | "5576_AS400_PA_CCUL_CUSTOMER.CoExist_Product_Code != NULL "                                    |
      | "5576_AS400_PA_CCUL_CUSTOMER.CoExist_Sub_Product_Code != NULL"                                 |
      | "5576_AS400_PA_CCUL_CUSTOMER.PA_CC_LIMIT !=NULL"                                               |
      | "5576_AS400_PA_CCUL_CUSTOMER.USPO_RATE !=NULL"                                                 |
      | "5576_AS400_PA_CCUL_CUSTOMER.BILL_CODE !=NULL"                                                 |


  @PA_ULOC_AS400 @PA_ULOC_AS400_Negative_TestCases_Validation @5576 @AS400 @OP12020
  Scenario Outline: PA ULOC_OP12020_5576_AS400 Validate <TestID> Negative TestCases Response Fields

    * def testDataFileName = PAULOCTestDataAS400FileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

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
      | TestID                                                                                        |
#      | "N-5576_AS400_offer should not return 5 days before file delivery date in scheduler table"    |
      | "N-5576_AS400_DECEASED_F=Y"                                                                   |
      | "N-5576_AS400_DECEASED_F=NULL"                                                                |
      | "N-5576_AS400_CUST_TP_CD!= PSNL"                                                              |
      | "N-5576_AS400_LANG_CD = K"                                                                    |
      | "N-5576_AS400_LANG_CD = NE"                                                                   |
      | "N-5576_AS400_LANG_CD = NULL"                                                                 |
      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is INE"     |
      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is CS"      |
      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is VIC and SRC_SYS_SUB_PRD_CD is RG"      |
      | "N-5576_AS400_PA_CCUL_CUSTOMER.Primary Product Code != VIC"                                   |
      | "N-5576_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code != RG"                                |
      | "N-5576_AS400_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" |
      | "N-5576_AS400_PRIM_ADDR_LINE_1 =NULL"                                                         |
      | "N-5576_AS400_PRIM_PROV_CD =NULL"                                                             |
      | "N-5576_AS400_PRIM_CITY_NM =NULL"                                                             |
      | "N-5576_AS400_PRIM_POST_CD =NULL"                                                             |
      | "N-5576_AS400_INDV_FRST_NM =NULL"                                                             |
      | "N-5576_AS400_INDV_LAST_NM =NULL"                                                             |
      | "N-5576_AS400_GIVEN_NAME =NULL"                                                               |
      | "N-5576_AS400_PA_CCUL_Customer.preapprvd start date  = After The Present Date"                |
      | "N-5576_AS400_PA_CCUL_Customer.preapprvd end date  = Before The Present Date"                 |