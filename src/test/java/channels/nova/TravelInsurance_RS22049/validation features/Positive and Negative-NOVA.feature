@TravelInsurance_PositiveNegative_Validation_5715
Feature: Validate TravelInsurance Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @TravelInsurance_5715  @TravelInsurance_5715_Nova_Positive_Validation_withIH_validation @5715 @NOVA @RS22049

  Scenario Outline: TravelInsurance_5715_NOVA Validate <TestID> Positive TestCases Response Fields with IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = TravelInsuranceNovaTestData

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

    #   # Fetch recorded activity for CID from IH
    * print "CID before fetching IH is:" +cid
    * call read('classpath:channels/nova/ReusableScenarios.feature@fetchIHRows')

#     Validating IPT and PST records which are recorded in IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@TravelInsuranceOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
    * call read('classpath:channels/nova/ReusableScenarios.feature@TravelInsuranceSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                       |
      | "5715_NOVA_BASE_01"                                          |
      | "5715_NOVA_BASE_02"                                          |
      | "5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_eq_1" |
      | "5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL"        |
      | "5715_NOVA_multiple_insight_cd"                              |

  @TravelInsurance_5715  @TravelInsurance_5715_Nova_Positive_Validation_withoutIH_validation @5715 @NOVA @RS22049

  Scenario Outline: TravelInsurance_5715_NOVA Validate <TestID> Positive TestCases Response Fields without IH validation

  #    Reading data from Excel sheet
    * def testDataFileName = TravelInsuranceNovaTestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@TravelInsuranceSpecificOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                                                 |
      | "5715_NOVA_lang_cd_eq_fr"                                                              |
      | "5715_NOVA_cust_age _eq_18"                                                            |
      | "5715_NOVA_DNS_eq_NULL"                                                                |
      | "5715_NOVA_DNS_eq_N"                                                                   |
      | "5715_NOVA_PROV_CD_eq_NULL"                                                            |
      | "5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND"                                            |
      | "5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_eq_30"                              |
      | "5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND"                                      |
      | "5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_eq_30"                        |
      | "5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_gt_1"                           |
      | "5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_eq_30"                    |
      | "5715_NOVA_PROD_CD_eq_AXG_SUB_PROD_eq_GS"                                              |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_NF"                                              |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_PB"                                              |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_RG"                                              |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_SP"                                              |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_ST"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_DM"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ST"                                              |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_TR"                                              |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_TS"                                              |
      | "5715_NOVA_PROD_CD_eq_BLV_SUB_PROD_eq_YY"                                              |
      | "5715_NOVA_PROD_CD_eq_AXP_SUB_PROD_eq_PC"                                              |
      | "5715_NOVA_PROD_CD_eq_AXS_SUB_PROD_eq_SC"                                              |
      | "5715_NOVA_PROD_CD_eq_AXS_SUB_PROD_eq_SS"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SV"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ZZ"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SS"                                              |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_F1"                                              |
      | "5715_NOVA_PROD_CD_eq_VFA_SUB_PROD_eq_A1"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_NF"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG"                                              |
      | "5715_NOVA_PROD_CD_eq_VFA_SUB_PROD_eq_A3"                                              |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_NF"                                              |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_RG"                                              |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_RC"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SC"                                              |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SL"                                              |
      | "5715_NOVA_ACTIVE_BB_Active_AC"                                                        |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG_PROD_CD_eq_VGD_SUB_PROD_eq_SP_Prioritization" |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ST_BBACCT_ACACCT_Prioritization"                 |


  @TravelInsurance_5715 @TravelInsurance_5715_Nova_NegativeTestCases_Validation @5715 @NOVA @RS22049
  Scenario Outline: TravelInsurance_5715_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = TravelInsuranceNovaTestData

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
      | TestID                                                                   |
      | "N-5715_NOVA_DECEASED_F_eq_Y"                                            |
      | "N-5715_NOVA_DECEASED_F_eq_NULL"                                         |
      | "N-5715_NOVA_CUST_TP_CD_ne_PSNL"                                         |
      | "N-5715_NOVA_LANG_CD_eq_K"                                               |
      | "N-5715_NOVA_LANG_CD_eq_NULL"                                            |
      | "N-5715_NOVA_PRIM_CNTRY_CD_eq_NULL"                                      |
      | "N-5715_NOVA_PRIM_CNTRY_CD_ne_CA"                                        |
      | "N-5715_NOVA_MKTBL_eq_N"                                                 |
      | "N-5715_NOVA_MKTBL_eq_NULL"                                              |
      | "N_5715_NOVA_DNS_eq_Y"                                                   |
      | "N_5715_NOVA_PRIM_PROV_CD_eq_QC"                                         |
      | "N_5715_NOVA_CUST_AGE_lt_18"                                             |
      | "N_5715_NOVA_CUST_AGE_eq_NULL"                                           |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_curr_val_ne_1"              |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_curr_val_eq_null"           |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_gt_30"              |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_curr_val_ne_1"        |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_curr_val_eq_null"     |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_gt_30"        |
      | "N_5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_eq_null"           |
      | "N_5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_lt_1"           |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_curr_val_ne_1"    |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_curr_val_eq_null" |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_gt_30"    |
      | "N_5715_NOVA_ACCT_SUBSYS_ID_ne_KS_ie_UO"                                 |
      | "N_5715_NOVA_ACCT_STAT_CD_ne_Open"                                       |
      | "N_5715_NOVA_ACCT_STAT_CD _eq_ NULL"                                     |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_BBB"                                      |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_NULL"                                     |
      | "N_5715_NOVA_SRC_SYS_SUB_PRD_CD_eq_DD"                                   |
      | "N_5715_NOVA_SRC_SYS_SUB_PRD_CD_eq_NULL"                                 |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_DM"             |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_MB"             |
      | "N_5715_NOVA_Not_Active_BB_Active_AC"                                    |
      | "N_5715_NOVA_Active_ACCT_SUBSYS_ID_ne_BB_Active_AC"                      |
      | "N_5715_NOVA_Active_BB_Active_AC_PROD_HEIR_LEVEL_ne_Chequing Accounts"   |
      | "N_5715_NOVA_Active_BB_NOT_Active_AC"                                    |
      | "N_5715_NOVA_Active_BB_Active_ACCT_SUBSYS_ID_ne_AC"                      |
      | "N_5715_NOVA_Active_BB_Active_AC_pos131211_ne_600"                       |
      | "N_5715_NOVA_SRC_ACCT_STAT_CD_eq_NULL_BB_Active_AC"                      |
      | "N_5715_NOVA_EDW_ACCT_STAT_CD_eq_NULL_ACTIVE_BB_AC"                      |
      | "N_5715_NOVA_Active_ACCT_SUBSYS_ID_eq_NULL_Active_AC"                    |
      | "N_5715_NOVA_Active_BB_Active_AC_PROD_HEIR_LEVEL_eq_null"                |
      | "N_5715_NOVA_Active_BB_Active_AC_ACCT_SUBSYS_ID_eq_NULL"                 |
      | "N_NoInsight"                                                            |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_eq_null"            |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_eq_null"      |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_eq_null"  |