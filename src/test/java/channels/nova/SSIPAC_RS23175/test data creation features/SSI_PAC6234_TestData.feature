@SSI_PAC_Nova_6234
Feature: Create test data for SSI_PAC_6234 Nova test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @SSI_PAC_NOVATestData_1account @6234 @NOVA @RS23175 @1account
  Scenario Outline: SSIPAC_RS23175_6234_NOVA Create test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIPACNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


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
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6234_NOVA_BASE_Seg_01"                                                                                       | "25"     |
      | "6234_NOVA_Creative_01_LANG_CD_eq_EN"                                                                         | "25"     |
      | "6234_NOVA_Creative_01_LANG_CD_eq_F"                                                                          | "25"     |
      | "6234_NOVA_Creative_01_LANG_CD_eq_FR"                                                                         | "25"     |
      | "6234_NOVA_Creative_01_ITRADE_MCLEOD_F_eq_NULL"                                                               | "25"     |
      | "6234_NOVA_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                  | "25"     |
      | "6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RRS"       | "25"     |
      | "6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RSS"       | "25"     |
      | "6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REF"       | "25"     |
      | "6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REI"       | "25"     |
      | "6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_TFSA_SRC_SYS_SUB_PRD_CD_BNSCSVTF_eq_SRC_SYS_PRD_CD_eq_TFS"       | "25"     |
      | "6234_NOVA_Creative_01_ACCT_ODT_eq_20"                                                                        | "20"     |
      | "6234_NOVA_Creative_01_ACCT_ODT_eq_30"                                                                        | "30"     |
      | "6234_NOVA_Creative_01_PIC_PAC_F_eq_2"                                                                        | "25"     |
      | "N-6234_NOVA_Creative_01_DECEASED_F_eq_Y"                                                                     | "25"     |
      | "N-6234_NOVA_Creative_01_DECEASED_F_eq_NULL"                                                                  | "25"     |
      | "N-6234_NOVA_Creative_01_CUST_TP_CD_eq_ABCD"                                                                  | "25"     |
      | "N-6234_NOVA_Creative_01_PRIM_CNTRY_CD_eq_IN"                                                                 | "25"     |
      | "N-6234_NOVA_Creative_01_PRIM_CNTRY_CD_eq_NULL"                                                               | "25"     |
      | "N-6234_NOVA_Creative_01_CUST_AGE_eq_NULL"                                                                    | "25"     |
      | "N-6234_NOVA_Creative_01_LANG_CD_eq_KA"                                                                       | "25"     |
      | "N-6234_NOVA_Creative_01_MRKTBLE_F_eq_N"                                                                      | "25"     |
      | "N-6234_NOVA_Creative_01_MRKTBLE_F_eq_NULL"                                                                   | "25"     |
      | "N-6234_NOVA_Creative_01_ITRADE_MCLEOD_F_eq_Y"                                                                | "25"     |
      | "N-6234_NOVA_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                   | "25"     |
      | "N-6234_NOVA_Creative_01_INDV_FRST_NM_eq_NULL"                                                                | "25"     |
      | "N-6234_NOVA_Creative_01_INDV_LAST_NM_eq_NULL"                                                                | "25"     |
      | "N-6234_NOVA_Creative_01_PLN_ACCT_DLR_ne_SSI"                                                                 | "25"     |
      | "N-6234_NOVA_Creative_01_PLN_ACCT_DLR_eq_NULL"                                                                | "25"     |
      | "N-6234_NOVA_Creative_01_ACCT_SUBSYS_ID_ne_UF"                                                                | "25"     |
      | "N-6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_NULL"                                                              | "25"     |
      | "N-6234_NOVA_Creative_01_SRC_ACCT_STAT_CD_ne_Active"                                                          | "25"     |
      | "N-6234_NOVA_Creative_01_SRC_ACCT_STAT_CD_eq_NULL"                                                            | "25"     |
      | "N-6234_NOVA_Creative_01_ACCT_ODT_gt_30"                                                                      | "31"     |
      | "N-6234_NOVA_Creative_01_ACCT_ODT_lt_20"                                                                      | "19"     |
      | "N-6234_NOVA_Creative_01_ACCT_ODT_eq_NULL"                                                                    | "NULL"   |
      | "N-6234_NOVA_Creative_01_PLN_ACCT_CD_MASTER_eq_LIF_SRC_SYS_SUB_PRD_CD_eq_BNSCSVRG_SRC_SYS_PRD_CD_eq_BNSCSVRG" | "25"     |
      | "N-6234_NOVA_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                                       | "25"     |
      | "N-6234_NOVA_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                    | "25"     |
      | "N-6234_NOVA_Creative_01_IP_AR_RELATN_TYPE_CD_ne_ANN_OR_OWN"                                                         | "25"     |
      | "N-6234_NOVA_Creative_01_IP_AR_RELATN_TYPE_CD_eq_NULL"                                                        | "25"     |
      | "N-6234_NOVA_Creative_01_PIC_PAC_F_eq_1"                                                                      | "25"     |


  @SSI_PAC_NOVATestData_2account @6234 @NOVA @RS23175 @2accounts
  Scenario Outline: SSIPAC_RS23175_6234_NOVA Create test data for 2 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIPACNOVATestData
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
      | TestID                                                                                                        | ACCT_ODT1 | ACCT_ODT2 |
      | "6234_NOVA_Creative_01_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180"   | "25"      | "180"     |
      | "6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180"   | "25"      | "180"     |
      | "6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_ne_9_ACCT_ODT_eq_180"   | "25"      | "180"     |
      | "6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_181"   | "25"      | "181"     |
      | "N-6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180" | "25"      | "180"     |
      | "N-6234_NOVA_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_179" | "25"      | "179"     |


  @SSI_PAC_NOVATestData_17account @6234 @NOVA @RS23175 @17accounts
  Scenario Outline: SSIPAC_RS23175_6234_NOVA Create test data for 17 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIPACNOVATestData
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
    * def acct_num3 = '00000001'+randGen(15)
    * print "Account Number3 is " + acct_num3
    * def acct_num4 = '00000002'+randGen(15)
    * print "Account Number4 is " + acct_num4
    * def acct_num5 = '00000003'+randGen(15)
    * print "Account Number5 is " + acct_num5
    * def acct_num6 = '00000004'+randGen(15)
    * print "Account Number4 is " + acct_num4
    * def acct_num7 = '00000005'+randGen(15)
    * print "Account Number7 is " + acct_num7
    * def acct_num8 = '00000006'+randGen(15)
    * print "Account Number8 is " + acct_num8
    * def acct_num9 = '00000007'+randGen(15)
    * print "Account Number9 is " + acct_num9
    * def acct_num10 = '00000008'+randGen(15)
    * print "Account Number10 is " + acct_num10
    * def acct_num11 = '00000009'+randGen(15)
    * print "Account Number11 is " + acct_num11
    * def acct_num12 = '00000010'+randGen(15)
    * print "Account Number12 is " + acct_num12
    * def acct_num13 = '00000011'+randGen(15)
    * print "Account Number13 is " + acct_num13
    * def acct_num14 = '00000012'+randGen(15)
    * print "Account Number14 is " + acct_num14
    * def acct_num15 = '00000013'+randGen(15)
    * print "Account Number15 is " + acct_num15
    * def acct_num16 = '00000014'+randGen(15)
    * print "Account Number16 is " + acct_num16
    * def acct_num17 = '00000015'+randGen(15)
    * print "Account Number17 is " + acct_num17


    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 2 Test ID is '+Acc3

    * def Acc4 = <TestID>+'_Account_4'
    * print 'Account 4 Test ID is '+Acc4

    * def Acc5 = <TestID>+'_Account_5'
    * print 'Account 5 Test ID is '+Acc5
    * def Acc6 = <TestID>+'_Account_6'
    * print 'Account 6 Test ID is '+Acc6
    * def Acc7 = <TestID>+'_Account_7'
    * print 'Account 7 Test ID is '+Acc7
    * def Acc8 = <TestID>+'_Account_8'
    * print 'Account 8 Test ID is '+Acc8
    * def Acc9 = <TestID>+'_Account_9'
    * print 'Account 9 Test ID is '+Acc9
    * def Acc10 = <TestID>+'_Account_10'
    * print 'Account 10 Test ID is '+Acc10
    * def Acc11 = <TestID>+'_Account_11'
    * print 'Account 11 Test ID is '+Acc11
    * def Acc12 = <TestID>+'_Account_12'
    * print 'Account 12 Test ID is '+Acc12
    * def Acc13 = <TestID>+'_Account_13'
    * print 'Account 13 Test ID is '+Acc13
    * def Acc14 = <TestID>+'_Account_14'
    * print 'Account 14 Test ID is '+Acc14
    * def Acc15 = <TestID>+'_Account_15'
    * print 'Account 15 Test ID is '+Acc15
    * def Acc16 = <TestID>+'_Account_16'
    * print 'Account 16 Test ID is '+Acc16
    * def Acc17 = <TestID>+'_Account_17'
    * print 'Account 17 Test ID is '+Acc17


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |
      | Acc4     | acct_num4     |
      | Acc5     | acct_num5     |
      | Acc6     | acct_num6     |
      | Acc7     | acct_num7     |
      | Acc8     | acct_num8     |
      | Acc9     | acct_num9     |
      | Acc10    | acct_num10    |
      | Acc11    | acct_num11    |
      | Acc12    | acct_num12    |
      | Acc13    | acct_num13    |
      | Acc14    | acct_num14    |
      | Acc15    | acct_num15    |
      | Acc16    | acct_num16    |
      | Acc17    | acct_num17    |

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
      | TestID                                                                                                     | ACCT_ODT |
      | "6234_NOVA_Creative_01_NRS_LIF_LIRA_LRSP_LRIF_PRIF_RRIF_RLIF_RRIF_RRSP_RLSP_RRSP_RDSP_RESP_RESP_TFSA_FHSA" | "25"     |