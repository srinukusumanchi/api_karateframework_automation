@SuppCard_CrossSell_Nova_5468
Feature: Create test data for Supp Card Cross Sell-5468 Nova test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @SuppCardCrossSell_NOVA_BASE_Test_Data @5468 @NOVA @RS21099
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA Create test data for base test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Convert the acct_odt to YYYY-MM-DD format
#    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID              |
      | "5468_NOVA_BASE_01" |
      | "5468_NOVA_BASE_02" |
#      Added NOVA Base 3 in multiple insights scenario as it needs 2 insights
#      | "5468_NOVA_BASE_03" |
      | "5468_NOVA_BASE_04" |
      | "5468_NOVA_BASE_05" |
      | "5468_NOVA_BASE_06" |
      | "5468_NOVA_BASE_07" |
      | "5468_NOVA_BASE_08" |
      | "5468_NOVA_BASE_09" |

  @SuppCardCrossSell_NOVA_Positive_negative_Single_account_single_insight_Test_Data @5468 @NOVA @RS21099
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA Create test data for positive and negative single account single insight test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Convert the acct_odt to YYYY-MM-DD format
#    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                              |
      | "5468_CUST_AGE=18"                                                                                  |
      | "5468_LANG_CD in EN"                                                                                |
      | "5468_LANG_CD in E"                                                                                 |
      | "5468_LANG_CD in F"                                                                                 |
      | "5468_LANG_CD in FR"                                                                                |
      | "5468_LANG_CD in small case_e"                                                                      |
      | "5468_LANG_CD in small case_en"                                                                     |
      | "5468_LANG_CD in small case_f"                                                                      |
      | "5468_LANG_CD in small case_fr"                                                                     |
      | "5468_DO_NOT_SOLICIT_F = Y"                                                                         |
      | "5468_NOT_AML_KYC = NULL"                                                                           |
      | "5468_ACCT_SUBSYS_ID=KS"                                                                            |
      | "5468_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                 |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1" |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1"     |
      | "5468_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1"     |
      | "5468_NOVA_PROD_CD_AXG_SUB_PROD_CD_GS"                                                              |
      | "5468_NOVA_PROD_CD_VFF_SUB_PROD_CD_TS"                                                              |
      | "5468_NOVA_PROD_CD_VCL_SUB_PROD_CD_ST"                                                              |
      | "5468_NOVA_PROD_CD_AXS_SUB_PROD_CD_SS"                                                              |
      | "5468_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT"     |
      | "5468_Perform Viewed Disposition and offer should display when Lead scope - ACT"                    |
      | "N-5468_CUST_TP_CD !=PSNL"                                                                          |
      | "N-5468_Primary Country Cd != CA"                                                                   |
      | "N-5468_Primary Country Cd = NULL"                                                                  |
      | "N-5468_CUST_AGE < 18"                                                                              |
      | "N-5468_CUST_AGE = NULL"                                                                            |
      | "N-5468_LANG_CD NOT in (EN, E, FR, F)"                                                              |
      | "N-5468_LANG_CD = NULL"                                                                             |
      | "N-5468_MRKTBLE_F = N"                                                                              |
      | "N-5468_MRKTBLE_F = NULL"                                                                           |
      | "N-5468_NOT_AML_KYC = Y"                                                                            |
      | "N-5468_Customer Decease - Y"                                                                       |
      | "N-5468_Customer Decease - NULL"                                                                    |
      | "N_5468_NOVA_PRIMARY_ACCT_HOLDER_ne_Y"                                                              |
      | "N-5468_VGD_NF & ACCT_ODT>90"                                                                       |
      | "N-5468_VCL_SS & ACCT_ODT>90"                                                                       |
      | "N-5468_VLR_NF & ACCT_ODT>90"                                                                       |
      | "N-5468_VCL_SV & ACCT_ODT>90"                                                                       |
      | "N-5468_VFA_A1 & ACCT_ODT>90"                                                                       |
      | "N-5468_VFF_F1 & ACCT_ODT>90"                                                                       |
      | "N-5468_VLR_RC & ACCT_ODT>90"                                                                       |
      | "N-5468_VGD_RG & ACCT_ODT>90"                                                                       |
      | "N-5468_01_07"                                                                                      |
      | "N-5468_02_05"                                                                                      |
      | "N-5468_19_05"                                                                                      |
      | "N-5468_13_05"                                                                                      |
      | "N-5468_07_01"                                                                                      |
      | "N-5468_23_02"                                                                                      |
      | "N-5468_VGD_AB"                                                                                     |
      | "N-5468_VCL_BC"                                                                                     |
      | "N-5468_VLR_CD"                                                                                     |
      | "N_5468_NOVA_ACCT_SUBSYS_ID_ne_KS"                                                                  |
      | "N_5468_NOVA_SRC_ACCT_STAT_CD_ne_Open"                                                              |
      | "N_5468_NOVA_CHRGF_CD_ne_0"                                                                         |
      | "N_5468_NOVA_SUPPL_CREDIT_CARD_FLAG_eq_Y"                                                           |
      | "N_5468_NOVA_CR_CRD_LMT_AMT_lt_2000"                                                                |
      | "N_5468_NOVA_UTILIZATIOn_gt_0.85"                                                                   |
      | "N_5468_NOVA_DECILE_CREDITCARD_SUPPL_PROPENSITY_CURR_Val_gt_5"                                      |

  @SuppCardCrossSell_NOVA_Positive_negative_Single_account_single_insight_with_odt_Test_Data @5468 @NOVA @RS21099

  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA Create test data for positive and negative single account single insight with odt test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                            |ACCT_ODT|
      | "N_Exclusion_KS_Open_Credit Cards_ACCT_ODT_lt_90" |"89"    |
      | "N_Exclusion_KS_Open_Credit Cards_ACCT_ODT_eq_90" |"90"    |

  @SuppCardCrossSell_NOVA_Positive_Negative_multiple_account_single_insight_single_ODT @5468 @NOVA @RS21099
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_NOVA Create test data for positive and negative multiple account with single ODT single insight test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
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

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')


    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT |
      | <TestID> | acct_num1     | "NULL"   |
      | Acc2     | acct_num2     | ACCT_ODT |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                | ACCT_ODT |
      | "5468_VCL_RG & ACCT_ODT>90 and 02_03 & ACCT_ODT>90"                                                   | "94"     |
      | "5468_VFF_TR & ACCT_ODT>90 and 23_03 & ACCT_ODT>90"                                                   | "95"     |
      | "5468_VFF_TR & ACCT_ODT>90 and VFF_TS & ACCT_ODT>90"                                                  | "92"     |
      | "5468_VCL_RG & ACCT_ODT>90 and VLR_RG & ACCT_ODT>90"                                                  | "93"     |
      | "5468_AXG_GC & Acct_odt>90 and AXG_GS & Acct_odt>90"                                                  | "94"     |
      | "5468_NOVA_Exclusion_positive_ACCT_SUBSYSID_ne_KS"                                                    | "98"     |
      | "5468_NOVA_Exclusion_positive_SRC_ACCT_STAT_CD_ne_Open"                                               | "98"     |
      | "5468_NOVA_Exclusion_positive_PROD_HIER_LEVEL_3_ne_CreditCards"                                       | "98"     |
      | "5468_NOVA_Exclusion_positive_ACCT_ODT_gt_90"                                                         | "91"     |
      | "N_5468_NOVA_Exclusion_positive_ACCT_ODT_eq_90"                                                       | "90"     |
      | "N_Exclusion_BB_01_01_ACCT_ODT_lt_90_KS_VCL_ZZ"                                                       | "89"     |
      | "N_Exclusion_BB_02_03_ACCT_ODT_eq_90_AXP_PC"                                                          | "90"     |
      | "N_Exclusion_BB_13_02_ACCT_ODT_lt_90_VFF_TR"                                                          | "89"     |
      | "N_Exclusion_BB_13_07_ACCT_ODT_eq_90_VCL_DM"                                                          | "90"     |
      | "N_Exclusion_BB_19_01_ACCT_ODT_lt_90_AXS_SC"                                                          | "89"     |
      | "N_Exclusion_BB_19_08_ACCT_ODT_eq_90_VFF_TS"                                                          | "90"     |
      | "N_Exclusion_BB_07_11_ACCT_ODT_lt_90_VCL_NF"                                                          | "89"     |
      | "N_Exclusion_BB_07_12_ACCT_ODT_eq_90_AXS_SS"                                                          | "90"     |
      | "N_Exclusion_BB_23_01_ACCT_ODT_lt_90_VLR_RG"                                                          | "89"     |
      | "N_Exclusion_BB_23_03_ACCT_ODT_eq_90_VCL_ST"                                                          | "90"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 01_01 & ACCT_ODT>90"                                                 | "91"     |
      | "N-5468_VCL_SS & ACCT_ODT>90 and 01_03 & ACCT_ODT>90"                                                 | "91"     |
      | "N-5468_VLR_NF & ACCT_ODT>90 and 02_01 & ACCT_ODT>90"                                                 | "91"     |
      | "N-5468_VGD_RG & ACCT_ODT>90 and 19_01 & ACCT_ODT>90"                                                 | "91"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 and 19_08 & ACCT_ODT>90"                                                 | "91"     |
      | "N-5468_VGD_NF & ACCT_ODT>90 & ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A and 01_01 & ACCT_ODT < 90"    | "89"     |
      | "N-5468_VCL_ZZ & ACCT_ODT>90 & ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = Open and 01_02 & ACCT_ODT = 90" | "90"     |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=BB & SRC_ACCT_STAT_CD = B"  | "90"     |
      | "N-5468_VGD_NF & ACCT_ODT>90, and 01_01 & ACCT_ODT>90 and  ACCT_SUBSYS_ID=KS & SRC_ACCT_STAT_CD = A"  | "90"     |


  @SuppCardCrossSell_NOVA_Positive_Negative_multiple_account_single_insight_multiple_ODT @5468 @NOVA @RS21099
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_NOVA Create test data for positive and negative multiple account with multiple ODT single insight test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt1 to YYYY-MM-DD format
    * string ACCT_ODT1 = <ACCT_ODT1>
    * print "Account ODT is", ACCT_ODT1

    # Convert the acct_odt2 to YYYY-MM-DD format
    * string ACCT_ODT2 = <ACCT_ODT2>
    * print "Account ODT2 is", ACCT_ODT2

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')


    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | acct_num1     | ACCT_ODT1 |
      | Acc2     | acct_num2     | ACCT_ODT2 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                              | ACCT_ODT1 | ACCT_ODT2 |
      | "5468_VCL_ZZ & ACCT_ODT<90 and 01_02 & ACCT_ODT>90" | "89"      | "91"      |
      | "5468_VLR_RG & ACCT_ODT<90 and 01_04 & ACCT_ODT>90" | "89"      | "92"      |
      | "5468_VCL_DM & ACCT_ODT<90 and 02_02 & ACCT_ODT>90" | "89"      | "93"      |

  @SuppCardCrossSell_NOVA_Positive_Negative_multiple_account_single_insight_no_ODT_Prioritization @5468 @prioritization @NOVA @RS21099
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_NOVA Create test data for positive and negative multiple account with no ODT single insight for prioritization test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Convert the acct_odt1 to YYYY-MM-DD format
#    * string ACCT_ODT1 = <ACCT_ODT1>
#    * print "Account ODT is", ACCT_ODT1
#
#    # Convert the acct_odt2 to YYYY-MM-DD format
#    * string ACCT_ODT2 = <ACCT_ODT2>
#    * print "Account ODT2 is", ACCT_ODT2

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')


    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
#    # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                       |
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


  @SuppCardCrossSell_NOVA_positive_negative_single_account_multiple_insights @5468 @NOVA @RS21099
  Scenario Outline: Supp Card Cross Sell_RS21099_5468_NOVA Create test data for single account multiple insights test cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Convert the acct_odt to YYYY-MM-DD format
#    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
#    # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                 |
      | "5468_NOVA_BASE_03"
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"   |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL > 1)"   |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL != 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL = 1)"  |
      | "5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL = 1) AND (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)"   |
      | "N-5468_(CUST_INSIGHTS.INSIGHT_CD = DECILE_CREDITCARD_SUPPL_PROPENSITY and CUST_INSIGHTS.CURR_VAL < 1) and (CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_CREDITCARD_SUPPL and CUST_INSIGHTS.CURR_VAL < 1)" |

# July 20th 2023 Release
  @SuppCardCrossSell_NOVA_Inclusion_July20thRelease @5468 @NOVA @RS21099 @11111
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA Create test data for Inclusion July20th Release

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    ###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

#    # insert the created CID into the CUST_INSIGHTS sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
#    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
#
#    # insert the created CID  into the CUST_INSIGHTS_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
    #Inclusion Positive
      | TestID                                                           | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_lt_Curr_Dt"       | "92"     | "1"              | "-2"           |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_eq_Curr_Dt"       | "92"     | "0"              | "-2"           |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_gt_Curr_Dt"         | "92"     | "2"              | "-1"           |
      | "5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_eq_Curr_Dt"         | "92"     | "2"              | "0"            |
#      |                                                                  |          |                  |                |

	  #Inclusion Negative
      | "N-5468_Seg_01_Trig_04_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "92"     | "-1"             | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "92"     | "2"              | "1"            |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CODE_ne_RS21099"        | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_ne_CIE5468"   | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_eq_NULL"      | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_Y"    | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_NOVA_CHANNEL_ne_Y"               | "92"     | "2"              | "-2"           |
      | "N-5468_Seg_01_Trig_04_ExtTable_NOVA_CHANNEL_eq_NULL"            | "92"     | "2"              | "-2"           |

  @SuppCardCrossSell_NOVA_multiple_record_ExternalTable_Positive_Negative_Scenarios_TestData_July20thRelease @5468 @NOVA @RS21099 @11111
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA_ TestData <TestID> Create test data for multiple record with External table

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE1 = <VALID_START_DATE1>
    * string VALID_START_DATE2 = <VALID_START_DATE2>
    * string VALID_END_DATE = <VALID_END_DATE>

#    * def ExtRec1 = <TestID>+'_rec1'
    * def ExtRec1 = <TestID>+'_Account_2'
    * print 'Record2 Test ID is '+ExtRec1

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

#     # insert the created CID into the CUST_INSIGHTS sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
#    # insert the created CID  into the CUST_INSIGHTS_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


###To add into External input table


  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | VALID_START_DATE  |
      | <TestID> | CID | VALID_START_DATE1 |
      | ExtRec1  | CID | VALID_START_DATE2 |

     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database') examples

    Examples:
      | TestID                                   | VALID_START_DATE1 | VALID_END_DATE | VALID_START_DATE2 | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5468_Seg_01_Trig_04_ExtTable_2_Records" | "2"               | "-2"           | "3"               | 60                | "92"     |


  @SuppCardCrossSell_NOVA_Exclusion_July20thRelease @5468 @NOVA @RS21099 @11111
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_NOVA Create test data for Exclusion July20th Release

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SuppCardCrossSellNovatestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    ###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
    #Exclusion Positive
      | TestID                                                              | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "92"     | "2"              | "-2"           |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "92"     | "2"              | "-2"           |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "92"     | "2"              | "1"            |
      | "5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "92"     | "-1"             | "-2"           |

    #Exclusion Negative
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "92"     | "2"              | "-1"           |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     | "92"     | "2"              | "0"            |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   | "92"     | "1"              | "-2"           |
      | "N-5468_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   | "92"     | "0"              | "-2"           |