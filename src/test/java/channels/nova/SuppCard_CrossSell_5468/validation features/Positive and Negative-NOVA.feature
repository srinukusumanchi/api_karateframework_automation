@SuppCardCrossSell_PositiveNegative_Validation_5468
Feature: Validate Supplementary Card CrossSell Positive and Negative for NOVA test cases
  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_NOVA_IH_Validation @5468 @ORN @RS21099
  Scenario Outline: Supplementary card Cross Sell_5468_NOVA Validate <TestID> Positive TestCases Response Fields with IH
    * def testDataFileName = SuppCardCrossSellNovatestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppCardsOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_NOVA')

#    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                       |
      | "5468_NOVA_BASE_01"                          |
      | "5468_NOVA_BASE_02"                          |
      | "5468_NOVA_BASE_03"                          |
      | "5468_NOVA_BASE_04"                          |
      | "5468_NOVA_BASE_05"                          |
      | "5468_NOVA_BASE_06"                          |
      | "5468_NOVA_BASE_07"                          |
      | "5468_NOVA_BASE_08"                          |
      | "5468_NOVA_BASE_09"                          |
    #Prioritization
      | "5468_NOVA_Prioritization_AXP_PC_AND_AXG_GC" |
      | "5468_NOVA_Prioritization_AXG_GC_AND_AXG_GS" |
      | "5468_NOVA_Prioritization_AXG_GS_AND_VFF_TR" |
      | "5468_NOVA_Prioritization_VFF_TR_AND_VFF_TS" |
      | "5468_NOVA_Prioritization_VFF_TS_AND_VLR_RG" |
      | "5468_NOVA_Prioritization_VLR_RG_AND_VCL_RG" |
      | "5468_NOVA_Prioritization_VCL_RG_AND_VCL_ZZ" |
      | "5468_NOVA_Prioritization_VCL_ZZ_AND_VCL_NF" |
      | "5468_NOVA_Prioritization_VCL_NF_AND_VCL_DM" |
      | "5468_NOVA_Prioritization_VCL_DM_AND_VCL_ST" |
      | "5468_NOVA_Prioritization_VCL_ST_AND_AXS_SC" |
      | "5468_NOVA_Prioritization_AXS_SC_AND_AXS_SS" |

  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_Nova_Positive_Validation @5468 @NOVA @RS21099
  Scenario Outline: Supplementary card Cross Sell_5468_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellNovatestData

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

    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                |
      | "5468_CUST_AGE=18"                                                                                                                                                                                    |
      | "5468_LANG_CD in EN"                                                                                                                                                                                  |
      | "5468_LANG_CD in E"                                                                                                                                                                                   |
      | "5468_LANG_CD in F"                                                                                                                                                                                   |
      | "5468_LANG_CD in FR"                                                                                                                                                                                  |
      | "5468_LANG_CD in small case_e"                                                                                                                                                                        |
      | "5468_LANG_CD in small case_en"                                                                                                                                                                       |
      | "5468_LANG_CD in small case_f"                                                                                                                                                                        |
      | "5468_LANG_CD in small case_fr"                                                                                                                                                                       |
      | "5468_DO_NOT_SOLICIT_F = Y"                                                                                                                                                                           |
      | "5468_NOT_AML_KYC = NULL"                                                                                                                                                                             |
      | "5468_ACCT_SUBSYS_ID=KS"                                                                                                                                                                              |
      | "5468_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                   |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                   |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                       |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                       |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)" |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"  |
      | "5468_NOVA_PROD_CD_AXG_SUB_PROD_CD_GS"                                                                                                                                                                |
      | "5468_NOVA_PROD_CD_VFF_SUB_PROD_CD_TS"                                                                                                                                                                |
      | "5468_NOVA_PROD_CD_VCL_SUB_PROD_CD_ST"                                                                                                                                                                |
      | "5468_NOVA_PROD_CD_AXS_SUB_PROD_CD_SS"                                                                                                                                                                |
      | "5468_VCL_ZZ & ACCT_ODT<90 and 01_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VLR_RG & ACCT_ODT<90 and 01_04 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VCL_DM & ACCT_ODT<90 and 02_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VCL_RG & ACCT_ODT>90 and 02_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VFF_TR & ACCT_ODT>90 and 23_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VFF_TR & ACCT_ODT>90 and VFF_TS & ACCT_ODT>90"                                                                                                                                                  |
      | "5468_VCL_RG & ACCT_ODT>90 and VLR_RG & ACCT_ODT>90"                                                                                                                                                  |
      | "5468_AXG_GC & Acct_odt>90 and AXG_GS & Acct_odt>90"                                                                                                                                                  |
      | "5468_NOVA_Exclusion_positive_ACCT_SUBSYSID_ne_KS"                                                                                                                                                    |
      | "5468_NOVA_Exclusion_positive_SRC_ACCT_STAT_CD_ne_Open"                                                                                                                                               |
      | "5468_NOVA_Exclusion_positive_PROD_HIER_LEVEL_3_ne_CreditCards"                                                                                                                                       |
      | "5468_NOVA_Exclusion_positive_ACCT_ODT_gt_90"                                                                                                                                                         |


  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_Nova_NegativeTestCases_Validation @5468 @NOVA @RS21099
  Scenario Outline: Supp Card CrossSell_5468_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellNovatestData

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
      | TestID                                                                                                                                                                                                      |
      | "N-5468_CUST_TP_CD !=PSNL"                                                                                                                                                                                  |
      | "N-5468_Primary Country Cd != CA"                                                                                                                                                                           |
      | "N-5468_Primary Country Cd = NULL"                                                                                                                                                                          |
      | "N-5468_CUST_AGE < 18"                                                                                                                                                                                      |
      | "N-5468_CUST_AGE = NULL"                                                                                                                                                                                    |
      | "N-5468_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                                                                      |
      | "N-5468_LANG_CD = NULL"                                                                                                                                                                                     |
      | "N-5468_MRKTBLE_F = N"                                                                                                                                                                                      |
      | "N-5468_MRKTBLE_F = NULL"                                                                                                                                                                                   |
      | "N-5468_NOT_AML_KYC = Y"                                                                                                                                                                                    |
      | "N-5468_Customer Decease - Y"                                                                                                                                                                               |
      | "N-5468_Customer Decease - NULL"                                                                                                                                                                            |
      | "N_5468_NOVA_PRIMARY_ACCT_HOLDER_ne_Y"                                                                                                                                                                      |
      | "N-5468_VGD_NF & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VCL_SS & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VLR_NF & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VCL_SV & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VFA_A1 & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VFF_F1 & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VLR_RC & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-5468_VGD_RG & ACCT_ODT>90"                                                                                                                                                                               |
      | "N_Exclusion_KS_Open_Credit Cards_ACCT_ODT_lt_90"                                                                                                                                                           |
      | "N_Exclusion_KS_Open_Credit Cards_ACCT_ODT_eq_90"                                                                                                                                                           |
      | "N_Exclusion_BB_01_01_ACCT_ODT_lt_90_KS_VCL_ZZ"                                                                                                                                                             |
      | "N_Exclusion_BB_02_03_ACCT_ODT_eq_90_AXP_PC"                                                                                                                                                                |
      | "N_Exclusion_BB_13_02_ACCT_ODT_lt_90_VFF_TR"                                                                                                                                                                |
      | "N_Exclusion_BB_13_07_ACCT_ODT_eq_90_VCL_DM"                                                                                                                                                                |
      | "N_Exclusion_BB_19_01_ACCT_ODT_lt_90_AXS_SC"                                                                                                                                                                |
      | "N_Exclusion_BB_19_08_ACCT_ODT_eq_90_VFF_TS"                                                                                                                                                                |
      | "N_Exclusion_BB_07_11_ACCT_ODT_lt_90_VCL_NF"                                                                                                                                                                |
      | "N_Exclusion_BB_07_12_ACCT_ODT_eq_90_AXS_SS"                                                                                                                                                                |
      | "N_Exclusion_BB_23_01_ACCT_ODT_lt_90_VLR_RG"                                                                                                                                                                |
      | "N_Exclusion_BB_23_03_ACCT_ODT_eq_90_VCL_ST"                                                                                                                                                                |
      | "N-5468_01_07"                                                                                                                                                                                              |
      | "N-5468_02_05"                                                                                                                                                                                              |
      | "N-5468_19_05"                                                                                                                                                                                              |
      | "N-5468_13_05"                                                                                                                                                                                              |
      | "N-5468_07_01"                                                                                                                                                                                              |
      | "N-5468_23_02"                                                                                                                                                                                              |
      | "N-5468_VGD_AB"                                                                                                                                                                                             |
      | "N-5468_VCL_BC"                                                                                                                                                                                             |
      | "N-5468_VLR_CD"                                                                                                                                                                                             |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 01_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-5468_VCL_SS & ACCT_ODT>90 and 01_03 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-5468_VLR_NF & ACCT_ODT>90 and 02_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-5468_VGD_RG & ACCT_ODT>90 and 19_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 19_08 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-5468_VGD_NF & ACCT_ODT>90 & ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A and 01_01 & ACCT_ODT < 90"                                                                                                          |
      | "N-5468_VCL_ZZ & ACCT_ODT>90 & ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = Open and 01_02 & ACCT_ODT = 90"                                                                                                       |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = B"                                                                                                        |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A"                                                                                                        |
      | "N_5468_NOVA_ACCT_SUBSYS_ID_ne_KS"                                                                                                                                                                          |
      | "N_5468_NOVA_SRC_ACCT_STAT_CD_ne_Open"                                                                                                                                                                      |
      | "N_5468_NOVA_CHRGF_CD_ne_0"                                                                                                                                                                                 |
      | "N_5468_NOVA_SUPPL_CREDIT_CARD_FLAG_eq_Y"                                                                                                                                                                   |
      | "N_5468_NOVA_CR_CRD_LMT_AMT_lt_2000"                                                                                                                                                                        |
      | "N_5468_NOVA_UTILIZATIOn_gt_0.85"                                                                                                                                                                           |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"      |
      | "N_5468_NOVA_DECILE_CREDITCARD_SUPPL_PROPENSITY_CURR_Val_gt_5"                                                                                                                                              |
      | "N_5468_NOVA_Exclusion_positive_ACCT_ODT_eq_90"                                                                                                                                                             |
 # July 20th 2023 Release
  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_Nova_Positive_Validation_July20Release @5468 @NOVA @RS21099
  Scenario Outline: Supplementary card Cross Sell_5468_NOVA Validate July20Release <TestID> Positive TestCases Response

  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellNovatestData

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
    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppCardsOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_NOVA')

#    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                              |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_lt_Curr_Dt"          |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_eq_Curr_Dt"          |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_gt_Curr_Dt"            |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_eq_Curr_Dt"            |
      | "5468_Seg_01_Trig_04_ExtTable_2_Records"                            |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     |


  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_Nova_NegativeTestCases_Validation_ReleaseJuly20 @5468 @NOVA @RS21099
  Scenario Outline: Supp Card CrossSell_5468_NOVA Validate July20Release <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellNovatestData

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
      | TestID                                                            |
      | "N-5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_gt_Curr_Dt"      |
      | "N-5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_lt_Curr_Dt"        |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CODE_ne_RS21099"         |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_ne_CIE5468"    |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_eq_NULL"       |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_Y"     |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"  |
      | "N-5468_Seg_01_Trig_04_ExtTable_NOVA_CHANNEL_ne_Y"                |
      | "N-5468_Seg_01_Trig_04_ExtTable_NOVA_CHANNEL_eq_NULL"             |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"   |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"   |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt" |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt" |