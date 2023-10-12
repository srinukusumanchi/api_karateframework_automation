@SPSP_Loan_Repay_Nova @PositiveNegative_Validation_5701
Feature: Validate SPSP loan Repay offer 5701 Positive and Negative test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @SPSP_Loan_Repay_Positive_Scenarios_withIHValidation @5701 @NOVA @RS20027
  Scenario Outline: SPSP Loan Repay - RS20027_5701_NOVA Validate <TestID> IH field values against proposition data
    * def testDataFileName = SPSP_Loan_RepayNOVAFileName
    #    Reading data from Excel sheet
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

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for SPSP specific fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@SPSPLoanRepaySpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                            |
      |"5701_NOVA_BASE"                                   |


  @SPSP_Loan_Repay_Positive_Scenarios_withoutIHValidation @5701 @NOVA @RS20027
  Scenario Outline: SPSP Loan Repay - RS20027_5701_NOVA Validate <TestID> web response against proposition data
    * def testDataFileName = SPSP_Loan_RepayNOVAFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
   # * call clearIH(cid,requestfile,offerCode)

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

   # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for SPSP specific fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@SPSPLoanRepaySpecificOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
     | TestID                                             |
     |"5701_NOVA_lang_cd = fr"                            |
     |"5701_NOVA_Employee_Staff = Null"                   |
     |"5701_NOVA_Current Date - STUDY_END_DT =120 Days"   |
     |"5701_NOVA_Current Date - STUDY_END_DT  = 121 Days" |
     |"5701_NOVA_Current Date - STUDY_END_DT  =149 Days"  |
     |"5701_NOVA_Current Date - STUDY_END_DT =150 Days"   |


  @SPSP_Loan_Repay_Nova_Validation_5701_Negative_TestCases_Validation @5701 @NOVA @RS20027
  Scenario Outline: SPSP_Loan_Repay_Nova_Validation_5701_Negative_TestCases_Validation Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = SPSP_Loan_RepayNOVAFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print 'testid'+data
    * def cid = karate.get('data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

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
      | TestID                                              |
      |"N-5701_NOVA_DECEASED_F=NULL"                        |
      |"N-5701_NOVA_CUST_TP_CD!= PSNL"                      |
      |"N-5701_NOVA_DECEASED_F=Y"                           |
      |"N-5701_NOVA_LANG_CD = K"                            |
      |"N-5701_NOVA_LANG_CD = NULL"                         |
      |"N-5701_NOVA_PRIM_CNTRY_CD = NULL"                   |
      |"N-5701_NOVA_PRIM_CNTRY_CD != CA"                    |
      |"N-5701_NOVA_MKTBl = N"                              |
      |"N-5701_NOVA_EMPLOYEE_STAFF_F = Y"                   |
      |"N_5701_NOVA_Current Date - STUDY_END_DT =119 Days"  |
      |"N_5701_NOVA_Current Date - STUDY_END_DT  = 151 Days"|
      |"N_5701_NOVA_ACCT_SUBSYS_ID!=KS"                     |
      |"N_5701_NOVA_ACCT_STAT_CD!=Open"                     |
      |"N_5701_NOVA_ACCT_STAT_CD = NULL"                    |
      |"N_5701_NOVA_SRC_SYS_PRD_CD!= SSL"                   |
      |"N_5701_NOVA_SRC_SYS_PRD_CD = NULL"                  |
      |"N_5701_NOVA_SRC_SYS_SUB_PRD_CD != SP"               |
      |"N_5701_NOVA_SRC_SYS_SUB_PRD_CD = NULL"              |
