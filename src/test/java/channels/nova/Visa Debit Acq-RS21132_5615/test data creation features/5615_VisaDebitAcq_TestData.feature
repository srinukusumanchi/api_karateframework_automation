@VisaDebitAcq_testdata_5615
Feature: Create test data for Visa Debit Acq - 5615 Nova test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @VisaDebitAcq @5616 @NOVA @RS21132 @5615_testdata_positive
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for positive test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * print "SOL Last Login Date is", SOL_LAST_LOGIN_DT

  # Convert the Mob Last Login Date to YYYY-MM-DD format
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * print "Mob Last Login Date is", MOB_LAST_LOGIN_DT

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight


  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT |
      | <TestID> | accountNumber   | ""               | ACCT_ODT |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""       |

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID                                                                                                                 | Event_Date | ACCT_ODT | MOB_LAST_LOGIN_DT | sol_login |
#      | "5615_CUST_TP_CD=PSNL"                                                                                                   | "-1"       | "100"    | "10"      | "10"      |
#      | "5615_Primary Country Cd = CA"                                                                                           | "-1"       | "92"     | "10"      | "10"      |
#      | "5615_CUST_AGE =16"                                                                                                      | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_CUST_AGE >16"                                                                                                      | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_LANG_CD in Capital Letter =E"                                                                                      | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_LANG_CD in Capital Letter =EN"                                                                                     | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_LANG_CD in Capital Letter =F"                                                                                      | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_LANG_CD in Capital Letter =FR"                                                                                     | "-1"       | "100"    | "NULL"    | "10"      |
#      | "5615_LANG_CD in Small Letter = e"                                                                                       | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_LANG_CD in Small Letter = en"                                                                                      | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_LANG_CD in Small Letter = f"                                                                                       | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_LANG_CD in Small Letter = fr"                                                                                      | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_DO_NOT_SOLICIT_F = N"                                                                                              | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_DO_NOT_SOLICIT_F = NULL"                                                                                           | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_MRKTBLE_F = Y"                                                                                                     | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_DECEASED_F=N"                                                                                                      | "-1"       | "100"    | "10"      | "NULL"    |
#      | "5615_ACCT_ODT = NULL"                                                                                                   | "-1"       | "NULL"   | "10"      | "10"      |
#      | "5615_PRIMARY_ACCT_HOLDER_FLAG=Y"                                                                                        | "-1"       | "100"    | "10"      | "10"      |
#      | "5615_INSIGHT_CD = FLG_CC_Online_Purchase_30D and CUST_INSIGHTS.CURR_VAL = 0"                                            | "-1"       | "NULL"   | "10"      | "10"      |
#      | "5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CUST_INSIGHTS.CURR_VAL = 1 and EVENT_DATE < 21 days of current date"   | "-20"      | "NULL"   | "10"      | "10"      |
      | "5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CUST_INSIGHTS.CURR_VAL = 1 and EVENT_DATE = 21 days of current date" | "-21"      | "NULL"   | "10"              | "10"      |
#      | "5615_PROD_HIER_LEVEL_4 = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A"                            | "-1"       | "100"    | "10"      | "10"      |
#      | "5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05"                 | "-1"       | "NULL"   | "10"      | "10"      |
#      | "5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with 600"                                          | "-1"       | "NULL"   | "10"      | "10"      |
#      | "5615_5615012201_INSIGHT_MOB & SOL LOGIN < 90 DAYS_NO MOBILE WALLET TRANSACTION"                                         | "-1"       | "100"    | "80"      | "80"      |
#      | "5615_5615012201_INSIGHT_MOB & SOL LOGIN = 90 DAYS_NO MOBILE WALLET TRANSACTION"                                         | "-2"       | "100"    | "90"      | "90"      |
#      | "5615_5615012202_MOB & SOL LOGIN < 90 DAYS_NO MOBILE WALLET TRANSACTION"                                                 | "-3"       | "100"    | "80"      | "80"      |
#      | "5615_5615012202_MOB & SOL LOGIN = 90 DAYS_NO MOBILE WALLET TRANSACTION"                                                 | "-4"       | "100"    | "90"      | "90"      |
#      | "5615_5615012203_mob and sol > 90)"                                                                                      | "-5"       | "100"    | "100"     | "100"     |
#      | "5615_5615012203_mob and sol = null)"                                                                                    | "-5"       | "100"    | "NULL"    | "NULL"    |
#      | "5615_5615012203_LAST_APPLE_PAY_TXN_TMSTMP   is NOT null"                                                                | "-6"       | "100"    | "NULL"    | "10"      |
#      | "5615_5615012203_LAST_ANDROID_PAY_TXN_TMSTMP is NOT null"                                                                | "-7"       | "100"    | "NULL"    | "10"      |
#      | "5615_5615012203_LAST_SAMSUNG_PAY_TXN_TMSTMP is NOT null"                                                                | "-8"       | "100"    | "10"      | "NULL"    |
#      | "5615_5615012203_LAST_SCOTIA_PAY_TXN_TMSTMP  is NOT null"                                                                | "-1"       | "100"    | "10"      | "NULL"    |


  @VisaDebitAcq @5616 @NOVA @RS21132 @5615_testdata_negative
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for negative test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * print "SOL Last Login Date is", SOL_LAST_LOGIN_DT

  # Convert the Mob Last Login Date to YYYY-MM-DD format
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * print "Mob Last Login Date is", MOB_LAST_LOGIN_DT

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight


  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT |
      | <TestID> | accountNumber   | ""               | ACCT_ODT |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""       |

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID                                                                                                       | Event_Date | ACCT_ODT | MOB_LAST_LOGIN_DT | sol_login |
      | "N_5615_CUST_TP_CD!=PSNL"                                                                                    | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_Primary Country Cd! = CA"                                                                            | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_Primary Country Cd = NULL"                                                                           | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_CUST_AGE =15"                                                                                        | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_CUST_AGE = NULL"                                                                                     | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_LANG_CD in Capital Letter = K"                                                                       | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_LANG_CD in Capital Letter = NE"                                                                      | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_LANG_CD in Capital Letter = NULL"                                                                    | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_DO_NOT_SOLICIT_F = Y"                                                                                | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_MRKTBLE_F = N"                                                                                       | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_MRKTBLE_F = NULL"                                                                                    | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_DECEASED_F= Y"                                                                                       | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_DECEASED_F= NULL"                                                                                    | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=01,SUB_PRD_CD=04_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=02,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=02_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=04_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=07_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=19,SUB_PRD_CD=08_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                           | "-1"       | "80"     | "10"              | "10"      |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=07_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=13,SUB_PRD_CD=08_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=07,SUB_PRD_CD=11_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=07,SUB_PRD_CD=12_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=23,SUB_PRD_CD=01_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRD_CD=23,SUB_PRD_CD=03_ACCT_ODT<=90 days"                                                           | "-1"       | "90"     | "10"              | "10"      |
      | "N_5615_PRIMARY_ACCT_HOLDER_FLAG = N"                                                                        | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                                     | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_INSIGHT_CD ! = FLG_CC_Online_Purchase_30D and CURR_VAL = 0"                                          | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_INSIGHT_CD  = FLG_CC_Online_Purchase_30D and CURR_VAL ! = 0"                                         | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_INSIGHT_CD != Flg_Visa_Debit_Txn_Last_7D and CURR_VAL = 1 and EVENT_DATE<= 21 days"                  | "-15"      | "100"    | "10"              | "10"      |
      | "N_5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CURR_VAL != 1 and EVENT_DATE<= 21 days"                  | "-15"      | "100"    | "10"              | "10"      |
      | "N_5615_INSIGHT_CD = Flg_Visa_Debit_Txn_Last_7D and CURR_VAL = 1 and EVENT_DATE > 21 days"                   | "-22"      | "100"    | "10"              | "10"      |
      | "N_5615_PROD_HIER_LEVEL_4 ! = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A"            | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_PROD_HIER_LEVEL_4  = Chequing Accounts AND ACCT_SUBSYS_ID ! = BB AND SRC_ACCT_STAT_CD = A"           | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_PROD_HIER_LEVEL_4  = Chequing Accounts AND ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD ! = A"           | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID ! = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05" | "-1"       | "NULL"   | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD ! = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD = 05" | "-1"       | "NULL"   | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD ! = 05 AND SRC_SYS_SUB_PRD_CD = 05" | "-1"       | "NULL"   | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A  AND SRC_SYS_PRD_CD = 05 AND SRC_SYS_SUB_PRD_CD ! = 05" | "-1"       | "NULL"   | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID ! = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with 600"                          | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD ! = A and SCD_NUM starts with 600"                          | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SCD_NUM starts with ! 600"                          | "-1"       | "100"    | "10"              | "10"      |

  @VisaDebitAcq @5616 @NOVA @RS21132 @5615_testdata_negative_segments
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for negative test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * print "SOL Last Login Date is", SOL_LAST_LOGIN_DT

  # Convert the Mob Last Login Date to YYYY-MM-DD format
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * print "Mob Last Login Date is", MOB_LAST_LOGIN_DT

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight


  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT |
      | <TestID> | accountNumber   | ""               | ACCT_ODT |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""       |

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID                                                                                                         | Event_Date | ACCT_ODT | MOB_LAST_LOGIN_DT | sol_login |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN >90 and no mobile wallet transaction"                          | "-1"       | "100"    | "95"              | "95"      |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN <90 had mobile wallet transaction"                             | "-1"       | "100"    | "80"              | "80"      |
      | "N_5615_5615012201_Insight and MOB && SOL_LOGIN =90 had mobile wallet transaction"                             | "-1"       | "100"    | "90"              | "90"      |
      | "N_5615_5615012201_Digitally Active and had no mobile wallet transaction and no insight"                       | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN >90 and no mobile wallet transaction"                          | "-1"       | "100"    | "95"              | "95"      |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN <90 had mobile wallet transaction"                             | "-1"       | "100"    | "80"              | "80"      |
      | "N_5615_5615012202_Insight and MOB && SOL_LOGIN =90 had mobile wallet transaction"                             | "-1"       | "100"    | "90"              | "90"      |
      | "N_5615_5615012202_Digitally Active and had no mobile wallet transaction and no insight"                       | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_5615012201_5615012201_Digitally Active and had no mobile wallet transaction device tp!=ios or android" | "-1"       | "100"    | "10"              | "10"      |
      | "N_5615_5615012203_MOB && SOL_LOGIN >  90 and had mobile wallet transaction and no insight"                    | "-1"       | "100"    | "100"             | "100"     |
      | "N_5615_5615012203_INSIGHT _MOB && SOL_LOGIN = 90 and had no mobile wallet transaction"                        | "-1"       | "100"    | "90"              | "90"      |
      | "N_5615_5615012203_INSIGHT _MOB && SOL_LOGIN < 90 and had no mobile wallet transaction"                        | "-1"       | "100"    | "80"              | "80"      |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP and LAST_VD_OPOS_TXN_TMSTMP > 90 days and had insight"              | "-1"       | "100"    | "10"              | "10"      |


  @VisaDebitAcq @5616 @NOVA @RS21132 @5615_testdata_segment4
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for segment4 test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * print "SOL Last Login Date is", SOL_LAST_LOGIN_DT

  # Convert the Mob Last Login Date to YYYY-MM-DD format
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * print "Mob Last Login Date is", MOB_LAST_LOGIN_DT


  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight

  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_NUM_Insertion_CUST_INSIGHTS_Sheet')

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT |
      | <TestID> | accountNumber   | ""               | ACCT_ODT |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""       |

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                      | ACCT_ODT | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5615_LAST_VD_VPOS_TXN_TMSTMP >90 days && LAST_VD_OPOS_TXN_TMSTMP = NULL from current date" | "100"    | "10"              | "10"              |
      | "5615_LAST_VD_OPOS_TXN_TMSTMP > 90 days && LAST_VD_VPOS_TXN_TMSTMP =NULL from current date" | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP>90 days && LAST_VD_OPOS_TXN_TMSTMP < 90 days"    | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP>90 days && LAST_VD_VPOS_TXN_TMSTMP < 90 days"    | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP < 90"                                            | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_VPOS_TXN_TMSTMP = 90"                                            | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP < 90"                                            | "100"    | "10"              | "10"              |
      | "N_5615_5615012204_LAST_VD_OPOS_TXN_TMSTMP = 90"                                            | "100"    | "10"              | "10"              |

  @VisaDebitAcq @5616 @NOVA @RS21132 @5615_testdata_positive_notactiveaccount
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for positive test cases

  # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebitAcqNOVATestData
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * print "SOL Last Login Date is", SOL_LAST_LOGIN_DT

  # Convert the Mob Last Login Date to YYYY-MM-DD format
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * print "Mob Last Login Date is", MOB_LAST_LOGIN_DT

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight


  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber
  # Generating BB account number to insert into database
    * def BBAccountNumber = '00000000'+randGen(15)
    * print "BB Account Number is " + BBAccountNumber


  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

    * def BBAcc = <TestID> + '_Account_3'
    * print 'BB Account Test ID is '+BBAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT     |
      | <TestID> | accountNumber   | ""               | ACCT_ODT     |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""           |
      | BBAcc    | BBAccountNumber | ""               | "2021-11-30" |

  # insert theBBAcc created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID                                       | Event_Date | ACCT_ODT | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5615_ACCT_ODT < 90 and SRC_ACCT_STAT_CD!=A" | "-1"       | "100"    | "10"              | "10"              |
