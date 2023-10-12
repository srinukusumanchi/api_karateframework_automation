@CIEPROG-50 @PositiveNegative_Validation_5821
Feature: Validate D2D Engagement Welcome-NTB-5821 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')

  @D2DWelcome @D2DEngagementWelcomeNTB_IH_Validation @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-NTB_RS17103_5821_SOL Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')

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
    * call read('classpath:channels/sol/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                            |
      | "5821_ISSUE_Engagement_Group_D2D" |

  @D2DWelcome @D2DEngagementWelcomeNTB_Positive_TestCases_Validation  @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-NTB_RS17103_5821_SOL Validate <TestID> Positive TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
  #     Generate a SOL SOAP call
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

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                |
      | "5821_SOL_LANG_CD_eq_fr"                                                      |
      | "5821_SOL_CUST_AGE_eq_16"                                                     |
      | "5821_SOL_DO_NOT_SOLICIT_F_eq_NULL"                                           |
      | "5821_SOL_NOT_AML_KYC_eq_NULL"                                                |
      | "5821_SOL_CUST_OPND_DT_eq_120_days"                                           |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_02" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_04" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_02" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_02" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_04" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_07" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_08" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_07" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_08" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_11" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03" |
      | "5821_SOL_4332_5821_Prioritization"                                           |
      | "5821_SOL_4334_5821_Prioritization"                                           |

  @D2DWelcome @D2DEngagementWelcomeNTB_Negative_TestCases_Validation  @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-NTB_RS17103_5821_SOL Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a SOL SOAP call
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
    * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                     |
      | "N_5821_SOL_DECEASED_F_eq_Y"                                                      |
      | "N_5821_SOL_DECEASED_F_eq_NULL"                                                   |
      | "N_5821_SOL_CUST_TP_CD_ne_PSNL"                                                   |
      | "N_5821_SOL_PRIM_CNTRY_CD_ne_CA"                                                  |
      | "N_5821_SOL_PRIM_CNTRY_CD_eq_NULL"                                                |
      | "N_5821_SOL_DO_NOT_SOLICIT_F_eq_Y"                                                |
      | "N_5821_SOL_NOT_AML_KYC_eq_Y"                                                     |
      | "N_5821_SOL_CUST_AGE_lt_16"                                                       |
      | "N_5821_SOL_CUST_AGE_eq_NULL"                                                     |
      | "N_5821_SOL_LANG_CD_eq_bn"                                                        |
      | "N_5821_SOL_Lang_CD_eq_NULL"                                                      |
      | "N_5821_SOL_CUST_OPND_DT_gt_120_days"                                             |
      | "N_5821_SOL_CUST_OPND_DT_eq_NULL"                                                 |
      | "N_5821_SOL_ACCT_SUBSYS_ID_ne_BB"                                                 |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_NULL"                                               |
      | "N_5821_SOL_SRC_ACCT_STAT_CD_ne_A"                                                |
      | "N_5821_SOL_SRC_ACCT_STAT_CD_eq_NULL"                                             |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_07"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_NULL" |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_02"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_02" |
      | "N_5821_SOL_ACCT_ODT_eq_NULL"                                                     |

