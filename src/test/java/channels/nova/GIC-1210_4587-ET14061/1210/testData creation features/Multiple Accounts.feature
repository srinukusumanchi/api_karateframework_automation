@ET14061
@NOVA_1210

Feature: Create test data for NOVA - GIC Renewal Investments Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @GICTestData_NOVA @GIC_NOVA_Positive_TestCases_TestData @GIC_NOVATwoAccountsTestData_1210 @GIC_NOVA_MultipleAccounts @1210 @4587 @NOVA @ET14061
  Scenario Outline: GIC Renewal Investments_NOVA Create test data for Two Accounts Positive Test Cases Of 1210

    * def testDataFileName = GICtestDataFileName

        # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    * def CRFC1 = <TestID>+'_CRFC1'
    * print 'CRFC1 Test ID is '+CRFC1

    * def CRFC2 = <TestID>+'_CRFC2'
    * print 'CRFC2 Test ID is '+CRFC2


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # Generate Random certificate to insert into database
    * def cert_1 = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+cert_1

    * def cert_2 = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+cert_2

        # Convert the offer expiry date to YYYY-MM-DD format
    * string crfc1MaturityDate = futureDateInDays(15)

        # Convert the offer expiry date to YYYY-MM-DD format
    * string crfc2MaturityDate = futureDateInDays(20)
   # Used table keyword to iterate for any BDD line
    * table examples
      | testId | accountNumber | CERT   | maturityDate      |
      | CRFC1  | accountNumber | cert_1 | crfc1MaturityDate |
      | CRFC2  | accountNumber | cert_2 | crfc2MaturityDate |

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet') examples

      # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples



    Examples:
      | TestID                                                                         | DOB  |
      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON earliest mat_dt" | "22" |


  @GIC_NOVA @GIC_NOVA_Positive_TestCases_TestData @GIC_NOVA_TwoAccountsMULTITestData_1210 @GIC_NOVA_MultipleAccounts_HigheshtMatValAmt_1210 @1210 @1210 @NOVA @ET14061
  Scenario Outline: GIC_NOVA Create test data for Two Accounts Positive Test Cases Of 1210 for high maturity amount and other least certificates

    * def testDataFileName = GICtestDataFileName

        # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    * def CRFC1 = <TestID>+'_CRFC1'
    * print 'CRFC1 Test ID is '+CRFC1

    * def CRFC2 = <TestID>+'_CRFC2'
    * print 'CRFC2 Test ID is '+CRFC2


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # Generate Random certificate to insert into database
    * def cert_1 = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+cert_1

    * def cert_2 = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+cert_2

        # Convert the offer expiry date to YYYY-MM-DD format
    * string crfc1MaturityDate = futureDateInDays(15)


   # Used table keyword to iterate for any BDD line
    * table examples
      | testId | accountNumber | CERT   | maturityDate      |
      | CRFC1  | accountNumber | cert_1 | crfc1MaturityDate |
      | CRFC2  | accountNumber | cert_2 | crfc1MaturityDate |

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet') examples

      # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples



    Examples:
      | TestID                                                                                  | DOB  |
      | "1210_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K"                         | "22" |
      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON higest maturtiy amount"   | "22" |
      | "1210_WHEN THERE ARE MULTIPLE  GICs THEN PRIORITISED BASED ON lowest certficate number" | "22" |




