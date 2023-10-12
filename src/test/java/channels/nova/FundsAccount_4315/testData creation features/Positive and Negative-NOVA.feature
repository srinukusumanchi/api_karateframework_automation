@CIMCAMP-391 @PositiveNegative_TestData_4315_NOVA
Feature: Create test data for D2D Engagement Fund Account_NOVA-4315 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DFundAccount_NOVA @D2DEngagementFundAccount_IH_Validation_TestData_NOVA @4315 @NOVA @RS18022
  Scenario Outline: D2D Engagement Fund Account_RS18022_4315_NOVA Create test data for validating IH field values
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = FundsAccountDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                               | ACCT_ODT | DOB  |
      | "4315_Validate IH Record fields against Proposition" | "20"     | "21" |
      | "Extra1"                                             | "20"     | "22" |
      | "Extra2"                                             | "20"     | "23" |
      | "Extra3"                                             | "20"     | "23" |
      | "Extra4"                                             | "20"     | "23" |
      | "Extra5"                                             | "20"     | "23" |
      | "Extra6"                                             | "20"     | "23" |
      | "Extra7"                                             | "20"     | "23" |
      | "Extra8"                                             | "20"     | "23" |
      | "Extra9"                                             | "20"     | "23" |

  @D2DFundAccount_NOVA @D2DEngagementFundAccount_Positive_TestCases_TestData_NOVA @4315 @NOVA @RS18022
  Scenario Outline: D2D Engagement Fund Account_RS18022_4315_NOVA Create test data for Positive Test Cases
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = FundsAccountDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                | ACCT_ODT | DOB  |
      | "4315_PRIM_CNTRY_CD= CA"              | "20"     | "25" |
      | "4315_CUST_TP_CD=PSNL"                | "20"     | "25" |
      | "4315_DO_NOT_SOLICIT_F=N"             | "20"     | "25" |
      | "4315_DO_NOT_SOLICIT_F=NULL"          | "20"     | "25" |
      | "4315_LANG_CD=E"                      | "20"     | "25" |
      | "4315_LANG_CD=EN"                     | "20"     | "25" |
      | "4315_LANG_CD=F"                      | "20"     | "25" |
      | "4315_LANG_CD=FR"                     | "20"     | "25" |
      | "4315_LANG_CD_lowerCase=e"            | "20"     | "25" |
      | "4315_LANG_CD_lowerCase=en"           | "20"     | "25" |
      | "4315_LANG_CD_lowerCase=f"            | "20"     | "25" |
      | "4315_LANG_CD_lowerCase=fr"           | "20"     | "25" |
      | "4315_INDV_BRTH_DT_Equal to 16"       | "20"     | "16" |
      | "4315_INDV_BRTH_DT_greater than 16"   | "20"     | "25" |
      | "4315_Prv_Bnk_Ind = N"                | "20"     | "25" |
      | "4315_Deceased_F = N"                 | "20"     | "25" |
      | "4315_Employee_Staff_F = N"           | "20"     | "20" |
      | "4315_Employee_Staff_F = NULL"        | "20"     | "25" |
      | "4315_INDV_BRTH_DT_Equal is not NULL" | "20"     | "25" |
      | "4315_PRD CD-01, SUB PRD CD -01"      | "20"     | "25" |
      | "4315_PRD CD-01, SUB PRD CD -02"      | "20"     | "25" |
      | "4315_PRD CD-01, SUB PRD CD -03"      | "20"     | "25" |
      | "4315_PRD CD-01, SUB PRD CD -04"      | "20"     | "25" |
      | "4315_PRD CD-02, SUB PRD CD -01"      | "20"     | "25" |
      | "4315_PRD CD-02, SUB PRD CD -02"      | "20"     | "25" |
      | "4315_PRD CD-02, SUB PRD CD -03"      | "20"     | "25" |
      | "4315_PRD CD-07, SUB PRD CD -11"      | "20"     | "25" |
      | "4315_PRD CD-07, SUB PRD CD -12"      | "20"     | "25" |
      | "4315_PRD CD-13, SUB PRD CD -01"      | "20"     | "25" |
      | "4315_PRD CD-13, SUB PRD CD -03"      | "20"     | "25" |
      | "4315_PRD CD-13, SUB PRD CD -07"      | "20"     | "25" |
      | "4315_PRD CD-13, SUB PRD CD -08"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -01"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -02"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -03"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -04"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -07"      | "20"     | "25" |
      | "4315_PRD CD-19, SUB PRD CD -08"      | "20"     | "25" |
      | "4315_PRD CD-23, SUB PRD CD -01"      | "20"     | "25" |
      | "4315_PRD CD-23, SUB PRD CD -03"      | "20"     | "25" |
      | "4315_SRC_ACCT_STAT_CD = A"           | "20"     | "25" |
      | "4315_ACCT_SUBSYS_ID = BB"            | "20"     | "25" |
      | "4315_ACCT_ODT is  =14 days"          | "14"     | "25" |
      | "4315_ACCT_ODT is  =20 days"          | "20"     | "25" |
      | "4315_ACCT_ODT is  =30 days"          | "30"     | "25" |
      | "4315_CRNT_BAL_AMT is >0"             | "20"     | "25" |

  @D2DFundAccount_Negative_TestCases_TestData @D2DEngagementFundAccount_Negative_TestCases_TestData @4315 @SOL @RS18022
  Scenario Outline: D2D Engagement Fund Account_RS18022_4315_SOL Create test data for Negative Test Cases
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = FundsAccountDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                             | ACCT_ODT | DOB    |
      | "N-4315_PRIM_CNTRY_CD!= CA"        | "20"     | "25"   |
      | "N-4315_PRIM_CNTRY_CD= NULL"       | "20"     | "25"   |
      | "N-4315_CUST_TP_CD=Non_PSNL"       | "20"     | "25"   |
      | "N-4315_CUST_TP_CD=NULL"           | "20"     | "25"   |
      | "N-4315_DO_NOT_SOLICIT_F=Y"        | "20"     | "25"   |
      | "N-4315_INDV_BRTH_DT_Less than 16" | "20"     | "15"   |
      | "N-4315_INDV_BRTH_DT_Equal = NULL" | "20"     | "NULL" |
      | "N-4315 - Prv_Bnk_Ind = Y"         | "20"     | "25"   |
      | "N-4315 - Prv_Bnk_Ind = NULL"      | "20"     | "25"   |
      | "N-4315_LANG_CD= K"                | "20"     | "25"   |
      | "N-4315_LANG_CD= NE"               | "20"     | "25"   |
      | "N-4315_LANG_CD= A"                | "20"     | "25"   |
      | "N-4315_LANG_CD= RF"               | "20"     | "25"   |
      | "N-4315_LANG_CD= NULL"             | "20"     | "25"   |
      | "N-4315 - Deceased_F = Y"          | "20"     | "25"   |
      | "N-4315 - Deceased_F = NULL"       | "20"     | "25"   |
      | "N-4315 - Employee_Staff_F = Y"    | "20"     | "25"   |
      | "N-4315_SRC_SYS_PRD_CD =03"        | "20"     | "25"   |
      | "N-4315_PRD CD-01, SUB PRD CD -05" | "20"     | "25"   |
      | "N-4315_PRD CD-02, SUB PRD CD -04" | "20"     | "25"   |
      | "N-4315_PRD CD-07, SUB PRD CD -10" | "20"     | "25"   |
      | "N-4315_PRD CD-13, SUB PRD CD -02" | "20"     | "25"   |
      | "N-4315_PRD CD-18, SUB PRD CD -06" | "20"     | "25"   |
      | "N-4315_PRD CD-19, SUB PRD CD -09" | "20"     | "25"   |
      | "N-4315_PRD CD-23, SUB PRD CD -04" | "20"     | "25"   |
      | "N-4315_SRC_ACCT_STAT_CD = B"      | "20"     | "25"   |
      | "N-4315_SRC_ACCT_STAT_CD = NULL"   | "20"     | "25"   |
      | "N-4315_ACCT_SUBSYS_ID = KS"       | "20"     | "25"   |
      | "N-4315_CRNT_BAL_AMT is NULL"      | "20"     | "25"   |
      | "N-4315_PRD CD-18, SUB PRD CD -01" | "20"     | "25"   |
      | "N-4315_PRD CD-18, SUB PRD CD -03" | "20"     | "25"   |
      | "N-4315_PRD CD-18, SUB PRD CD -07" | "20"     | "25"   |
      | "N-4315_CRNT_BAL_AMT is <0"        | "20"     | "25"   |
      | "N-4315_CRNT_BAL_AMT is =0"        | "20"     | "25"   |

  @D2DFundAccount_Negative_TestCases_TestData @D2DEngagementFundAccount_ACCTODT>30_ACCTODT<14_Negative_TestCases_TestData @4315 @SOL @RS18022
  Scenario Outline: D2D Engagement Fund Account_RS18022_4315_SOL Create test data for Negative Test Case acct odt>30 days and Lessthan 14 days
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = FundsAccountDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                          | ACCT_ODT | DOB  |
      | "N-4315_Account Open Date greater than 30 days" | "31"     | "30" |
      | "N-4315_ACCT_ODT is  less than 14 days"         | "13"     | "30" |

  @D2DFundsAccount_Negative_TestCases_TestData_NOVA @D2DFundsAccount_CUST_OPND_DT<7_Negative_TestCases_TestData_NOVA @4315 @NOVA @RS18022
  Scenario Outline: D2D FundsAccount_RS18022_4315_NOVA Create test data for Negative Test Case CUST_OPND_DT<7 days
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = FundsAccountDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                 | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "N-4315_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" | "20"     | "46" | "4"          |
