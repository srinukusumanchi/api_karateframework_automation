@CIMCAMP-418 @PositiveAndNegative_TestData_6001
Feature: Create test data for ULOC CLI - 6001 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6001 @6001 @NOVA @RS23043
  Scenario Outline: ULOC CLI - Base_RS23043_6001_NOVA Create test data for validating base line IH field values
    * def testDataFileName = ULOCCLINovaTestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                       | Ofr_st | Ofr_End |
      | "6001_NOVA_BASE_Creative_01" | "10"   | "40"    |
      | "6001_NOVA_BASE_Creative_02" | "10"   | "40"    |

  @ULOCCLI @ULOCCLI_Positive_Validation_TestData_6001 @6001 @NOVA @RS23043
  Scenario Outline: ULOC CLI - Positive_RS23043_6001_NOVA Create test data for validating positive response values
    * def testDataFileName = ULOCCLINovaTestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                                                    | Ofr_st | Ofr_End |
      | "6001_NOVA_Creative_1_CUST_AGE_eq_18"                     | "10"   | "40"    |
      | "6001_NOVA_Creative_1_LANG_CD_eq_fr"                      | "10"   | "40"    |
      | "6001_NOVA_Creative_2_CC_VIP_IND_eq_NULL"                 | "10"   | "40"    |
      | "6001_NOVA_Creative_1_Curr_Dt_eq_CLI_OFR_ST_DT"           | "0"    | "40"    |
      | "6001_NOVA_Creative_2_Curr_Dt_gt_CLI_OFR_ST_DT"           | "10"   | "40"    |
      | "6001_NOVA_Creative_1_CLI_APRVD_CR_LMT_gt_CR_CRD_LMT_AMT" | "10"   | "40"    |

  @ULOCCLI @ULOCCLI_Positive_Validation_TestData_6001_multipleaccounts @6001 @NOVA @RS23043
  Scenario Outline: ULOC CLI - Positive_RS23043_6001_NOVA Create test data for validating multiple priotization positive response values
    * def testDataFileName = ULOCCLINovaTestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)
    * string offerStartDate2 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)
    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)
    * string offerExpiryDate2 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def acct_num3 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | "NULL"           | offerStartDate2 | offerExpiryDate2 |
      | <TestID>+'_Account_3' | acct_num3     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                                                                                               | Ofr_st | Ofr_End |
      | "6001_NOVA_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Same_Product"      | "10"   | "40"    |
      | "6001_NOVA_Creative_1_Multiple_KS_Accounts_Prioritize_with_Highest_Approved_Limit_Different_Product" | "10"   | "40"    |



  @ULOCCLI @ULOCCLI_Negative_Validation_TestData_6001 @6001 @NOVA @RS23043 @may_test_gd
  Scenario Outline: ULOC CLI - Negative_RS23043_6001_NOVA Create test data for validating negative response values
    * def testDataFileName = ULOCCLINovaTestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)
    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                                                                                                        | Ofr_st | Ofr_End |
      | "N-6001_NOVA_Creative_1_CUST_AGE_lt_18"                                                                       | "10"   | "40"    |
      | "N-6001_NOVA_Creative_1_CUST_AGE_eq_NULL"                                                                     | "10"   | "40"    |
      | "N-6001_NOVA_Creative_1_DECEASED_ne_N"                                                                        | "10"   | "40"    |
      | "N-6001_NOVA_Creative_1_DECEASED_eq_NULL"                                                                     | "10"   | "40"    |
      | "N-6001_NOVA_Creative_1_LANG_CD_ne_fr"                                                                        | "10"   | "40"    |
      | "N-6001_NOVA_Creative_1_LANG_CD_eq_NULL"                                                                      | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_CUST_TP_CD_ne_PSNL"                                                                   | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_PRIM_CNTRY_CD _ne_CA"                                                                 | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_PRIM_CNTRY_CD _eq_NULL"                                                               | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_CC_VIP_IND_eq_2"                                                                      | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_CC_VIP_IND_eq_9"                                                                      | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_MRKTBLE_F_ne_Y"                                                                       | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_MRKTBLE_F_ne_NULL"                                                                    | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_INDV_FRST_NM_eq_NULL"                                                                 | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_INDV_LAST_NM_eq_NULL"                                                                 | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_ne_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE"   | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_ne_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE"   | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_ne_SCL_SRC_SYS_SUB_PRD_CD_eq_INE"   | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_ne_INE"   | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_NULL_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE" | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_NULL_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_INE"   | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_NULL_SRC_SYS_SUB_PRD_CD_eq_INE"  | "10"   | "40"    |
      | "N-6001_NOVA_ACCT_SUBSYS_ID_eq_KS_SRC_ACCT_STAT_CD_eq_Open_SRC_SYS_PRD_CD_eq_SCL_SRC_SYS_SUB_PRD_CD_eq_NULL"  | "10"   | "40"    |
      | "N-6001_NOVA_CLI_OFR_F_ne_Z"                                                                                  | "10"   | "40"    |
      | "N-6001_NOVA_CLI_OFR_F_eq_NULL"                                                                               | "10"   | "40"    |
      | "N-6001_NOVA_CLI_OFR_CRNT_F_ne_Y"                                                                             | "10"   | "40"    |
      | "N-6001_NOVA_CLI_OFR_CRNT_F_eq_NULL"                                                                          | "10"   | "40"    |
      | "N-6001_NOVA_Curr_Dt_lt_CLI_OFR_ST_DT"                                                                        | "-3"   | "40"    |
      | "N-6001_NOVA_Curr_Dt_gt_CLI_OFR_EXP_DT"                                                                       | "10"   | "-10"   |
      | "N-6001_NOVA_CLI_OFR_ST_DT_eq_NULL"                                                                           | "NULL" | "40"    |
      | "N-6001_NOVA_CLI_OFR_EXP_DT_eq_NULL"                                                                          | "10"   | "NULL"  |
      | "N-6001_NOVA_CLI_APRVD_CR_LMT_lt_CR_CRD_LMT_AMT"                                                              | "10"   | "40"    |
      | "N-6001_NOVA_CLI_APRVD_CR_LMT_eq_CR_CRD_LMT_AMT"                                                              | "10"   | "40"    |
      | "N-6001_NOVA_CLI_APRVD_CR_LMT_eq_NULL"                                                                        | "10"   | "40"    |
      | "N-6001_NOVA_CC_SCNRY_CUST_ID_NOT_Null"                                                                       | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                                                        | "10"   | "40"    |
      | "N-6001_NOVA_Creative_2_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                                                     | "10"   | "40"    |

