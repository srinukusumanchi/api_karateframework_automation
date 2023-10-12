@InternationalMoneyTransfer_PositiveNegative_Validation_6087
Feature: Validate International Money Transfer Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @InternationalMoneyTransfer_6087  @InternationalMoneyTransfer_6087_ORN_Positive_Validation_withIH_validation @6087 @ORN @RS23094

  Scenario Outline: InternationalMoneyTransfer_6087_ORN Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = InternationalMoneyTransferORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')


#    #defining cellGroup to test the cell group logging in IH(Retriving from excel sheet)
#    * def cellGroup = karate.get('$data.CellGroup')
#    * print "cell group is :" +cellGroup
#   # Report database records in cucumber report
#    #* call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

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

    #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@IMTSpecificIHValidation')

#    #     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@@IMTControlValidation')
    * def cid_Control = subString(cid,13,14)
    * print "Cid_control" + cid_Control
    * string validation_scenario = read('classpath:channels/orn/LatestContextual_val.feature')
    * print 'Validation_scenario is:'+ validation_scenario
    * if (cid_Control != '0') karate.call(validation_scenario)
#    # Validate the ORN rest Response against DB and Proposition data
#    * call read('classpath:channels/orn/ReusableScenarios.feature@LatestContextualOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                 |
      | "6087_ORN_BASE_Seg_01" |
      | "6087_ORN_BASE_Seg_02" |
      | "6087_ORN_BASE_Seg_03" |
      | "6087_ORN_BASE_Seg_04" |
      | "6087_ORN_BASE_Seg_05" |

  @InternationalMoneyTransfer_6087  @InternationalMoneyTransfer_6087_ORN_Positive_Validation_withoutIH_validation @6087 @ORN @RS23094

  Scenario Outline: InternationalMoneyTransfer_6087_ORN Validate <TestID> Positive TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = InternationalMoneyTransferORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('$data.TestID')
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Report database records in cucumber report
    #* call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
#      * call clearIH(cid,requestfile,offerCode)

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

    * def cid_Control = subString(cid,13,14)
    * print "Cid_control" + cid_Control
    * string validation_scenario = read('classpath:channels/orn/LatestContextual_val.feature')
    * print 'Validation_scenario is:'+ validation_scenario
#    * string FetchIH_scenario = read('classpath:channels/orn/FetchIH_control.feature')
#    * print 'FetchIH_scenario is:'+ FetchIH_scenario
    * eval (cid_Control == '0')?(eval (getIhRecords(cid) != {})?printPassedResult('Offer status','in Control'):printFailedResult('Offer status','Offer not returned')):karate.call(validation_scenario)

#   # Validate the ORN rest Response against DB and Proposition data
#    * call read('classpath:channels/orn/ReusableScenarios.feature@LatestContextualOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                            |
#      | "6087_ORN_Seg_01_CUST_AGE_eq_18"                                  |
#      | "6087_ORN_Seg_01_CUST_AGE_gt_18"                                  |
#      | "6087_ORN_Seg_02_LANG_CD_eq_fr"                                   |
      | "6087_ORN_Seg_04_INSIGHT_CD_eq_IMT_PREDICTION"                   |
      | "6087_ORN_Seg_05_CURR_VAL_eq_1"                                 |
#      | "6087_ORN_Seg_01_Event_Dt_lt_30"                                  |
#      | "6087_ORN_Seg_01_Event_Dt_eq_30"                                  |
#      | "6087_ORN_Seg_01_Event_Dt_lt_0"                                   |
#      | "6087_ORN_Seg_01_Event_Dt_eq_0"                                   |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_0_HOUSEHOLD_LANG_CD_eq_PAN"    |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_999_HOUSEHOLD_LANG_CD_eq_PAN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_C1_HOUSEHOLD_LANG_CD_eq_PAN"   |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_FC1_HOUSEHOLD_LANG_CD_eq_PAN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_FC2_HOUSEHOLD_LANG_CD_eq_PAN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_FC3_HOUSEHOLD_LANG_CD_eq_HIN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_EN2_HOUSEHOLD_LANG_CD_eq_HIN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_PV1_HOUSEHOLD_LANG_CD_eq_HIN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_PV2_HOUSEHOLD_LANG_CD_eq_HIN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_SW1_HOUSEHOLD_LANG_CD_eq_HIN"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_SW2_HOUSEHOLD_LANG_CD_eq_GUJ"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_SW3_HOUSEHOLD_LANG_CD_eq_GUJ"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_SE2_HOUSEHOLD_LANG_CD_eq_GUJ"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_STP_HOUSEHOLD_LANG_CD_eq_GUJ"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_C2_HOUSEHOLD_LANG_CD_eq_GUJ"   |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_FW_HOUSEHOLD_LANG_CD_eq_TAM"   |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_FW0_HOUSEHOLD_LANG_CD_eq_TAM"  |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_S_HOUSEHOLD_LANG_CD_eq_TAM"    |
#      | "6087_ORN_Seg_01_IMMGRTN_CAT_CD_eq_S00_HOUSEHOLD_LANG_CD_eq_TAM"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_0_HOUSEHOLD_LANG_CD_eq_TGL"    |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_999_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_C1_HOUSEHOLD_LANG_CD_eq_TGL"   |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_FC1_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_FC2_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_FC3_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_EN2_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_PV1_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_PV2_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_SW1_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_SW2_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_SW3_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_SE2_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_STP_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_C2_HOUSEHOLD_LANG_CD_eq_TGL"   |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_FW_HOUSEHOLD_LANG_CD_eq_TGL"   |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_FW0_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_S_HOUSEHOLD_LANG_CD_eq_TGL"    |
#      | "6087_ORN_Seg_02_IMMGRTN_CAT_CD_eq_S00_HOUSEHOLD_LANG_CD_eq_TGL"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_0_HOUSEHOLD_LANG_CD_eq_YUE"    |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_999_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_C1_HOUSEHOLD_LANG_CD_eq_YUE"   |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_FC1_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_FC2_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_FC3_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_EN2_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_PV1_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_PV2_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_SW1_HOUSEHOLD_LANG_CD_eq_YUE"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_SW2_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_SW3_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_SE2_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_STP_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_C2_HOUSEHOLD_LANG_CD_eq_CMN"   |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_FW_HOUSEHOLD_LANG_CD_eq_CMN"   |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_FW0_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_S_HOUSEHOLD_LANG_CD_eq_CMN"    |
#      | "6087_ORN_Seg_03_IMMGRTN_CAT_CD_eq_S00_HOUSEHOLD_LANG_CD_eq_CMN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_0_HOUSEHOLD_LANG_CD_eq_KAN"    |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_999_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_C1_HOUSEHOLD_LANG_CD_eq_KAN"   |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_FC1_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_FC2_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_FC3_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_EN2_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_PV1_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_PV2_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_SW1_HOUSEHOLD_LANG_CD_eq_KAN"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_SW2_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_SW3_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_SE2_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_STP_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_C2_HOUSEHOLD_LANG_CD_eq_NULL"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_FW_HOUSEHOLD_LANG_CD_eq_NULL"  |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_FW0_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_S_HOUSEHOLD_LANG_CD_eq_NULL"   |
#      | "6087_ORN_Seg_04_IMMGRTN_CAT_CD_eq_S00_HOUSEHOLD_LANG_CD_eq_NULL" |
#      | "6087_ORN_Seg_05_IMMGRTN_CAT_CD_eq_001"                           |
#      | "6087_ORN_Seg_05_IMMGRTN_CAT_CD_eq_B2"                            |
#      | "6087_ORN_Seg_05_IMMGRTN_CAT_CD_eq_NULL"                          |
      | "6087_ORN_Seg_05_ARRV_DT_eq_NULL"                                |


  @InternationalMoneyTransfer_6087 @InternationalMoneyTransfer_6087_ORN_NegativeTestCases_Validation @6087 @ORN @RS23094
  Scenario Outline: InternationalMoneyTransfer_6087_ORN Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = InternationalMoneyTransferORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    #* print 'TestID' + data
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
   # * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

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
      | TestID                                    |
      | "N-6087_ORN_Seg_01_CUST_AGE_lt_18"        |
      | "N-6087_ORN_Seg_02_CUST_AGE_eq_NULL"      |
      | "N-6087_ORN_Seg_03_MRKTBLE_F_ne_Y"        |
      | "N-6087_ORN_Seg_04_MRKTBLE_F_eq_NULL"     |
      | "N-6087_ORN_Seg_05_INDV_FRST_NM_eq_NULL"  |
      | "N-6087_ORN_Seg_01_INDV_LAST_NM_eq_NULL"  |
      | "N-6087_ORN_Seg_02_DECEASED_F_ne_N"       |
      | "N-6087_ORN_Seg_03_DECEASED_F_eq_NULL"    |
      | "N-6087_ORN_Seg_04_CUST_TP_CD_ne_PSNL"    |
      | "N-6087_ORN_Seg_01_PRIM_CNTRY_CD_ne_CA"   |
      | "N-6087_ORN_Seg_02_PRIM_CNTRY_CD_eq_NULL" |
      | "N-6087_ORN_Seg_05_LANG_CD_eq_ka"         |
      | "N-6087_ORN_Seg_05_LANG_CD_eq_te"         |
      | "N-6087_ORN_Seg_05_LANG_CD_eq_NULL"       |
      | "N-6087_ORN_Seg_01_CURR_VAL_ne_1"         |
      | "N-6087_ORN_Seg_02_CURR_VAL_eq_NULL"      |
      | "N-6087_ORN_Seg_03_EVENT_DATE_gt_30"      |
      | "N-6087_ORN_Seg_03_EVENT_DATE_eq_NULL"    |
