@PositiveNegative_Validation_5747
Feature: Validate D2DXSell- 5747 ORN for Positive and Negative test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @D2DXSell @D2DXSell_ORN_BASE_IH_Validation @5747 @ORN @RS22054
  Scenario Outline: D2DXsell_RS22054_5747_ORN Validate base test cases with IH field values against proposition data
    * def testDataFileName = D2DXSellORNTestData
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
#    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)


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

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')


#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                           |
      | "5747_ORN_BASE_01_NewMO"                                        |
      | "5747_ORN_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" |
      | "5747_ORN_BASE_03_MPSA_Bal_gt_30K"                              |
      | "5747_ORN_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                |
      | "5747_ORN_BASE_Seg_07_Trig_13_MAT_DT_eq_8months"                |
      | "5747_ORN_BASE_09_Trig_2"                                       |
      | "5747_ORN_BASE_10_Trig_2"                                       |
      | "5747_ORN_BASE_08_Trig_2"                                       |
      | "5747_ORN_BASE_11_Trig_2"                                       |


  @D2DXSell @D2DXSell_ORN_positive_with_Out_IH_Validation @5747 @ORN @RS22054
  Scenario Outline: D2DXsell_ RS22054_5747_ORN Validate <TestID> Positive scenarios without IH validation against proposition data
    * def testDataFileName = D2DXSellORNTestData
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
#    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

#    #    Clear IH when it goes to control group
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

   # Fetch recorded activity for CID from IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

#
##     Validating IPT and PST records which are recorded in IH
#    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                       |
      | "5747_ORN_CUST_AGE_eq_18_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_2"                                                           |
      | "5747_ORN_CUST_AGE_eq_65_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_3"                                                           |
      | "5747_ORN_Not_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_4" |
      | "5747_ORN_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing Accounts_CUST_DIM_ENGAGEMENT_INDEX_eq_14"            |
      | "5747_ORN_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing Accounts_CUST_DIM_ENGAGEMENT_INDEX_gt_14"            |
       | "5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"                     |
      | "5747_ORN_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_1"                                                     |
      | "5747_ORN_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_2"                                                     |
      | "5747_ORN_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_3"                                                     |
      | "5747_ORN_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_eq_1"                                                                  |
      | "5747_ORN_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_gt_1"                                                                  |
      | "5747_ORN_CUST_DIM.MLS_ADDED_AT_DT_eq_30"                                                                                 |
      | "5747_ORN_CUST_DIM.MLS_ADDED_AT_DT_lt_30"                                                                                 |
      | "5747_ORN_CUST_DIM.MLS_ADDED_AT_DT_eq_1"                                                                                  |
      | "5747_ORN_CUST_DIM.MLS_ADDED_AT_DT_eq_0"                                                                                  |
      | "5747_ORN_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_30"                                                                          |
      | "5747_ORN_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_lt_30"                                                                          |
      | "5747_ORN_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_1"                                                                           |
      | "5747_ORN_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_0"                                                                           |
      | "5747_ORN_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_30"                                                                        |
      | "5747_ORN_CUST_DIM.GRADUATION_LIFE_EVENT_DT_lt_30"                                                                        |
      | "5747_ORN_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_1"                                                                         |
      | "5747_ORN_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_0"                                                                         |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_eq_30"                                    |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GS_CRD_RENEWAL_DT_gt_30"                                    |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_eq_90"                                    |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR_CRD_RENEWAL_DT_lt_90"                                    |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_gt_30"                                    |
      | "5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VLR_SRC_SYS_SUB_PRD_CD_eq_RG_CRD_RENEWAL_DT_lt_90"                                    |
      | "5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_30"                                                                 |
      | "5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                                                 |
      | "5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_60"                                                                 |
      | "5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_lt_60"                                                                 |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_21_IP_AR_RELATN_TYPE_CD_eq_BOR"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_SOL"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_60_IP_AR_RELATN_TYPE_CD_eq_BOR"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_COB"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_COB"                        |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_IP_AR_RELATN_TYPE_CD_eq_SOL_MAT_Dt_eq_8months"                          |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_IP_AR_RELATN_TYPE_CD_eq_SOL"                                            |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_IP_AR_RELATN_TYPE_CD_eq_BOR"                                            |
      | "5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_IP_AR_RELATN_TYPE_CD_eq_COB"                                            |
      | "5747_ORN_Seg_05_Trig_9_CRNT_BAL_AMT_gt_30000"                                                                            |
      | "5747_ORN_Trig_15_ACCT_ODT_eq_50 days"                                                                                    |
      | "5747_ORN_Trig_15_ACCT_ODT_eq_60 days"                                                                                    |
      | "5747_ORN_Trig_15_ACCT_ODT_gt_50 days"                                                                                    |
      | "5747_ORN_Trig_15_ACCT_ODT_lt_60 days"                                                                                    |
      | "5747_ORN_Trig_15_Single_MPSA"                                                                                            |
      | "5747_ORN_Seg_03_or_04_Trig_16_CURR_VAL_eq_1"                                                                             |
      | "5747_ORN_Trig_15_Dual_MPSA"                                                                                              |


##Added for March 30th 2023 release
      | "5747_ORN_Seg_09_Trig_17"                                                                   |
      | "5747_ORN_Seg_10_Trig_17"                                                                   |
      | "5747_ORN_Seg_11_Trig_17_ACCT_ODT_gt_60"                                                    |
      | "5747_ORN_Seg_08_Trig_2_CUST_OPND_DT_lt_60"                                                 |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"                     |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXP_SRC_SYS_SUB_PRD_CD_eq_PC"                     |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXS_SRC_SYS_SUB_PRD_CD_eq_SC"                     |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR"                     |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_ZZ"                     |
      | "5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_SS"                     |
      | "5747_ORN_Seg_08_Trig_2_ACCT_ODT_lt_60"                                                     |
      | "5747_ORN_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_lt_90_MOB_LAST_LOGIN_DT_eq_NULL"                  |
      | "5747_ORN_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_lt_90"                  |
      | "5747_ORN_Seg_09_Trig_2_CUST_OPND_DT_gt_90"                                                 |
      | "5747_ORN_Seg_09_Trig_2_CUST_OPND_DT_eq_90"                                                 |
      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXP_SRC_SYS_SUB_PRD_CD_eq_PC"                     |
      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXS_SRC_SYS_SUB_PRD_CD_eq_SC"                     |
      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR"                     |
      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_ZZ"                     |
      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_SS"                     |
      | "5747_ORN_Seg_09_Trig_2_ACCT_ODT_gt_90"                                                     |
      | "5747_ORN_Seg_09_Trig_2_ACCT_ODT_eq_90"                                                     |
      | "5747_ORN_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_10_Trig_2_CUST_OPND_DT_gt_60"                                                 |
      | "5747_ORN_Seg_10_Trig_2_CUST_OPND_DT_eq_60"                                                 |
      | "5747_ORN_Seg_10_Trig_2_ACCT_ODT_gt_60"                                                     |
      | "5747_ORN_Seg_10_Trig_2_ACCT_ODT_eq_60"                                                     |
      | "5747_ORN_Seg_10_Trig_2_non_Scene_CC_PROD_HIER_LEVEL_3_eq_Credit Cards"                     |
      | "5747_ORN_Seg_10_Trig_2_SOL_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_10_Trig_2_SOL_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_10_Trig_2_MOB_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_10_Trig_2_MOB_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_11_Trig_2_IMMGRTN_CAT_CD_ne_S_or_S00"                                         |
      | "5747_ORN_Seg_11_Trig_2_SOL_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_11_Trig_2_SOL_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_11_Trig_2_MOB_LAST_LOGIN_DT_lt_90"                                            |
      | "5747_ORN_Seg_11_Trig_2_MOB_LAST_LOGIN_DT_eq_90"                                            |
      | "5747_ORN_Seg_08_Trig_18_VALID_START_DATE_lt_Curr_Dt"                                       |
      | "5747_ORN_Seg_09_Trig_18_VALID_START_DATE_eq_Curr_Dt"                                       |
      | "5747_ORN_Seg_10_Trig_18_VALID_END_DATE_gt_Curr_Dt"                                         |
      | "5747_ORN_Seg_11_Trig_18_VALID_END_DATE_eq_Curr_Dt"                                         |
      | "5747_ORN_Seg_11_Trig_17_ACCT_ODT_eq_60"                                                    |
      | "5747_ORN_Seg_11_Trig_17_ACCT_ODT_lt_60"                                                    |
      | "5747_ORN_Seg_10_Trig_2_AMEX_with_Scene_Plus"                                               |
    #Added for April 13th release
      | "5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5747_ORN_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" |
      | "5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" |
      | "5747_ORN_DNS_eq_Y"                                                                         |


  @D2DXSell @D2DXSell_ORN_positive_IH_Validation @5747 @ORN @RS22054
  Scenario Outline: D2DXsell_RS22054_5747_ORN Validate positive scenarios with IH field values against proposition data
    * def testDataFileName = D2DXSellORNTestData
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
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')

    #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

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

   # It clears Result fields
    * clearResultFields()

   # Fetch recorded activity for CID from IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')

#     Validationg IPT and PST records which are recorded in IH
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXsellSpecificIHValidation')

    # Validate the web Response with IH,Proposition
    * call read('classpath:channels/orn/ReusableScenarios.feature@D2DXSellOfferValidation')

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0
    Examples:
      | TestID                                                                                               |
#      | "5747_ORN_MULT_TRIG_NEWMORTGAGE_Highly Engaged_MarriageLifeEvent"                                   |
      | "5747_ORN_MULT_TRIG_DECILE_D2D_RESPONSE_PROPENSITY_CNT_PAGEVISIT_D2D"                               |
#      | "5747_ORN_CREATIVE_PRIORITIZE_NEWMORTGAGE_NOMPSA"                                                   |
#      | "5747_ORN_CREATIVE_PRIORITIZE_NEWMORTGAGE_MPSA_gt_30K"                                              |
#      | "5747_ORN_CREATIVE_PRIORITIZE_NEWMORTGAGE_MPSA_lt_30K"                                              |
#      | "5747_ORN_MULT_TRIG_NEWMORTGAGE_Clickstream_MPSAbalanceover15K_NewCreditCard"                       |
#      | "5747_ORN_MULT_TRIG_Graduation_Clickstream_MPSAbalancebelow15K_CardRenewal_UpcomingMortgageRenewal" |
#      | "5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CLOSED"                      |



  @D2DXSell @D2DXSell_Negative_TestCases_ORN_Validation_5747 @5747 @ORN @RS22054

  Scenario Outline: D2DXsell  RS22054_5747_ORN Validate Negative TestCases Response Fields
    * def testDataFileName = D2DXSellORNTestData
    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print 'testid is'+data

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')
    * def creative_id = karate.get('data.CreativeId')

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
    * print '***************Response*************'+karate.pretty(responseString)

    * clearResultFields()

    * def responseStringActual = responseString == '{}' ? {} : (karate.jsonPath(responseString,"$.offers[0].creative_id"))

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != creative_id)

    Examples:
      | TestID                                                                                    |
      | "N-5747_ORN_DECEASED_F_eq_Y"                                                                                    |
      | "N-5747_ORN_DECEASED_F_eq_NULL"                                                                                 |
      | "N-5747_ORN_CUST_TP_CD_ne_PSNL"                                                                                 |
      | "N-5747_ORN_LANG_CD_eq_K"                                                                                       |
      | "N-5747_ORN_LANG_CD_eq_NULL"                                                                                    |
      | "N-5747_ORN_PRIM_CNTRY_CD_eq_NULL"                                                                              |
      | "N-5747_ORN_PRIM_CNTRY_CD_ne_CA"                                                                                |
      | "N-5747_ORN_MKTBL_eq_N"                                                                                         |
      | "N-5747_ORN_MKTBL_eq_NULL"                                                                                      |
      | "N-5747_ORN_NOT_AML_KYC_eq_Y"                                                                                   |
      | "N-5747_ORN_ITRADE_MCLEOD_F_eq_Y"                                                                               |
      | "N-5747_ORN_EMPLOYEE_STAFF_F_eq_Y"                                                                              |
      | "N-5747_ORN_HAS_CLOSED_CHQ_F_eq_Y"                                                                              |
      | "N_5747_ORN_CUST_AGE_gt_65"                                                                                     |
      | "N_5747_ORN_CUST_AGE_lt_18"                                                                                     |
      | "N_5747_ORN_CUST_AGE_eq_NULL"                                                                                   |
      | "N_5747_ORN_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"                               |
      | "N_5747_ORN_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_ne_1_2_3_4"                                                        |
      | "N_5747_ORN_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_NULL"                                                           |
      | "N_5747_ORN_CUST_DIM_ENGAGEMENT_INDEX_lt_9"                                                                     |
      | "N_5747_ORN_CUST_DIM_ENGAGEMENT_INDEX_eq_NULL"                                                                  |
      | "N_5747_ORN_CUST_DIM.PHYSICIANS_F_eq_ Y"                                                                        |
      | "N_5747_ORN_ACCT_SUBSYS_ID_ne_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"         |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"       |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_gt_30000"      |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_gt_30000"        |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_ne_BSAMP_CRNT_BAL_AMT_lt_30000"         |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_NULL_CRNT_BAL_AMT_lt_30000"          |
      | "N_5747_ORN_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_NULL"          |
      | "N_5747_ORN_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_ne_1_2_3"                                     |
      | "N_5747_ORN_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_NULL"                                      |
      | "N_5747_ORN_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_eq_NULL"                                                   |
      | "N_5747_ORN_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_lt_1"                                                      |
      | "N_5747_ORN_Current date - CUST_DIM.MLS_ADDED_AT_DT_gt_30"                                                      |
      | "N_5747_ORN_Current date - CUST_DIM.MLS_ADDED_AT_DT_eq_NULL"                                                    |
      | "N_5747_ORN_Current date - CUST_DIM.MARRIAGE_LIFE_EVENT_DT_gt_30"                                              |
      | "N_5747_ORN_Current date - CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_NULL"                                            |
      | "N_5747_ORN_Current date - CUST_DIM.GRADUATION_LIFE_EVENT_DT_gt_30"                                            |
      | "N_5747_ORN_Current date - CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_NULL"                                          |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_lt_30"                        |
      | "N_5747_ORN_STATUS_NULL_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_gt_30"                 |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_gt_90"                        |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_lt_90"                       |
      | "N_5747_ORN_not_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR_CRD_RENEWAL_DT_lt_90"                    |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_NULL_CRD_RENEWAL_DT_lt_90"                      |
      | "N_5747_ORN_Open_NOT_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_gt_30"                    |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_eq_NULL"                      |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VBB_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_lt_90"                        |
      | "N_5747_ORN_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_DD_CRD_RENEWAL_DT_lt_90"                        |
      | "N_5747_ORN_Open_ACCT_SUBSYS_ID_eq_NULL_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_gt_30"    |
      | "N_5747_ORN_Close_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                                    |
      | "N_5747_ORN_STATUS_eq_NULL_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                           |
      | "N_5747_ORN_Open_BS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                                     |
      | "N_5747_ORN_Open_ACCT_SUBSYS_ID_eq_NULL_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                 |
      | "N_5747_ORN_Open_KS_PROD_HIER_LEVEL_3_ne_CC_ACCT_ODT_lt_60"                                                     |
      | "N_5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_NULL_ACCT_ODT_lt_60"                                                   |
      | "N_5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_NULL"                                                   |
      | "N_5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_lt_30"                                                     |
      | "N_5747_ORN_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_60"                                                     |
      | "N_5747_ORN_NOTActive_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"         |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_ne_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"            |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_NULL_IP_AR_RELATN_TYPE_CD_eq_SOL"          |
      | "N_5747_ORN_STATUS_eq_NULL_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"    |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_NULL_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"                   |
      | "N_5747_ORN_STATUS_eq_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_NULL" |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_nonResidential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_BOR"         |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_21_IP_AR_RELATN_TYPE_CD_eq_BOR"            |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_NOB"            |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_60_IP_AR_RELATN_TYPE_CD_eq_BOR"            |
      | "N_5747_ORN_MULT_TRIG_NEWMORTGAGE_Physician_Flag"                                                               |
      | "N_5747_ORN_NOTActive_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_SOL"           |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_ne_Residential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_SOL"              |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_NULL_IP_AR_RELATN_TYPE_CD_eq_SOL"                 |
      | "N_5747_ORN_STATUS_eq_NULL_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_SOL"      |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_NULL_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_SOL"                     |
      | "N_5747_ORN_STATUS_eq_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_NULL"   |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_nonResidential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_BOR"           |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_8months_IP_AR_RELATN_TYPE_CD_eq_NOB"              |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_lt_8months_IP_AR_RELATN_TYPE_CD_eq_BOR"              |
      | "N_5747_ORN_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_8months_IP_AR_RELATN_TYPE_CD_eq_BOR"              |
      | "N_5747_ORN_Seg_06_Trig_9_CRNT_BAL_AMT_eq_30000"                                                                |
      | "N_5747_ORN_Seg_06_Trig_9_CRNT_BAL_AMT_lt_30000"                                                                |
      | "N_5747_ORN_Seg_06_Trig_9_CRNT_BAL_AMT_eq_NULL"                                                                 |
      | "N_5747_ORN_Trig_15_ACCT_ODT_eq_NULL"                                                                           |
      | "N_5747_ORN_Trig_15_ACCT_ODT_eq_49 days"                                                                        |
      | "N_5747_ORN_Trig_15_ACCT_ODT_eq_61 days"                                                                        |
      | "N_5747_ORN_Seg_03_or_04_Trig_16_CURR_VAL_eq_0"                                                                 |
      | "N_5747_ORN_Seg_03_or_04_Trig_16_CURR_VAL_eq_NULL"                                                              |
    #Added for March release 2023
      | "N_5747_ORN_Seg_09_Trig_17_ACCT_SUBSYS_ID_ne_KS"                                         |
      | "N_5747_ORN_Seg_09_Trig_17_ACCT_SUBSYS_ID_eq_NULL"                                       |
      | "N_5747_ORN_Seg_09_Trig_17_SRC_ACCT_STAT_CD_ne_Open"                                     |
      | "N_5747_ORN_Seg_09_Trig_17_SRC_ACCT_STAT_CD_eq_NULL"                                     |
      | "N_5747_ORN_Seg_09_Trig_17_PROD_HIER_LEVEL_3_ne_Credit_Cards"                            |
      | "N_5747_ORN_Seg_09_Trig_17_PROD_HIER_LEVEL_3_eq_NULL"                                    |
      | "N_5747_ORN_Seg_08_Trig_18_VALID_START_DATE_gt_Curr_Dt"                                  |
      | "N_5747_ORN_Seg_08_Trig_18_VALID_END_DATE_lt_Curr_Dt"                                    |
      | "N_5747_ORN_Seg_08_Trig_18_CAMPAIGN_CODE_ne_RS22054"                                     |
      | "N_5747_ORN_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_ne_CIE5747"                                |
      | "N_5747_ORN_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_eq_NULL"                                   |
      | "N_5747_ORN_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_FLAG_ne_Y"                                 |
      | "N_5747_ORN_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                              |
      | "N_5747_ORN_Seg_08_Trig_18_ORN_CHANNEL_ne_Y"                                            |
      | "N_5747_ORN_Seg_08_Trig_18_ORN_CHANNEL_eq_NULL"                                         |
      | "N_5747_ORN_Seg_08_Trig_2_CUST_OPND_DT_eq_60"                                            |
      | "N_5747_ORN_Seg_08_Trig_2_CUST_OPND_DT_gt_60"                                            |
      | "N_5747_ORN_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL"             |
      | "N_5747_ORN_Seg_08_Trig_2_ACCT_ODT_eq_60"                                                |
      | "N_5747_ORN_Seg_08_Trig_2_ACCT_ODT_gt_60"                                                |
      | "N_5747_ORN_Seg_08_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                 |
      | "N_5747_ORN_Seg_08_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                              |
      | "N_5747_ORN_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_08_Trig_2_MOB_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"           |
      | "N_5747_ORN_Seg_09_Trig_2_CUST_OPND_DT_lt_90"                                            |
      | "N_5747_ORN_Seg_09_Trig_2_CUST_OPND_DT_eq_NULL"                                          |
      | "N_5747_ORN_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL"             |
      | "N_5747_ORN_Seg_09_Trig_2_ACCT_ODT_lt_90"                                                |
      | "N_5747_ORN_Seg_09_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                 |
      | "N_5747_ORN_Seg_09_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                              |
      | "N_5747_ORN_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"           |
      | "N_5747_ORN_Seg_09_Trig_2_Has_AMEX_GOLD_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"  |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_CUST_OPND_DT_lt_60"                                       |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_CUST_OPND_DT_eq_NULL"                                     |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_ACCT_SUBSYS_ID_ne_KS"                                     |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_ACCT_SUBSYS_ID_ne_NULL"                                   |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SRC_ACCT_STAT_CD_ne_Open"                                 |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SRC_ACCT_STAT_CD_eq_NULL"                                 |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL"        |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SRC_SYS_PRD_CD_ne_AXG_SRC_SYS_SUB_PRD_CD_ne_GC"           |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_ACCT_ODT_lt_60"                                           |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SOL_LAST_LOGIN_DT_gt_90"                                  |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_MOB_LAST_LOGIN_DT_gt_90"                                  |
      | "N_5747_ORN_Seg_10_Trig_2_AMEX_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"      |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_CUST_OPND_DT_lt_60"                                  |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_CUST_OPND_DT_eq_NULL"                                |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_ACCT_SUBSYS_ID_ne_KS"                                |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_ACCT_SUBSYS_ID_ne_NULL"                              |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_SRC_ACCT_STAT_CD_ne_Open"                            |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_SRC_ACCT_STAT_CD_eq_NULL"                            |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_ACCT_ODT_lt_60"                                      |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_SOL_LAST_LOGIN_DT_gt_90"                             |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_MOB_LAST_LOGIN_DT_gt_90"                             |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL" |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_PROD_HIER_LEVEL_3_ne_Credit Cards"                   |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_PROD_HIER_LEVEL_3_eq_NULL"                           |
      | "N_5747_ORN_Seg_10_Trig_2_Non_Scene_with_Scene_Plus"                                     |
      | "N_5747_ORN_Seg_11_Trig_2_MCB_IND_ne_Y"                                                  |
      | "N_5747_ORN_Seg_11_Trig_2_MCB_IND_eq_NULL"                                               |
      | "N_5747_ORN_Seg_11_Trig_2_IMMGRTN_CAT_CD_eq_S"                                           |
      | "N_5747_ORN_Seg_11_Trig_2_IMMGRTN_CAT_CD_eq_S00"                                         |
      | "N_5747_ORN_Seg_11_Trig_2_SOL_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_11_Trig_2_MOB_LAST_LOGIN_DT_gt_90"                                       |
      | "N_5747_ORN_Seg_11_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"           |
#Added for April 13th release
      |"N_5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180"               |
      |"N_5747_ORN_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180"               |
      | "N_5747_ORN_BASE_Seg_07_Trig_13_MAT_DT_lt_8months"                         |
      | "N_5747_ORN_BASE_Seg_07_Trig_13_MAT_DT_gt_8months"                         |