@PositiveNegative_Validation_5570
Feature: Validate PA Credit Cards-5570 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

  @PACC @PACC_MomentumInfinite_Positive_TestCases_IH_Validation @5570 @AS400 @OP14037
  Scenario Outline: PA Credit Cards_OP14037_5570_AS400 Validate <TestID> IH for Positive TestCases
    * def testId = <TestID>

    * def testDataFileName = PACCTestDataAS400FileName
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

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCULOCOfferValidationWithIH')

    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "5570_AS400_Customer Not Deceased" |


  @PACC @PACC_MomentumInfinite_Positive_TestCases_Validation @5570 @AS400 @OP14037
  Scenario Outline: PA Credit Cards_OP14037_5570_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = PACCTestDataAS400FileName
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

#   #    It clears Result fields
#    * clearResultFields()

    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                   |
      | "5570_AS400_Customer Not Deceased"                                                                                       |
      | "5570_AS400_CUST_TP_CD = PSNL"                                                                                           |
      | "5570_AS400_LANG_CD = E"                                                                                                 |
      | "5570_AS400_LANG_CD = EN"                                                                                                |
      | "5570_AS400_LANG_CD = F"                                                                                                 |
      | "5570_AS400_LANG_CD = FR"                                                                                                |
      | "5570_AS400_LANG_CD = LowerCase_e"                                                                                       |
      | "5570_AS400_LANG_CD = LowerCase_en"                                                                                      |
      | "5570_AS400_LANG_CD = LowerCase_f"                                                                                       |
      | "5570_AS400_LANG_CD = LowerCase_fr"                                                                                      |
      | "5570_AS400_CLOSEST_TRANSIT_NUM !=NULL or RESP_TRNST_NUM !=NULL or ASSIGNED_FA_TRANSIT !=NULL"                           |
      | "5570_AS400_PRIM_ADDR_LINE_1 !=NULL && PRIM_PROV_CD !=NULL"                                                              |
      | "5570_AS400_PRIM_CITY_NM !=NULL && PRIM_POST_CD !=NULL"                                                                  |
      | "5570_AS400_INDV_FRST_NM !=NULL && INDV_LAST_NM !=NULL && GIVEN_NAME!=NULL"                                              |
      | "5570_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD! in (VCL,VLR,VGD,AXG,AXP,AXS,VFF,VFA,VUS) && SRC_ACCT_STAT_CD!=Active" |
      | "5570_AS400_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                                                   |
      | "5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VCL"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"                                                              |
      | "5570_AS400_PA_CCUL_CUSTOMER.Coexist Product Code = VIC"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.Coexist Sub Product Code = RG"                                                              |


  @PACC @PACC_MomentumInfinite_Negative_TestCases_Validation @5570 @AS400 @OP14037
  Scenario Outline: PA Credit Cards_Momentum Infinite_OP14037_5570_AS400 Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = PACCTestDataAS400FileName
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
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * match nbaCode_XML == null

    Examples:
      | TestID                                                                                        |
#      | "N-5570_AS400_offer should not return 5 days before file delivery date in scheduler table" |
      | "N-5570_AS400_DECEASED_F=Y"                                                                   |
      | "N-5570_AS400_DECEASED_F=NULL"                                                                |
      | "N-5570_AS400_CUST_TP_CD!= PSNL"                                                              |
#      | "N-5570_AS400_CUST_TP_CD = NULL"                                                           |
      | "N-5570_AS400_LANG_CD = K"                                                                    |
      | "N-5570_AS400_LANG_CD = NE"                                                                   |
      | "N-5570_AS400_LANG_CD = NULL"                                                                 |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VCL && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VLR && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VGD && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXG && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXP && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFF && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFA && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VUS && SRC_ACCT_STAT_CD=Active"          |
      | "N-5570_AS400_FIRST NAME = NULL"                                                              |
      | "N-5570_AS400_LAST NAME = NULL"                                                               |
      | "N-5570_AS400_GIVEN NAME = NULL"                                                              |
      | "N-5570_AS400_PRIM_ADDR_LINE1 = NULL"                                                         |
      | "N-5570_AS400_PRIM_PROV_CD = NULL"                                                            |
      | "N-5570_AS400_PRIM_POST_CD = NULL"                                                            |
      | "N-5570_AS400_PRIM_CITY_CD = NULL"                                                            |
      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code != VCL"                                   |
      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code != DM"                                |
#      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VCL && PA_CCUL_CUSTOMER.Primary Sub Product Code = NULL" |
#      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = NULL && PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"  |
      | "N-5570_AS400_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" |
#      | "N-5570_AS400_PA_CCUL_Customer is Blank "                                                                      |
      | "N-5570_AS400_PA_CCUL_Customer.preapprvd start date  = NULL"                                  |
      | "N-5570_AS400_PA_CCUL_Customer.preapprvd end date  = NULL"                                    |

