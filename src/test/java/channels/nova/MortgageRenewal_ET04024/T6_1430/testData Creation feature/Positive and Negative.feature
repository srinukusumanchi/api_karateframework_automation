@ET04024 @NOVA

Feature: Create test data for NOVA - Mortgage Renewals Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_Positive_TestCases_TestData @MortgageRenewal_NOVA_GenericPositiveTestCases @T6 @1430 @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Positive Generic Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                                                        |
#      | "Primary Customer_NOVA_BANKRUPTCY_DT= NULL_SOL"                                                                               |
#      | "Primary Customer_NOVA_BANKRUPTCY_DT= NULL_BOR"                                                                               |
#      | "NOVA_CUST_TP_CD = PSNL"                                                                                                      |
#      | "SOL_LAST_LOGIN_DT = !NULL"                                                                                                   |
#      | "MOB_LAST_LOGIN_DT = !NULL"                                                                                                   |
#      | "NOVA_Deceased_F = N"                                                                                                         |
#      | "NOVA_LANG_CD = E"                                                                                                            |
#      | "NOVA_LANG_CD = EN"                                                                                                           |
#      | "NOVA_LANG_CD = F"                                                                                                            |
#      | "NOVA_LANG_CD = FR"                                                                                                           |
#      | "NOVA_LANG_CD_LowerCase = e"                                                                                                  |
#      | "NOVA_LANG_CD_LowerCase = en"                                                                                                 |
#      | "NOVA_LANG_CD_LowerCase = f"                                                                                                  |
#      | "NOVA_LANG_CD_LowerCase = fr"                                                                                                 |
#      | "NOVA_CR_RSK_IND != (D,E)"                                                                                                    |
#      | "NOVA_CR_RSK_IND = NULL"                                                                                                      |
#      | "NOVA_INDV_FRST_NM = !NULL"                                                                                                   |
#      | "NOVA_INDV_LAST_NM = !NULL"                                                                                                   |
#      | "NOVA_RENEW_LIMITED_F = 0"                                                                                                    |
#      | "NOVA_RENEW_LIMITED_F >2"                                                                                                     |
#      | "NOVA_CASHBACK_F  = N"                                                                                                        |
#      | "NOVA_CASHBACK_F  = NULL"                                                                                                     |
#      | "NOVA_MORT_NOT_FRCLSR_F = Y"                                                                                                  |
#      | "NOVA_MORT_NOT_FRCLSR_F = NULL"                                                                                               |
#      | "NOVA_SRC_SYS_PRD_CD != (911,931,951)"                                                                                        |
#      | "NOVA_INTEREST_RATE >0"                                                                                                       |
#      | "NOVA_MAT_DT - Current Date = 6"                                                                                              |
#      | "NOVA_MAT_DT - Current Date = 5"                                                                                              |
#      | "NOVA_MAT_DT - Current Date = 4"                                                                                              |
#      | "NOVA_MAT_DT - Current Date = 3"                                                                                              |
#      | "NOVA_MAT_DT - Current Date = 1"                                                                                              |
#      | "NOVA_AMORTIZATION_REMAIN = 26"                                                                                               |
#      | "NOVA_AMORTIZATION_REMAIN > 26"                                                                                               |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 2"                                                                                             |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 3"                                                                                             |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 4"                                                                                             |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 5"                                                                                             |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 6"                                                                                             |
#      | "NOVA_MORT_PB_TRANSIT_REGION = 7"                                                                                             |
#      | "NOVA_MORT_ARREARS_MONTHS < 0"                                                                                                |
#      | "NOVA_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN"                                                |
#      | "NOVA_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS <= 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS"                                 |
#      | "NOVA_MORT_FUND_CODE !=(1900, 1901, 1902, 1912, 1916, 1922, 1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600)" |
#      | "NOVA_TERM = Any Numeric"                                                                                                     |
#      | "NOVA_CRNT_BAL_AMT = 20000"                                                                                                   |
#      | "NOVA_CRNT_BAL_AMT > 20000"                                                                                                   |
      | "NOVA_SRC_ACCT_STAT_CD = Active"                                                                                              |
      | "NOVA_EDW_ACCT_STAT_CD = A"                                                                                                   |
      | "NOVA_SCD_NUM = 13 Digit Number"                                                                                              |
      | "NOVA_MORT_COMM_TYPE = Residential"                                                                                           |
      | "NOVA_ACCT_NUM = 23 Digit Numeric Value"                                                                                      |
      | "NOVA_IP_AR_RELATN_TYPE_CD = SOL"                                                                                             |
      | "NOVA_IP_AR_RELATN_TYPE_CD = BOR"                                                                                             |
      | "NOVA_ACCT_SUBSYS_ID = UO"                                                                                                    |
      | "NOVA_ACCT_SUBSYS_ID = AC"                                                                                                    |

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_Segmentation_Positive_TestCases_TestData @MortgageRenewal_NOVA_SegmentationPositiveTestCases @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Segmentation Positive Test Cases of T6 T5 T4 T3 T1

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
#    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                                |
      | "NOVA_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                          |
      | "NOVA_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                          |
      | "NOVA_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                               |
      | "NOVA_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                               |
      | "NOVA_T6_MOB_LAST_LOGIN_DT_Count <2"                                                                                          |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                          |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                          |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                               |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                               |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_Count <2"                                                                                          |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                        |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                        |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                             |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                             |
      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2"                                                                        |
      | "NOVA_T5_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                          |
      | "NOVA_T5_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                          |
      | "NOVA_T5_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                               |
      | "NOVA_T5_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                               |
      | "NOVA_T5_MOB_LAST_LOGIN_DT_Count <2"                                                                                          |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                          |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                          |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                               |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                               |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_Count <2"                                                                                          |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                        |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                        |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                             |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                             |
      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2"                                                                        |
      | "NOVA_T4_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                  |
      | "NOVA_T4_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                  |
      | "NOVA_T4_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                       |
      | "NOVA_T4_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                       |
      | "NOVA_T4_MOB_LAST_LOGIN_DT_Count <2"                                                                  |
      | "NOVA_T4_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                  |
      | "NOVA_T4_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                  |
      | "NOVA_T4_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                       |
      | "NOVA_T4_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                       |
      | "NOVA_T4_SOL_LAST_LOGIN_DT_Count <2"                                                                  |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                     |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                     |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2"                                                |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number" |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number" |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"      |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"      |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                 |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"                        |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26_ASSIGNED_FA_ID = 7digit Number" |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26_ASSIGNED_FA_ID = 7digit Number" |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000_ASSIGNED_FA_ID = 7digit Number"      |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000_ASSIGNED_FA_ID = 7digit Number"      |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2_ASSIGNED_FA_ID = 7digit Number"                 |

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_Negative_TestCases_TestData @MortgageRenewal_NOVA_GenericNegativeTestCases @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Negative Generic Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
#    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                 |
      | "N-Primary Customer_NOVA_BANKRUPTCY_DT!= NULL_SOL"                                     |
      | "N-Primary Customer_NOVA_BANKRUPTCY_DT!= NULL_BOR"                                     |
      | "N-NOVA_CUST_TP_CD != PSNL"                                                            |
      | "N-NOVA_CUST_TP_CD = NULL"                                                             |
      | "N-NOVA_Deceased_F = Y"                                                                |
      | "N-NOVA_Deceased_F = NULL"                                                             |
      | "N-NOVA_LANG_CD = K"                                                                   |
      | "N-NOVA_LANG_CD = NE"                                                                  |
      | "N-NOVA_LANG_CD = NULL"                                                                |
      | "N-NOVA_CR_RSK_IND = D"                                                                |
      | "N-NOVA_CR_RSK_IND = E"                                                                |
      | "N-NOVA_RENEW_LIMITED_F = 1"                                                           |
      | "N-NOVA_RENEW_LIMITED_F = 2"                                                           |
      | "N-NOVA_CASHBACK_F  = Y"                                                               |
      | "N-NOVA_MORT_NOT_FRCLSR_F = N"                                                         |
      | "N-NOVA_SRC_SYS_PRD_CD = 911"                                                          |
      | "N-NOVA_SRC_SYS_PRD_CD = 931"                                                          |
      | "N-NOVA_SRC_SYS_PRD_CD = 951"                                                          |
      | "N-NOVA_INTEREST_RATE = 0"                                                             |
      | "N-NOVA_INTEREST_RATE < 0"                                                             |
      | "N-NOVA_MAT_DT - Current Date != (6,5,4,3,1)"                                          |
      | "N-NOVA_AMORTIZATION_REMAIN < 26"                                                      |
      | "N-NOVA_MORT_PB_TRANSIT_REGION!= (2,3,4,5,6,7)"                                        |
      | "N-NOVA_MORT_ARREARS_MONTHS > 0"                                                       |
      | "N-NOVA_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL"                                     |
      | "N-NOVA_MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)"                         |
      | "N-NOVA_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088" |
      | "N-NOVA_SRC_ACCT_STAT_CD = NULL"                                                       |
      | "N-NOVA_SRC_ACCT_STAT_CD = OPEN"                                                       |
      | "N-NOVA_EDW_ACCT_STAT_CD = B"                                                          |
      | "N-NOVA_EDW_ACCT_STAT_CD = NULL"                                                       |
      | "N-NOVA_SCD_NUM = NULL"                                                                |
      | "N-NOVA_SCD_NUM = BLANK"                                                               |
      | "N-NOVA_MORT_COMM_TYPE != Residential"                                                 |
      | "N-NOVA_MORT_COMM_TYPE = NULL"                                                         |
      | "N-NOVA_IP_AR_RELATN_TYPE_CD = BLANK"                                                  |
      | "N-NOVA_IP_AR_RELATN_TYPE_CD = NULL"                                                   |
      | "N-NOVA_IP_AR_RELATN_TYPE_CD = Zero"                                                   |
      | "N-NOVA_ACCT_SUBSYS_ID != UO"                                                          |
      | "N-NOVA_ACCT_SUBSYS_ID != AC"                                                          |

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_Segmentation_Negative_TestCases_TestData @MortgageRenewal_NOVA_SegmentationNegativeTestCases @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Segmentation Negative Test Cases of T6 T5 T4 T3 T1

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                                         |
      | "N-NOVA_T6_SOL_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                         |
      | "N-NOVA_T6_SOL_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                        |
      | "N-NOVA_T6_SOL_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                   |
      | "N-NOVA_T6_SOL_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                        |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                         |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                        |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                   |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                        |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"       |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"      |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26" |
      | "N-NOVA_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"      |
      | "N-NOVA_T5_SOL_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                         |
      | "N-NOVA_T5_SOL_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                        |
      | "N-NOVA_T5_SOL_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                   |
      | "N-NOVA_T5_SOL_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                        |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                         |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                        |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                   |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                        |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"       |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"      |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26" |
      | "N-NOVA_T5_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"      |
#      | "N-NOVA_T4_SOL_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                                                          |
#      | "N-NOVA_T4_SOL_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                                                         |
#      | "N-NOVA_T4_SOL_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                                                    |
#      | "N-NOVA_T4_SOL_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                                                         |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                                                          |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                                                         |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                                                    |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                                                         |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA"                                        |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B"                                       |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26"                                  |
#      | "N-NOVA_T4_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000"                                       |
#      | "N-NOVA_T3_SOL_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"                         |
#      | "N-NOVA_T3_SOL_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T3_SOL_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric"                   |
#      | "N-NOVA_T3_SOL_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T3_SOL_MOB_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                                        |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"                         |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric"                   |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                                        |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"       |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"      |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric" |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"      |
#      | "N-NOVA_T3_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                      |
#      | "N-NOVA_T1_SOL_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"                         |
#      | "N-NOVA_T1_SOL_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T1_SOL_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric"                   |
#      | "N-NOVA_T1_SOL_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T1_SOL_MOB_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                                        |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"                         |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric"                   |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"                        |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                                        |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ACCT_SUBSYS_ID = CA_ASSIGNED_FA_ID = 7 digit Numeric"       |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_EDW_ACCT_STAT_CD = B_ASSIGNED_FA_ID = 7 digit Numeric"      |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN <  26_ASSIGNED_FA_ID = 7 digit Numeric" |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT < 20000_ASSIGNED_FA_ID = 7 digit Numeric"      |
#      | "N-NOVA_T1_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_ASSIGNED_FA_ID = NULL"                                      |

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_TwoCustomer_TestCases_TestData @MortgageRenewal_NOVA_TwoCustomer @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Two Negative Test Cases of T6 T5 T4 T3 T1

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet_2Customers')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

    # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId   | CID  |
      | <TestID> | CID1 |
      | secCust  | CID2 |

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID1
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc



    # Used table keyword to iterate for any BDD line
    * table acctDim
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') acctDim
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim


    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId   | CID  | accountNumber   |
      | <TestID> | CID1 | UOAccountNumber |
      | ACAcc    | CID1 | ACAccountNumber |
      | secCust  | CID2 | UOAccountNumber |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                                                 |
#      | "CoBorrower_NOVA_BANKRUPTCY_DT= NULL_COB"                                            |
#      | "CoBorrower_NOVA_BANKRUPTCY_DT= NULL_COS"                                            |
#      | "NOVA_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB As CoBorrower"              |
#      | "NOVA_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COS As CoBorrower"              |
#      | "NOVA_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower"              |
#      | "NOVA_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower"              |
#      | "CoBorrower_NOVA_Deceased_F = N for COB"                                             |
#      | "CoBorrower_NOVA_Deceased_F = N for COS"                                             |
#      | "NOVA_T6_MOB_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T6_SOL_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2"                                |
#      | "NOVA_T5_MOB_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T5_SOL_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2"                                |
#      | "NOVA_T4_MOB_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_Count=2"                                                  |
#      | "NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2"                                |
#      | "NOVA_T3_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number" |
#      | "NOVA_T1_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number"                   |
#      | "NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = 7digit Number" |
#      | "N_CoBorrower_NOVA_BANKRUPTCY_DT!= NULL_COB"                                           |
#      | "N_CoBorrower_NOVA_BANKRUPTCY_DT!= NULL_COS"                                           |
#      | "N_Secondary_Customer_BANKRUPTCY_DT = NULL And Primary_Customer_BANKRUPTCY_DT != NULL" |
#      | "N_CoBorrower_NOVA_Deceased_F = Y for COBorrower"                                      |
#      | "N_CoBorrower_NOVA_Deceased_F = Y for COS"                                             |
#      | "N-NOVA_T6_MOB_LAST_LOGIN_DT=NULL_Count=2"                                             |
#      | "N-NOVA_T6_SOL_LAST_LOGIN_DT=NULL_Count=2"                                             |
#      | "N-NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT=NULL_Count=2"                           |
#      | "N-NOVA_T5_MOB_LAST_LOGIN_DT=NULL_Count=2"                                             |
#      | "N-NOVA_T5_SOL_LAST_LOGIN_DT=NULL_Count=2"                                             |
#      | "N-NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT=NULL_Count=2"                           |
#      | "N-NOVA_T4_MOB_LAST_LOGIN_DT=NULL_Count=2"                                             |
      | "N-NOVA_T4_SOL_LAST_LOGIN_DT=NULL_Count=2"                                             |
      | "N-NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT=NULL_Count=2"                           |
      | "N-NOVA_T3_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"                            |
      | "N-NOVA_T3_SOL_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"                            |
      | "N-NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"          |
      | "N-NOVA_T1_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"                            |
      | "N-NOVA_T1_SOL_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"                            |
      | "N-NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2_ASSIGNED_FA_ID = NULL"          |

  @MortgageRenewalTestData_NOVA @MortgageRenewal_NOVA_ThreeCustomer_TestCases_TestData @MortgageRenewal_NOVA_ThreeCustomer @NOVA @ET04024
  Scenario Outline: Mortgage Renewals NOVA Create test data for Three Customer Test Cases of T6 T5 T4 T3 T1

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID2 is "+CID3

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet_2Customers')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

    * def thirdCust = <TestID>+'_3'
    * print 'Third Customer Test ID is '+thirdCust

    # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId    | CID  |
      | <TestID>  | CID1 |
      | secCust   | CID2 |
      | thirdCust | CID3 |

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID1
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc



    # Used table keyword to iterate for any BDD line
    * table acctDim
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') acctDim
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim


    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId    | CID  | accountNumber   |
      | <TestID>  | CID1 | UOAccountNumber |
      | ACAcc     | CID1 | ACAccountNumber |
      | secCust   | CID2 | UOAccountNumber |
      | thirdCust | CID3 | UOAccountNumber |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                                                    |
      | "N-NOVA_T6_MOB_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T6_SOL_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"                                   |
      | "N-NOVA_T5_MOB_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T5_SOL_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T5_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"                                   |
      | "N-NOVA_T4_MOB_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T4_SOL_LAST_LOGIN_DT_Count>2"                                                     |
      | "N-NOVA_T4_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"                                   |
      | "N-NOVA_T3_MOB_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic"                   |
      | "N-NOVA_T3_SOL_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic"                   |
      | "N-NOVA_T3_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic" |
      | "N-NOVA_T1_MOB_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic"                   |
      | "N-NOVA_T1_SOL_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic"                   |
      | "N-NOVA_T1_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2_ASSIGNED_FA_ID = 7 digit Numberic" |

