@SuppCard_CrossSell_ORN_5468
Feature: Create test data for Supp Card Cross Sell-5468 ORN test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @SuppCardCrossSell_ORN_11111 @5468 @ORN @RS21099 @11111
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_ORN Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID         | ACCT_ODT |
      | "5468_ORN_BASE_01"   | "92"     |
      | "5468_ORN_BASE_02"   | "92"     |
      | "5468_CUST_TP_CD=PSNL, Primary Country Cd = CA, MRKTBLE_F = Y, Customer Not Decease, CUST_AGE >18"            | "92"     |
      | "5468_CUST_AGE=18"                                                                                            | "92"     |
      | "5468_LANG_CD in EN"                                                                                          | "92"     |
      | "5468_LANG_CD in E"                                                                                           | "92"     |
      | "5468_LANG_CD in F"                                                                                           | "92"     |
      | "5468_LANG_CD in FR"                                                                                          | "92"     |
      | "5468_LANG_CD in small case_e"                                                                                | "92"     |
      | "5468_LANG_CD in small case_en"                                                                               | "92"     |
      | "5468_LANG_CD in small case_f"                                                                                | "92"     |
      | "5468_LANG_CD in small case_fr"                                                                               | "92"     |
      | "5468_DO_NOT_SOLICIT_F = NULL"                                                                                | "92"     |
      | "5468_NOT_AML_KYC = NULL"                                                                                     | "92"     |
      | "5468_ACCT_SUBSYS_ID=KS"                                                                                      | "92"     |
      | "5468_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                           | "92"     |
      | "5468_CHRGF_CD = 0"                                                                                           | "92"     |
      | "5468_BLOCK_CD and RECL_CD both blank"                                                                        | "92"     |
      | "5468_BLOCK_CD and RECL_CD -  C"                                                                              | "92"     |
      | "5468_BLOCK_CD and RECL_CD  - XH"                                                                             | "92"     |
      | "5468_BLOCK_CD and RECL_CD  -  NULL"                                                                          | "92"     |
      | "5468_IP_AR_RELATN_TYPE_CD!=SUP"                                                                              | "92"     |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1"           | "92"     |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2"           | "92"     |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1"               | "92"     |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1"               | "92"     |
      | "N-5468_VGD_NF & ACCT_ODT>90"                                                                                 | "94"     |
      | "5468_VCL_ZZ & ACCT_ODT>90"                                                                                   | "95"     |
      | "N-5468_VCL_SS & ACCT_ODT>90"                                                                                 | "96"     |
      | "5468_VLR_RG & ACCT_ODT>90"                                                                                   | "97"     |
      | "N-5468_VLR_NF & ACCT_ODT>90"                                                                                 | "98"     |
      | "5468_VCL_DM & ACCT_ODT>90"                                                                                   | "99"     |
      | "5468_VCL_RG & ACCT_ODT>90"                                                                                   | "100"    |
      | "5468_VCL_NF & ACCT_ODT>90"                                                                                   | "101"    |
      | "N-5468_VCL_SV & ACCT_ODT>90"                                                                                 | "92"     |
      | "N-5468_VFA_A1 & ACCT_ODT>90"                                                                                 | "92"     |
      | "N-5468_VFF_F1 & ACCT_ODT>90"                                                                                 | "92"     |
      | "5468_AXG_GC & ACCT_ODT>90"                                                                                   | "92"     |
      | "N-5468_AXS_SC & ACCT_ODT>90"                                                                                 | "92"     |
      | "N-5468_AXP_PC & ACCT_ODT>90"                                                                                 | "92"     |
      | "N-5468_VLR_RC & ACCT_ODT>90"                                                                                 | "92"     |
      | "5468_VFF_TR & ACCT_ODT>90"                                                                                   | "92"     |
      | "N-5468_VGD_RG & ACCT_ODT>90"                                                                                 | "92"     |
      | "N-5468_CUST_TP_CD !=PSNL"                                                                                    | "92"     |
      | "N-5468_Primary Country Cd != CA"                                                                             | "92"     |
      | "N-5468_Primary Country Cd = NULL"                                                                            | "92"     |
      | "N-5468_CUST_AGE < 18"                                                                                        | "92"     |
      | "N-5468_CUST_AGE = NULL"                                                                                      | "92"     |
      | "N-5468_LANG_CD NOT in (EN, E, FR, F)"                                                                        | "92"     |
      | "N-5468_LANG_CD = NULL"                                                                                       | "92"     |
      | "N-5468_DO_NOT_SOLICIT_F = Y"                                                                                 | "92"     |
      | "N-5468_MRKTBLE_F = N"                                                                                        | "92"     |
      | "N-5468_MRKTBLE_F = NULL"                                                                                     | "92"     |
      | "N-5468_NOT_AML_KYC = Y"                                                                                      | "92"     |
      | "N-5468_Customer Decease - Y"                                                                                 | "92"     |
      | "N-5468_Customer Decease - NULL"                                                                              | "92"     |
      | "N-5468_VGD_NF & ACCT_ODT <90"                                                                                | "90"     |
      | "N-5468_VCL_ZZ & ACCT_ODT = 90"                                                                               | "91"     |
      | "N-5468_01_07"                                                                                                | "92"     |
      | "N-5468_02_05"                                                                                                | "92"     |
      | "N-5468_19_05"                                                                                                | "92"     |
      | "N-5468_13_05"                                                                                                | "92"     |
      | "N-5468_07_01"                                                                                                | "92"     |
      | "N-5468_23_02" | "92"     |
      | "N-5468_VGD_AB"                                                                                               | "92"     |
      | "N-5468_VCL_BC"                                                                                               | "92"     |
      | "N-5468_VLR_CD"                                                                                               | "92"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1)"       | "92"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1 or 2)" | "92"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL > 2)"       | "92"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"           | "92"     |
      | "5468_IP_AR_RELATN_TYPE_CD=SUP"                                                                               | "92"     |
      | "5468_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT"               | "92"     |
      | "5468_Perform Viewed Disposition and offer should display when Lead scope - ACT"                              | "92"     |
      | "5468_Validate IH Record fields against Proposition"                                                          | "92"     |
      | "5468_VFF_TS & ACCT_ODT>90"                                                                                   | "95"     |
      | "5468_AXG_GS & ACCT_ODT>90"                                                                                   | "96"     |
      | "5468_VCL_ST & ACCT_ODT>90"                                                                                   | "97"     |


  @SuppCardCrossSell_ORN_11221 @5468 @ORN @RS21099 @11221
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_ORN Create test data for 11221

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')


    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                | ACCT_ODT |
      | "5468_IP_AR_RELATN_TYPE_CD!=SUP_multiple accounts"                                                    | "93"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 01_01 & ACCT_ODT>90"                                                 | "93"     |
      | "5468_VCL_ZZ & ACCT_ODT>90 and 01_02 & ACCT_ODT>90"                                                   | "93"     |
      | "N-5468_VCL_SS & ACCT_ODT>90 and 01_03 & ACCT_ODT>90"                                                 | "93"     |
      | "5468_VLR_RG & ACCT_ODT>90 and 01_04 & ACCT_ODT>90"                                                   | "93"     |
      | "N-5468_VLR_NF & ACCT_ODT>90 and 02_01 & ACCT_ODT>90"                                                 | "93"     |
      | "5468_VCL_DM & ACCT_ODT>90 and 02_02 & ACCT_ODT>90"                                                   | "93"     |
      | "5468_VCL_RG & ACCT_ODT>90 and 02_03 & ACCT_ODT>90"                                                   | "93"     |
      | "5468_VFF_TR & ACCT_ODT>90 and 23_03 & ACCT_ODT>90"                                                   | "93"     |
      | "N-5468_VGD_RG & ACCT_ODT>90 and 19_01 & ACCT_ODT>90"                                                 | "93"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 19_08 & ACCT_ODT>90"                                                 | "93"     |
      | "5468_VFF_TR & ACCT_ODT>90 and VFF_TS & ACCT_ODT>90"                                                  | "93"     |
      | "5468_VCL_RG & ACCT_ODT>90 and VLR_RG & ACCT_ODT>90"                                                  | "93"     |
      | "5468_AXG_GC & Acct_odt>90 and AXG_GS & Acct_odt>90"                                                  | "93"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 & ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A and 01_01 & ACCT_ODT < 90"    | "93"     |
      | "N-5468_VCL_ZZ & ACCT_ODT>90 & ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = Open and 01_02 & ACCT_ODT = 90" | "93"     |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = B"  | "93"     |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A"  | "93"     |

  @SuppCardCrossSell_ORN_11112 @5468 @ORN @RS21099 @11112
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_ORN Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellORNTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                       | ACCT_ODT |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"         | "93"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"         | "93"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"        | "93"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"         | "93"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"       | "93"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"         | "94"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"         | "94"     |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 2) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"         | "94"     |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1 or 2) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)" | "94"     |