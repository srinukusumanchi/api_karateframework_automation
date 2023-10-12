@NTCCredit_Nova_5619
Feature: Create test data for NTC Credit Nova Disposition Positive and Negative test cases

  Background:Common for NOVA Positive and Negative test data

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTCCredit_NOVA_1122 @5619 @NOVA @RS2098A @1122
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Create test data for 1122

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCCreditNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Account2 = <TestID>+'_Account_2'
    * print 'Second Account Test ID is '+Account2

    # Used table keyword to iterate for any BDD line
    * table examples
      | "testId   | "accountNumber |
      | "<TestID> | "acct_num1     |
      | "Account2 | "acct_num2     |

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    Examples:
      | TestID                               | ACCT_ODT |
#      | "N-5619_NOVA_2_BBAccounts_1301_0101" | "32""     |
#      | "N-5619_NOVA_2_BBAccounts_0711_0201" | "32""     |

  @NTCCredit_NOVA_1111 @5619 @NOVA @RS2098A @1111
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Create test data for 1111 <TestID>

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCCreditNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

          # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt


    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

           # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

      #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                         | Arrive_Dt | ACCT_ODT |
#      | "5619_NOVA_Customer Not Deceased"                        | "45"        | "32"       |
#      | "5619_NOVA_CUST_AGE=18"                                  | "45"        | "33"       |
#      | "5619_NOVA_LANG_CD=E"                                    | "45"        | "34"       |
#      | "5619_NOVA_LANG_CD=EN"                                   | "45"        | "35"       |
#      | "5619_NOVA_LANG_CD=e_LowerCase"                          | "45"        | "39"       |
#      | "5619_NOVA_LANG_CD=en_LowerCase"                         | "45"        | "40"       |
#      | "5619_NOVA_DO_NOT_SOLICIT_F=NULL"                        | "45"        | "47"       |
#      | "5619_NOVA_MCB_IND = Y"                                  | "45"        | "48"       |
#      | "5619_NOVA_ARR_DT LT 5 years"   | "45"       | "49"      |
#      | "5619_NOVA_13_01"                                        | "45"        | "50"       |
#      | "5619_NOVA_13_03"                                        | "45"        | "53"       |
#      | "5619_NOVA_13_07"                                        | "45"        | "55"       |
#      | "5619_NOVA_13_08"                                        | "45"        | "58"       |
#      | "5619_NOVA_07_11"                                        | "45"        | "59"       |
#      | "5619_NOVA_07_12"                                        | "45"        | "55"       |
#      | "5619_NOVA_Acct_Odt_GE_30_TO_LE_60"                      | "45"        | "47"      |
#      | "5619_NOVA_ACCT_SUBSYS_ID = BB AND SRC_ACCT_STAT_CD = A" | "45"        | "32"       |
#      | "N-5619_NOVA_Deceased=Y"                                 | "45"        | "32"       |
#      | "N-5619_NOVA_Deceased=NULL"                              | "45"        | "32"       |
#      | "N-5619_NOVA_CUST_TP_CD!=PSNL"                           | "45"        | "32"       |
#      | "N-5619_NOVA_CUST_TP_CD=NULL"                            | "45"        | "32"       |
#      | "N-5619_NOVA_PRIM_CNTRY_CD!=CA"                          | "45"        | "32"       |
#      | "N-5619_NOVA_PRIM_CNTRY_CD=NULL"                         | "45"        | "32"       |
#      | "N-5619_NOVA_CUST_AGE=NULL"                              | "45"        | "32"       |
#      | "N-5619_NOVA_CUST_AGE<18"                                | "45"        | "32"       |
#      | "N-5619_NOVA_LANG_CD=G"                                  | "45"        | "32"       |
#      | "N-5619_NOVA_LANG_CD=NULL"                               | "45"        | "32"       |
#      | "N-5619_NOVA_DO_NOT_SOLICIT_F=Y"                         | "45"        | "32"       |
#      | "N-5619_NOVA_MRKTBLE_F=N"                                | "45"        | "32"       |
#      | "N-5619_NOVA_MRKTBLE_F=NULL"                             | "45"        | "32"       |
#      | "N-5619_NOVA_MCB_IND = N"                                | "45"        | "32"       |
#      | "N-5619_NOVA_MCB_IND = NULL"                             | "45"        | "32"       |
#      | "N-5619_NOVA_ARR_DT GT 5 years" | "1826"     | "32"      |
      | "N-5619_NOVA_ARR_DT_1827days" | "1827"     | "32"      |
#      | "N-5619_NOVA_ACCT_SUBSYS_ID!=BB"                         | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_ACCT_STAT_CD!=A"                        | "45"        | "32"       |
#      | "N-5619_NOVA_ACCT_ODT < 30 days"                         | "45"        | "30"       |
#      | "N-5619_NOVA_ACCT_ODT > 60 days"                         | "45"        | "62"       |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=01"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=02"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=03"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=04"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=01"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=02"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=03"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=01"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=02"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=03"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=04"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=07"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=08"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=01"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=03"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=13 and SRC_SUB_PRD_CD=02"        | "45"        | "32"       |
#      | "N-5619_NOVA_SRC_PRD_CD=07 and SRC_SUB_PRD_CD=01"        | "45"        | "32"       |
#      | "5619_NOVA_ARR_DT_eq_5years"    | "1825"     | "32"      |
#      | "N-5619_NOVA_ARR_DT_eq_NULL"    | "NULL"     | "32"      |
