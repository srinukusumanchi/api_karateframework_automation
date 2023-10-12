@Nova_NTB_Adviceplus_5822_IH_Positive_Negative_TestData
Feature: Create test data for NTB_AdvicePlus-5822 Nova Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTB_AdvicePlus_NOVA @NTB_AdvicePlus_5822_BASE_IH_Validation_TestData_NOVA @5822 @NOVA @RS22111 @Sanity
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * def ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

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

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

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
      | TestID              | ARRV_DT | CUST_OPND_DT | ACCT_ODT |
#      | "5822_NOVA_BASE_01" | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_BASE_02" | "45"      | "90"         | "55"     |
      | "5822_NOVA_BASE_05" | "NULL"    | "90"         | "55"     |
      | "5822_NOVA_BASE_06" | "45"      | "90"         | "55"     |

  @NTB_AdvicePlus_5822_NOVA @NTB_AdvicePlus_5822_Positive_TestCases_TestData_NOVA @5822 @NOVA @RS22111
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA Create test data for Positive Test Cases with single account

       # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * def ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

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

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

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
      | TestID                                                           | ARRV_DT | CUST_OPND_DT | ACCT_ODT |
#      | "5822_NOVA_LANG_CD_eq_fr"                                    | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_CUST_AGE_eq_18"                                   | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_CUST_OPND_DT_eq_120"                              | "NULL"    | "120"        | "55"     |
#      | "5822_NOVA_ARRV_DT_eq_1825_days"                             | "1825"      | "90"         | "55"     |
#      | "5822_NOVA_DO_NOT_SOLICIT_F_eq_NULL"                         | "45"      | "90"         | "55"     |
#      | "5822_NOVA_NOT_AML_KYC_eq_NULL"                              | "45"      | "90"         | "55"     |
#      | "5822_NOVA_ACCT_ODT_eq_50"                                   | "45"      | "90"         | "50"     |
#      | "5822_NOVA_ACCT_ODT_eq_51"                                   | "45"      | "90"         | "51"     |
#      | "5822_NOVA_ACCT_ODT_eq_59"                                   | "45"      | "90"         | "59"     |
#      | "5822_NOVA_ACCT_ODT_eq_60"                                   | "45"      | "90"         | "60"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CreditCards"                 | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_HighInterestSavingsAccounts" | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CashTermDeposit"             | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_CashDemandDeposit"           | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_UnsecuredLending"            | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_PROD_HIER_LEVEL_3_eq_SecureLinesOfCredit"         | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_MCB_IND_ne_Y"                                     | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_MCB_IND_eq_NULL"                                  | "NULL"    | "90"         | "55"     |
#      | "5822_NOVA_ARRV_DT_gt_1825_days"                             | "1826"    | "90"         | "55"     |
#      | "5822_NOVA_ARRV_DT_gt_1826_days" | "1827"    | "90"         | "55"     |
#      | "5822_NOVA_ARRV_DT_eq_NULL"                                  | "NULL"    | "90"         | "55"     |
      | "5822_NOVA_Seg_05_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" | "NULL"    | "90"         | "55"     |
      | "5822_NOVA_Seg_06_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" | "45"      | "90"         | "55"     |

  @NTB_AdvicePlus_5822_NOVA @NTB_AdvicePlus_5822_Negative_TestCases_TestData_NOVA @5822 @NOVA @RS22111
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA Create test data for Negative Test Cases with single account

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * def ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

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

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

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
      | TestID | Arrive_Dt | CUST_OPND_DT | ACCT_ODT |
#      | "N_5822_NOVA_DECEASED_F_eq_Y"                 | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_DECEASED_F_eq_Null"              | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_CUST_TP_CD_ne_PSNL"              | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_PRIM_CNTRY_CD_ne_CA"             | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_PRIM_CNTRY_CD_eq_NULL"           | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_CUST_AGE_lt_18"                  | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_CUST_AGE_eq_NULL"                | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_LANG_CD_eq_bn"                   | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_Lang_CD_eq_NULL"                 | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_NOT_AML_KYC_eq_Y"                | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_CUST_OPND_DT_gt_120_days"        | "NULL"    | "121"        | "55"     |
#      | "N_5822_NOVA_CUST_OPND_DT_eq_NULL"            | "NULL"    | "NULL"       | "55"     |
#      | "N_5822_NOVA_ASSIGNED_FA_TRANSIT_ne_NULL"     | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_MAPP_TMRRW_LAST_SESS_DT_ne_NULL" | "NULL"    | "90"         | "55"     |
#      | "N_5822_NOVA_ACCT_ODT_eq_49"                  | "45"      | "90"         | "49"     |
#      | "N_5822_NOVA_ACCT_ODT_eq_81"                  | "45"      | "90"         | "81"     |
#      | "N_5822_NOVA_ACCT_ODT_eq_NULL"                | "45"      | "90"         | "NULL"   |

  @NTB_AdvicePlus_5822_NOVA_multiple_Account_Negative_Positive_Scenarios_TestData @5822 @NOVA @RS22111
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA_TestData Create test data<TestID> for multiple account for Negative and  positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * def ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", ACCT_ODT1

    # Generating account number 2 account
    * def accountNumber2 = '0000000000000'+randGen(10)
    * print "2nd account number is " + accountNumber2

      # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_SL> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_SL>)
    * print "Account ODT2 is", acct_odt2

    # Defining TestID for the loop
    * def TEST = testId+'_Account_2'

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber  | ACCT_ODT  |
      | <TestID> | accountNumber  | acct_odt1 |
      | TEST     | accountNumber2 | acct_odt2 |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') mult_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts


    Examples:
      | TestID | ARRV_DT | CUST_OPND_DT | ACCT_ODT | Acct_Odt_SL |
#      | "5822_NOVA_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"   | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL" | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"   | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"     | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_ne_09_ACCT_ODT_lt_180days_AFIL"   | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_NULL_ACCT_ODT_lt_180days_AFIL" | "NULL"    | "90"         | "55"     | "100"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_gt_180days_AFIL"   | "NULL"    | "90"         | "55"     | "181"       |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_NULL_AFIL"      | "NULL"    | "90"         | "55"     | "NULL"      |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL" | "NULL"    | "90"         | "55"     | "179"       |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_180days_AFIL" | "NULL"    | "90"         | "55"     | "180"       |


  @NTB_AdvicePlus_5822_NOVA_multiple_3_Account_Negative_Positive_Scenarios_TestData @5822 @NOVA @RS22111
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA_TestData Create test data<TestID> for multiple 3 account for Negative and  positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTB_AdvicePlus_NOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * def ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

    # Generating account number to insert into database
    * def accountNumber1 = '00000000'+CID
    * print "account number is " + accountNumber1

    # Generating account number 2 account
    * def accountNumber2 = '0000000000000'+randGen(10)
    * print "2nd account number is " + accountNumber2

    # Generating account number 3 account
    * def accountNumber3 = '0000000000001'+randGen(10)
    * print "3rd account number is " + accountNumber3

      # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", ACCT_ODT1

    # Defining TestID for the loop
    * def TEST1 = testId+'_Account_2'

    # Defining TestID for the loop
    * def TEST2 = testId+'_Account_3'

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber  | ACCT_ODT  |
      | <TestID> | accountNumber1 | acct_odt1 |
      | TEST1    | accountNumber2 | "NULL"    |
      | TEST2    | accountNumber3 | "NULL"    |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') mult_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts


    Examples:
      | TestID | ARRV_DT | CUST_OPND_DT | ACCT_ODT |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_ne_Y_Lending_Investing_Loans"    | "45"      | "90"         | "55"     |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_ne_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"    | "45"      | "90"         | "55"     |
#      | "5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL_Lending_Investing_Loans" | "45"      | "90"         | "55"     |
#      | "N_5822_NOVA_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"  | "45"      | "90"         | "55"     |
