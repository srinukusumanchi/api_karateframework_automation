@PositiveAndNegative_TestData_5761
Feature: Create test data for ULOC Insurance-5761 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @ULOCInsurance @ULOCInsurance_IH_BASE_5761_TestData @5761 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Create test data for validating IH field values
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_nova_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                     | ACCT_ODT |
      | "5761_NOVA_BASE_01_Seg_01" | "120"    |
      | "5761_NOVA_BASE_02_Seg_02" | "120"    |
      | "5761_NOVA_BASE_03_Seg_03" | "20"     |


  @ULOCInsurance @ULOCInsurance_Positive_TestCases_5761_TestData  @5761 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Create test data for Positive Test Cases
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_nova_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                                                            | ACCT_ODT |
      | "5761_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL_EMPLOYEE_STAFF_F_eq_NULL"                              | "100"    |
      | "5761_NOVA_Seg_01_CUST_AGE_eq_18"                                                                 | "120"    |
      | "5761_NOVA_Seg_01_CUST_AGE_eq_64"                                                                 | "130"    |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RG_INS_STATUS_DESC_eq_Wavied"       | "140"    |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_LifeOnly"     | "30"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_CS_INS_STATUS_DESC_eq_Disability"   | "40"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE_INS_STATUS_DESC_eq_DisAndLife"  | "50"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_DisJL"        | "90"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL_INS_STATUS_DESC_eq_DisLifeAndCI" | "80"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_SP_INS_STATUS_DESC_eq_LifeAndCI"    | "70"     |
      | "5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_LI_INS_STATUS_DESC_eq_LifeDisAndJL" | "20"     |
      | "5761_NOVA_Seg_01_CRNT_BAL_AMT_eq_1dot2_x_CR_CRD_LMT_AMT"                                         | "89"     |
      | "5761_NOVA_Seg_01_CRNT_BAL_AMT_eq_0"                                                              | "120"    |
      | "5761_NOVA_Seg_01_CREDIT_ARREARS_DAYS_eq_60"                                                      | "102"    |
      | "5761_NOVA_Seg_01_CREDIT_ARREARS_DAYS_eq_NULL"                                                    | "600"    |
      | "5761_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_500"                                                          | "300"    |
      | "5761_NOVA_Seg_01_CR_CRD_LMT_AMT_lt_50000"                                                        | "360"    |
      | "5761_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_50000"                                                        | "45"     |

  @ULOCInsurance @ULOCInsurance_Negative_TestCases_5761_TestData @5761 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA  Create test data for Negative Test Cases
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                             | ACCT_ODT |
#      | "N_5761_NOVA_Seg_01_DECEASED_F_ne_N"                                   | "120"    |
#      | "N_5761_NOVA_Seg_01_DECEASED_F_eq_NULL"                                | "120"    |
#      | "N_5761_NOVA_Seg_01_CUST_TP_CD_ne_PSNL"                                | "120"    |
#      | "N_5761_NOVA_Seg_01_PRIM_CNTRY_CD_ne_CA"                               | "120"    |
#      | "N_5761_NOVA_Seg_01_PRIM_CNTRY_CD_eq_NULL"                             | "120"    |
#      | "N_5761_NOVA_Seg_01_MRKTBLE_F_ne_Y"                                    | "120"    |
#      | "N_5761_NOVA_Seg_01_MRKTBLE_F_eq_NULL"                                 | "120"    |
#      | "N_5761_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_Y"                             | "120"    |
#      | "N_5761_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL"                          | "120"    |
#      | "N_5761_NOVA_Seg_01_LANG_CD_eq_Y"                                      | "120"    |
#      | "N_5761_NOVA_Seg_01_LANG_CD_eq_NULL"                                   | "120"    |
#      | "N_5761_NOVA_Seg_01_CUST_AGE_eq_17"                                    | "120"    |
#      | "N_5761_NOVA_Seg_01_CUST_AGE_eq_65"                                    | "120"    |
#      | "N_5761_NOVA_Seg_01_CUST_AGE_eq_NULL"                                  | "120"    |
#      | "N_5761_NOVA_Seg_01_ACCT_SUBSYS_ID_ne_KS"                              | "120"    |
#      | "N_5761_NOVA_Seg_01_ACCT_SUBSYS_ID_eq_NULL"                            | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"    | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_NULL"  | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RG"   | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL" | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_ACCT_STAT_CD_ne_Open"                          | "120"    |
#      | "N_5761_NOVA_Seg_01_SRC_ACCT_STAT_CD_eq_NULL"                          | "120"    |
#      | "N_5761_NOVA_Seg_01_CRNT_BAL_AMT_lt_0"                                 | "120"    |
#      Removed as it's not a production scenario
#      | "N_5761_NOVA_Seg_01_CRNT_BAL_AMT_eq_NULL"                              | "120"    |
#      | "N_5761_NOVA_Seg_01_CRNT_BAL_AMT_gt_1dot2_x_CR_CRD_LMT_AMT"            | "120"    |
#      | "N_5761_NOVA_Seg_01_CREDIT_ARREARS_DAYS_gt_60"                         | "120"    |
#      | "N_5761_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                     | "120"    |
#      | "N_5761_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                  | "120"    |
#      | "N_5761_NOVA_Seg_01_INS_STATUS_DESC_Invalid"                           | "120"    |
#      | "N_5761_NOVA_Seg_01_INS_STATUS_DESC_eq_NULL"                           | "120"    |
#      | "N_5761_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_50000"                           | "120"    |
#      | "N_5761_NOVA_Seg_01_CR_CRD_LMT_AMT_lt_zero"                            | "120"    |
#      | "N_5761_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_NULL"                            | "120"    |
#      | "N_5761_NOVA_Seg_01_ACCT_ODT_eq_NULL"                                  | "NULL"   |
#      | "N_5761_NOVA_Seg_01_ACCT_ODT_gt_30_lt_70"                              | "50"     |
      | "N_5761_NOVA_Seg_01_ACCT_ODT_lt_0" | "-1"     |


  @ULOCInsurance @ULOCInsurance_Prioritization_4_Acct_TestCases_5761_TestData @5761 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Create test data<TestID> for  prioritization 4 accountPositive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ULOCINSNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating KS account
    * def KSaccountNumber = '0000000'+ CID + '1'
    * print "KS account number is " + KSaccountNumber

    # Generating KS account2
    * def KSaccountNumber2 = '0000000'+ CID + '2'
    * print "KS Acocunt NUmber two is " + KSaccountNumber2

    # Generating KS account3
    * def KSaccountNumber3 = '0000000'+ CID + '3'
    * print "KS Acocunt NUmber Three is " + KSaccountNumber3

    # Generating KS account4
    * def KSaccountNumber4 = '0000000'+ CID + '4'
    * print "KS Acocunt NUmber Four is " + KSaccountNumber4

    # Defining TestID for the loop for KS Account 2
    * def TESTacctTwo = testId+'_Account_2'

      # Defining TestID for the loop for KS Account 3
    * def TESTacctThree = testId+'_Account_3'

      # Defining TestID for the loop for KS Account 4
    * def TESTacctFour = testId+'_Account_4'

#    * string ACCT_ODT = <ACCT_ODT>
    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table four_accounts
      | testId        | accountNumber    |
      | <TestID>      | KSaccountNumber  |
      | TESTacctTwo   | KSaccountNumber2 |
      | TESTacctThree | KSaccountNumber3 |
      | TESTacctFour  | KSaccountNumber4 |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') four_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') four_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') four_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') four_accounts

#   # insert the created Account Open Date into the ACCT_DIM sheet
#
#    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') four_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') four_accounts

    Examples:
      | TestID                                   |
      | "5761_NOVA_Seg_02_1_2_3_4_Valid"         |
      | "5761_NOVA_Seg_02_1_Invalid_2_3_4_Valid" |


  @ULOCInsurance @ULOCInsurance_Prioritization_2_Acct_TestCases_5761_TestData @5761 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Create test data<TestID> for prioritization 2 account Positive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ULOCINSNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating KS account
    * def KSaccountNumber = '0000000'+ CID + '1'
    * print "KS account number is " + KSaccountNumber

    # Generating KS account2
    * def KSaccountNumber2 = '0000000'+ CID + '2'
    * print "KS Acocunt NUmber two is " + KSaccountNumber2

    # Defining TestID for the loop for KS Account 2
    * def TESTacctTwo = testId+'_Account_2'


#    * string ACCT_ODT = <ACCT_ODT>
    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table two_accounts
      | testId      | accountNumber    |
      | <TestID>    | KSaccountNumber  |
      | TESTacctTwo | KSaccountNumber2 |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') two_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') two_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') two_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') two_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') two_accounts

    Examples:
      | TestID                          |
      | "5761_NOVA_Seg_01_3_4_Valid"    |
      | "5761_NOVA_Seg_01_4_4_Valid"    |
      | "5761_NOVA_Seg_01_3_4_Diff_ODT" |
