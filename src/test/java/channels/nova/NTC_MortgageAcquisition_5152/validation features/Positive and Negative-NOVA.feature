@NTCMortgageAcquisition_PositiveNegative_Nova_Validation_5152
Feature: Validate NTC Mortgage Acquisition Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @NTCMortgageAcquisitionNOVA @NTCMortgageAcquisition_5152_Nova_Positive_Validation @5152 @NOVA @RS2098D @AUTOTESTTOTAL#55
  Scenario Outline: NTC Mortgage Acquisition_5152_NOVA Validate <TestID> Positive TestCases Response Fields

    # Reading data from Excel sheet
    * def testDataFileName = NTCMANOVATestData


    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@NTCMortgageAcquisitionValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                                           |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 01 && SUB PRD CD IN (01 or 02 or 03 or 04)"             |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 02 && SUB PRD CD IN (01 or 02 or 03)"                   |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 19 && SUB PRD CD IN (01 or 02 or 03 or 04 or 07 or 08)" |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 07 && SUB PRD CD IN (11 or 12)"                         |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 13 && SUB PRD CD IN (01 or 03 or 07 or 08)"             |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 23 && SUB PRD CD IN (01 or 03)"                         |
      | "5152_1Preferred_With_ACCT_SUBSYS_ID = UO AND SRC_ACCT_STAT_CD! = Active"                                        |
      | "5152_1Preferred_With_ACCT_SUBSYS_ID! = UO AND SRC_ACCT_STAT_CD = Active"                                        |
      | "5152_DECEASED_F = N"                                                                                            |
      | "5152_CUST_TP_CD = PSNL"                                                                                         |
      | "5152_Primary Country Cd = CA"                                                                                   |
      | "5152_CUST_AGE =18"                                                                                              |
      | "5152_CUST_AGE > 18"                                                                                             |
      | "5152_LANG_CD in E"                                                                                              |
      | "5152_LANG_CD in EN"                                                                                             |
      | "5152_LANG_CD in F"                                                                                              |
      | "5152_LANG_CD in FR"                                                                                             |
      | "5152_LANG_CD in Small Case e"                                                                                   |
      | "5152_LANG_CD in Small Case en"                                                                                  |
      | "5152_LANG_CD in Small Case f"                                                                                   |
      | "5152_LANG_CD in Small Case fr"                                                                                  |
      | "5152_DO_NOT_SOLICIT_F !=  Y"                                                                                    |
      | "5152_DO_NOT_SOLICIT_F =  NULL"                                                                                  |
      | "5152_MRKTBLE_F =  Y"                                                                                            |
      | "5152_IMMGRTN_CAT_CD not in (S , S00)"                                                                           |
      | "5152_Physicians_F != Y"                                                                                         |
      | "5152_Physicians_F = NULL"                                                                                       |
      | "5152_MCB_IND = Y"                                                                                               |
      | "5152_ARRV_DT <  3 years"                                                                                        |
      | "5152_ARRV_DT =  3 years"                                                                                        |
      | "5152_ACCT_ODT = 271"                                                                                            |
      | "5152_ACCT_ODT = 301"                                                                                            |
      | "5152_ACCT_SUBSYS_ID = BB"                                                                                       |
      | "5152_SRC_SACCT_STAT_CD = A"                                                                                     |
      | "5152_ACCT_ODT in (271-301)"                                                                                     |
      | "5152_PRD CD = 13 && SUB PRD CD IN (01 OR 03 OR 07 OR 08)"                                                       |
      | "5152_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                              |
      | "5152_5152022201_IMMGRTN_CAT_CD in FW"                                                                           |
      | "5152_5152022201_IMMGRTN_CAT_CD in FW0"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in C1"                                                                           |
      | "5152_5152022202_IMMGRTN_CAT_CD in C2"                                                                           |
      | "5152_5152022202_IMMGRTN_CAT_CD in EN2"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in FC1"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in FC2"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in FC3"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in PV1"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in PV2"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in SE2"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in STP"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in SW1"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in SW2"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in SW3"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in NV5"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in 999"                                                                          |
      | "5152_5152022202_IMMGRTN_CAT_CD in 000"                                                                          |

  @NTCMortgageAcquisitionNOVA @NTCMortgageAcquisition_5152_Nova_Negative_Validation @5152 @NOVA @RS2098D @AUTOTESTTOTAL#40
  Scenario Outline: NTC Mortgage Acquisition_5152_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = NTCMANOVATestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                     |
      | "N_5152_DECEASED_F = Y"                                                    |
      | "N_5152_DECEASED_F = NULL"                                                 |
      | "N_5152_CUST_TP_CD != PSNL"                                                |
      | "N_5152_Primary Country Cd != CA"                                          |
      | "N_5152_Primary Country Cd = NULL"                                         |
      | "N_5152_CUST_AGE = 17"                                                     |
      | "N_5152_CUST_AGE = NULL"                                                   |
      | "N_5152_LANG_CD in K"                                                      |
      | "N_5152_LANG_CD in NE"                                                     |
      | "N_5152_LANG_CD in NULL"                                                   |
      | "N_5152_DO_NOT_SOLICIT_F =  Y"                                             |
      | "N_5152_MRKTBLE_F =  N"                                                    |
      | "N_5152_MRKTBLE_F =  NULL"                                                 |
      | "N_5152_IMMGRTN_CAT_CD not in S00"                                         |
      | "N_5152_IMMGRTN_CAT_CD not in S"                                           |
      | "N_5152_IMMGRTN_CAT_CD = NULL"                                             |
      | "N_5152_Physicians_F = Y"                                                  |
      | "N_5152_MCB_IND = N"                                                       |
      | "N_5152_MCB_IND = NULL"                                                    |
      | "N_5152_ARRV_DT > 3 years"                                                 |
      | "N_5152_ACCT_ODT = 1"                                                      |
      | "N_5152_ACCT_ODT < 271"                                                    |
      | "N_5152_ACCT_ODT > 301"                                                    |
      | "N_5152_ACCT_ODT = NULL"                                                   |
      | "N_5152_ACCT_SUBSYS_ID! = BB"                                              |
      | "N_5152_SRC_SACCT_STAT_CD! = A"                                            |
      | "N_5152_PRD CD = 01 && SUB PRD CD IN (01,02,03,04)"                        |
      | "N_5152_PRD CD = 02 && SUB PRD CD IN (01,02,03)"                           |
      | "N_5152_PRD CD = 19 && SUB PRD CD IN (01,02,03,04,07,08)"                  |
      | "N_5152_PRD CD = 07 && SUB PRD CD IN (11,12)"                              |
      | "N_5152_PRD CD = 23 && SUB PRD CD IN (01,03)"                              |
      | "N_5152_PRIMARY_ACCT_HOLDER_FLAG = N"                                      |
      | "N_5152_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                   |
      | "N_5152_1Preferred_With_PRD CD = 01 && SUB PRD CD IN (01,02,03,04)"        |
      | "N_5152_1Preferred_With_PRD CD = 02 && SUB PRD CD IN (01,02,03)"           |
      | "N_5152_1Preferred_With_PRD CD = 19 && SUB PRD CD IN (01,02,03,04,07,08)"  |
      | "N_5152_1Preferred_With_PRD CD = 07 && SUB PRD CD IN (11,12)"              |
      | "N_5152_1Preferred_With_PRD CD = 13 && SUB PRD CD IN (01,03,07,08)"        |
      | "N_5152_1Preferred_With_PRD CD = 23 && SUB PRD CD IN (01,03)"              |
      | "N_5152_1Preferred_With_ACCT_SUBSYS_ID = UO AND SRC_ACCT_STAT_CD = Active" |