@D2DXSell_Nova_6037_Top1_TestData_Creation
Feature: Create test data for D2DXSell Top1 Offer - 6037 Nova test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DXSell_NOVA_Sanity_6037_Top1_TestData @6037 @NOVA @RS22054 @Sanity
  Scenario Outline: D2DXSell_RS22054_6037_NOVA_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellTop1NovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format

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
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                              |
      | "6037_NOVA_BASE_01_NoMPSA"          |
      | "6037_NOVA_BASE_02_MPSA_Bal_lt_30K" |


  @D2DXSell_NOVA_positive_Negative_6037_TestData @6037 @NOVA @RS22054
  Scenario Outline: D2DXSell_RS22054_6037_Top1_NOVA_TestData <TestID> Create test data for single account No insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellTop1NovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>

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

    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                                         | ACCT_ODT |
      | "6037_NOVA_CUST_AGE_eq_18"                                                                     | "NULL"   |
      | "6037_NOVA_CUST_AGE_eq_65"                                                                     | "NULL"   |
      | "6037_NOVA_Not_Active_BB_PROD_HEIR_LEVEL_eq_Chequing Accounts"                                 | "NULL"   |
      | "6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"               | "NULL"   |
      | "6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing Accounts"               | "NULL"   |
      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180"   | "190"    |
      | "6037_NOVA_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180"   | "190"    |
      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180"   | "190"    |
      | "6037_NOVA_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180"   | "190"    |
      | "6037_NOVA_DNS_eq_Y"                                                                           | "NULL"   |
      | "6037_NOVA_BASE_02_MPSA_Bal_eq_30K"                                                            | "NULL"   |
#      | "N-6037_NOVA_DECEASED_F_eq_Y"                                                                  | "NULL"   |
#      | "N-6037_NOVA_DECEASED_F_eq_NULL"                                                               | "NULL"   |
#      | "N-6037_NOVA_CUST_TP_CD_ne_PSNL"                                                               | "NULL"   |
#      | "N-6037_NOVA_LANG_CD_eq_K"                                                                     | "NULL"   |
#      | "N-6037_NOVA_LANG_CD_eq_NULL"                                                                  | "NULL"   |
#      | "N-6037_NOVA_PRIM_CNTRY_CD_eq_NULL"                                                            | "NULL"   |
#      | "N-6037_NOVA_PRIM_CNTRY_CD_ne_CA"                                                              | "NULL"   |
#      | "N-6037_NOVA_MKTBL_eq_N"                                                                       | "NULL"   |
#      | "N-6037_NOVA_MKTBL_eq_NULL"                                                                    | "NULL"   |
#      | "N-6037_NOVA_NOT_AML_KYC_eq_Y"                                                                 | "NULL"   |
#      | "N-6037_NOVA_ITRADE_MCLEOD_F_eq_Y"                                                             | "NULL"   |
#      | "N-6037_NOVA_EMPLOYEE_STAFF_F_eq_Y"                                                            | "NULL"   |
#      | "N-6037_NOVA_HAS_CLOSED_CHQ_F_eq_Y"                                                            | "NULL"   |
#      | "N_6037_NOVA_CUST_AGE_gt_65"                                                                   | "NULL"   |
#      | "N_6037_NOVA_CUST_AGE_lt_18"                                                                   | "NULL"   |
#      | "N_6037_NOVA_CUST_AGE_eq_NULL"                                                                 | "NULL"   |
#      | "N_6037_NOVA_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"             | "NULL"   |
#      | "N_6037_NOVA_Acct_Subsys_id _eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" | "179"    |
#      | "N_6037_NOVA_Acct_Subsys_id _eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" | "180"    |

  @D2DXSell_NOVA_Single_Account_ExternalTable_Top1_Positive_Scenarios_TestData @6037 @NOVA @RS22054
  Scenario Outline: D2DXSell_RS22054_6037_Top1_NOVA_TestData <TestID> Create test data for single account with External table positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellTop1NovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
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


    Examples:
      | TestID                                  | VALID_START_DATE | VALID_END_DATE |
      | "6037_NOVA_VALID_START_DATE_gt_Curr_Dt" | -5               | -10             |
      | "6037_NOVA_VALID_END_DATE_lt_Curr_Dt"   | 20               | 10             |