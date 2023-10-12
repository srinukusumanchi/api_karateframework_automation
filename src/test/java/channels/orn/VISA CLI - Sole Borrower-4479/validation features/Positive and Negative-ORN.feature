@CIMCAMP-418 @PositiveNegative_Validation_4479_ORN
Feature: Validate Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Positive and Negative test cases for ORN channel

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')


  @CreditLimitIncrease @CreditLimitIncreaseVISASoloBorrower_IH_Validation_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> IH field values against proposition data
    * def testDataFileName = CLItestDataFileName
    # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid
    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num
    * string testId = karate.get('$data.TestID')
    # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
#    # Report database records in cucumber report
#    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
    # Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    # Printing request body in console
    * print '*********Request**********'+requestfile
    # request (Karate keyword) for sending request string
    * request requestfile
    # Performing action on JSON request (Post Action)
    * method post
    # Verifying Success with status code 200
    * status 200
    * def responseString = response
    # Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
    # It clears Result fields
    * clearResultFields()
    # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')
    # Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIOfferValidationWithIH')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                               |
      | "4479_Validate IH Record fields against Proposition" |


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLISoleBorrower_Positive_TestCases_Validation_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> Positive TestCases Response Fields
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
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #  Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
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

    * call read('classpath:channels/orn/ReusableScenarios.feature@CLIContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                        |
      | "4479_ISSUE = Engagement and Group = Unsecured Lending"       |
      | "4479_CUST_TP_CD = PSNL"                                      |
      | "4479_PRIM_CNTRY_CD = CA"                                     |
      | "4479_INDV_BRTH_DT_Equal to 18 yrs"                           |
      | "4479_INDV_BRTH_DT_Greater than 18 yrs"                       |
      | "4479_INDV_BRTH_DT_Less than 70 yrs"                          |
      | "4479_INDV_BRTH_DT_Equal to 70 yrs"                           |
      | "4479_MKT_F = Y"                                              |
      | "4479_Deceased_F = N"                                         |
      | "4479_Lang Code = E"                                          |
      | "4479_Lang Code = EN"                                         |
      | "4479_Lang Code = F"                                          |
      | "4479_Lang Code = FR"                                         |
      | "4479_Lang Code Small Case = en"                              |
      | "4479_Lang Code Small Case = fr"                              |
      | "4479_PRIMARY_ACCT_HOLDER_FLAG = Y"                           |
      | "4479_SRC_ACCT_STAT_CD = A"                                   |
      | "4479_SRC_ACCT_STAT_CD = Open"                                |
      | "4479_SRC_ACCT_STAT_CD = Active"                              |
      | "4479_SRC_ACCT_STAT_CD = NULL"                                |
      | "4479_SRC_ACCT_STAT_CD = 5"                                   |
      | "4479_ACCT_SUBSYS_ID = KS"                                    |
      | "4479_CLI_OFR_F =  Z"                                         |
      | "4479_PRD CD- VCL, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"  |
      | "4479_PRD CD- VCL, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"  |
      | "4479_PRD CD- VCL, SUB PRD CD -NF  & CC_SCNRY_CUST_ID = Null" |
      | "4479_PRD CD- VCL, SUB PRD CD -DM  & CC_SCNRY_CUST_ID = Null" |
      | "4479_PRD CD-VLR, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VLR, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VGD, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VGD, SUB PRD CD -ST & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VGD, SUB PRD CD -SP & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VGD, SUB PRD CD -NF & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VUS, SUB PRD CD -RG & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VLR, SUB PRD CD -RC & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VCL, SUB PRD CD -ZZ & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VFA, SUB PRD CD -A1 & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VFF, SUB PRD CD - F1 & CC_SCNRY_CUST_ID = Null"  |
      | "4479_PRD CD-VFF, SUB PRD CD -TR & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD-VFF, SUB PRD CD -TS & CC_SCNRY_CUST_ID = Null"   |
      | "4479_PRD CD- VCL, SUB PRD CD -SV"                            |
      | "4479_PRD CD- VCL, SUB PRD CD -SS"                            |
      | "4479_CLI Offer Start Date Less than current date"            |
      | "4479_CLI Offer Start Date equal to current date"             |
      | "4479_CLI Offer Expiry Date greater than current date"        |
      | "4479_CLI Offer Expiry Date equal to current date"            |
      | "4479_CLI_APRVD_CR_LMT greater than CR_CRD_LMT_AMT"           |
      | "4479_CLI_OFR_CRNT_F = Y"                                     |
      | "4479_CC_STEP_LINK_F  = N"                                    |
      | "4479_CC_ACCT_VIP_IND  = 1"                                   |
      | "4479_Indv_Brth_Dt greater than 70"                           |


  @CreditLimitIncrease @Pre-ApprovedCreditLimitIncreaseVISACLISoleBorrower_Negative_TestCases_Validation_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = CLItestDataFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

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

    * match responseString == {}

    Examples:
      | TestID                                                 |
      | "N - 4479_PRIM_CNTRY_CD! = CA"                         |
      | "N - 4479_PRIM_CNTRY_CD = Null"                        |
      | "N - 4479_CUST_TP_CD != PSNL"                          |
      | "N - 4479_Indv_Brth_Dtless than 18"                    |
      | "N - 4479_Indv_Brth_Dt Equal to Null"                  |
      | "N - 4479_Deceased_F = Y"                              |
      | "N - 4479_Deceased_F = Null"                           |
      | "N - 4479_LANG_CD = K"                                 |
      | "N - 4479_LANG_CD = NE"                                |
      | "N - 4479_LANG_CD = Null"                              |
      | "N - 4479_MKT_F = N"                                   |
      | "N - 4479_MKT_F = NULL"                                |
      | "N - 4479_PRD CD- VCL, SUB PRD CD -SP"                 |
      | "N - 4479_CLI_OFR_F =A"                                |
      | "N - 4479_CLI_OFR_F = Null"                            |
      | "N - 4479_ACCT_SUBSYS_ID = BB"                         |
      | "N - 4479_CLI_APRVD_CR_LMT lesser than CR_CRD_LMT_AMT" |
      | "N - 4479_CLI_APRVD_CR_LMT equal to CR_CRD_LMT_AMT"    |
      | "N - 4479_CLI_OFR_CRNT_F = N"                          |
      | "N - 4479_CLI_OFR_CRNT_F = Null"                       |
      | "N - 4479_CC_STEP_LINK_F  = Y"                         |
      | "N - 4479_CC_STEP_LINK_F  = Null"                      |
      | "N - 4479_CC_ACCT_VIP_IND  = 2"                        |
      | "N - 4479_CC_ACCT_VIP_IND  = 9"                        |
      | "N - 4479_CLI_OFR_ST_DT  null"                         |
      | "N - 4479_CLI_OFR_EXP_DT is null"                      |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = N"                |
      | "N - 4479_PRIMARY_ACCT_HOLDER_FLAG = Null"             |
      | "N - 4479_CLI_OFR_ST_DT  greater than current date"    |
      | "N - 4479_CLI_OFR_EXP_DT lesser than current date"     |