@PositiveNegative_Validation_5778
Feature: Validate Invalid Email-5778 Positive and Negative test cases

  Background: Common for AS400 Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')

#
#  @MissingAndInvalid_Email_Validation @InvalidEmail_IH_Validation @5778 @AS400 @RS22069 @Base_5578_AV
#  Scenario Outline: Invalid Email_RS22069_5778_Base_AS400 Validate <TestID> IH field values against proposition data
#    * def testDataFileName = InvalidmissingemailAs400TestData5778
#    #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('$data.TestID')
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('$data.NBACode')
#
#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')
#
#  #     Generate a AS400 SOAP call
#    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
#    #    Clear IH when it goes to control group - It will open browser only if response doesnt come
#    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action soapAction
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#   # It clears Result fields
#    * clearResultFields()
#    * call read('classpath:channels/as400/ReusableScenarios.feature@MissingInvalidEmailOfferValidation')
#
##   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')
#
##     Validating IPT and PST records which are recorded in IH
##    * call read('classpath:channels/as400/ReusableScenarios.feature@MissingInvalidEmailOfferValidation')
#    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#
#    Examples:
#      | TestID               |
#      | "5778_AS400_BASE_01" |
#
#  @MissingAndInvalid_Email_Validation @InvalidEmail_Positive_Validation @5778 @AS400 @RS22069 @Positive_5578_Validation
#  Scenario Outline: Invalid Email_RS22069_5778_AS400 Validate <TestID> IH field values against proposition data
#    * def testDataFileName = InvalidmissingemailAs400TestData5778
#    #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID is '+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    * string testId = karate.get('$data.TestID')
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('$data.NBACode')
#
#   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')
#
#  #     Generate a AS400 SOAP call
#    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
##    #    Clear IH when it goes to control group
##    * call clearIH(cid,requestfile,offerCode)
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action soapAction
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#   # It clears Result fields
#    * clearResultFields()
#
##   # Fetch recorded activity for CID from IH
##    * call read('classpath:channels/as400/ReusableScenarios.feature@fetchIHRows')
#
##     Validationg IPT and PST records which are recorded in IH
#    * call read('classpath:channels/as400/ReusableScenarios.feature@MissingInvalidEmailOfferValidation')
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#
#    Examples:
#      | TestID                               |
##      | "5778_AS400_VLD_EMAIL_F_eq_NULL"                                        |
#      | "5778_AS400_LANG_CD_eq_fr"                                              |
##      | "5778_AS400_UNSUBSCRIBED_F_eq_NULL"                                     |
##      | "5778_AS400_SOL_LAST_LOGIN_DT_eq_blank_AND_MOB_LAST_LOGIN_DT_eq_blank"  |
##      | "5778_AS400_SOL_LAST_LOGIN_DT_eq_blank_AND_MOB_LAST_LOGIN_DT_gt_90days" |
##      | "5778_AS400_SOL_LAST_LOGIN_DT_gt_90days_AND_MOB_LAST_LOGIN_DT_eq_blank" |
##      | "5778_AS400_CUST_AGE_eq_18"                                             |
##      | "5778_AS400_CUST_AGE_eq_74"                                             |
#      # Not a valid scenario as it returns 5579
##      | "5778_AS400_PRIM_EMAIL_ADDR_eq_NULL" |
##      | "5778_AS400_INDV_FRST_NM_eq_NULL"                                       |
##      | "5778_AS400_INDV_LAST_NM_eq_NULL"                                       |
#
#
#  @MissingAndInvalid_Email_Validation @InvalidEmail_Negative_Validation @5778 @AS400 @RS22069 @Negative_5578_N
#  Scenario Outline: MissingAndInvalid_RS22069_5778_AS400 Validate <TestID> Negative TestCases Response Fields
#    * def testDataFileName = InvalidmissingemailAs400TestData5778
#    #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#    * def cid = karate.get('$data.ID')
#    * print 'CID'+cid
#
#    * def acct_num = '00000000'+cid
#    * print "account number is " + acct_num
#
#    # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')
#
#    * string testId = karate.get('data.TestID')
#    * print 'Test Cases Id is '+testId
#
#     #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = karate.get('data.NBACode')
#
#  #     Generate a AS400 SOAP call
#    * call read('classpath:channels/as400/ReusableScenarios.feature@AS400_SOAP_CALL')
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action soapAction
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.prettyXml(responseString)
#
#      #    It clears Result fields
#    * clearResultFields()
#
##    Validating error response
#    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
#    * match nbaCode_XML == null
#    Examples:
#      | TestID                                     |
##      | "N_5778_AS400_DECEASED_F_eq_Y"             |
##      | "N_5778_AS400_DECEASED_F_eq_NULL"          |
##      | "N_5778_AS400_VLD_EMAIL_F_eq_Y"            |
##      | "N_5778_AS400_PRIM_CNTRY_CD_ne_CA"         |
##      | "N_5778_AS400_PRIM_CNTRY_CD_eq_NULL"       |
##      | "N_5778_AS400_LANG_CD_ne_en"               |
##      | "N_5778_AS400_LANG_CD_ne_fr"               |
##      | "N_5778_AS400_LANG_CD_eq_NULL"             |
##      | "N_5778_AS400_DO_NOT_EMAIL_F_eq_Y"         |
##      | "N_5778_AS400_DO_NOT_EMAIL_F_eq_NULL"      |
##      | "N_5778_AS400_UNSUBSCRIBED_F_eq_Y"         |
##      | "N_5778_AS400_SOL_LAST_LOGIN_DT_lt_90days" |
##      | "N_5778_AS400_MOB_LAST_LOGIN_DT_lt_90days" |
##      | "N_5778_AS400_CUST_AGE_lt_18"              |
##      | "N_5778_AS400_CUST_AGE_gt_74"              |
##      | "N_5778_AS400_CUST_AGE_eq_NULL"            |
##      | "N_5778_AS400_CUST_TP_CD_ne_PSNL"          |
##      | "N_5778_AS400_SOL_LAST_LOGIN_DT_eq_90days" |
##      | "N_5778_AS400_MOB_LAST_LOGIN_DT_eq_90days" |
#      | "N_5778_AS400_DNS_F_eq_Y"                  |
#

  @MissingAndInvalid_Email_Validation @MissingInvalidEmail_AS400_Positive_5778_Validation_July6th2023Release @5778 @AS400 @RS22069 @Positive_5578_Validation
  Scenario Outline: Invalid Email_RS22069_5778_AS400_July6th2023Release Validate <TestID> IH field values against proposition data
    * def testDataFileName = InvalidmissingemailAs400TestData5778
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

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@MissingInvalidEmailOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                              |
      | "5778_AS400_DO_NOT_EMAIL_F_eq_Y"    |
      | "5778_AS400_DO_NOT_EMAIL_F_eq_NULL" |
      | "5778_AS400_DO_NOT_EMAIL_F_eq_N"    |

