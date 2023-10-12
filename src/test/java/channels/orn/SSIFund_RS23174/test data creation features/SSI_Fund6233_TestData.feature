@SSI_FUND_ORN_6233
Feature: Create test data for SSI_Fund_6233 ORN test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @SSI_FUND_ORNTestData_1account @6233 @ORN @RS23174 @1account
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


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
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6233_ORN_BASE_Seg_01"                                                                                       | "5"      |
      | "6233_ORN_Creative_01_LANG_CD_eq_EN"                                                                         | "5"      |
      | "6233_ORN_Creative_01_LANG_CD_eq_F"                                                                          | "5"      |
      | "6233_ORN_Creative_01_LANG_CD_eq_FR"                                                                         | "5"      |
      | "6233_ORN_Creative_01_ITRADE_MCLEOD_F_eq_NULL"                                                               | "5"      |
      | "6233_ORN_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                                                  | "5"      |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RRS"       | "5"      |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RRSP_SRC_SYS_SUB_PRD_CD_BNSCSVRG_eq_SRC_SYS_PRD_CD_eq_RSS"       | "5"      |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REF"       | "5"      |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_RESP_SRC_SYS_SUB_PRD_CD_BNSCSVRX_eq_SRC_SYS_PRD_CD_eq_REI"       | "5"      |
      | "6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_TFSA_SRC_SYS_SUB_PRD_CD_BNSCSVTF_eq_SRC_SYS_PRD_CD_eq_TFS"       | "5"      |
      | "6233_ORN_Creative_01_ACCT_ODT_eq_10"                                                                        | "10"     |
      | "N-6233_ORN_Creative_01_DECEASED_F_eq_Y"                                                                     | "5"      |
      | "N-6233_ORN_Creative_01_DECEASED_F_eq_NULL"                                                                  | "5"      |
      | "N-6233_ORN_Creative_01_CUST_TP_CD_eq_ABCD"                                                                  | "5"      |
      | "N-6233_ORN_Creative_01_PRIM_CNTRY_CD_eq_IN"                                                                 | "5"      |
      | "N-6233_ORN_Creative_01_PRIM_CNTRY_CD_eq_NULL"                                                               | "5"      |
      | "N-6233_ORN_Creative_01_CUST_AGE_eq_NULL"                                                                    | "5"      |
      | "N-6233_ORN_Creative_01_LANG_CD_eq_KA"                                                                       | "5"      |
      | "N-6233_ORN_Creative_01_MRKTBLE_F_eq_N"                                                                      | "5"      |
      | "N-6233_ORN_Creative_01_MRKTBLE_F_eq_NULL"                                                                   | "5"      |
      | "N-6233_ORN_Creative_01_ITRADE_MCLEOD_F_eq_Y"                                                                | "5"      |
      | "N-6233_ORN_Creative_01_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                                                   | "5"      |
      | "N-6233_ORN_Creative_01_INDV_FRST_NM_eq_NULL"                                                                | "5"      |
      | "N-6233_ORN_Creative_01_INDV_LAST_NM_eq_NULL"                                                                | "5"      |
      | "N-6233_ORN_Creative_01_PLN_ACCT_DLR_ne_SSI"                                                                 | "5"      |
      | "N-6233_ORN_Creative_01_PLN_ACCT_DLR_eq_NULL"                                                                | "5"      |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_ne_UF"                                                                | "5"      |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_NULL"                                                              | "5"      |
      | "N-6233_ORN_Creative_01_SRC_ACCT_STAT_CD_ne_Active"                                                          | "5"      |
      | "N-6233_ORN_Creative_01_SRC_ACCT_STAT_CD_eq_NULL"                                                            | "5"      |
      | "N-6233_ORN_Creative_01_PLAN_SPOT_BALANCE_eq_1"                                                              | "5"      |
      | "N-6233_ORN_Creative_01_ACCT_ODT_gt_10"                                                                      | "11"     |
      | "N-6233_ORN_Creative_01_ACCT_ODT_eq_NULL"                                                                    | "NULL"   |
      | "N-6233_ORN_Creative_01_PLN_ACCT_CD_MASTER_eq_LIF_SRC_SYS_SUB_PRD_CD_eq_BNSCSVRG_SRC_SYS_PRD_CD_eq_BNSCSVRG" | "5"      |
      | "N-6233_ORN_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_N"                                                       | "5"      |
      | "N-6233_ORN_Creative_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                    | "5"      |
      | "N-6233_ORN_Creative_01_IP_AR_RELATN_TYPE_CD_ne_ANN_OR_OWN"                                                         | "5"      |
      | "N-6233_ORN_Creative_01_IP_AR_RELATN_TYPE_CD_eq_NULL"                                                        | "5"      |


  @SSI_FUND_ORNTestData_2account @6233 @ORN @RS23174 @2accounts
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data for 2 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
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

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | acct_num1     | ACCT_ODT1 |
      | Acc2     | acct_num2     | ACCT_ODT2 |

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
      | TestID                                                                                                        | ACCT_ODT1 | ACCT_ODT2 |
      | "6233_ORN_Creative_01_NRS_RRSP"                                                                              | "8"       | "8"       |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180"   | "8"       | "180"     |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180"   | "8"       | "180"     |
      | "6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_181"   | "8"       | "181"     |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_180" | "8"       | "180"     |
      | "N-6233_ORN_Creative_01_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_9_ACCT_ODT_eq_179" | "8"       | "179"     |

  @SSI_FUND_ORNTestData_3account @6233 @ORN @RS23174 @3accounts
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data for 3 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt1 to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the acct_odt2 to YYYY-MM-DD format
#    * string ACCT_ODT2 = <ACCT_ODT2>
#    * print "Account ODT2 is", ACCT_ODT2
#
#    # Convert the acct_odt3 to YYYY-MM-DD format
#    * string ACCT_ODT3 = <ACCT_ODT3>
#    * print "Account ODT3 is", ACCT_ODT3

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000001'+randGen(15)
    * print "Account Number3 is " + acct_num3

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 2 Test ID is '+Acc3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |

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
      | TestID                                | ACCT_ODT |
      | "6233_ORN_Creative_01_NRS_RRSP_RRSP" | "8"      |

  @SSI_FUND_ORNTestData_4account @6233 @ORN @RS23174 @4accounts
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data for 4 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt1 to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the acct_odt2 to YYYY-MM-DD format
#    * string ACCT_ODT2 = <ACCT_ODT2>
#    * print "Account ODT2 is", ACCT_ODT2
#
#    # Convert the acct_odt3 to YYYY-MM-DD format
#    * string ACCT_ODT3 = <ACCT_ODT3>
#    * print "Account ODT3 is", ACCT_ODT3
#
#    # Convert the acct_odt4 to YYYY-MM-DD format
#    * string ACCT_ODT4 = <ACCT_ODT4>
#    * print "Account ODT4 is", ACCT_ODT4

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000001'+randGen(15)
    * print "Account Number3 is " + acct_num3
    * def acct_num4 = '00000002'+randGen(15)
    * print "Account Number4 is " + acct_num4

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 2 Test ID is '+Acc3

    * def Acc4 = <TestID>+'_Account_4'
    * print 'Account 4 Test ID is '+Acc4

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |
      | Acc4     | acct_num4     |

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
      | TestID                                     | ACCT_ODT |
      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP" | "8"       |


  @SSI_FUND_ORNTestData_5account @6233 @ORN @RS23174 @5accounts
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data for 5 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt1 to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the acct_odt2 to YYYY-MM-DD format
#    * string ACCT_ODT2 = <ACCT_ODT2>
#    * print "Account ODT2 is", ACCT_ODT2
#
#    # Convert the acct_odt3 to YYYY-MM-DD format
#    * string ACCT_ODT3 = <ACCT_ODT3>
#    * print "Account ODT3 is", ACCT_ODT3
#
#    # Convert the acct_odt4 to YYYY-MM-DD format
#    * string ACCT_ODT4 = <ACCT_ODT4>
#    * print "Account ODT4 is", ACCT_ODT4
#
#    # Convert the acct_odt5 to YYYY-MM-DD format
#    * string ACCT_ODT5 = <ACCT_ODT5>
#    * print "Account ODT5 is", ACCT_ODT5

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

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 2 Test ID is '+Acc3

    * def Acc4 = <TestID>+'_Account_4'
    * print 'Account 4 Test ID is '+Acc4

    * def Acc5 = <TestID>+'_Account_5'
    * print 'Account 5 Test ID is '+Acc5

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |
      | Acc4     | acct_num4     |
      | Acc5     | acct_num5     |

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
      | TestID                                          | ACCT_ODT |
      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP_RESP" | "8"       |

  @SSI_FUND_ORNTestData_6account @6233 @ORN @RS23174 @6accounts
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data for 6 account scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt1 to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the acct_odt2 to YYYY-MM-DD format
#    * string ACCT_ODT2 = <ACCT_ODT2>
#    * print "Account ODT2 is", ACCT_ODT2
#
#    # Convert the acct_odt3 to YYYY-MM-DD format
#    * string ACCT_ODT3 = <ACCT_ODT3>
#    * print "Account ODT3 is", ACCT_ODT3
#
#    # Convert the acct_odt4 to YYYY-MM-DD format
#    * string ACCT_ODT4 = <ACCT_ODT4>
#    * print "Account ODT4 is", ACCT_ODT4
#
#    # Convert the acct_odt5 to YYYY-MM-DD format
#    * string ACCT_ODT5 = <ACCT_ODT5>
#    * print "Account ODT5 is", ACCT_ODT5
#
#    # Convert the acct_odt6 to YYYY-MM-DD format
#    * string ACCT_ODT6 = <ACCT_ODT6>
#    * print "Account ODT6 is", ACCT_ODT6

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

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

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

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |
      | Acc4     | acct_num4     |
      | Acc5     | acct_num5     |
      | Acc6     | acct_num6     |

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
      | TestID                                               | ACCT_ODT |
      | "6233_ORN_Creative_01_NRS_RRSP_RRSP_RESP_RESP_TFSA" | "8"       |