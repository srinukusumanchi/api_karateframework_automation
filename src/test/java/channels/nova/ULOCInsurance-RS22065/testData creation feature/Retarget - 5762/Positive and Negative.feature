@PositiveAndNegative_TestData_5762
Feature: Create test data for ULOC Insurance-5762 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @ULOCInsurance @ULOCInsurance_IH_5762_TestData @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Create test data for validating IH field values
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
     # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
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
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                     |ACCT_ODT| Event_Date |
      | "5762_NOVA_BASE_01_Seg_01" | "120"    | "1"        |


  @ULOCInsurance @ULOCInsurance_Positive_TestCases_5762_TestData  @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Create test data for Positive Test Cases
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
     # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
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
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                            |ACCT_ODT| Event_Date |
      | "5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL_EMPLOYEE_STAFF_F_eq_NULL"                              | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CUST_AGE_eq_22"                                                                 | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CUST_AGE_eq_60"                                                                 | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RG_INS_STATUS_DESC_eq_Wavied"       | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_LifeOnly"     | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_CS_INS_STATUS_DESC_eq_Disability"   | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE_INS_STATUS_DESC_eq_DisAndLife"  | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RS_INS_STATUS_DESC_eq_DisJL"        | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_RL_INS_STATUS_DESC_eq_DisLifeAndCI" | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_SP_INS_STATUS_DESC_eq_LifeAndCI"    | "120"    | "1"        |
      | "5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_SSL_SRC_SYS_SUB_PRD_CD_eq_LI_INS_STATUS_DESC_eq_LifeDisAndJL" | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_1dot2_x_CR_CRD_LMT_AMT"                                         | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_0"                                                              | "120"    | "1"        |
      | "5762_NOVA_Seg_01_ACCT_ODT_eq_50"                                                                 | "50"     | "1"        |
      | "5762_NOVA_Seg_01_ACCT_ODT_gt_50"                                                                 | "51"     | "1"        |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_500"                                                          | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_lt_50000"                                                        | "120"    | "1"        |
      | "5762_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_50000"                                                        | "120"    | "1"        |

  @ULOCInsurance @ULOCInsurance_Negative_TestCases_5762_TestData @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA  Create test data for Negative Test Cases
    * def testDataFileName = ULOCINSNovaTestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
     # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
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
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                 |ACCT_ODT| Event_Date |
      | "N_5762_NOVA_Seg_01_DECEASED_F_ne_N"                                   | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_DECEASED_F_eq_NULL"                                | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CUST_TP_CD_ne_PSNL"                                | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_PRIM_CNTRY_CD_ne_CA"                               | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_PRIM_CNTRY_CD_eq_NULL"                             | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_MRKTBLE_F_ne_Y"                                    | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_MRKTBLE_F_eq_NULL"                                 | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_LANG_CD_eq_Y"                                      | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_LANG_CD_eq_NULL"                                   | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_Y"                             | "120"    | "1"        |
#      | "N_5762_NOVA_Seg_01_DO_NOT_SOLICIT_F_eq_NULL"                          | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_17"                                    | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_65"                                    | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CUST_AGE_eq_NULL"                                  | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_EMPLOYEE_STAFF_F_eq_Y"                             | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_ACCT_SUBSYS_ID_ne_KS"                              | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_ACCT_SUBSYS_ID_eq_NULL"                            | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_GC"    | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_VIC_SRC_SYS_SUB_PRD_CD_eq_NULL"  | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_RG"   | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_NULL" | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_ACCT_STAT_CD_ne_Open"                          | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_SRC_ACCT_STAT_CD_eq_NULL"                          | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_lt_0"                                 | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_eq_NULL"                              | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CRNT_BAL_AMT_gt_1dot2_x_CR_CRD_LMT_AMT"            | "120"    | "1"        |
#      | "N_5762_NOVA_Seg_01_CREDIT_ARREARS_DAYS_gt_60"                         | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                     | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                  | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_INS_STATUS_DESC_Invalid"                           | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_INS_STATUS_DESC_eq_NULL"                           | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CR_CRD_LMT_AMT_gt_50000"                           | "120"    | "1"        |
      | "N_5762_NOVA_Seg_01_CR_CRD_LMT_AMT_eq_NULL"                            | "120"    | "1"        |
      | "N_5762_NOVA_ACCT_ODT_lt_50"                                           | "20"     | "1"        |
      | "N_5762_NOVA_ACCT_ODT_eq_NULL"                                         | "NULL"   | "1"        |
      | "N_5762_NOVA_NoInsight"                                                | "120"    | "NULL"     |
      | "N_5762_NOVA_INSIGHT_CD_ne_FLG_LOC_INS_ABANDON_APP"                    | "120"    | "1"        |
      | "N_5762_NOVA_CURR_VAL_ne_1"                                            | "120"    | "1"        |
      | "N_5762_NOVA_CURR_VAL_eq_null"                                         | "120"    | "1"        |
      | "N_5762_NOVA_EVENT_DT_eq_null"                                         | "120"    | "NULL"     |
      | "N_5762_NOVA_EVENT_DT_gt_30"                                           | "120"    | "40"       |

  @ULOCInsurance @ULOCInsurance_Prioritization_8_Acct_TestCases_5762_TestData @5762 @NOVA @RS22065
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Create test data<TestID> for  prioritization 4 accountPositive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ULOCINSNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

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

     # Generating KS account5
    * def KSaccountNumber5 = '0000000'+ CID + '5'
    * print "KS account number five is " + KSaccountNumber5

    # Generating KS account6
    * def KSaccountNumber6 = '0000000'+ CID + '6'
    * print "KS Acocunt NUmber six is " + KSaccountNumber6

    # Generating KS account7
    * def KSaccountNumber7 = '0000000'+ CID + '7'
    * print "KS Acocunt NUmber seven is " + KSaccountNumber7

    # Generating KS account8
    * def KSaccountNumber8 = '0000000'+ CID + '8'
    * print "KS Acocunt NUmber eight is " + KSaccountNumber8

    # Defining TestID for the loop for KS Account 2
    * def TESTacctTwo = testId+'_Account_2'

      # Defining TestID for the loop for KS Account 3
    * def TESTacctThree = testId+'_Account_3'

      # Defining TestID for the loop for KS Account 4
    * def TESTacctFour = testId+'_Account_4'

    # Defining TestID for the loop for KS Account 2
    * def TESTacctFive = testId+'_Account_5'

      # Defining TestID for the loop for KS Account 3
    * def TESTacctSix = testId+'_Account_6'

      # Defining TestID for the loop for KS Account 4
    * def TESTacctSeven = testId+'_Account_7'

     # Defining TestID for the loop for KS Account 4
    * def TESTacctEight = testId+'_Account_8'

    * string ACCT_ODT = <ACCT_ODT>
    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table eight_accounts
      | testId        | accountNumber    |
      | <TestID>      | KSaccountNumber  |
      | TESTacctTwo   | KSaccountNumber2 |
      | TESTacctThree | KSaccountNumber3 |
      | TESTacctFour  | KSaccountNumber4 |
      | TESTacctFive  | KSaccountNumber5 |
      | TESTacctSix   | KSaccountNumber6 |
      | TESTacctSeven | KSaccountNumber7 |
      | TESTacctEight | KSaccountNumber8 |



  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') eight_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') eight_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') eight_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') eight_accounts

   # insert the created Account Open Date into the ACCT_DIM sheet

    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') eight_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') eight_accounts

    Examples:
      | TestID                     |ACCT_ODT| Event_Date |
      | "5762_NOVA_prioritization" | "120"    | "1"        |


