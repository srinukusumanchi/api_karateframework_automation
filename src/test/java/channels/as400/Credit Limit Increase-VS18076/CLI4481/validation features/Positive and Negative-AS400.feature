@CIMCAMP-418 @PositiveNegative_Validation_4481
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower-4481 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_IH_Validation @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Validate <TestID> IH field values against proposition data
    * def testDataFileName = CLItestDataFileName
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4481_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLICoBorrower_Positive_TestCases_Validation @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
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

    * call read('classpath:channels/as400/ReusableScenarios.feature@CLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                        |
      | "4481_INDV_BRTH_DT_Equal to 18 yrs"                                           |
      | "4481_INDV_BRTH_DT_Equal to 70 yrs"                                           |
      | "4481_Lang Code = E"                                                          |
      | "4481_Lang Code = EN"                                                         |
      | "4481_Lang Code = F"                                                          |
      | "4481_Lang Code = FR"                                                         |
      | "4481_Lang Code small case = en"                                              |
      | "4481_Lang Code small case = fr"                                              |
      | "4481_Lang Code small case = f"                                               |
      | "4481_Lang Code small case = fr"                                              |
      | "4481_SRC_ACCT_STAT_CD = 5"                                                   |
      | "4481_DNS_F = Y"                                                              |
      | "4481_DNS_F = NULL"                                                           |
      | "4481_DNS_F = N"                                                              |
      | "4481_PRD CD- VCL, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  |
      | "4481_PRD CD- VCL, SUB PRD CD -ST & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  |
      | "4481_PRD CD- VCL, SUB PRD CD -NF  & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4481_PRD CD- VCL, SUB PRD CD -DM  & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID" |
      | "4481_PRD CD-VLR, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VLR, SUB PRD CD -NF & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VGD, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VGD, SUB PRD CD -ST & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VGD, SUB PRD CD -SP & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VGD, SUB PRD CD -NF & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VUS, SUB PRD CD -RG & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VLR, SUB PRD CD -RC & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VCL, SUB PRD CD -ZZ & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VFA, SUB PRD CD -A1 & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VFF, SUB PRD CD - F1 & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"  |
      | "4481_PRD CD-VFF, SUB PRD CD -TR & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_PRD CD-VFF, SUB PRD CD -TS & Primary.CIS_CUST_ID != CC_SCNRY_CUST_ID"   |
      | "4481_CLI Offer Start Date equal to current date"                             |
      | "4481_CLI Offer Expiry Date equal to current date"                            |
      | "4481_SRC_ACCT_STAT_CD = A"                                                   |
      | "4481_SRC_ACCT_STAT_CD = Open"                                                |
      | "4481_SRC_ACCT_STAT_CD = Active"                                              |
      | "4481_SRC_ACCT_STAT_CD = NULL"                                                |
      | "4481_Indv_Brth_Dt greater than 70"                                           |

  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseAmexCLICoBorrower_Negative_TestCases_Validation @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_AS400 Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
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
      | TestID                                                 |
      | "N - 4481_PRIM_CNTRY_CD! = CA"                         |
      | "N - 4481_PRIM_CNTRY_CD = Null"                        |
      | "N - 4481_CUST_TP_CD != PSNL"                          |
      | "N - 4481_CUST_TP_CD =  Null"                          |
      | "N - 4481_Indv_Brth_Dtless than 18"                    |
      | "N - 4481_Indv_Brth_Dt Equal to Null"                  |
      | "N - 4481_Secondary Name is Null"                      |
      | "N - 4481_Deceased_F = Y"                              |
      | "N - 4481_Deceased_F = Null"                           |
      | "N - 4481_LANG_CD = K"                                 |
      | "N - 4481_LANG_CD = NE"                                |
      | "N - 4481_LANG_CD = Null"                              |
      | "N - 4481_MKT_F = N"                                   |
      | "N - 4481_MKT_F = NULL"                                |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SP"                 |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SV"                 |
      | "N - 4481_PRD CD- VCL, SUB PRD CD -SS"                 |
      | "N - 4481_CLI_OFR_ST_DT  greater than current date"    |
      | "N - 4481_CLI_OFR_EXP_DT lesser than current date"     |
      | "N - 4481_CLI_OFR_F =A"                                |
      | "N - 4481_CLI_OFR_F = Null"                            |
      | "N - 4481_ACCT_SUBSYS_ID = BB"                         |
      | "N - 4481_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" |
      | "N - 4481_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    |
      | "N - 4481_CLI_OFR_CRNT_F = N"                          |
      | "N - 4481_CLI_OFR_CRNT_F = Null"                       |
      | "N - 4481_CC_STEP_LINK_F  = Y"                         |
      | "N - 4481_CC_STEP_LINK_F  = Null"                      |
      | "N - 4481_CC_ACCT_VIP_IND  = 2"                        |
      | "N - 4481_CC_ACCT_VIP_IND  = 9"                        |
      | "N - 4481_CLI_OFR_ST_DT  null"                         |
      | "N - 4481_CLI_OFR_EXP_DT is null"                      |
      | "N - 4481_PRIMARY_ACCT_HOLDER_FLAG = N"                |
      | "N - 4481_PRIMARY_ACCT_HOLDER_FLAG = Null"             |
