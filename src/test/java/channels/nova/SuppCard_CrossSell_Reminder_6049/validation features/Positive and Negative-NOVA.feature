@SuppCardCrossSell_PositiveNegative_Validation_6049
Feature: Validate Supplementary Card CrossSell Reminder Positive and Negative for NOVA test cases
  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')


  @SuppCardCrossSell_6049 @SuppCardCrossSell_6049_Reminder_NOVA_IH_Validation @6049 @RS21099
  Scenario Outline: Supplementary card Cross Sell_Reminder_6049_NOVA Validate <TestID> Positive TestCases Response Fields with IH
    * def testDataFileName = SuppCardCrossSellReminderNovatestData

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
      | "6049_NOVA_BASE_01"                          |
      | "6049_NOVA_BASE_02"                          |
      | "6049_NOVA_BASE_03"                          |
      | "6049_NOVA_BASE_04"                          |
      | "6049_NOVA_BASE_05"                          |
      | "6049_NOVA_BASE_06"                          |
      | "6049_NOVA_BASE_07"                          |
      | "6049_NOVA_BASE_08"                          |
      | "6049_NOVA_BASE_09"                          |
    #Prioritization
      | "6049_NOVA_Prioritization_AXP_PC_AND_AXG_GC" |
      | "6049_NOVA_Prioritization_AXG_GC_AND_AXG_GS" |
      | "6049_NOVA_Prioritization_AXG_GS_AND_VFF_TR" |
      | "6049_NOVA_Prioritization_VFF_TR_AND_VFF_TS" |
      | "6049_NOVA_Prioritization_VFF_TS_AND_VLR_RG" |
      | "6049_NOVA_Prioritization_VLR_RG_AND_VCL_RG" |
      | "6049_NOVA_Prioritization_VCL_RG_AND_VCL_ZZ" |
      | "6049_NOVA_Prioritization_VCL_ZZ_AND_VCL_NF" |
      | "6049_NOVA_Prioritization_VCL_NF_AND_VCL_DM" |
      | "6049_NOVA_Prioritization_VCL_DM_AND_VCL_ST" |
      | "6049_NOVA_Prioritization_VCL_ST_AND_AXS_SC" |
      | "6049_NOVA_Prioritization_AXS_SC_AND_AXS_SS" |

  @SuppCardCrossSell_6049 @SuppCardCrossSell_6049_Reminder_Nova_Positive_Validation @6049 @NOVA @RS21099
  Scenario Outline: Supplementary card Cross Sell_6049_Reminder_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellReminderNovatestData

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


##    Clear IH when it goes to control group
#    * call clearIH(cid,requestfile,offerCode)

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
      | "6049_CUST_AGE=18"                                                                                                                                                                                    |
      | "6049_LANG_CD in EN"                                                                                                                                                                                  |
      | "6049_LANG_CD in E"                                                                                                                                                                                   |
      | "6049_LANG_CD in F"                                                                                                                                                                                   |
      | "6049_LANG_CD in FR"                                                                                                                                                                                  |
      | "6049_LANG_CD in small case_e"                                                                                                                                                                        |
      | "6049_LANG_CD in small case_en"                                                                                                                                                                       |
      | "6049_LANG_CD in small case_f"                                                                                                                                                                        |
      | "6049_LANG_CD in small case_fr"                                                                                                                                                                       |
      | "6049_DO_NOT_SOLICIT_F = Y"                                                                                                                                                                           |
      | "6049_NOT_AML_KYC = NULL"                                                                                                                                                                             |
      | "6049_ACCT_SUBSYS_ID=KS"                                                                                                                                                                              |
      | "6049_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                                                   |
      | "6049_NOVA_PROD_CD_AXG_SUB_PROD_CD_GS"                                                                                                                                                                |
      | "6049_NOVA_PROD_CD_VFF_SUB_PROD_CD_TS"                                                                                                                                                                |
      | "6049_NOVA_PROD_CD_VCL_SUB_PROD_CD_ST"                                                                                                                                                                |
      | "6049_NOVA_PROD_CD_AXS_SUB_PROD_CD_SS"                                                                                                                                                                |
      | "6049_VCL_ZZ & ACCT_ODT<90 and 01_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "6049_VLR_RG & ACCT_ODT<90 and 01_04 & ACCT_ODT>90"                                                                                                                                                   |
      | "6049_VCL_DM & ACCT_ODT<90 and 02_02 & ACCT_ODT>90"                                                                                                                                                   |
      | "6049_VCL_RG & ACCT_ODT>90 and 02_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "6049_VFF_TR & ACCT_ODT>90 and 23_03 & ACCT_ODT>90"                                                                                                                                                   |
      | "6049_VFF_TR & ACCT_ODT>90 and VFF_TS & ACCT_ODT>90"                                                                                                                                                  |
      | "6049_VCL_RG & ACCT_ODT>90 and VLR_RG & ACCT_ODT>90"                                                                                                                                                  |
      | "6049_AXG_GC & Acct_odt>90 and AXG_GS & Acct_odt>90"                                                                                                                                                  |
      | "6049_NOVA_Exclusion_positive_ACCT_SUBSYSID_ne_KS"                                                                                                                                                    |
      | "6049_NOVA_Exclusion_positive_SRC_ACCT_STAT_CD_ne_Open"                                                                                                                                               |
      | "6049_NOVA_Exclusion_positive_PROD_HIER_LEVEL_3_ne_CreditCards"                                                                                                                                       |
      | "6049_NOVA_Exclusion_positive_ACCT_ODT_gt_90"                                                                                                                                                         |


  @SuppCardCrossSell_6049 @SuppCardCrossSell_6049_Reminder_Nova_NegativeTestCases_Validation @6049 @NOVA @RS21099
  Scenario Outline: Supp Card CrossSell_6049_Reminder_NOVA Validate <TestID> Negative TestCases Response Fields
  #    Reading data from Excel sheet
    * def testDataFileName = SuppCardCrossSellReminderNovatestData

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
      | "N-6049_CUST_TP_CD !=PSNL"                                                                                                                                                                                  |
      | "N-6049_Primary Country Cd != CA"                                                                                                                                                                           |
      | "N-6049_Primary Country Cd = NULL"                                                                                                                                                                          |
      | "N-6049_CUST_AGE < 18"                                                                                                                                                                                      |
      | "N-6049_CUST_AGE = NULL"                                                                                                                                                                                    |
      | "N-6049_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                                                                      |
      | "N-6049_LANG_CD = NULL"                                                                                                                                                                                     |
      | "N-6049_MRKTBLE_F = N"                                                                                                                                                                                      |
      | "N-6049_MRKTBLE_F = NULL"                                                                                                                                                                                   |
      | "N-6049_NOT_AML_KYC = Y"                                                                                                                                                                                    |
      | "N-6049_Customer Decease - Y"                                                                                                                                                                               |
      | "N-6049_Customer Decease - NULL"                                                                                                                                                                            |
      | "N_6049_NOVA_PRIMARY_ACCT_HOLDER_ne_Y"                                                                                                                                                                      |
      | "N-6049_VGD_NF & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VCL_SS & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VLR_NF & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VCL_SV & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VFA_A1 & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VFF_F1 & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VLR_RC & ACCT_ODT>90"                                                                                                                                                                               |
      | "N-6049_VGD_RG & ACCT_ODT>90"                                                                                                                                                                               |
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
      | "N-6049_01_07"                                                                                                                                                                                              |
      | "N-6049_02_05"                                                                                                                                                                                              |
      | "N-6049_19_05"                                                                                                                                                                                              |
      | "N-6049_13_05"                                                                                                                                                                                              |
      | "N-6049_07_01"                                                                                                                                                                                              |
      | "N-6049_23_02"                                                                                                                                                                                              |
      | "N-6049_VGD_AB"                                                                                                                                                                                             |
      | "N-6049_VCL_BC"                                                                                                                                                                                             |
      | "N-6049_VLR_CD"                                                                                                                                                                                             |
      | "N-6049_VGD_NF & ACCT_ODT>90 and 01_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-6049_VCL_SS & ACCT_ODT>90 and 01_03 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-6049_VLR_NF & ACCT_ODT>90 and 02_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-6049_VGD_RG & ACCT_ODT>90 and 19_01 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-6049_VGD_NF & ACCT_ODT>90 and 19_08 & ACCT_ODT>90"                                                                                                                                                       |
      | "N-6049_VGD_NF & ACCT_ODT>90 & ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A and 01_01 & ACCT_ODT < 90"                                                                                                          |
      | "N-6049_VCL_ZZ & ACCT_ODT>90 & ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = Open and 01_02 & ACCT_ODT = 90"                                                                                                       |
      | "N-6049_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = B"                                                                                                        |
      | "N-6049_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A"                                                                                                        |
      | "N_6049_NOVA_ACCT_SUBSYS_ID_ne_KS"                                                                                                                                                                          |
      | "N_6049_NOVA_SRC_ACCT_STAT_CD_ne_Open"                                                                                                                                                                      |
      | "N_6049_NOVA_CHRGF_CD_ne_0"                                                                                                                                                                                 |
      | "N_6049_NOVA_SUPPL_CREDIT_CARD_FLAG_eq_Y"                                                                                                                                                                   |
      | "N_6049_NOVA_CR_CRD_LMT_AMT_lt_2000"                                                                                                                                                                        |
      | "N_6049_NOVA_UTILIZATIOn_gt_0.85"                                                                                                                                                                           |
      | "N_6049_NOVA_Exclusion_positive_ACCT_ODT_eq_90"                                                                                                                                                             |