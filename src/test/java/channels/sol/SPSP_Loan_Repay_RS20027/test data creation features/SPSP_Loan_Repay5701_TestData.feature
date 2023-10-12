@SPSP_Loan_Repay_SOL_TestData_5701
Feature: Create test data for SPSP_Loan-5701 SOL test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @SPSP_Loan_Repay_SOLTestData @5701 @SOL @RS20027
  Scenario Outline: SPSP_RS20027_5701_SOL Create test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SPSP_Loan_RepaySOLFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Pavani:Added Study End date to be calculated based on current date
    # Generating STUDY_END_DT to insert into database
    * def studyEndDate = dateFormatExcludeDays(130)
    * print "Study End date is:" + studyEndDate


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    #Pavani:To insert Study end date in Excel
    # insert the created Study_End_date into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@StudyEndDate_Insertion_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                           |
      |"5701_SOL_BASE"                                   |
      |"5701_SOL_lang_cd = fr"                           |
      |"5701_SOL_Employee_Staff = Null"                  |
      |"N-5701_SOL_DECEASED_F=Y"                         |
      |"N-5701_SOL_DECEASED_F=NULL"                      |
      |"N-5701_SOL_CUST_TP_CD!= PSNL"                    |
      |"N-5701_SOL_LANG_CD = K"                          |
      |"N-5701_SOL_LANG_CD = NULL"                       |
      |"N-5701_SOL_PRIM_CNTRY_CD = NULL"                 |
      |"N-5701_SOL_PRIM_CNTRY_CD != CA"                  |
      |"N-5701_SOL_MKTBl = N"                            |
      |"N-5701_SOL_EMPLOYEE_STAFF_F = Y"                 |
      |"N_5701_SOL_ACCT_SUBSYS_ID!=KS"                   |
      |"N_5701_SOL_ACCT_STAT_CD!=Open"                   |
      |"N_5701_SOL_ACCT_STAT_CD = NULL"                  |
      |"N_5701_SOL_SRC_SYS_PRD_CD!= SSL"                 |
      |"N_5701_SOL_SRC_SYS_PRD_CD = NULL"                |
      |"N_5701_SOL_SRC_SYS_SUB_PRD_CD != SP"             |
      |"N_5701_SOL_SRC_SYS_SUB_PRD_CD = NULL"            |


  @SPSP_Loan_Repay_SOLTestData @5701 @SOL @RS20027 @boundaryStudydate
  Scenario Outline: SPSP_RS20027_5701_SOL Create test data

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = SPSP_Loan_RepaySOLFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generating STUDY_END_DT based on Example to insert into database
    * string studyEndDate = <Study_End_dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Study_End_dt>)
    * print "Study End Date is", studyEndDate


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Study_End_date into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@StudyEndDate_Insertion_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                           |Study_End_dt|
      |"5701_SOL_Current Date - STUDY_END_DT =120 Days"  |120|
      |"5701_SOL_Current Date - STUDY_END_DT  = 121 Days"|121|
      |"5701_SOL_Current Date - STUDY_END_DT  =149 Days" |149|
      |"5701_SOL_Current Date - STUDY_END_DT =150 Days"  |150|
      |"N_5701_SOL_Current Date - STUDY_END_DT =119 Days"|119|
      |"N_5701_SOL_Current Date - STUDY_END_DT  = 151 Days"|151|
