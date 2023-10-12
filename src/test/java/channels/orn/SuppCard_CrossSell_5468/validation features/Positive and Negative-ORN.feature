@SuppCardCrossSell_PositiveNegative_Validation_5468
Feature: Validate Supplementary Card CrossSell Positive and Negative for ORN test cases

  Background: Common for ORN Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/orn/ChannelORN.txt')

  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_ORN_IH_Validation @5468 @ORN @RS21099
  Scenario Outline: Supplementary card Cross Sell_5468_ORN Validate <TestID> Positive TestCases Response Fields with IH validation
  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellORNTestData

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
    * call read('classpath:channels/orn/ReusableScenarios.feature@SuppCardsOfferValidationWithIH')

    # Validate the NOVA rest Response against DB and Proposition data
    * call read('classpath:channels/orn/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_ORN')

#    # Validate the NOVA rest Response against DB and Proposition data for travel insurance specific validation
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SSMSpecificOfferValidation')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID             |
      | "5468_ORN_BASE_01" |
      | "5468_ORN_BASE_02" |

  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_ORN_Positive_Validation @5468 @ORN @RS21099
  Scenario Outline: Supplementary card Cross Sell_5468_ORN Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a ORN SOAP call
    * call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')


   # Clear IH when it goes to control group
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

    * call read('classpath:channels/orn/ReusableScenarios.feature@SuppCardCrossSellOfferValidation_ORN')
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                                                |
      | "5468_CUST_TP_CD=PSNL, Primary Country Cd = CA, MRKTBLE_F = Y, Customer Not Decease, CUST_AGE >18"                                                                                                    |
      | "5468_CUST_AGE=18"                                                                                                                                                                                    |
      | "5468_LANG_CD in EN"                                                                                                                                                                                  |
      | "5468_LANG_CD in E"                                                                                                                                                                                   |
      | "5468_LANG_CD in F"                                                                                                                                                                                   |
      | "5468_LANG_CD in FR"                                                                                                                                                                                  |
      | "5468_LANG_CD in small case_e"                                                                                                                                                                        |
      | "5468_LANG_CD in small case_en"                                                                                                                                                                       |
      | "5468_LANG_CD in small case_f"                                                                                                                                                                        |
      | "5468_LANG_CD in small case_fr"                                                                                                                                                                       |
      | "5468_DO_NOT_SOLICIT_F = NULL"                                                                                                                                                                        |
      | "5468_NOT_AML_KYC = NULL"                                                                                                                                                                             |
      | "5468_ACCT_SUBSYS_ID=KS"                                                                                                                                                                              |
      | "5468_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                   |
      | "5468_CHRGF_CD = 0"                                                                                                                                                                                   |
      | "5468_BLOCK_CD and RECL_CD both blank"                                                                                                                                                                |
      | "5468_BLOCK_CD and RECL_CD -  C"                                                                                                                                                                      |
      | "5468_BLOCK_CD and RECL_CD  - XH"                                                                                                                                                                     |
      | "5468_BLOCK_CD and RECL_CD  -  NULL"                                                                                                                                                                  |
      | "5468_IP_AR_RELATN_TYPE_CD!=SUP"                                                                                                                                                                      |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                   |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2"                                                                                                   |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1"                                                                                                       |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1"                                                                                                       |
      | "5468_VCL_ZZ & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VLR_RG & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VCL_DM & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VCL_RG & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VCL_NF & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_AXG_GC & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VFF_TR & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VFF_TS & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_AXG_GS & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_VCL_ST & ACCT_ODT>90"                                                                                                                                                                           |
      | "5468_IP_AR_RELATN_TYPE_CD!=SUP_multiple accounts"                                                                                                                                                    |
      | "5468_VCL_ZZ & ACCT_ODT>90 and 01_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VLR_RG & ACCT_ODT>90 and 01_04 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VCL_DM & ACCT_ODT>90 and 02_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VCL_RG & ACCT_ODT>90 and 02_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VFF_TR & ACCT_ODT>90 and 23_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "5468_VFF_TR & ACCT_ODT>90 and VFF_TS & ACCT_ODT>90"                                                                                                                                                  |
      | "5468_VCL_RG & ACCT_ODT>90 and VLR_RG & ACCT_ODT>90"                                                                                                                                                  |
      | "5468_AXG_GC & Acct_odt>90 and AXG_GS & Acct_odt>90"                                                                                                                                                  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)" |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"  |
      | "5468_IP_AR_RELATN_TYPE_CD=SUP"                                                                                                                                                                       |


  @SuppCardCrossSell_5468 @SuppCardCrossSell_5468_ORN_NegativeTestCases_Validation @5468 @ORN @RS21099
  Scenario Outline: Supp Card CrossSell_5468_ORN Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellORNTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num



    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')

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
      | TestID                                                                                                                                                                                                       |
#      | "N-5468_VGD_NF & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VCL_SS & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VLR_NF & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VCL_SV & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VFA_A1 & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VFF_F1 & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_AXS_SC & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_AXP_PC & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_VLR_RC & ACCT_ODT>90"                                                                                                                                                                                |
#      | "N-5468_CUST_TP_CD !=PSNL"                                                                                                                                                                                   |
#      | "N-5468_Primary Country Cd != CA"                                                                                                                                                                            |
#      | "N-5468_Primary Country Cd = NULL"                                                                                                                                                                           |
#      | "N-5468_CUST_AGE < 18"                                                                                                                                                                                       |
#      | "N-5468_CUST_AGE = NULL"                                                                                                                                                                                     |
#      | "N-5468_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                                                                       |
#      | "N-5468_LANG_CD = NULL"                                                                                                                                                                                      |
#      | "N-5468_DO_NOT_SOLICIT_F = Y"                                                                                                                                                                                |
#      | "N-5468_MRKTBLE_F = N"                                                                                                                                                                                       |
#      | "N-5468_MRKTBLE_F = NULL"                                                                                                                                                                                    |
#      | "N-5468_NOT_AML_KYC = Y"                                                                                                                                                                                     |
#      | "N-5468_Customer Decease - Y"                                                                                                                                                                                |
#      | "N-5468_Customer Decease - NULL"                                                                                                                                                                             |
#      | "N-5468_VGD_NF & ACCT_ODT <90"                                                                                                                                                                               |
      | "N-5468_VCL_ZZ & ACCT_ODT = 90"                                                                                                                                                                              |
#      | "N-5468_01_07"                                                                                                                                                                                               |
#      | "N-5468_02_05"                                                                                                                                                                                               |
#      | "N-5468_19_05"                                                                                                                                                                                               |
#      | "N-5468_13_05"                                                                                                                                                                                               |
#      | "N-5468_07_01"                                                                                                                                                                                               |
#      | "N-5468_23_02"                                                                                                                                                                                               |
#      | "N-5468_VGD_AB"                                                                                                                                                                                              |
#      | "N-5468_VCL_BC"                                                                                                                                                                                              |
#      | "N-5468_VLR_CD"                                                                                                                                                                                              |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1)"                                                                                                      |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1 or 2)"                                                                                                |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL > 2)"                                                                                                      |
#      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"                                                                                                          |
#      | "N-5468_VGD_NF & ACCT_ODT>90 and 01_01 & ACCT_ODT>90"                                                                                                                                                        |
#      | "N-5468_VCL_SS & ACCT_ODT>90 and 01_03 & ACCT_ODT>90"                                                                                                                                                        |
#      | "N-5468_VLR_NF & ACCT_ODT>90 and 02_01 & ACCT_ODT>90"                                                                                                                                                        |
#      | "N-5468_VGD_NF & ACCT_ODT>90 and 19_08 & ACCT_ODT>90"                                                                                                                                                        |
#      | "N-5468_VGD_NF & ACCT_ODT>90 & ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A and 01_01 & ACCT_ODT < 90"                                                                                                           |
#      | "N-5468_VCL_ZZ & ACCT_ODT>90 & ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = Open and 01_02 & ACCT_ODT = 90"                                                                                                        |
#      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = B"                                                                                                         |
#      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A"                                                                                                         |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"       |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1 or 2) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)" |
#      | "N-5468_VGD_RG & ACCT_ODT>90 and 19_01 & ACCT_ODT>90"                                                                                                                                                        |
#      | "N-5468_VGD_RG & ACCT_ODT>90"                                                                                                                                                                                |