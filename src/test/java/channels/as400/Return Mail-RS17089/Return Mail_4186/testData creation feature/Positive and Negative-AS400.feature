@PositiveAndNegative_TestData_4186
Feature: Create test data for Return Mail-4186 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @ReturnMail @ReturnMail_IH_Validation_TestData @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Create test data for validating IH field values
    * def testDataFileName = ReturnMailFileName
    #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

     # insert the created CID into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the account number into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_PREF_Insertion_Database')
    Examples:
      | TestID                                               |
      | "4186_Validate IH Record fields against Proposition" |


  @ReturnMail @ReturnMail_Positive_TestCases_TestData @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Create test data for Positive Test Cases
    * def testDataFileName = ReturnMailFileName
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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

    # insert the created CID into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the account number into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_PREF_Insertion_Database')
    Examples:
      | TestID                                       |
      | "4186_ISSUE = Informational and Group = Customer Servicing"                                                          |
      | "4186_PROD_CD = SAV, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                |
      | "4186_PROD_CD = SCL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = SSL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VCL, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VFA, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VFF, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VGD, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VIC, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VLR, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VAX, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = VUS, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXG, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXP, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186_PROD_CD = AXS, PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                |
      | "4186 Current_Account_Name = Customer Name (Given_name!=NULL) INDV_FRST_NM and INDV_LAST_NM not NULL"                |
      | "4186 INDV_FRST_NM not NULL (to display Current_Account_Name) when INDV_LAST_NM and Given_name is NULL"              |
      | "4186 INDV_LAST_NM not NULL (to display Current_Account_Name) when INDV_FRST_NM and Given_name is NULL"              |
      | "4186_Validate CurrentAccountName is NULL when INDV_FRST_NM = NULL, INDV_LAST_NAME=NULL , Given_name=NULL"           |
      | "4186_Validate Current Account Number is blank if CR_CRD_NUM is NULL when acct_subsys_id  = KS"                      |
      | "4186_Perform Accept Disposition and lead will be returned after 2 days if PREF_ACTION_CD=SUPPRESSML"                |
      | "4186_Perform Book appointment Disposition and lead will be returned after 2 days if PREF_ACTION_CD=SUPPRESSML"      |
      | "4186_Perform Customer Self Service Disposition and lead will be returned after 2 days if PREF_ACTION_CD=SUPPRESSML" |
      | "4186_ACCT_SUBSYS_ID_eq_KS_SCD_NUM_eq_Null"    |
      | "4186_ACCT_SUBSYS_ID_eq_AC_CR_CRD_NUM_eq_Null" |

  @ReturnMail @ReturnMail_Negative_TestCases_TestData @4186 @AS400 @RS17089
  Scenario Outline: Return Mail_RS17089_4186_AS400 Create test data for Negative Test Cases
    * def testDataFileName = ReturnMailFileName
   #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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

      # insert the created CID into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the account number into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_PREF_Insertion_Database')

    Examples:
      | TestID                                                                                                                                    |
      | "N-4186_CUST_TP_CD != PSNL"                                                                                                               |
      | "N-4186_CUST_TP_CD =  Null"                                                                                                               |
      | "N-4186_Deceased_F = Y"                                                                                                                   |
      | "N-4186_Deceased_F = Null"                                                                                                                |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,SAV,AXG,AXP,AXS and PREF_ACTION_CD = SUPPRESSML and ACCT_SUBSYS_ID!= AC or KS" |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,SAV,AXG,AXP,AXS and PREF_ACTION_CD = SUPPRESSML and ACCT_SUBSYS_ID = NULL"     |
      | "N_4186_PROD_CD != SAV and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                               |
      | "N_4186_PROD_CD is NULL and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                              |
      | "N_4186-PROD_CD = SAV, PREF_ACTION_CD !=SUPPRESSML and ACCT_SUBSYS_ID=AC"                                                                 |
      | "N_4186-PROD_CD = SAV and PREF_ACTION_CD = NULL and ACCT_SUBSYS_ID=AC"                                                                    |
      | "N_4186_PROD_CD not in (SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,AXG,AXP,AXS) and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"         |
      | "N_4186_PROD_CD is NULL and PREF_ACTION_CD=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                              |
      | "N_4186_PROD_CD = SCL, PREF_ACTION_CD !=SUPPRESSML and ACCT_SUBSYS_ID=KS"                                                                 |
      | "N_4186_PROD_CD in SCL,SSL,VCL,VFA,VFF,VGD,VIC,VLR,VAX,VUS,AXG,AXP,AXS and PREF_ACTION_CD=NULL and ACCT_SUBSYS_ID=KS"                     |
      | "N-4186_ACCT_SUBSYS_ID_eq_AC_SCD_NUM_eq_Null"                                                                                               |
      | "N-4186_ACCT_SUBSYS_ID_eq_KS_CR_CRD_NUM_eq_Null"                                                                                            |
