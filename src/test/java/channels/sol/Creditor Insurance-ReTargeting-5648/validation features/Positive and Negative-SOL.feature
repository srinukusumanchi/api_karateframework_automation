@PositiveNegativeRetargeting_Validation_5648
Feature: Validate Creditor Insurance- Retargeting-5648 Positive and Negative test cases

  Background:  Common for SOL Positive and Negative

  # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')


  @CreditorInsuranceRetargeting @CreditorInsurance_retargetingSOL_Positive_TestCases_Validation @5648 @SOL @VS17084 @AUTOTESTTOTAL#48
  Scenario Outline: Creditor Insurance Retargeting_VS17084_5648_SOL Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
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
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


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

    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceRetargetingSOLOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                |
      | "5648_SOL_EMPLOYEE_STAFF_F=NULL"                      |
      | "5648_SOL_DO_NOT_SOLICIT_F=N"                         |
      | "5648_SOL_DO_NOT_SOLICIT_F=NULL"                      |
      | "5648_SOL_CUST_AGE=18"                                |
      | "5648_SOL_CUST_AGE=69"                                |
      | "5648_SOL_CUST_AGE=18 to 69"                          |
      | "5648_SOL_ACCT_SUBSYS_ID = KS"                        |
      | "5648_SOL_SRC_ACCT_STAT_CD = Open"                    |
      | "5648_SOL_CR_CRD_PRTCTN_F = N"                        |
      | "5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = Y"               |
      | "5648_SOL_CR_CRD_LMT_AMT <50000 andCR_CRD_LMT_AMT >0" |
      | "5648_SOL_CR_CRD_LMT_AMT =50000 andCR_CRD_LMT_AMT >0" |
      | "5648_SOL_ACCT_ODT > 50 days"                         |
      | "5648_SOL_ACCT_ODT = 51 days"                         |
      | "5648_SOL_CRNT_BAL_AMT < (1.2 x CR_CRD_LMT_AMT)"      |
      | "5648_SOL_CRNT_BAL_AMT = (1.2 x CR_CRD_LMT_AMT)"      |
      | "5648_SOL_AXG_GC"                                     |
      | "5648_SOL_AXG_GS"                                     |
      | "5648_SOL_AXP_PC"                                     |
      | "5648_SOL_AXS_SC"                                     |
      | "5648_SOL_AXS_SS"                                     |
      | "5648_SOL_VCL_DM"                                     |
      | "5648_SOL_VCL_NF"                                     |
      | "5648_SOL_VCL_NH"                                     |
      | "5648_SOL_VCL_RG"                                     |
      | "5648_SOL_VCL_SC"                                     |
      | "5648_SOL_VCL_SL"                                     |
      | "5648_SOL_VCL_SS"                                     |
      | "5648_SOL_VCL_ST"                                     |
      | "5648_SOL_VCL_SV"                                     |
      | "5648_SOL_VCL_ZZ"                                     |
      | "5648_SOL_VFA_A1"                                     |
      | "5648_SOL_VFA_A3"                                     |
      | "5648_SOL_VFF_F1"                                     |
      | "5648_SOL_VFF_TR"                                     |
      | "5648_SOL_VFF_TS"                                     |
      | "5648_SOL_VGD_NF"                                     |
      | "5648_SOL_VGD_RG"                                     |
      | "5648_SOL_VGD_SP"                                     |
      | "5648_SOL_VGD_ST"                                     |
      | "5648_SOL_VLR_NF"                                     |
      | "5648_SOL_VLR_RC"                                     |
      | "5648_SOL_VLR_RG"                                     |
      | "5648_SOL_VUS_RG"                                     |
      | "5648_SOL_LANG_CD in en"                              |
      | "5648_SOL_LANG_CD in fr"                              |


  @CreditorInsuranceRetargeting @CreditorInsurance_RetargetingSOL_Negative_TestCases_Validation @5648 @SOL @VS17084 @AUTOTESTTOTAL#36
  Scenario Outline: Creditor Insurance Retargeting_VS17084_5648_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

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
      | "N-5648_SOL_DECEASED_F=Y"                                               |
      | "N-5648_SOL_DECEASED_F=NULL"                                            |
      | "N-5648_SOL_CUST_TP_CD=NONPSNL"                                         |
      | "N-5648_SOL_PRIM_CNTRY_CD != CA"                                        |
      | "N-5648_SOL_EMPLOYEE_STAFF_F=Y"                                         |
      | "N-5648_SOL_MRKTBLE_F = N"                                              |
      | "N-5648_SOL_MRKTBLE_F = NULL"                                           |
      | "N-5648_SOL_DO_NOT_SOLICIT_F=Y"                                         |
      | "N-5648_SOL_CUST_AGE<18"                                                |
      | "N-5648_SOL_CUST_AGE>69"                                                |
      | "N-5648_SOL_CUST_AGE=NULL"                                              |
      | "N-5648_SOL_ACCT_SUBSYS_ID != KS"                                       |
      | "N-5648_SOL_SRC_ACCT_STAT_CD != Open"                                   |
      | "N-5648_SOL_CR_CRD_PRTCTN_F = Y"                                        |
      | "N-5648_SOL_CR_CRD_PRTCTN_F = NULL"                                     |
      | "N-5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = N"                               |
      | "N-5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = NULL"                            |
      | "N-5648_SOL_CR_CRD_LMT_AMT>50000"                                       |
      | "N-5648_SOL_CR_CRD_LMT_AMT<0"                                           |
      | "N-5648_SOL_AXG_AB"                                                     |
      | "N-5648_SOL_AXP_BC"                                                     |
      | "N-5648_SOL_AXS_CD"                                                     |
      | "N-5648_SOL_VCL_EF"                                                     |
      | "N-5648_SOL_VFA_AC"                                                     |
      | "N-5648_SOL_VFF_GH"                                                     |
      | "N-5648_SOL_VGD_EF"                                                     |
      | "N-5648_SOL_VLR_TH"                                                     |
      | "N-5648_SOL_VUS_AS"                                                     |
      | "N-5648_SOL_Current Date - ACCT_ODT < 50 days"                          |
      | "N-5648_SOL_Current Date - ACCT_ODT = 50 days"                          |
      | "N-5648_SOL_CRNT_BAL_AMT > 1.2 x CR_CRD_LMT_AMT"                        |
      | "N-5648_SOL_LANG_CD = NULL"                                             |
      | "N-5648_SOL_LANG_CD = ft"                                               |
      | "N-5648_SOL_INSIGHT_CD != FLG_CC_INS_ABANDON_APP"                       |
      | "N-5648_SOL_CURR_VAL != 1"                                              |
      | "N-5648_SOL_Current date - EVENT_DATE >  30 days"                       |
      | "N-5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL < 1"    |
      | "N-5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL = NULL" |



  @CreditorInsuranceRetargeting @CreditorInsurance_retargetingSOL_Positive_TestCases_Validation_IH @5648 @SOL @VS17084 @AUTOTESTTOTAL#7
  Scenario Outline: Creditor Insurance Retargeting_VS17084_5648_SOL Validate <TestID> Positive TestCases Response Fields with IH
  #    Reading data from Excel sheet
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
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
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


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

    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceRetargetingSOLOfferValidation')

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@CreditorInsuranceOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                      |
      | "5648_SOL_INSIGHT_CD = FLG_CC_INS_ABANDON_APP and CURR_VAL = 1 and Current date - EVENT_DATE = 30 days"                                                     |
      | "5648_SOL_INSIGHT_CD = FLG_CC_INS_ABANDON_APP and CURR_VAL = 1 and Current date - EVENT_DATE < 30 days"                                                     |
      | "5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL = 1"                                                                                          |
      | "5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL > 1"                                                                                          |
      | "5648_SOL_RAB_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE <  30" |
      | "5648_SOL_RAB_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL > 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE =  30" |
      | "5648_SOL_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL! = 1,Current date - EVENT_DATE <  30"    |
      | "5648_SOL_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE >  30"     |
      | "5648_SOL_RAB_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL != 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE <  30"    |
