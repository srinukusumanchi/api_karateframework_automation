@SPSP_Loan_Repay_SOL @PositiveNegative_Validation_5701
Feature: Validate SPSP loan Repay offer 5701 Positive and Negative test cases

  Background: Common for SOL Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/SOL/ChannelSOL.txt')


  @SPSP_Loan_Repay_Positive_Scenarios_withIHValidation @5701 @SOL @RS20027 @AUTOTESTTOTAL#1
  Scenario Outline: SPSP Loan Repay - RS20027_5701_SOL Validate <TestID> IH field values against proposition data
    * def testDataFileName = SPSP_Loan_RepaySOLFileName
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
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/SOL/ReusableScenarios.feature@SOL_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile

 #  Performing action on xml request (Get Action)
    * soap action soapAction

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/SOL/ReusableScenarios.feature@OfferValidationWithIH')

    # Validate the SOL soap Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                           |
      |"5701_SOL_BASE"                                   |



  @SPSP_Loan_Repay_Positive_Scenarios_withoutIHValidation @5701 @SOL @RS20027 @AUTOTESTTOTAL#6
  Scenario Outline: SPSP Loan Repay - RS20027_5701_SOL Validate <TestID> web response against proposition data
    * def testDataFileName = SPSP_Loan_RepaySOLFileName
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
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/SOL/ReusableScenarios.feature@SOL_SOAP_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile

 #  Performing action on xml request (Get Action)
    * soap action soapAction

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the SOL soap Response against DB and Proposition data
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                           |
      |"5701_SOL_lang_cd = fr"                           |
      |"5701_SOL_Employee_Staff = Null"                  |
      |"5701_SOL_Current Date - STUDY_END_DT =120 Days"  |
      |"5701_SOL_Current Date - STUDY_END_DT  = 121 Days"|
      |"5701_SOL_Current Date - STUDY_END_DT  =149 Days" |
      |"5701_SOL_Current Date - STUDY_END_DT =150 Days"  |


  @SPSP_Loan_Repay_SOL_Validation_5701_Negative_TestCases_Validation @5701 @SOL @RS20027 @AUTOTESTTOTAL#18
  Scenario Outline: SPSP_Loan_Repay_SOL_Validation_5701_Negative_TestCases_Validation Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = SPSP_Loan_RepaySOLFileName
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/SOL/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  # #     Generate a SOL SOAP call
    * call read('classpath:channels/SOL/ReusableScenarios.feature@SOL_SOAP_CALL')

    #    Clear IH when it goes to control group
   # * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile

 #  Performing action on xml request (Get Action)
    * soap action soapAction

  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()
   #Validating error response
    * match null ==  karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
#
    Examples:
      | TestID                                                 |
      |"N-5701_SOL_DECEASED_F=Y"                               |
      |"N-5701_SOL_DECEASED_F=NULL"                            |
      |"N-5701_SOL_CUST_TP_CD!= PSNL"                          |
      |"N-5701_SOL_LANG_CD = K"                                |
      |"N-5701_SOL_LANG_CD = NULL"                             |
      |"N-5701_SOL_PRIM_CNTRY_CD = NULL"                       |
      |"N-5701_SOL_PRIM_CNTRY_CD != CA"                        |
      |"N-5701_SOL_MKTBl = N"                                  |
      |"N-5701_SOL_EMPLOYEE_STAFF_F = Y"                       |
      |"N_5701_SOL_Current Date - STUDY_END_DT =119 Days"      |
      |"N_5701_SOL_Current Date - STUDY_END_DT  = 151 Days"    |
      |"N_5701_SOL_ACCT_SUBSYS_ID!=KS"                         |
      |"N_5701_SOL_ACCT_STAT_CD!=Open"                         |
      |"N_5701_SOL_ACCT_STAT_CD = NULL"                        |
      |"N_5701_SOL_SRC_SYS_PRD_CD!= SSL"                       |
      |"N_5701_SOL_SRC_SYS_PRD_CD = NULL"                      |
      |"N_5701_SOL_SRC_SYS_SUB_PRD_CD != SP"                   |
      |"N_5701_SOL_SRC_SYS_SUB_PRD_CD = NULL"                  |