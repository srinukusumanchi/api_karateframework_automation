@RRSP_Contribution_Nova_5955
Feature: Create test data for RRSPContribution-5955 Nova  test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @RRSPPACReminder_NOVA_BASE_PositiveTestData @5955 @NOVA @RS21094 @Sanity-NOVA
  Scenario Outline: RRSP Reminder_RS21094_5955_NOVA Create test data for Positive BASE Test Data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
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

    Examples:
      | TestID         | ACCT_ODT |
      | "5955_BASE_01" | "10"     |
      | "5955_BASE_02" | "76"     |

  @RRSPPACReminder_NOVA_PositiveTestData @5955 @NOVA @RS21094
  Scenario Outline: RRSP_Positive_RS21094_5955_NOVA Create test data for positive Test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
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

    Examples:
      | TestID                                                                                           | ACCT_ODT |
      | "5955_CUST_AGE_eq_18"                                                                            | "71"     |
      | "5955_LANG_CD_eq_e"                                                                              | "72"     |
      | "5955_LANG_CD_eq_en"                                                                             | "73"     |
      | "5955_LANG_CD_eq_f"                                                                              | "74"     |
      | "5955_LANG_CD_eq_fr"                                                                             | "75"     |
      | "5955_LANG_CD_eq_capital_E"                                                                      | "65"     |
      | "5955_LANG_CD_eq_capital_EN"                                                                     | "66"     |
      | "5955_LANG_CD_eq_capital_F"                                                                      | "67"     |
      | "5955_LANG_CD_eq_capital_FR"                                                                     | "68"     |
      | "5955_DO_NOT_SOLICIT_F_eq_NULL"                                                                  | "69"     |
      | "5955_NOT_AML_KYC_eq_NULL"                                                                       | "70"     |
      | "5955_MD_FINANCIAL_F_eq_NULL"                                                                    | "10"     |
      | "5955_ITRADE_MCLEOD_F_eq_NULL"                                                                   | "10"     |
      | "5955_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                      | "10"     |
      | "5955_PLN_ACCT_CD_MASTER_eq_RRSP_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_eq_Active_PIC_PAC_F_eq_0" | "10"     |
      | "5955_Currentdate-ACCT_ODT=BusinessDSS1"                                                         | "7"      |
      | "5955_Currentdate-ACCT_ODT>BusinessDSS1"                                                         | "8"      |
      | "5955_Currentdate-ACCT_ODT=BusinessDSS2"                                                         | "78"     |
      | "5955_Currentdate-ACCT_ODT<BusinessDSS2"                                                         | "77"     |
      | "5955_PRIMARY_ACCT_HOLDER_FLAG_eq_Y"                                                             | "10"     |
      | "5955_INDV_FRST_NM_ne_NULL"                                                                      | "10"     |


  @RRSPPACReminder_Positive_MultipleAccounts_TestData @5955 @NOVA @RS21091
  Scenario Outline: RRSP Fund_RS21094_5955_NOVA Create test data for Multiple accounts PAC Reminder

    #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     #     Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1>
    * print "Account ODT1 is", acct_odt1

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2>
    * print "Account ODT2 is", acct_odt2

     # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | acct_num1     | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |

      #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

     # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                      | Acct_Odt_1 | Acct_Odt_2 |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_Lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_gt_90days"        | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_NA_ACCT_ODT_lt_90days"       | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_NotOpen_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_gt_90days"    | "10"       | "91"       |
      | "5955_5955032303_5955012302_prioritise_5955012302"                                                          | "10"       | "76"       |

  @RRSPContribution_PACReminder_Negative_MultipleAccounts_TestData @5955 @NOVA @RS21091
  Scenario Outline: RRSP_PACReminder_RS21094_5955_NOVA Create test data for negative Multiple accounts

    #  Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #  Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1>
    * print "Account ODT is", ACCT_ODT1

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2>
    * print "Account ODT is", ACCT_ODT2

     # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

      # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | acct_num1     | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |

# insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                     | Acct_Odt_1 | Acct_Odt_2 |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_01_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_02_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_02_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_04_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_19_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_07_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_13_SRC_SUB_PRD_CD_08_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_11_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_07_SRC_SUB_PRD_CD_12_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_01_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_eq_90days"     | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_BB_SRC_PRD_CD_23_SRC_SUB_PRD_CD_03_SRC_ACCT_STAT_CD_eq_A_ACCT_ODT_lt_90days"     | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_ZZ_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SS_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_DM_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_NF_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VCL_SRC_SUB_PRD_CD_SV_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFA_SRC_SUB_PRD_CD_A1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_F1_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXG_SRC_SUB_PRD_CD_GC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXS_SRC_SUB_PRD_CD_SC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_AXP_SRC_SUB_PRD_CD_PC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VLR_SRC_SUB_PRD_CD_RC_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VFF_SRC_SUB_PRD_CD_TR_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_eq_90days" | "10"       | "90"       |
      | "N-5955_ACCT_SUBSYS_ID_eq_KS_SRC_PRD_CD_VGD_SRC_SUB_PRD_CD_RG_SRC_ACCT_STAT_CD_eq_Open_ACCT_ODT_lt_90days" | "10"       | "89"       |


  @RRSPPACReminder_NOVA_NegativeTestData @5955 @NOVA @RS21094
  Scenario Outline: RRSP_PACReminder_RS21094_5955_NOVA <TestID> Create test data for negative test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
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

    Examples:
      | TestID                                     | ACCT_ODT |
      | "N-5955_CUST_TP_CD_ne_PSNL"                | "10"     |
      | "N-5955_CUST_TP_CD_eq_NULL"                | "10"     |
      | "N-5955_PRIM_CNTRY_CD_ne_CA"               | "10"     |
      | "N-5955_PRIM_CNTRY_CD_eq_NULL"             | "10"     |
      | "N-5955_DECEASED_F_ne_N"                   | "10"     |
      | "N-5955_DECEASED_F_eq_NULL"                | "10"     |
      | "N-5955_CUST_AGE_eq_NULL"                  | "10"     |
      | "N-5955_CUST_AGE_lt_18"                    | "10"     |
      | "N-5955_LANG_CD_ne_e_en_f_fr_E_EN_F_FR"    | "10"     |
      | "N-5955_LANG_CD_eq_NULL"                   | "10"     |
      | "N-5955_MRKTBLE_F_ne_Y"                    | "10"     |
      | "N-5955_MRKTBLE_F_eq_NULL"                 | "10"     |
      | "N-5955_NOT_AML_KYC_eq_Y"                  | "10"     |
      | "N-5955_MD_FINANCIAL_F_eq_Y"               | "10"     |
      | "N-5955_ITRADE_MCLEOD_F_eq_Y"              | "10"     |
      | "N-5955_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y" | "10"     |
      | "N-5955_PLN_ACCT_CD_MASTER_ne_RRSP"        | "10"     |
      | "N-5955_PLN_ACCT_CD_MASTER_eq_NULL"        | "10"     |
      | "N-5955_ACCT_SUBSYS_ID_ne_UF"              | "10"     |
      | "N-5955_ACCT_SUBSYS_ID_eq_NULL"            | "10"     |
      | "N-5955_SRC_ACCT_STAT_CD_ne_Active"        | "10"     |
      | "N-5955_SRC_ACCT_STAT_CD_eq_NULL"          | "10"     |
      | "N-5955_PIC_PAC_F_ne_0"                    | "10"     |
      | "N-5955_PIC_PAC_F_eq_NULL"                 | "10"     |
      | "N-5955_ACCT_ODT_eq_NULL"                  | "NULL"   |
      | "N-5955_Currentdate-ACCT_ODT<BusinessDSS1" | "6"      |
      | "N-5955_Currentdate-ACCT_ODT>BusinessDSS2" | "79"     |
      | "N-5955_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"     | "10"     |
      | "N-5955_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"  | "10"     |
      | "N-5955_INDV_FRST_NM_eq_NULL"              | "10"     |
      | "N-5955_INDV_LAST_NM_eq_NULL"              | "10"     |
    ##Added on march 02 2023 rel
      | "N_5955_PLN_ACCT_DLR_ne_BNS"               | "10"     |
      | "N_5955_PLN_ACCT_DLR_ne_SSI"               | "10"     |
      | "N_5955_PLN_ACCT_DLR_eq_NULL"              | "10"     |


  @RRSPPACReminder_NOVA_PositivePriorityTestData @5955 @NOVA @RS21094
  Scenario Outline: RRSP Fund_RS21094_5955_NOVA Create test data for positive Priority data

      # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     #  Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1>
    * print "Account ODT1 is", acct_odt1

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2>
    * print "Account ODT2 is", acct_odt2

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

     # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | acct_num1     | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |



      #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

     # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

     # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                 | Acct_Odt_1 | Acct_Odt_2 | CUST_OPND_DT |
      | "5502_5955_ifeligibleforbothoffersthen prioritise5955" | "10"       | "100"      | "100"        |

    
    #    Added for June 8th 2023 release for adding external table for exclusion for TFSA PAC Reminder offer

  @RRSPPACReminder_NOVA_Single_record_ExternalTable_Positive_Negative_Scenarios_TestData @5955 @NOVA @RS21094
  Scenario Outline: RRSPPACReminder_RS21094_5501_NOVA_TestData <TestID> Create test data for single account with External table positive and negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPFundNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
##To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')


    Examples:
      | TestID                                         | VALID_START_DATE | VALID_END_DATE | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "N_5955_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"      | 5                | -5             | 100          | 60                | 60                | 10       |
