@InsuranceReminder_PositiveNegative_Validation_5784
Feature: Validate InsuranceReminder Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @InsuranceReminder_5784  @InsuranceReminder_5784_Nova_Positive_Validation_withIH_validation @5784 @NOVA @RS22075

  Scenario Outline: InsuranceReminder_5784_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = InsuranceReminderNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
    * def cellGroup = karate.get('$data.CellGroup')
    * print "cell group is :" +cellGroup
   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

#    #    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@InsuranceReminderOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for insurance Reminder specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@InsuranceReminderSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID              |
      | "5784_NOVA_BASE_01" |
      | "5784_NOVA_BASE_02" |
      | "5784_NOVA_BASE_03" |

  @InsuranceReminder_5784  @InsuranceReminder_5784_Nova_Positive_Validation_withoutIH_validation @5784 @NOVA @RS22075

  Scenario Outline: InsuranceReminder_5784_NOVA Validate <TestID> Positive TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = InsuranceReminderNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    #* call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
 #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

   # It clears Result fields
    * clearResultFields()

   # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@InsuranceReminderSpecificOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                 |
      | "5784_NOVA_Seg_01_LANG_CD_eq_fr and DO_NOT_SOLICIT_F=NULL"                             |
      | "5784_CUST_LvL_NOVA_CUST_AGE = 18 and Unsubscribe=N"                                   |
      | "5784_CUST_LvL_NOVA_CUST_AGE = 69"                                                     |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=GC"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=GS"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=PC"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=SC"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=SS"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=DM"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=NF"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=NH"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=RG"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SC"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SL"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SS"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=ST"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SV"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=ZZ"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFA and SRC_SYS_SUB_PRD_CD=A1"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFA and SRC_SYS_SUB_PRD_CD=A3"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=F1"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=TR"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=TS"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=NF"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=RG"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=SP"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=ST"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=NF"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=RC"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=RG"                       |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VUS and SRC_SYS_SUB_PRD_CD=RG"                       |
      | "5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = 120"                                           |
      | "5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = 30"                                            |
      | "5784_Acc_Lvl_INS_STATUS_CODE = X AND Current Date -INSUR_STAT_LAST_CHNG_DT =40 days"  |
      | "5784_Acc_Lvl_INS_STATUS_CODE = X AND Current Date -INSUR_STAT_LAST_CHNG_DT = 1 days"  |
      | "5784_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG_PROD_CD_eq_VGD_SUB_PROD_eq_SP_Prioritization" |

  @InsuranceReminder_5784 @InsuranceReminder_5784_Nova_NegativeTestCases_Validation @5784 @NOVA @RS22075
  Scenario Outline: InsuranceReminder_5784_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = InsuranceReminderNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    #* print 'TestID' + data
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
   # * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

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
      | TestID                                                                                      |
      | "N_5784_CUST_LvL_NOVA_CUST_TP_CD != PSNL"                                                   |
      | "N_5784_CUST_LvL_NOVA_CUST_TP_CD = NULL"                                                    |
      | "N_5784_CUST_LvL_NOVA_PRIM_CNTRY_CD != CA"                                                  |
      | "N_5784_CUST_LvL_NOVA_PRIM_CNTRY_CD = NULL"                                                 |
      | "N_5784_CUST_LvL_NOVA_Lang_CD_!= (en,fr)"                                                   |
      | "N_5784_CUST_LvL_NOVA_Lang_CD_= NULL"                                                       |
      | "N_5784_CUST_LvL_NOVA_MRKTBLE_F != Y"                                                       |
      | "N_5784_CUST_LvL_NOVA_MRKTBLE_F= NULL"                                                      |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE < 18"                                                        |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE = NULL"                                                      |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE > 70"                                                        |
      | "N_5784_CUST_LvL_DO_NOT_SOLICIT_F=Y"                                                        |
      | "N_5784_NOVA_Acc_Lvl_ACCT_SUBSYS_ID != KS"                                                  |
      | "N_5784_NOVA_Acc_Lvl_ACCT_SUBSYS_ID = NULL"                                                 |
      | "N_5784_NOVA_Acc_Lvl_SRC_ACCT_STAT_CD != Open"                                              |
      | "N_5784_NOVA_Acc_Lvl_SRC_ACCT_STAT_CD = NULL"                                               |
      | "N_5784_NOVA_Acc_Lvl_PROD_HIER_LEVEL_3 != Credit Cards"                                     |
      | "N_5784_NOVA_Acc_Lvl_PROD_HIER_LEVEL_3 = NULL"                                              |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD!=AXG and SRC_SYS_SUB_PRD_CD =GC"                        |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD!=AXG and SRC_SYS_SUB_PRD_CD =NULL"                      |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=!GS"                         |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=NULL and SRC_SYS_SUB_PRD_CD=PC"                         |
      | "N_5784_NOVA_Acc_Lvl_CR_CRD_PRTCTN_F!= Y"                                                   |
      | "N_5784_NOVA_Acc_Lvl_CR_CRD_PRTCTN_F=NULL"                                                  |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS > 120"                                              |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS < 30"                                               |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = NULL"                                             |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE != 101"                                                     |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = 501"                                                      |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = NULL"                                                     |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT > 40 days"   |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT < 1 days"    |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT = NULL"      |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE != X  AND Current Date -INSUR_STAT_LAST_CHNG_DT <  40 days" |
      | "N_5784_Acc_Lvl_PRIMARY_ACCT_HOLDER_FLAG != Y"                                              |
      | "N_5784_Acc_Lvl_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                            |
