@Insurance_Reminder_Nova_5784_TestData_Creation
Feature: Create test data for Insurance Reminder- 5784 Nova test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @Insurance_Reminder_NOVA_Sanity_TestData @5784 @NOVA @RS22075 @Sanity
  Scenario Outline: Insurance_Reminder_RS22075_5784_NOVA_TestData Create test data for single account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InsuranceReminderNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the INSUR_STAT_LAST_CHNG_DT to YYYY-MM-DD format
    * string INSUR_STAT_LAST_CHNG_DT = <INSUR_STAT_LAST_CHNG_DT> =='NULL'?'NULL': dateFormatExcludeDays(<INSUR_STAT_LAST_CHNG_DT>)
    * print "INSUR_STAT_LAST_CHNG_DT is ",INSUR_STAT_LAST_CHNG_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Generating credit card number to insert into database
    * def CreditCardNumber = '1'+CID
    * print "creditcard number is " + CreditCardNumber

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

      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@InsureDate_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')


    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Credit card Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID              | INSUR_STAT_LAST_CHNG_DT |
      | "5784_NOVA_BASE_01" | "NULL"                  |
      | "5784_NOVA_BASE_02" | "NULL"                  |
      | "5784_NOVA_BASE_03" | "20"                    |


  @Insurance_Reminder_NOVA_Positive_Scenarios_TestData @5784 @NOVA @RS22075
  Scenario Outline: Insurance_Reminder_RS22075_5784_NOVA_TestData Create test data for positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InsuranceReminderNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
     # Convert the INSUR_STAT_LAST_CHNG_DT to YYYY-MM-DD format
    * string INSUR_STAT_LAST_CHNG_DT = <INSUR_STAT_LAST_CHNG_DT> =='NULL'?'NULL': dateFormatExcludeDays(<INSUR_STAT_LAST_CHNG_DT>)
    * print "INSUR_STAT_LAST_CHNG_DT is ",INSUR_STAT_LAST_CHNG_DT


    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Generating credit card number to insert into database
    * def CreditCardNumber = '1'+CID
    * print "creditcard number is " + CreditCardNumber

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

     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@InsureDate_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Credit card Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                | INSUR_STAT_LAST_CHNG_DT |
      | "5784_NOVA_Seg_01_LANG_CD_eq_fr and DO_NOT_SOLICIT_F=NULL"                            | "NULL"                  |
      | "5784_CUST_LvL_NOVA_CUST_AGE = 18 and Unsubscribe=N"                                  | "NULL"                  |
      | "5784_CUST_LvL_NOVA_CUST_AGE = 69"                                                    | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=GC"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=GS"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=PC"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=SC"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=SS"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=DM"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=NF"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=NH"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=RG"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SC"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SL"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SS"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=ST"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=SV"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VCL and SRC_SYS_SUB_PRD_CD=ZZ"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFA and SRC_SYS_SUB_PRD_CD=A1"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFA and SRC_SYS_SUB_PRD_CD=A3"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=F1"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=TR"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VFF and SRC_SYS_SUB_PRD_CD=TS"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=NF"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=RG"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=SP"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VGD and SRC_SYS_SUB_PRD_CD=ST"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=NF"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=RC"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VLR and SRC_SYS_SUB_PRD_CD=RG"                      | "NULL"                  |
      | "5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=VUS and SRC_SYS_SUB_PRD_CD=RG"                      | "NULL"                  |
      | "5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = 120"                                          | "NULL"                  |
      | "5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = 30"                                           | "NULL"                  |
      | "5784_Acc_Lvl_INS_STATUS_CODE = X AND Current Date -INSUR_STAT_LAST_CHNG_DT =40 days" | "40"                    |
      | "5784_Acc_Lvl_INS_STATUS_CODE = X AND Current Date -INSUR_STAT_LAST_CHNG_DT = 1 days" | "1"                     |


     #Positive scenario for multiple account for prioritization
  @Insurance_Reminder_NOVA_multiple_Account_Positive_Scenarios_TestData @5784 @NOVA @RS22075
  Scenario Outline: Insurance_Reminder_RS22075_5784_NOVA_TestData Create test data for multiple account prioritization scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InsuranceReminderNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number1 to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating account Number 2
    * def accountNumber2 = '00000001'+CID
    * print "Account number2 is " + accountNumber2

      # Generating credit card number1 to insert into database
    * def CreditCardNumber = '1'+CID
    * print "creditcard number is " + CreditCardNumber

     # Generating credit card number2 to insert into database
    * def CreditCardNumber2 = '2'+CID
    * print "creditcard number2 is " + CreditCardNumber2

    # Defining TestID for the loop
    * def TEST = testId+'_acct_one'

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber  | CreditCardNumber  |
      | <TestID> | accountNumber  | CreditCardNumber  |
      | TEST     | accountNumber2 | CreditCardNumber2 |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts

    # insert the created Credit card Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet') mult_accounts

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                                                                 |
      | "5784_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG_PROD_CD_eq_VGD_SUB_PROD_eq_SP_Prioritization" |


  @Insurance_Reminder_NOVA_Negative_Scenarios_TestData @5784 @NOVA @RS22075
  Scenario Outline: Insurance_Reminder_RS22075_5784_NOVA_TestData Create test data for negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InsuranceReminderNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the INSUR_STAT_LAST_CHNG_DT to YYYY-MM-DD format
    * string INSUR_STAT_LAST_CHNG_DT = <INSUR_STAT_LAST_CHNG_DT> =='NULL'?'NULL': dateFormatExcludeDays(<INSUR_STAT_LAST_CHNG_DT>)
    * print "INSUR_STAT_LAST_CHNG_DT is ",INSUR_STAT_LAST_CHNG_DT


    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generating credit card number to insert into database
    * def CreditCardNumber = '1'+CID
    * print "creditcard number is " + CreditCardNumber


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

     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@InsureDate_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Credit card Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                      | INSUR_STAT_LAST_CHNG_DT |
      | "N_5784_CUST_LvL_NOVA_CUST_TP_CD != PSNL"                                                   | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_CUST_TP_CD = NULL"                                                    | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_PRIM_CNTRY_CD != CA"                                                  | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_PRIM_CNTRY_CD = NULL"                                                 | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_Lang_CD_!= (en,fr)"                                                   | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_Lang_CD_= NULL"                                                       | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_MRKTBLE_F != Y"                                                       | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_MRKTBLE_F= NULL"                                                      | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE < 18"                                                        | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE = NULL"                                                      | "NULL"                  |
      | "N_5784_CUST_LvL_NOVA_CUST_AGE > 70"                                                        | "NULL"                  |
      | "N_5784_CUST_LvL_DO_NOT_SOLICIT_F=Y"                                                        | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_ACCT_SUBSYS_ID != KS"                                                  | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_ACCT_SUBSYS_ID = NULL"                                                 | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_ACCT_STAT_CD != Open"                                              | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_ACCT_STAT_CD = NULL"                                               | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_PROD_HIER_LEVEL_3 != Credit Cards"                                     | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_PROD_HIER_LEVEL_3 = NULL"                                              | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD!=AXG and SRC_SYS_SUB_PRD_CD =GC"                        | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD!=AXG and SRC_SYS_SUB_PRD_CD =NULL"                      | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=AXG and SRC_SYS_SUB_PRD_CD=!GS"                         | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_SRC_SYS_PRD_CD=NULL and SRC_SYS_SUB_PRD_CD=PC"                         | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_CR_CRD_PRTCTN_F!= Y"                                                   | "NULL"                  |
      | "N_5784_NOVA_Acc_Lvl_CR_CRD_PRTCTN_F=NULL"                                                  | "NULL"                  |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS > 120"                                              | "NULL"                  |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS < 30"                                               | "NULL"                  |
      | "N_5784_NOVA_Acc_LvlCREDIT_ARREARS_DAYS = NULL"                                             | "NULL"                  |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT > 40 days"   | "50"                    |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT < 1 days"    | "0"                     |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE = X  AND Current Date -INSUR_STAT_LAST_CHNG_DT = NULL"      | "NULL"                  |
      | "N_5784_Acc_Lvl_INS_STATUS_CODE != X  AND Current Date -INSUR_STAT_LAST_CHNG_DT <  40 days" | "20"                    |
      | "N_5784_Acc_Lvl_PRIMARY_ACCT_HOLDER_FLAG != Y"                                               | "NULL"                  |
      | "N_5784_Acc_Lvl_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                             | "NULL"                  |
