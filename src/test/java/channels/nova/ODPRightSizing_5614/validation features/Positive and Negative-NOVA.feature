@ODPRightSizing_validation_5614
Feature: Validate ODP Right Sizing Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')
  @ODPRightSizing_NOVA @5614 @NOVA @RS21131 @5614_validation_IH_positive @AUTOTESTTOTAL#1
  Scenario Outline: ODP Right Sizing_RS21131_5614_NOVA Validation of IH for positive test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ODPRightSizingNovaTestData

  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

  # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@ODPRightSizingOfferValidationWithIH')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                          |
      | "5614_NOVA_Customer Not Deceased"               |


  @ODPRightSizing_NOVA @5614 @NOVA @RS21131 @5614_validation_positive @AUTOTESTTOTAL#61
  Scenario Outline: ODP Right Sizing_RS21131_5614_NOVA Validation of positive test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ODPRightSizingNovaTestData

  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

  # It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                          |
      | "5614_NOVA_Customer Not Deceased"               |
      | "5614_NOVA_CUST_AGE=18"                         |
      | "5614_NOVA_LANG_CD=E"                           |
      | "5614_NOVA_LANG_CD=EN"                          |
      | "5614_NOVA_LANG_CD=F"                           |
      | "5614_NOVA_LANG_CD=FR"                          |
      | "5614_NOVA_LANG_CD=LowerCase_e"                 |
      | "5614_NOVA_LANG_CD=LowerCase_en"                |
      | "5614_NOVA_LANG_CD=LowerCase_f"                 |
      | "5614_NOVA_LANG_CD=LowerCase_fr"                |
      | "5614_NOVA_DO_NOT_SOLICIT_F=NULL"               |
      | "5614_NOVA_PRIM_PROV_CD!=QC"                    |
      | "5614_NOVA_Segment_1_Sole"                      |
      | "5614_NOVA_01_01_Sole"                          |
      | "5614_NOVA_01_02_Sole"                          |
      | "5614_NOVA_01_03_Sole"                          |
      | "5614_NOVA_01_04_Sole"                          |
      | "5614_NOVA_02_01_Sole"                          |
      | "5614_NOVA_02_02_Sole"                          |
      | "5614_NOVA_02_03_Sole"                          |
      | "5614_NOVA_19_01_Sole"                          |
      | "5614_NOVA_19_02_Sole"                          |
      | "5614_NOVA_19_03_Sole"                          |
      | "5614_NOVA_19_04_Sole"                          |
      | "5614_NOVA_19_07_Sole"                          |
      | "5614_NOVA_19_08_Sole"                          |
      | "5614_NOVA_13_01_Sole"                          |
      | "5614_NOVA_13_03_Sole"                          |
      | "5614_NOVA_13_07_Sole"                          |
      | "5614_NOVA_13_08_Sole"                          |
      | "5614_NOVA_07_11_Sole"                          |
      | "5614_NOVA_07_12_Sole"                          |
      | "5614_NOVA_Segment_1_Joint"                     |
      | "5614_NOVA_01_01_Joint"                         |
      | "5614_NOVA_01_02_Joint"                         |
      | "5614_NOVA_01_03_Joint"                         |
      | "5614_NOVA_01_04_Joint"                         |
      | "5614_NOVA_02_01_Joint"                         |
      | "5614_NOVA_02_02_Joint"                         |
      | "5614_NOVA_02_03_Joint"                         |
      | "5614_NOVA_19_01_Joint"                         |
      | "5614_NOVA_19_02_Joint"                         |
      | "5614_NOVA_19_03_Joint"                         |
      | "5614_NOVA_19_04_Joint"                         |
      | "5614_NOVA_19_07_Joint"                         |
      | "5614_NOVA_19_08_Joint"                         |
      | "5614_NOVA_13_01_Joint"                         |
      | "5614_NOVA_13_03_Joint"                         |
      | "5614_NOVA_13_07_Joint"                         |
      | "5614_NOVA_13_08_Joint"                         |
      | "5614_NOVA_07_11_Joint"                         |
      | "5614_NOVA_07_12_Joint"                         |
      | "5614_NOVA_23_01_SRC_ACCT_STAT_CD!=A"           |
      | "5614_NOVA_ACCT_SUBSYS_ID!=BB"                  |
      | "5614_NOVA_SRC_ACCT_STAT_CD!=A"                 |
      | "5614_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=05" |
      | "5614_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=04" |
      | "5614_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=05" |
      | "5614_NOVA_SRC_PRD_CD=13 and SRC_SUB_PRD_CD=02" |
      | "5614_NOVA_SRC_PRD_CD=07 and SRC_SUB_PRD_CD=01" |
      | "5614_NOVA_PRIM_PROV_CD=NULL"                   |

  @ODPRightSizing_NOVA @5614 @NOVA @RS21131 @5614_validation_negative @AUTOTESTTOTAL#20
  Scenario Outline: ODP Right Sizing_RS21131_5614_NOVA Validation of negative test cases<TestID>

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ODPRightSizingNovaTestData
  # Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

  # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  # Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  # Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  # Printing request body in console
    * print '*********Request**********'+requestfile

  # request (Karate keyword) for sending request string
    * request requestfile

  # Performing action on JSON request (Post Action)
    * method post

  # Verifying Sucess with status code 200
    * status 200
    * def responseString = response

  # Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

  # Tt clears Result fields
    * clearResultFields()

  # Validating error response
    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                            |
      | "N-5614_NOVA_Deceased=Y"                          |
      | "N-5614_NOVA_Deceased=NULL"                       |
      | "N-5614_NOVA_CUST_TP_CD!=PSNL"                    |
#      | "N-5614_NOVA_CUST_TP_CD=NULL"                     |
      | "N-5614_NOVA_PRIM_CNTRY_CD!=CA"                   |
      | "N-5614_NOVA_PRIM_CNTRY_CD=NULL"                  |
      | "N-5614_NOVA_CUST_AGE=NULL"                       |
      | "N-5614_NOVA_CUST_AGE<18"                         |
      | "N-5614_NOVA_LANG_CD=G"                           |
      | "N-5614_NOVA_LANG_CD=NULL"                        |
      | "N-5614_NOVA_DO_NOT_SOLICIT_F=Y"                  |
      | "N-5614_NOVA_MRKTBLE_F=N"                         |
      | "N-5614_NOVA_MRKTBLE_F=NULL"                      |
      | "N-5614_NOVA_PRIM_PROV_CD=QC"                     |
      | "N-5614_NOVA_INSIGHT_CD != IND_ODP_USAGE"         |
#      | "N-5614_NOVA_INSIGHT_CD =NULL"                    |
      | "N-5614_NOVA_CURR_VAL != 1 or 2 "                 |
      | "N-5614_NOVA_EVENT_DATE GT 30 days"               |
      | "N-5614_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=01" |
      | "N-5614_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=03" |