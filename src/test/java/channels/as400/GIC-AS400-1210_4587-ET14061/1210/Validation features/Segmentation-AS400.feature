@CIMCAMP-6290 @PositiveNegative_Validation_1210
Feature: Validate GIC - Renewal 1210 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @GICRENEWAL @GICrenewal_Segmentation_TestCases_Validation_1210 @1210 @AS400 @4T14061
  Scenario Outline: GIC Renewal_1210_ET14061 Validate <TestID> Segmentation TestCases Response Fields
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
      | TestID                                                                                                              |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=1"                       |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE is in between 1 and 7"   |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=7"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=8"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE is in between 8 and 14"  |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=14"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=15"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE is in between 15 and 22" |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=22"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE=23"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_CALENDAR DATE is greater than 23"      |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=1"                       |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE is in between 1 and 7"   |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=7"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=8"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE is in between 8 and 14"  |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=14"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=15"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE is in between 15 and 22" |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=22"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE is greater than 23"      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_CALENDAR DATE=23"                      |


