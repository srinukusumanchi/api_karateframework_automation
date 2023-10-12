@CIMCAMP-6290 @PositiveNegative_Validation_1210
Feature: Validate GIC Renewal-1210 Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @GICRenewal @GICRenewal_segmentation_Validation_nova_1210 @1210 @NOVA @ET14061
  Scenario Outline: GIC Renewal_ET14061_1210_NOVA Validate <TestID> IH field values against proposition data
  #    Reading data from Excel sheet
    * def testDataFileName = GICtestDataFileName

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
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
#    * call clearIH(cid,requestfile,offerCode)


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
    * print '***************Response*************'+karate.pretty(responseString)

    * call read('classpath:channels/nova/ReusableScenarios.feature@GICContextualOfferValidation_NOVA')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


   # It clears Result fields
    * clearResultFields()



       # Fetch recorded activity for CID from IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')


    * call read('classpath:channels/nova/ReusableScenarios.feature@GICIHValidation_OII_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                              |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=1"                       |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date is in between 1 and 7"   |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=7"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=8"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date is in between 8 and 14"  |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=14"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=15"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date is in between 15 and 22" |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=22"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date=23"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K && MAT_DT_Calendar Date is greater than 23"      |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=1"                       |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date is in between 1 and 7"   |
      | "1210_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=7"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=8"                       |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date is in between 8 and 14"  |
      | "1210_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=14"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=15"                      |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date is in between 15 and 22" |
      | "1210_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=22"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date=23"                      |
      | "1210_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K && MAT_DT_Calendar Date is greater than 23"      |


