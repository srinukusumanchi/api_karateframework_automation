@CIMCAMP-6290 @PositiveNegative_Validation_4587
Feature: Validate GIC - Renewal 4587 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @GICRenewal @GICRenewal_IH_Validation_4587_AS400 @4587 @AS400 @ET14061
  Scenario Outline: GIC RENEWAL_ET14061_4587_AS400 Validate <TestID> IH field values against proposition data

    * def testDataFileName = GICtestDataFileName
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retrieving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
    * call read('classpath:channels/as400/ReusableScenarios.feature@GICOfferValidationWithIH')



    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                               |
      | "4587_Validate IH Record fields against Proposition" |


  @GICRENEWAL @GICrenewal_Positive_TestCases_Validation_4587 @4587 @AS400 @4T14061
  Scenario Outline: GIC Renewal_4587_ET14061 Validate <TestID> Positive TestCases Response Fields

    * def testDataFileName = GICtestDataFileName
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
 #   * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@GICContextualOfferValidation_AS400')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                  |
      | "4587_ISSUE =Renewal Group=Investments"                                 |
      | "4587_PRIM_CNTRY_CD= CA"                                                |
      | "4587_CUST_TYP= PSNL"                                                   |
      | "4587_CUST_AGE greater than 18"                                         |
      | "4587_CUST_AGE equal to 18"                                             |
      | "4587_MRKTBLE_F=Y"                                                      |
      | "4587_DECEASED_F=N"                                                     |
      | "4587_LANG_CD=E"                                                        |
      | "4587_LANG_CD=EN"                                                       |
      | "4587_LANG_CD=F"                                                        |
      | "4587_LANG_CD=FR"                                                       |
      | "4587_LANG_CD_small case=e"                                             |
      | "4587_LANG_CD_small case=en"                                            |
      | "4587_LANG_CD_small case=f"                                             |
      | "4587_LANG_CD_small case=fr"                                            |
      | "4587_SRC_SYS_PRD_CD=NRS"                                               |
      | "4587_SRC_SYS_PRD_CD=TFSSB"                                             |
      | "4587_SRC_SYS_PRD_CD=RRSSB"                                             |
      | "4587_SRC_SYS_PRD_CD=NRSPR"                                             |
      | "4587_SRC_SYS_PRD_CD=TFS"                                               |
      | "4587_SRC_SYS_PRD_CD=RRS"                                               |
      | "4587_PRD_CD_MASTER!=NULL"                                              |
      | "4587_PRD_CD_MASTER!=BLANK"                                             |
      | "4587_PRD_CD_MASTER!=ACC"                                               |
      | "4587_PRD_CD_MASTER!=FLE"                                               |
      | "4587_PRD_CD_MASTER!=UTL"                                               |
      | "4587_PRD_ACCT_STAT_CD=A"                                               |
      | "4587_PLN_ACCT_CD_MASTER!=(RDSP,CT,CU,CV,TU,CTI,CUI,CVI,TUI,RESP,RRIF)" |
      | "4587_CRNT_BAL_AMT>$500"                                                |
      | "4587_CRNT_BAL_AMT=$500"                                                |
      | "4587_MAT_DT-Current Date<28 DAYS"                                      |
      | "4587_MAT_DT-Current Date =28 DAYS"                                     |
      | "4587_MAT_DT =CURRENT DATE"                                             |
      | "4587_TERM_MTH!=0"                                                      |
      | "4587_SRC_ACCT_STAT_CD=Active"                                          |
      | "4587_IP_PRD_CD!=BLANK"                                                 |
      | "4587_IP_PRD_CD!=NULL"                                                  |
      | "4587_ACCT_CRFC_NUM!=BLANK"                                             |
      | "4587_ACCT_CRFC_NUM!=NULL"                                              |
      | "4587_MAT_VAL_AMT>$0"                                                   |
      | "4587_MAT_VAL_AMT=100001"                                               |
      | "4587_ACCT_SUBSYS_ID=UF"                                                |
      | "4587_ACCT_NUM IS 23 DIGIT"                                             |
      | "4587_PRIMARY_ACCT_HOLDER_FLAG=Y"                                       |


  @GICRenewal @GICRenewal_Negative_TestCases_Validation_4587 @4587 @AS400 @ET14061
  Scenario Outline: GIC Renewal_ET14061_4587_AS400 Validate <TestID> Negative TestCases Response Fields

    * def testDataFileName = GICtestDataFileName
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
      | TestID                                                            |
      | "4587_N_PRIM_CNTRY_CD!= CA Eg:AC"                                 |
      | "4587_N_PRIM_CNTRY_CD=NULL"                                       |
      | "4587_N_CUST_TYP != PSNL (Eg:- Non_PSNL)"                         |
      | "4587_N_CUST_TYP =  Null"                                         |
      | "4587_N_CUST_AGE Less Than 18"                                    |
      | "4587_N_CUST_AGE =  Null"                                         |
      | "4587_N_MRKTBLE_F=N"                                              |
      | "4587_N_MRKTBLE_F=NULL"                                           |
      | "4587_N_LANG_CD=K"                                                |
      | "4587_N_LANG_CD=NE"                                               |
      | "4587_N_LANG_CD=Null"                                             |
      | "4587_N_Deceased_F=Y"                                             |
      | "4587_N_Deceased_F=NULL"                                          |
      | "4587_N_PRD_CD_MASTER=NULL"                                       |
      | "4587_N_PRD_CD_MASTER=BLANK"                                      |
      | "4587_N_PRD_CD_MASTER=ACC"                                        |
      | "4587_N_PRD_CD_MASTER=FLE"                                        |
      | "4587_N_PRD_CD_MASTER=ROC"                                        |
      | "4587_N_PRD_CD_MASTER=UTL"                                        |
      | "4587_N_PRD_ACCT_STAT_CD!=A"                                      |
      | "4587_N_PRD_ACCT_STAT_CD=null"                                    |
      | "4587_N_PLN_ACCT_CD_MASTER=RDSP"                                  |
      | "4587_N_PRD_CD_MASTER=CT"                                         |
      | "4587_N_PRD_CD_MASTER=CU"                                         |
      | "4587_N_PRD_CD_MASTER=CV"                                         |
      | "4587_N_PRD_CD_MASTER=TU"                                         |
      | "4587_N_PRD_CD_MASTER=CTI"                                        |
      | "4587_N_PRD_CD_MASTER=CUI"                                        |
      | "4587_N_PRD_CD_MASTER=CVI"                                        |
      | "4587_N_PRD_CD_MASTER=TUI"                                        |
      | "4587_N_PLN_ACCT_CD_MASTER=RESP"                                  |
      | "4587_N_PLN_ACCT_CD_MASTER=RRIF"                                  |
      | "4587_N_CRNT_BAL_AMT<500"                                         |
      | "4587_N_CRNT_BAL_AMT=499"                                         |
      | "4587_N_CRNT_BAL_AMT=0"                                           |
      | "4587_N_MAT_DT-Current Date  = 29 days"                           |
      | "4587_N_MAT_DT-Current Date>28 DAYS"                              |
      | "4587_N_SRC_ACCT_STAT_CD=Not Active"                              |
      | "4587_N_SRC_ACCT_STAT_CD=null"                                    |
      | "4587_N_ACCT_SUBSYS_ID!=UF"                                       |
      | "4587_N_ACCT_SUBSYS_ID=null"                                      |
      | "4587_N_MAT_VAL_AMT=0"                                            |
      | "4587_N_PRIMARY_ACCT_HOLDER_FLAG=N"                               |
      | "4587_N_PRIMARY_ACCT_HOLDER_FLAG=NULL"                            |
      | "4587_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K" |
      | "4587_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K" |





