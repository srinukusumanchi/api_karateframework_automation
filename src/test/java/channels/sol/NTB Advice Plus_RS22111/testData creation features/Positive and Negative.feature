@RS22111_NTBAdvicePlus @5822 @PositiveAndNegative_TestData_5822
Feature: Create test data for NTB Advice Plus - 5822 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTBAdvicePlus @NTBAdvicePlus_IH_Validation_TestData @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating IH field values
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

      # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", acct_odt

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID             | COD  | ACCT_ODT | Arrive_Dt |
      | "5822_SOL_BASE_01" | "45" | "60"     | "100"     |

  @NTBAdvicePlus @NTBAdvicePlus_TestData_Positive @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating Positive Scenarioes
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

      # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", acct_odt

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                          | COD  | ACCT_ODT | Arrive_Dt |
#      | "5822_SOL_LANG_CD_eq_fr"                                    | "45"  | "60"     | "100"     |
#      | "5822_SOL_CUST_AGE_eq_18"                                   | "45"  | "60"     | "100"     |
#      | "5822_SOL_CUST_OPND_DT_eq_120"                              | "120" | "60"     | "100"     |
      | "5822_SOL_ARRV_DT_eq_1825_days" | "45" | "60"     | "1825"    |
#      | "5822_SOL_DO_NOT_SOLICIT_F_eq_NULL"                         | "45"  | "60"     | "100"     |
#      | "5822_SOL_NOT_AML_KYC_eq_NULL"                              | "45"  | "60"     | "100"     |
#      | "5822_SOL_ACCT_ODT_eq_50"                                   | "45"  | "50"     | "100"     |
#      | "5822_SOL_ACCT_ODT_eq_51"                                   | "45"  | "51"     | "100"     |
#      | "5822_SOL_ACCT_ODT_eq_79"                                   | "45"  | "79"     | "100"     |
#      | "5822_SOL_ACCT_ODT_eq_80"                                   | "45"  | "80"     | "100"     |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_HighInterestSavingsAccounts" | "45"  | "60"     | "100"     |
#      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CashDemandDeposit"           | "45"  | "60"     | "100"     |

  @NTBAdvicePlus @NTBAdvicePlus_TestData_Negative @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating Negative Scenarioes
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account numberis " + accountNumber

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

      # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", acct_odt

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                        | COD  | ACCT_ODT | Arrive_Dt |
#      | "N_5822_SOL_DECEASED_F_eq_Y"                 | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_DECEASED_F_eq_Null"              | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_CUST_TP_CD_ne_PSNL"              | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_PRIM_CNTRY_CD_ne_CA"             | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_PRIM_CNTRY_CD_eq_NULL"           | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_CUST_AGE_lt_18"                  | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_CUST_AGE_eq_NULL"                | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_LANG_CD_eq_bn"                   | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_Lang_CD_eq_NULL"                 | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_NOT_AML_KYC_eq_Y"                | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_CUST_OPND_DT_gt_120_days"        | "121"  | "60"     | "100"     |
#      | "N_5822_SOL_CUST_OPND_DT_eq_NULL"            | "NULL" | "60"     | "100"     |
#      | "N_5822_SOL_ASSIGNED_FA_TRANSIT_ne_NULL"     | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_MAPP_TMRRW_LAST_SESS_DT_ne_NULL" | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_ACCT_ODT_eq_49"                  | "45"   | "49"     | "100"     |
#      | "N_5822_SOL_ACCT_ODT_eq_81"                  | "45"   | "81"     | "100"     |
#      | "N_5822_SOL_ACCT_ODT_eq_NULL"                | "45"   | "NULL"   | "100"     |
#      | "N_5822_SOL_MCB_IND_ne_Y"                    | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_MCB_IND_eq_NULL"                 | "45"   | "60"     | "100"     |
#      | "N_5822_SOL_ARRV_DT_gt_1825_days"            | "45"   | "60"     | "1826"    |
#      | "N_5822_SOL_ARRV_DT_gt_1826_days"            | "45"   | "60"     | "1827"    |
#      | "N_5822_SOL_ARRV_DT_eq_NULL"                 | "45"   | "60"     | "NULL"    |
#      | "N_5822_SOL_ACCT_SUBSYS_ID_ne_BB"            | "45"   | "60"     | "100"     |
      | "N_5822_SOL_ACCT_SUBSYS_ID_BB_PROD_CD_eq_07_SUBPROD_CD_eq_11" | "45" | "60"     | "1825"    |
      | "N_5822_SOL_ACCT_SUBSYS_ID_BB_PROD_CD_eq_07_SUBPROD_CD_eq_12" | "45" | "60"     | "1825"    |


  @NTBAdvicePlus @NTBAdvicePlus_TestData_2_MultipleAccounts_Pos_Neg @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating 2 Multiple Account Positive Negative Scenarioes
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database

    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num1

    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

    # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_1>)
    * print "Account ODT is", acct_odt1

     # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_2>)
    * print "Account ODT is", acct_odt2

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

     # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT |
      | <TestID> | acct_num1     | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the Database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                     | COD  | Acct_Odt_1 | Arrive_Dt | Acct_Odt_2 |
      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CreditCards"                                                                | "45" | "60"       | "100"     | "60"       |
      | "5822_SOL_PROD_HIER_LEVEL_3_eq_CashTermDeposit"                                                            | "45" | "60"       | "100"     | "60"       |
      | "5822_SOL_PROD_HIER_LEVEL_3_eq_UnsecuredLending"                                                           | "45" | "60"       | "100"     | "60"       |
      | "5822_SOL_PROD_HIER_LEVEL_3_eq_SecureLinesOfCredit"                                                        | "45" | "60"       | "100"     | "60"       |
      | "5822_SOL_ACCT_SUBSYS_ID_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"   | "45" | "60"       | "100"     | "179"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL" | "45" | "60"       | "100"     | "120"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"   | "45" | "60"       | "100"     | "179"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL"     | "45" | "60"       | "100"     | "179"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_ne_09_ACCT_ODT_lt_180days_AFIL"   | "45" | "60"       | "100"     | "179"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_NULL_ACCT_ODT_lt_180days_AFIL" | "45" | "60"       | "100"     | "179"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_gt_180days_AFIL"   | "45" | "60"       | "100"     | "181"      |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_NULL_AFIL"      | "45" | "60"       | "100"     | "NULL"     |
      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_lt_180days_AFIL" | "45" | "60"       | "100"     | "179"      |
      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_SYS_PRD_CD_eq_09_ACCT_ODT_eq_180days_AFIL" | "45" | "60"       | "100"     | "180"      |

  @NTBAdvicePlus @NTBAdvicePlus_TestData_3_MultipleAccounts_Pos_Neg @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating 3 Multiple Account Positive Negative Scenarioes
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number3 is " + acct_num3

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

    # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_1>)
    * print "Account ODT is", acct_odt1

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_2>)
    * print "Account ODT is", acct_odt2

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt3 = <Acct_Odt_3> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_3>)
    * print "Account ODT is", acct_odt3

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
   # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 3 Test ID is '+Acc3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT |
      | <TestID> | accountNumber | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |
      | Acc3     | acct_num3     | acct_odt3 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the Database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                         | COD  | Acct_Odt_1 | Arrive_Dt | Acct_Odt_2 | Acct_Odt_3 |
      | "5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_D2D_HISA_UL_SRC_ACCT_STAT_CD_ne_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"   | "45" | "60"       | "100"     | "60"       | "60"       |
      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_DD_HISA_SLC_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans" | "45" | "60"       | "100"     | "60"       | "60"       |
      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CDD_SLC_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans"  | "45" | "60"       | "100"     | "60"       | "60"       |


  @NTBAdvicePlus @NTBAdvicePlus_TestData_4_MultipleAccounts_Pos_Neg @5822 @SOL @RS22111
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating 4 Multiple Account Positive Negative Scenarioes
    * def testDataFileName = NTBAdvicePlustestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number3 is " + acct_num3
    * def acct_num4 = '00000000'+randGen(15)
    * print "Account Number4 is " + acct_num4

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

    # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt_1> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_1>)
    * print "Account ODT is", acct_odt1

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt_2> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_2>)
    * print "Account ODT is", acct_odt2

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt3 = <Acct_Odt_3> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_3>)
    * print "Account ODT is", acct_odt3

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt4 = <Acct_Odt_4> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt_4>)
    * print "Account ODT is", acct_odt4

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 3 Test ID is '+Acc3

    * def Acc4 = <TestID>+'_Account_4'
    * print 'Account 4 Test ID is '+Acc4

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ACCT_ODT  |
      | <TestID> | accountNumber | acct_odt1 |
      | Acc2     | acct_num2     | acct_odt2 |
      | Acc3     | acct_num3     | acct_odt3 |
      | Acc4     | acct_num4     | acct_odt4 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the Database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                       | COD  | Acct_Odt_1 | Arrive_Dt | Acct_Odt_2 | Acct_Odt_3 | Acct_Odt_3 | Acct_Odt_4 |
      | "N_5822_SOL_ACCT_SUBSYS_ID_eq_KS_PROD_HIER_LEVEL_3_eq_CC_CTD_UL_SRC_ACCT_STAT_CD_eq_A_PRIMARY_ACCT_HOLDER_FLAG_eq_Y_Lending_Investing_Loans" | "45" | "60"       | "100"     | "60"       | "60"       | "60"       | "60"       |






