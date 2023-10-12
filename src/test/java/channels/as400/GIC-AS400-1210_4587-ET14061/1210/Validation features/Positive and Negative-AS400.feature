@CIMCAMP-6290 @PositiveNegative_Validation_1210
Feature: Validate GIC - Renewal 1210 Positive and Negative test cases for RFR

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @GICRenewal @GICRenewal_IH_Validation_1210_AS400 @1210 @AS400 @ET14061
  Scenario Outline: GIC RENEWAL_ET14061_1210_AS400 Validate <TestID> IH field values against proposition data for RFR

    * def testDataFileName = GICtestDataFileName
      #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * print "test id is" +TestID

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
      | "1210_Validate IH Record fields against Proposition" |


  @GICRENEWAL @GICrenewal_Positive_TestCases_Validation_1210 @1210 @AS400 @4T14061
  Scenario Outline: GIC Renewal_1210_ET14061 Validate <TestID> Positive TestCases Response Fields for RFR

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
      | "1210_ISSUE =Renewal Group=Investments"                                 |
      | "1210_PRIM_CNTRY_CD= CA"                                                |
      | "1210_CUST_TYP= PSNL"                                                   |
      | "1210_CUST_AGE greater than 18"                                         |
      | "1210_CUST_AGE equal to 18"                                             |
      | "1210_MRKTBLE_F=Y"                                                      |
      | "1210_DECEASED_F=N"                                                     |
      | "1210_LANG_CD=E"                                                        |
      | "1210_LANG_CD=EN"                                                       |
      | "1210_LANG_CD=F"                                                        |
      | "1210_LANG_CD=FR"                                                       |
      | "1210_LANG_CD_small case=e"                                             |
      | "1210_LANG_CD_small case=en"                                            |
      | "1210_LANG_CD_small case=f"                                             |
      | "1210_LANG_CD_small case=fr"                                            |
      | "1210_SRC_SYS_PRD_CD=NRS"                                               |
      | "1210_SRC_SYS_PRD_CD=TFSSB"                                             |
      | "1210_SRC_SYS_PRD_CD=RRSSB"                                             |
      | "1210_SRC_SYS_PRD_CD=NRSPR"                                             |
      | "1210_SRC_SYS_PRD_CD=TFS"                                               |
      | "1210_SRC_SYS_PRD_CD=RRS"                                               |
      | "1210_PRD_CD_MASTER!=NULL"                                              |
      | "1210_PRD_CD_MASTER!=BLANK"                                             |
      | "1210_PRD_CD_MASTER!=ACC"                                               |
      | "1210_PRD_CD_MASTER!=FLE"                                               |
      | "1210_PRD_CD_MASTER!=UTL"                                               |
      | "1210_PRD_ACCT_STAT_CD=A"                                               |
      | "1210_PLN_ACCT_CD_MASTER!=(RDSP,CT,CU,CV,TU,CTI,CUI,CVI,TUI,RESP,RRIF)" |
      | "1210_CRNT_BAL_AMT=500"                                                 |
      | "1210_CRNT_BAL_AMT>500"                                                 |
      | "1210_MAT_DT=CURRENT DATE"                                              |
      | "1210_MAT_DT-Current Date<28 DAYS"                                      |
      | "1210_MAT_DT-Current Date =28 DAYS"                                     |
      | "1210_TERM_MTH!=0"                                                      |
      | "1210_SRC_ACCT_STAT_CD=Active"                                          |
      | "1210_IP_PRD_CD!=BLANK"                                                 |
      | "1210_IP_PRD_CD!=NULL"                                                  |
      | "1210_ACCT_CRFC_NUM!=BLANK"                                             |
      | "1210_ACCT_CRFC_NUM!=NULL"                                              |
      | "1210_MAT_VAL_AMT=0"                                                    |
      | "1210_MAT_VAL_AMT>0"                                                    |
      | "1210_ACCT_SUBSYS_ID=UF"                                                |
      | "1210_ACCT_NUM IS 23 DIGIT"                                             |
      | "1210_PRIMARY_ACCT_HOLDER_FLAG=Y"                                       |
      | "1210_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100k"         |

  @GICRenewal @GICRenewal_Negative_TestCases_Validation_1210 @1210 @AS400 @ET14061
  Scenario Outline: GIC Renewal_ET14061_1210_AS400 Validate <TestID> Negative TestCases Response Fields for RFR

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
      | "1210_N_PRIM_CNTRY_CD!= CA Eg:AC"                                 |
      | "1210_N_PRIM_CNTRY_CD=NULL"                                       |
      | "1210_N_CUST_TYP != PSNL (Eg:- Non_PSNL)"                         |
      | "1210_N_CUST_TYP =  Null"                                         |
      | "1210_N_CUST_AGE Less Than 18"                                    |
      | "1210_N_CUST_AGE =  Null"                                         |
      | "1210_N_MRKTBLE_F=N"                                              |
      | "1210_N_MRKTBLE_F=NULL"                                           |
      | "1210_N_LANG_CD=K"                                                |
      | "1210_N_LANG_CD=NE"                                               |
      | "1210_N_LANG_CD=Null"                                             |
      | "1210_N_Deceased_F=Y"                                             |
      | "1210_N_Deceased_F=NULL"                                          |
      | "1210_N_PRD_CD_MASTER=NULL"                                       |
      | "1210_N_PRD_CD_MASTER=BLANK"                                      |
      | "1210_N_PRD_CD_MASTER=ACC"                                        |
      | "1210_N_PRD_CD_MASTER=FLE"                                        |
      | "1210_N_PRD_CD_MASTER=ROC"                                        |
      | "1210_N_PRD_CD_MASTER=UTL"                                        |
      | "1210_N_PRD_ACCT_STAT_CD!=A"                                      |
      | "1210_N_PRD_ACCT_STAT_CD=null"                                    |
      | "1210_N_PLN_ACCT_CD_MASTER=RDSP"                                  |
      | "1210_N_PRD_CD_MASTER=CT"                                         |
      | "1210_N_PRD_CD_MASTER=CU"                                         |
      | "1210_N_PRD_CD_MASTER=CV"                                         |
      | "1210_N_PRD_CD_MASTER=TU"                                         |
      | "1210_N_PRD_CD_MASTER=CTI"                                        |
      | "1210_N_PRD_CD_MASTER=CUI"                                        |
      | "1210_N_PRD_CD_MASTER=CVI"                                        |
      | "1210_N_PRD_CD_MASTER=TUI"                                        |
      | "1210_N_PLN_ACCT_CD_MASTER=RESP"                                  |
      | "1210_N_PLN_ACCT_CD_MASTER=RRIF"                                  |
      | "1210_N_CRNT_BAL_AMT<$500"                                        |
      | "1210_N_CRNT_BAL_AMT=499"                                         |
      | "1210_N_CRNT_BAL_AMT=0"                                           |
      | "1210_N_MAT_DT-Current Date>28 DAYS"                              |
      | "1210_N_MAT_DT-CURRENTDATE = 29 DAYS"                             |
      | "1210_N_SRC_ACCT_STAT_CD=Not Active"                              |
      | "1210_N_SRC_ACCT_STAT_CD=null"                                    |
      | "1210_N_ACCT_SUBSYS_ID!=UF"                                       |
      | "1210_N_ACCT_SUBSYS_ID=null"                                      |
      | "1210_N_MAT_VAL_AMT=100001"                                       |
      | "1210_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K" |
      | "1210_N_PRIMARY_ACCT_HOLDER_FLAG=N"                               |
      | "1210_N_PRIMARY_ACCT_HOLDER_FLAG=NULL"                            |





