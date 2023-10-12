@D2DXSell_AS400_5747_TestData_Creation
Feature: Create test data for D2DXSell- 5747 AS400 test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DXSell_AS400_Sanity_5747_TestData @5747 @AS400 @RS22054 @Sanity
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created MARRIAGE_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')

     # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                            | MORT_FNDNG_DT | MARRIAGE_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | CUST_OPND_DT | ACCT_ODT |
      | "5747_AS400_BASE_01_NewMO"                                        | 30            | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_03_MPSA_Bal_gt_30K"                              | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                | "NULL"        | "15"        | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
##Added for MArch 30th 2023 release
      | "5747_AS400_BASE_09_Trig_2"                                       | "NULL"        | "NULL"      | "NULL"            | 30                | 100          | 100      |
      | "5747_AS400_BASE_08_Trig_2"                                       | "NULL"        | "NULL"      | 30                | "NULL"            | 20           | 30       |

 #############Mar2023 Release data creation start except Base#####################

  @D2DXSell_AS400_Single_Account_Noinsight_with_Date_Mar2023_Positive_Negative_Scenarios_TestData @5747 @AS400 @RS22054 @D2D_Mar2023
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData <TestID> Create test data for single account No insight positive and negative scenarios for Mar2023 release

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                                       | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
#      | "5747_AS400_Seg_09_Trig_17"                                                                 | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_3_Trig_17_ACCT_ODT_gt_60"                                                   | "NULL"       | 60                | 60                | 61       |
#      | "5747_AS400_Seg_08_Trig_2_CUST_OPND_DT_lt_60"                                               | 59           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXP_SRC_SYS_SUB_PRD_CD_eq_PC"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_AXS_SRC_SYS_SUB_PRD_CD_eq_SC"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_ZZ"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_SS"                   | 45           | 60                | 60                | 50       |
#      | "5747_AS400_Seg_08_Trig_2_ACCT_ODT_lt_60"                                                   | 45           | 60                | 60                | 59       |
#      | "5747_AS400_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_lt_90_MOB_LAST_LOGIN_DT_eq_NULL"                | 45           | 89                | "NULL"            | 50       |
#      | "5747_AS400_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_lt_90"                | 45           | "NULL"            | 89                | 50       |
#      | "5747_AS400_Seg_09_Trig_2_CUST_OPND_DT_gt_90"                                               | 91           | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_CUST_OPND_DT_eq_90"                                               | 90           | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXP_SRC_SYS_SUB_PRD_CD_eq_PC"                   | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXS_SRC_SYS_SUB_PRD_CD_eq_SC"                   | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR"                   | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_ZZ"                   | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_SS"                   | 100          | 60                | 60                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_ACCT_ODT_gt_90"                                                   | 100          | 60                | 60                | 91       |
#      | "5747_AS400_Seg_09_Trig_2_ACCT_ODT_eq_90"                                                   | 100          | 60                | 60                | 90       |
#      | "5747_AS400_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_lt_90"                                          | 100          | 89                | "NULL"            | 100      |
#      | "5747_AS400_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_eq_90"                                          | 100          | 90                | "NULL"            | 100      |
#      | "5747_AS400_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_lt_90"                                          | 100          | "NULL"            | 89                | 100      |
#      | "5747_AS400_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_eq_90"                                          | 100          | "NULL"            | 90                | 100      |
#      | "5747_AS400_Seg_3_Trig_17_ACCT_ODT_eq_60"                                                   | "NULL"       | 60                | 60                | 60       |
#      | "5747_AS400_Seg_3_Trig_17_ACCT_ODT_lt_60"                                                   | "NULL"       | 60                | 60                | 59       |
#      | "N_5747_AS400_Seg_09_Trig_17_ACCT_SUBSYS_ID_ne_KS"                                          | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_17_ACCT_SUBSYS_ID_eq_NULL"                                        | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_17_SRC_ACCT_STAT_CD_ne_Open"                                      | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_17_SRC_ACCT_STAT_CD_eq_NULL"                                      | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_17_PROD_HIER_LEVEL_3_ne_Credit_Cards"                             | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_17_PROD_HIER_LEVEL_3_eq_NULL"                                     | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_08_Trig_2_CUST_OPND_DT_eq_60"                                             | 60           | 60                | 60                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_CUST_OPND_DT_gt_60"                                             | 61           | 60                | 60                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL"              | 45           | 60                | 60                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_ACCT_ODT_eq_60"                                                 | 45           | 60                | 60                | 60       |
#      | "N_5747_AS400_Seg_08_Trig_2_ACCT_ODT_gt_60"                                                 | 45           | 60                | 60                | 61       |
#      | "N_5747_AS400_Seg_08_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                  | 45           | 60                | 60                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                               | 45           | 60                | 60                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_gt_90"                                        | 45           | 91                | "NULL"            | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_MOB_LAST_LOGIN_DT_gt_90"                                        | 45           | "NULL"            | 91                | 50       |
#      | "N_5747_AS400_Seg_08_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"            | 45           | "NULL"            | "NULL"            | 50       |
#      | "N_5747_AS400_Seg_09_Trig_2_CUST_OPND_DT_lt_90"                                             | 89           | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_CUST_OPND_DT_eq_NULL"                                           | "NULL"       | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL"              | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_ACCT_ODT_lt_90"                                                 | 100          | 60                | 60                | 89       |
#      | "N_5747_AS400_Seg_09_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                  | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                               | 100          | 60                | 60                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_gt_90"                                        | 100          | 91                | "NULL"            | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_MOB_LAST_LOGIN_DT_gt_90"                                        | 100          | "NULL"            | 91                | 100      |
#      | "N_5747_AS400_Seg_09_Trig_2_SOL_LAST_LOGIN_DT_eq_NULL_MOB_LAST_LOGIN_DT_eq_NULL"            | 100          | "NULL"            | "NULL"            | 100      |
#Added for April 13th release
      | "5747_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | "NULL"       | "NULL"            | "NULL"            | 190      |
      | "5747_AS400_Acct_Subsys_id_ne_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | "NULL"       | "NULL"            | "NULL"            | 190      |
      | "5747_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_ne_Active_SRC_PRD_CD_eq_9_ACCT_ODT_gt_180" | "NULL"       | "NULL"            | "NULL"            | 200      |
      | "5747_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_ne_9_ACCT_ODT_gt_180" | "NULL"       | "NULL"            | "NULL"            | 181      |
      | "5747_AS400_DNS_eq_Y"                                                                        | "NULL"       | "NULL"            | "NULL"            | "NULL"   |

  @D2DXSell_AS400_Single_Account_ExternalTable_with_Date_Mar2023_Positive_Negative_Scenarios_TestData @5747 @AS400 @RS22054 @D2D_Mar2023
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData <TestID> Create test data for single account with External table positive and negative scenarios for Mar2023 release

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/as400/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')


    Examples:
      | TestID                                                        | VALID_START_DATE | VALID_END_DATE | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5747_AS400_Seg_08_Trig_18_VALID_START_DATE_lt_Curr_Dt"       | 1                | -5             | 45           | 60                | 60                | 50       |
      | "5747_AS400_Seg_09_Trig_18_VALID_START_DATE_eq_Curr_Dt"       | 0                | -5             | 100          | 60                | 60                | 100      |
      | "5747_AS400_Seg_3_Trig_18_VALID_END_DATE_gt_Curr_Dt"          | 5                | -1             | 70           | 60                | 60                | 70       |
      | "5747_AS400_Seg_3_Trig_18_VALID_END_DATE_eq_Curr_Dt"          | 5                | 0              | "NULL"       | 60                | 60                | "NULL"   |
      | "N_5747_AS400_Seg_08_Trig_18_VALID_START_DATE_gt_Curr_Dt"     | -1               | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_VALID_END_DATE_lt_Curr_Dt"       | 5                | 1              | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_CAMPAIGN_CODE_ne_RS22054"        | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_ne_CIE5747"   | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_eq_NULL"      | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_FLAG_ne_Y"    | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_AS400_CHANNEL_ne_Y"              | 5                | -5             | 45           | 60                | 60                | 50       |
      | "N_5747_AS400_Seg_08_Trig_18_AS400_CHANNEL_eq_NULL"           | 5                | -5             | 45           | 60                | 60                | 50       |

  #Positive Scenario for multiple triggers with multiple account 2 accounts for prioritization of creative
  @D2DXSell_AS400_multiple_triggers_prioritization_Positive_Negative_Scenarios_Mar2023_TestData @5747 @AS400 @RS22054 @D2DXsellMar2023
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for multiple triggers multiple two accounts for prioritization positive and Negative scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber1 = '00000000'+CID
    * print "account number1 is " + accountNumber1
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
        # Generating account2
    * def accountNumber2 = '0000000000000'+randGen(10)
    * print "Account Number 2 is " + accountNumber2
    # Defining TestID for the loop
    * def TEST = testId+'_Account_2'

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
   # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

       # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber  |
      | <TestID> | accountNumber1 |
      | TEST     | accountNumber2 |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
    # insert the created ACCT_ODT into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') mult_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                                                                    | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CLOSED"          | 100          | 60                | 60                | 100      |
      | "5747_AS400_Seg_09_Trig_2_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GS_CLOSED"          | 100          | 60                | 60                | 100      |
      | "N_5747_AS400_Seg_09_Trig_2_Has_AMEX_GOLD_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC" | 100          | 60                | 60                | 100      |


 #############Mar2023 Release data creation End except Base#####################

  @D2DXSell_AS400_Single_Account_Noinsight_No_Date_Positive_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for single account No insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

     # insert the created Marriage Date into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')

    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                                                                      | MORT_FNDNG_DT | MARRIAGE_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | CUST_OPND_DT | ACCT_ODT |
      | "5747_AS400_CUST_AGE_eq_18_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_2"                                                           | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_CUST_AGE_eq_65_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_3"                                                           | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_Not_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_4" | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_Active_BB_SRC_ACCT_STAT_CD_ne_A_PROD_HEIR_LEVEL_eq_Chequing Accounts_CUST_DIM_ENGAGEMENT_INDEX_eq_9"            | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_ne_Chequing Accounts_CUST_DIM_ENGAGEMENT_INDEX_gt_9"            | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"                     | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_Seg_05_Trig_9_CRNT_BAL_AMT_gt_30000"                                                                            | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |

  @D2DXSell_AS400_Single_Account_withinsight_No_Date_Positive_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for single account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                  |
      | "5747_AS400_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_1" |
      | "5747_AS400_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_2" |
      | "5747_AS400_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_3" |
      | "5747_AS400_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_eq_1"              |
      | "5747_AS400_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_gt_1"              |
      | "5747_AS400_Seg_03_or_04_Trig_16_CURR_VAL_eq_1"                         |


  @D2DXSell_AS400_Single_Account_No_insight_Positive_Scenarios_TestData_withDate_NoInsight @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_DateDependant_AS400_TestData Create test data for single account No insight positive scenarios for date dependant scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string MLS_DT = <MLS_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string GRADUATION_DT = <GRADUATION_DT>
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string CRD_RENEWAL_DT = <CRD_RENEWAL_DT>
    * string maturityDate = <MAT_DT> == 'NULL'? 'NULL': futureDateInDays(<MAT_DT>)
    * print "Mortgage renewal Date is", maturityDate
    * string ACCT_ODT = <ACCT_ODT>

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    #INSERT THE DATE FIELDS INTO THE CUST_DIM SHEET
    # insert the created MLS_ADDED_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MLS_ADDED_DT_Insertion_CUST_DIM_Sheet')
    # insert the created MARRIAGE_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created GRADUATION_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@GRADUATION_EVENT_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CUSTOMER RECORD into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')
  # insert the created Card Renewal Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CardRenewalDate_Insertion_ACCT_DIM_Sheet')

    # insert the created Mortgage Renewal Date aka maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Record into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                               | CRD_RENEWAL_DT | ACCT_ODT | MORT_FNDNG_DT | MAT_DT | MLS_DT | MARRIAGE_DT | GRADUATION_DT |
      | "5747_AS400_CUST_DIM.MLS_ADDED_AT_DT_eq_30"                                                          | "NULL"         | "NULL"   | "NULL"        | "NULL" | 30     | "NULL"      | "NULL"        |
      | "5747_AS400_CUST_DIM.MLS_ADDED_AT_DT_lt_30"                                                          | "NULL"         | "NULL"   | "NULL"        | "NULL" | 29     | "NULL"      | "NULL"        |
      | "5747_AS400_CUST_DIM.MLS_ADDED_AT_DT_eq_1"                                                           | "NULL"         | "NULL"   | "NULL"        | "NULL" | 1      | "NULL"      | "NULL"        |
      | "5747_AS400_CUST_DIM.MLS_ADDED_AT_DT_eq_0"                                                           | "NULL"         | "NULL"   | "NULL"        | "NULL" | 0      | "NULL"      | "NULL"        |
      | "5747_AS400_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_30"                                                   | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | 30          | "NULL"        |
      | "5747_AS400_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_lt_30"                                                   | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | 29          | "NULL"        |
      | "5747_AS400_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_1"                                                    | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | 1           | "NULL"        |
      | "5747_AS400_CUST_DIM.MARRIAGE_LIFE_EVENT_DT_eq_0"                                                    | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | 0           | "NULL"        |
      | "5747_AS400_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_30"                                                 | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | 30            |
      | "5747_AS400_CUST_DIM.GRADUATION_LIFE_EVENT_DT_lt_30"                                                 | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | 29            |
      | "5747_AS400_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_1"                                                  | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | 1             |
      | "5747_AS400_CUST_DIM.GRADUATION_LIFE_EVENT_DT_eq_0"                                                  | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | 0             |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_eq_30"             | 30             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GS_CRD_RENEWAL_DT_gt_30"             | 40             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_eq_90"             | 90             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR_CRD_RENEWAL_DT_lt_90"             | 50             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_gt_30"             | 70             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VLR_SRC_SYS_SUB_PRD_CD_eq_RG_CRD_RENEWAL_DT_lt_90"             | 80             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_30"                                          | "NULL"         | 30       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                          | "NULL"         | 40       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_60"                                          | "NULL"         | 60       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_lt_60"                                          | "NULL"         | 50       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL" | "NULL"         | "NULL"   | 22            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_21_IP_AR_RELATN_TYPE_CD_eq_BOR" | "NULL"         | "NULL"   | 21            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_SOL" | "NULL"         | "NULL"   | 59            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_60_IP_AR_RELATN_TYPE_CD_eq_BOR" | "NULL"         | "NULL"   | 60            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_COB" | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_COB" | "NULL"         | "NULL"   | 56            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_SOL"       | "NULL"         | "NULL"   | "NULL"        | 271    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_270_IP_AR_RELATN_TYPE_CD_eq_BOR"       | "NULL"         | "NULL"   | "NULL"        | 270    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_lt_300_IP_AR_RELATN_TYPE_CD_eq_SOL"       | "NULL"         | "NULL"   | "NULL"        | 299    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_300_IP_AR_RELATN_TYPE_CD_eq_BOR"       | "NULL"         | "NULL"   | "NULL"        | 300    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_COB"       | "NULL"         | "NULL"   | "NULL"        | 280    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_lt_300_IP_AR_RELATN_TYPE_CD_eq_COB"       | "NULL"         | "NULL"   | "NULL"        | 290    | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_MULT_TRIG_NEWMORTGAGE_Highly Engaged_MarriageLifeEvent"                                  | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | 10          | "NULL"        |
      | "5747_AS400_CREATIVE_PRIORITIZE_NEWMORTGAGE_NOMPSA"                                                  | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Trig_15_ACCT_ODT_eq_50 days"                                                             | "NULL"         | 50       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Trig_15_ACCT_ODT_eq_60 days"                                                             | "NULL"         | 60       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Trig_15_ACCT_ODT_gt_50 days"                                                             | "NULL"         | 51       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Trig_15_ACCT_ODT_lt_60 days"                                                             | "NULL"         | 58       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |
      | "5747_AS400_Trig_15_Single_MPSA"                                                                     | "NULL"         | 55       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        |

  #Positive Scenario for multiple triggers with multiple insights
  @D2DXSell_AS400_multiple_triggers_multiple_insights_Positive_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for multiple triggers multiple insight positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

   # Used table keyword to iterate for any BDD line
    * table mult_insights
      | testId                                                                            | CID |
      | "5747_AS400_MULT_TRIG_DECILE_D2D_RESPONSE_PROPENSITY_CNT_PAGEVISIT_D2D"           | CID |
      | "5747_AS400_MULT_TRIG_DECILE_D2D_RESPONSE_PROPENSITY_CNT_PAGEVISIT_D2D_INSIGHT_1" | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') mult_insights

    Examples:
      | TestID                                                                  |
      | "5747_AS400_MULT_TRIG_DECILE_D2D_RESPONSE_PROPENSITY_CNT_PAGEVISIT_D2D" |


  #Positive Scenario for multiple triggers with multiple account 2 accounts for prioritization of creative
  @D2DXSell_AS400_multiple_triggers_prioritization_Positive_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for multiple triggers multiple two accounts for prioritization positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
        # Generating MPSA account
    * def MPSAaccountNumber = '0000000000'+'600'+randGen(10)
    * print "MPSA account number is " + MPSAaccountNumber
    # Defining TestID for the loop
    * def TEST = testId+'_acct_one'

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

       # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber     |
      | <TestID> | accountNumber     |
      | TEST     | MPSAaccountNumber |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                                   | MORT_FNDNG_DT |
      | "5747_AS400_CREATIVE_PRIORITIZE_NEWMORTGAGE_MPSA_gt_30K" | 30            |
      | "5747_AS400_CREATIVE_PRIORITIZE_NEWMORTGAGE_MPSA_lt_30K" | 30            |

  #Scenario for creation 3 accounts UO,UF and KS for prioritization of segment
  @D2DXSell_AS400_3_Accounts_Positive_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for 3 accounts single insight positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating UF account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating KS account
    * def KSaccountNumber = '0000000'+'1'+CID
    * print "KS account number is " + KSaccountNumber

    # Generating UO account
    * def UOaccountNumber = '0000000000'+'600'+randGen(10)
    * print "UO account number is " + UOaccountNumber
    # Defining TestID for the loop for UO Acct
    * def TESTUO = testId+'_acct_one'
    # Defining TestID for the loop for KS Acct
    * def TESTKS = testId+'_acct_two'
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string CRD_RENEWAL_DT = <CRD_RENEWAL_DT>
    * string GRADUATION_DT = <GRADUATION_DT>
    * string maturityDate = <MAT_DT> == 'NULL'? 'NULL': futureDateInDays(<MAT_DT>)
    * print "Mortgage renewal Date is", maturityDate
    * string ACCT_ODT = <ACCT_ODT>
    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created GRADUATION_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@GRADUATION_EVENT_DT_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table three_accounts
      | testId   | accountNumber   |
      | <TestID> | accountNumber   |
      | TESTUO   | UOaccountNumber |
      | TESTKS   | KSaccountNumber |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') three_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') three_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') three_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') three_accounts

  # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * def testId = TESTUO
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')
  # insert the created Card Renewal Date into the ACCT_DIM sheet
    * def testId = TESTKS
    * call read('classpath:channels/as400/ReusableScenarios.feature@CardRenewalDate_Insertion_ACCT_DIM_Sheet')

    # insert the created Mortgage Renewal Date aka maturity date into the ACCT_DIM sheet
    * def testId = TESTUO
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert the created Account Open Date into the ACCT_DIM sheet
    * def testId = TESTKS
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') three_accounts

    Examples:
      | TestID                                                                                                | CRD_RENEWAL_DT | ACCT_ODT | MORT_FNDNG_DT | MAT_DT | GRADUATION_DT |
      | "5747_AS400_MULT_TRIG_NEWMORTGAGE_Clickstream_MPSAbalanceover15K_NewCreditCard"                       | "NULL"         | 30       | 40            | "NULL" | "NULL"        |
      | "5747_AS400_MULT_TRIG_Graduation_Clickstream_MPSAbalancebelow15K_CardRenewal_UpcomingMortgageRenewal" | 30             | "NULL"   | "NULL"        | 280    | 20            |


   #Negative Test data creation

  @D2DXSell_AS400_Single_Account_NoDate_No_Insight_Negative_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for single account no insight with no date depandancy Negative scenarios

   # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID |
#      | "N-5747_AS400_DECEASED_F_eq_Y"                                                                               |
#      | "N-5747_AS400_DECEASED_F_eq_NULL"                                                                            |
#      | "N-5747_AS400_CUST_TP_CD_ne_PSNL"                                                                            |
#      | "N-5747_AS400_LANG_CD_eq_K"                                                                                  |
#      | "N-5747_AS400_LANG_CD_eq_NULL"                                                                               |
#      | "N-5747_AS400_PRIM_CNTRY_CD_eq_NULL"                                                                         |
#      | "N-5747_AS400_PRIM_CNTRY_CD_ne_CA"                                                                           |
#      | "N-5747_AS400_MKTBL_eq_N"                                                                                    |
#      | "N-5747_AS400_MKTBL_eq_NULL"                                                                                 |
#      | "N-5747_AS400_NOT_AML_KYC_eq_Y"                                                                              |
#      | "N-5747_AS400_ITRADE_MCLEOD_F_eq_Y"                                                                          |
#      | "N-5747_AS400_EMPLOYEE_STAFF_F_eq_Y"                                                                         |
#      | "N-5747_AS400_HAS_CLOSED_CHQ_F_eq_Y"                                                                         |
#      | "N_5747_AS400_CUST_AGE_gt_65"                                                                                |
#      | "N_5747_AS400_CUST_AGE_lt_18"                                                                                |
#      | "N_5747_AS400_CUST_AGE_eq_NULL"                                                                              |
#      | "N_5747_AS400_Active_BB_SRC_ACCT_STAT_CD_eq_A_PROD_HEIR_LEVEL_eq_Chequing Accounts"                          |
#      | "N_5747_AS400_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_ne_1_2_3_4"                                                   |
#      | "N_5747_AS400_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_NULL"                                                      |
#      | "N_5747_AS400_CUST_DIM_ENGAGEMENT_INDEX_lt_9"                                                                |
#      | "N_5747_AS400_CUST_DIM_ENGAGEMENT_INDEX_eq_NULL"                                                             |
#      | "N_5747_AS400_CUST_DIM.PHYSICIANS_F_eq_ Y"                                                                   |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_ne_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"    |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_30000"  |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_ne_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_gt_30000" |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_gt_30000"   |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_ne_BSAMP_CRNT_BAL_AMT_lt_30000"    |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_NULL_CRNT_BAL_AMT_lt_30000"     |
#      | "N_5747_AS400_ACCT_SUBSYS_ID_eq_UF_SRC_ACCT_STAT_CD_Active_SRC_SYS_PRD_CD_eq_BSAMP_CRNT_BAL_AMT_eq_NULL"     |
#      | "N_5747_AS400_Seg_06_Trig_9_CRNT_BAL_AMT_eq_30000"                                                           |
#      | "N_5747_AS400_Seg_06_Trig_9_CRNT_BAL_AMT_lt_30000"                                                           |
#      | "N_5747_AS400_Seg_06_Trig_9_CRNT_BAL_AMT_eq_NULL"                                                            |
#      | "N_5747_AS400_Trig_15_ACCT_ODT_eq_NULL"                                                                      |
#      | "N_5747_AS400_Trig_15_ACCT_ODT_eq_49 days"                                                                   |
#      | "N_5747_AS400_Trig_15_ACCT_ODT_eq_61 days"                                                                   |


  @D2DXSell_AS400_Single_Account_NoDate_with_Insight_Negative_Scenarios_TestData @5747 @AS400 @RS22054 @deepd2das400_TestLoad
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for single account with insight with no date depandancy Negative scenarios

   # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                               |
#      | "N_5747_AS400_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_ne_1_2_3" |
#      | "N_5747_AS400_INSIGHT_CD_eq_DECILE_D2D_RESPONSE_PROPENSITY_CURR_VAL_eq_NULL"  |
#      | "N_5747_AS400_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_eq_NULL"               |
#      | "N_5747_AS400_INSIGHT_CD_eq_CNT_PAGEVISIT_D2D_CURR_VAL_lt_1"                  |
      | "N_5747_AS400_Seg_03_or_04_Trig_16_CURR_VAL_eq_0"    |
      | "N_5747_AS400_Seg_03_or_04_Trig_16_CURR_VAL_eq_NULL" |



      #Negative scenario for single accounts single insight
  @D2DXSell_AS400_with_date_Negative_Scenarios_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for date dependant negative scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string MLS_DT = <MLS_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string GRADUATION_DT = <GRADUATION_DT>
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string CRD_RENEWAL_DT = <CRD_RENEWAL_DT>
    * string maturityDate = <MAT_DT> == 'NULL'? 'NULL': futureDateInDays(<MAT_DT>)
    * print "Mortgage renewal Date is", maturityDate
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    #INSERT THE DATE FIELDS INTO THE CUST_DIM SHEET
    # insert the created MLS_ADDED_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MLS_ADDED_DT_Insertion_CUST_DIM_Sheet')
    # insert the created MARRIAGE_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created GRADUATION_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@GRADUATION_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CUSTOMER RECORD into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')
  # insert the created Card Renewal Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CardRenewalDate_Insertion_ACCT_DIM_Sheet')

    # insert the created Mortgage Renewal Date aka maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Record into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')



    Examples:

      | TestID                                                                                         | CRD_RENEWAL_DT | ACCT_ODT | MORT_FNDNG_DT | MAT_DT | MLS_DT | MARRIAGE_DT | GRADUATION_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | CUST_OPND_DT |
#      | "N_5747_AS400_Current date - CUST_DIM.MLS_ADDED_AT_DT_gt_30"                                                      | "NULL"         | "NULL"   | "NULL"        | "NULL" | 40     | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Current date - CUST_DIM.MLS_ADDED_AT_DT_eq_NULL"                                                    | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Current date - CUST_DIM.MARRIAGE_LIFE_EVENT_DT _gt_30"                                              | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | 40          | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Current date - CUST_DIM.MARRIAGE_LIFE_EVENT_DT _eq_NULL"                                            | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Current date - CUST_DIM.GRADUATION_LIFE_EVENT_DT _gt_30"                                            | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | 40            | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Current date - CUST_DIM.GRADUATION_LIFE_EVENT_DT _eq_NULL"                                          | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_lt_30"                        | 20             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_NULL_KS_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_gt_30"                 | 40             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VCL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_gt_90"                        | 100            | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_DM_CRD_RENEWAL_DT_lt_90"                       | 70             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_not_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TR_CRD_RENEWAL_DT_lt_90"                    | 60             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_NULL_CRD_RENEWAL_DT_lt_90"                      | 40             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_NOT_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_gt_30"                    | 50             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_eq_NULL"                      | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VBB_SRC_SYS_SUB_PRD_CD_eq_TS_CRD_RENEWAL_DT_lt_90"                        | 70             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_SRC_SYS_PRD_CD_eq_VFF_SRC_SYS_SUB_PRD_CD_eq_DD_CRD_RENEWAL_DT_lt_90"                        | 80             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_ACCT_SUBSYS_ID_eq_NULL_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC_CRD_RENEWAL_DT_gt_30"    | 40             | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Close_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                                    | "NULL"         | 40       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_eq_NULL_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                           | "NULL"         | 35       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_BS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                                     | "NULL"         | 40       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_ACCT_SUBSYS_ID_eq_NULL_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_30"                                 | "NULL"         | 50       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_PROD_HIER_LEVEL_3_ne_CC_ACCT_ODT_lt_60"                                                     | "NULL"         | 45       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_NULL_ACCT_ODT_lt_60"                                                   | "NULL"         | 50       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_eq_NULL"                                                   | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_lt_30"                                                     | "NULL"         | 25       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Open_KS_PROD_HIER_LEVEL_3_eq_CC_ACCT_ODT_gt_60"                                                     | "NULL"         | 70       | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_NOTActive_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"         | "NULL"         | "NULL"   | 25            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_ne_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"            | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_eq_NULL_IP_AR_RELATN_TYPE_CD_eq_SOL"          | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_eq_NULL_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"    | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_NULL_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_SOL"                   | "NULL"         | "NULL"   | 40            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_eq_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_NULL" | "NULL"         | "NULL"   | 23            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_nonResidential_MORT_FNDNG_DT_gt_21_IP_AR_RELATN_TYPE_CD_eq_BOR"         | "NULL"         | "NULL"   | 25            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_21_IP_AR_RELATN_TYPE_CD_eq_BOR"            | "NULL"         | "NULL"   | 10            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_lt_60_IP_AR_RELATN_TYPE_CD_eq_NOB"            | "NULL"         | "NULL"   | 50            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MORT_FNDNG_DT_gt_60_IP_AR_RELATN_TYPE_CD_eq_BOR"            | "NULL"         | "NULL"   | 70            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_NOTActive_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_SOL"               | "NULL"         | "NULL"   | "NULL"        | 280    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_ne_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_SOL"                  | "NULL"         | "NULL"   | "NULL"        | 285    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_eq_NULL_IP_AR_RELATN_TYPE_CD_eq_SOL"                 | "NULL"         | "NULL"   | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_eq_NULL_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_SOL"          | "NULL"         | "NULL"   | "NULL"        | 290    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_NULL_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_SOL"                         | "NULL"         | "NULL"   | "NULL"        | 280    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_STATUS_eq_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_NULL"       | "NULL"         | "NULL"   | "NULL"        | 275    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_nonResidential_MAT_DT_gt_270_IP_AR_RELATN_TYPE_CD_eq_BOR"               | "NULL"         | "NULL"   | "NULL"        | 275    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_lt_270_IP_AR_RELATN_TYPE_CD_eq_BOR"                  | "NULL"         | "NULL"   | "NULL"        | 260    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_lt_300_IP_AR_RELATN_TYPE_CD_eq_NOB"                  | "NULL"         | "NULL"   | "NULL"        | 290    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_Active_UO_MORT_COMM_TYPE_eq_Residential_MAT_DT_gt_300_IP_AR_RELATN_TYPE_CD_eq_BOR"                  | "NULL"         | "NULL"   | "NULL"        | 320    | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#      | "N_5747_AS400_MULT_TRIG_NEWMORTGAGE_Physician_Flag"                                                               | "NULL"         | "NULL"   | 30            | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
#Added for April 13th release
      | "N_5747_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_lt_180" | "NULL"         | 179      | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |
      | "N_5747_AS400_Acct_Subsys_id_eq_SL_SRC_ACCT_STAT_CD_eq_Active_SRC_PRD_CD_eq_9_ACCT_ODT_eq_180" | "NULL"         | 180      | "NULL"        | "NULL" | "NULL" | "NULL"      | "NULL"        | "NULL"            | "NULL"            | "NULL"       |


  @D2DXSell_AS400_Dispositions_CrossChannel_5747_TestData @5747 @AS400 @RS22054
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for disposition and cross channel scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                                              |
      | "5747_Perform Accept Disposition and offer should not display when Lead scope - ALL"                |
      | "5747_Perform Accept Disposition and offer should not display when Lead scope - ACT"                |
      | "5747_Perform Accept Disposition and offer should not display when Lead scope - DEC"                |
      | "5747_Perform Decline Disposition and offer should not display when Lead scope - ALL"               |
      | "5747_Perform Decline Disposition and offer should not display when Lead scope - ACT"               |
      | "5747_Perform Decline Disposition and offer should not display when Lead scope - DEC"               |
      | "5747_Perform Refer to other team Disposition and offer should display  when Lead scope - ALL"      |
      | "5747_Perform Refer to other team Disposition and offer should not display when Lead scope - DEC"   |
      | "5747_Perform Refer to other team Disposition and offer should display when Lead scope - ACT"       |
      | "5747_Perform Refer to Sales Disposition and offer should display when Lead scope - ALL"            |
      | "5747_Perform Refer to Sales Disposition and offer should display when Lead scope - ACT"            |
      | "5747_Perform Refer to Sales Disposition and offer should not display when Lead scope - DEC"        |
      | "5747_Perform Book appointment Disposition and offer should not display when Lead scope - ALL"      |
      | "5747_Perform Book appointment Disposition and offer should not display when Lead scope - ACT"      |
      | "5747_Perform Book appointment Disposition and offer should not display when Lead scope - DEC"      |
      | "5747_Perform Customer Self Service Disposition and offer should not display when Lead scope - ALL" |
      | "5747_Perform Customer Self Service Disposition and offer should not display when Lead scope - ACT" |
      | "5747_Perform Customer Self Service Disposition and offer should not display when Lead scope - DEC" |
      | "5747_Perform Customer Defer Disposition and offer should display when Lead scope - ALL"            |
      | "5747_Perform Customer Defer Disposition and offer should display when Lead scope - ACT"            |
      | "5747_Perform Customer Defer Disposition and offer should not display when Lead scope - DEC"        |
      | "5747_Perform Accept Disposition in AS400 and offer should not display in MOB"                      |
      | "5747_Perform Decline Disposition in AS400 and offer should not display in MOB"                     |
      | "5747_Perform Refer to other team Disposition in AS400 and offer should display in MOB"             |
      | "5747_Perform Refer to Sales Disposition in AS400 and offer should display in MOB"                  |
      | "5747_Perform Book appointment Disposition in AS400 and offer should display in MOB"                |
      | "5747_Perform Customer Self Service Disposition in AS400 and offer should display in MOB"           |
      | "5747_Perform Customer Defer Disposition in AS400 and offer should display in MOB"                  |

  @D2DXSell_AS400_Single_Account_No_insight_Positive_Multiple_Scenarios_TestData_Acct_ODT_CurrentBalAmount_Trig16 @5747 @NOVA @deepd2das400_TestLoad
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for Trigger 16 with Acct_Odt and Currnt Bal amount multiple scenarioes

  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = D2DXSellAS400TestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
  # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt1 = <Acct_Odt1> == 'NULL'? 'NULL': dateFormat(<Acct_Odt1>)
    * print "First Account ODT is", Acct_Odt1
  # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt2 = <Acct_Odt2> == 'NULL'? 'NULL': dateFormat(<Acct_Odt2>)
    * print "Second Account ODT is", Acct_Odt2

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    * table examples
      | testId                | accountNumber | acct_odt  |
      | <TestID>              | acct_num1     | acct_odt1 |
      | <TestID>+'_Account_2' | acct_num2     | acct_odt2 |
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
      | TestID                         | Acct_Odt1 | Acct_Odt2 |
      | "5747_AS400_Trig_15_Dual_MPSA" | "40"      | "55"      |