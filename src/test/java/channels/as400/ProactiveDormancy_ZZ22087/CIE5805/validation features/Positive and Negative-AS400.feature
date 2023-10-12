@PositiveNegative_Validation_ 5805
Feature: Validate ProactiveDormancy- 5805 AS400 for Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')


  @ProactiveDormancy @ProactiveDormancy_BASE_IH_Validation @5805 @AS400 @ZZ22087
  Scenario Outline: ProactiveDormancy_ZZ22087_5805_AS400 Validate base test cases with IH field values against proposition data
    * def testDataFileName = ProDormancyAs400TestData

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
    * print "Test Id is:" + testId
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

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
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@ProactiveDormancySpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ProactiveDormancyOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID             |
      | "5805_CSE_BASE_01" |

  @ProactiveDormancy @ProactiveDormancy_positive_with_Out_IH_Validation @5805 @AS400 @ZZ22087
  Scenario Outline: ProactiveDormancy_ ZZ22087_5805_AS400 Validate Positive scenarios without IH validation against proposition data
    * def testDataFileName =    ProDormancyAs400TestData

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);


    * def cid = karate.get('$data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

  #     Generate a AS400 SOAP call
    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')

#    #    Clear IH when it goes to control group
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

#   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')
#
##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@ProactiveDormancySpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ProactiveDormancyOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                    |
      | "5805_CSE_LANG_CD_eq_fr"                                                                  |
      | "5805_CSE_INSIGHT_CD_eq_FLG_DORMANCY_ZZ22087_and_CURR_VAL_eq_1_CURRENTDATE_lt_EVENT_DATE" |

  @ProactiveDormancy @ProactiveDormancy_Negative_Validation @5805 @AS400 @ZZ22087
  Scenario Outline: ProactiveDormancy_ZZ22087_5805_AS400 Validate Negative scenarios with IH field values against proposition data
    * def testDataFileName =    ProDormancyAs400TestData

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
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * match nbaCode_XML == null

    Examples:
      | TestID                                                        |
      | "N_5805_CSE_DECEASED_F_eq_Y"                                  |
      | "N_5805_CSE_CUST_DIM_DECEASED_F_eq_NULL"                      |
      | "N_5805_CSE_CUST_TP_CD_ne_PSNL"                               |
      | "N_5805_CSE_CUST_TP_CD_eq_NULL"                               |
      | "N_5805_CSE_PrimaryCountryCd_ne_CA"                           |
      | "N_5805_CSE_PrimaryCountryCd_eq_NULL"                         |
      | "N_5805_CSE_LANG_CD_ne_en"                                    |
      | "N_5805_CSE_LANG_CD_eq_NULL"                                  |
      | "N_5805_CSE_CUST_INSIGHTS_INSIGHT_CD_ne_FLG_DORMANCY_ZZ22087" |
      | "N_5805_CSE_CURR_VAL_ne_1"                                    |
      | "N_5805_CSE_CURR_VAL_eq_NULL"                                 |
      | "N_5805_CSE_CURRENTDATE_ge_EVENT_DATE"                        |
      | "N_5805_CSE_CURRENTDATE_EVENT_DATE_eq_NULL"                   |
      | "N_5805_CSE_CURRENTDATE_eq_EVENT_DATE"                        |