@SOL_Welcome_5821_IH_Positive_Negative_TestData
Feature: Create test data for D2D Engagement-Welcome-5821 SOL Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementWelcome_SOL @D2DEngagement_Welcome_BASE_5821_IH_Validation_TestData_SOL @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement-Welcome_RS17103_5821_SOL Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                            | Acct_Odt | COD  |
      | "5821_ISSUE_Engagement_Group_D2D" | "2"      | "33" |

  @D2DEnagagement-Welcome_Positive_TestCases_TestData_SOL @D2DEngagement_Welcome_Positive_5821_TestCases_TestData_SOL @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement-Welcome_RS17103_5821_SOL Create test data for Positive Test Cases with single account

     # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                        | Acct_Odt | COD   |
      | "5821_SOL_LANG_CD_eq_fr"                                                      | "10"     | "20"  |
      | "5821_SOL_CUST_AGE_eq_16"                                                     | "11"     | "20"  |
      | "5821_SOL_DO_NOT_SOLICIT_F_eq_NULL"                                           | "12"     | "20"  |
      | "5821_SOL_NOT_AML_KYC_eq_NULL"                                                | "10"     | "20"  |
      | "5821_SOL_CUST_OPND_DT_eq_120_days"                                           | "10"     | "120" |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_01" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_02" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_03" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_04" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_01" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_02" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_02_SRC_SYS_SUB_PRD_CD_eq_03" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_01" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_02" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_03" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_04" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_07" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_19_SRC_SYS_SUB_PRD_CD_eq_08" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_01" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_03" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_07" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_13_SRC_SYS_SUB_PRD_CD_eq_08" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_11" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_12" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_01" | "12"     | "20"  |
      | "5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_23_SRC_SYS_SUB_PRD_CD_eq_03" | "12"     | "20"  |
      | "5821_SOL_4332_5821_Prioritization"                                          | "12"     | "20"  |
      | "5821_SOL_4334_5821_Prioritization"                                          | "12"     | "20"  |


  @D2DEngagement-Welcome_SOL @D2DEngagement_Welcome_5821_Negative_TestCases_TestData_SOL @5821 @SOL @RS17103
  Scenario Outline: D2D Engagement-Welcome_RS17103_5821_SOL Create test data for Negative Test Cases with single account

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2D_Welcome_NTB_DataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                            | Acct_Odt | COD    |
      | "N_5821_SOL_DECEASED_F_eq_Y"                                                      | "10"     | "20"   |
      | "N_5821_SOL_DECEASED_F_eq_NULL"                                                   | "10"     | "20"   |
      | "N_5821_SOL_CUST_TP_CD_ne_PSNL"                                                   | "10"     | "20"   |
      | "N_5821_SOL_CUST_TP_CD_ne_NULL"                                                   | "10"     | "20"   |
      | "N_5821_SOL_PRIM_CNTRY_CD_ne_CA"                                                  | "10"     | "20"   |
      | "N_5821_SOL_PRIM_CNTRY_CD_eq_NULL"                                                | "10"     | "20"   |
      | "N_5821_SOL_DO_NOT_SOLICIT_F_eq_Y"                                                | "10"     | "20"   |
      | "N_5821_SOL_NOT_AML_KYC_eq_Y"                                                     | "10"     | "20"   |
      | "N_5821_SOL_CUST_AGE_lt_16"                                                       | "10"     | "20"   |
      | "N_5821_SOL_CUST_AGE_eq_NULL"                                                     | "10"     | "20"   |
      | "N_5821_SOL_LANG_CD_eq_bn"                                                        | "10"     | "20"   |
      | "N_5821_SOL_Lang_CD_eq_NULL"                                                      | "10"     | "20"   |
      | "N_5821_SOL_CUST_OPND_DT_gt_120_days"                                             | "10"     | "121"  |
      | "N_5821_SOL_CUST_OPND_DT_eq_NULL"                                                 | "10"     | "NULL" |
      | "N_5821_SOL_ACCT_SUBSYS_ID_ne_BB"                                                 | "10"     | "20"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_NULL"                                               | "10"     | "20"   |
      | "N_5821_SOL_SRC_ACCT_STAT_CD_ne_A"                                                | "10"     | "20"   |
      | "N_5821_SOL_SRC_ACCT_STAT_CD_eq_NULL"                                             | "10"     | "20"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_07"   | "10"     | "20"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_01_SRC_SYS_SUB_PRD_CD_eq_NULL" | "10"     | "20"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_07_SRC_SYS_SUB_PRD_CD_eq_02"   | "10"     | "20"   |
      | "N_5821_SOL_ACCT_SUBSYS_ID_eq_BB_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_02" | "10"     | "20"   |
      | "N_5821_SOL_ACCT_ODT_eq_NULL"                                                     | "NULL"   | "20"   |