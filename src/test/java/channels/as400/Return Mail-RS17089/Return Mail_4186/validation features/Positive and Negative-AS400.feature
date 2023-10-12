@PositiveNegative_Validation_4186
Feature: Validate Return Mail-4186 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @ReturnMail @ReturnMail_IH_Validation @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Validate <TestID> IH field values against proposition data
    * def testDataFileName = ReturnMailFileName
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@ReturnMailOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4186_Validate IH Record fields against Proposition" |


  @ReturnMail @ReturnMail_Positive_TestCases_Validation @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Validate <TestID> Positive TestCases Response Fields
    * def testDataFileName = ReturnMailFileName
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

    * call read('classpath:channels/as400/ReusableScenarios.feature@ReturnMailContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                |
      | "4186_ISSUE = Informational and Group = Customer Servicing"           |
      | "4186_PROD_CD = SAV, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC" |
      | "4186_PROD_CD = SCL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = SSL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VCL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VFA, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VFF, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VGD, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VIC, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VLR, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VAX, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VUS, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXG, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXP, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXS, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186 Current_Account_Name = Customer Name (Given_name!=NULL) INDV_FRST_NM and INDV_LAST_NM not NULL"                |
      | "4186 INDV_FRST_NM not NULL (to display Current_Account_Name) when INDV_LAST_NM and Given_name is NULL"              |
      | "4186 INDV_LAST_NM not NULL (to display Current_Account_Name) when INDV_FRST_NM and Given_name is NULL"              |
      | "4186_Validate CurrentAccountName is NULL when INDV_FRST_NM = NULL, INDV_LAST_NAME=NULL , Given_name=NULL"           |
      | "4186_Validate Current Account Number is blank if CR_CRD_NUM is NULL when acct_subsys_id  = KS"                      |
      | "4186_ACCT_SUBSYS_ID_eq_KS_SCD_NUM_eq_Null"                           |
      | "4186_ACCT_SUBSYS_ID_eq_AC_CR_CRD_NUM_eq_Null"                        |

  @ReturnMail @ReturnMail_Negative_TestCases_Validation @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Validate <TestID> Negative TestCases Response Fields
    * def testDataFileName = ReturnMailFileName
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
      | TestID                                                                                                                                    |
      | "N-4186_CUST_TP_CD != PSNL"                                                                                                               |
      | "N-4186_CUST_TP_CD =  Null"                                                                                                               |
      | "N-4186_Deceased_F = Y"                                                                                                                   |
      | "N-4186_Deceased_F = Null"                                                                                                                |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,SAV,AXG,AXP,AXS and PREF_ACTION_CD = SUPPRESSML and ACCT_SUBSYS_ID!= AC or KS" |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,SAV,AXG,AXP,AXS and PREF_ACTION_CD = SUPPRESSML and ACCT_SUBSYS_ID = NULL"     |
      | "N_4186_PROD_CD != SAV and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                               |
      | "N_4186_PROD_CD is NULL and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                              |
      | "N_4186-PROD_CD = SAV, PREF_ACTION_CD !=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                                 |
      | "N_4186-PROD_CD = SAV and PREF_ACTION_CD = NULL and ACCT_SUBSYS_ID=AC"                                                                    |
      | "N_4186_PROD_CD not in (SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,AXG,AXP,AXS) and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"         |
      | "N_4186_PROD_CD is NULL and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                              |
      | "N_4186_PROD_CD = SCL, PREF_ACTION_CD !=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                                 |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,AXG,AXP,AXS and PREF_ACTION_CD=NULL and ACCT_SUBSYS_ID=KS"                     |
      | "N-4186_ACCT_SUBSYS_ID_eq_AC_SCD_NUM_eq_Null"                                                                                               |
      | "N-4186_ACCT_SUBSYS_ID_eq_KS_CR_CRD_NUM_eq_Null"                                                                                            |
