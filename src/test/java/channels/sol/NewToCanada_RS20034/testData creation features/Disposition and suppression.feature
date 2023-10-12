@RS20034 @5043 @Dispositions_TestData_5043
Feature: Create test data for New To Canada - 5043 Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NewToCanada @NewToCanada_ATC_DEL_DispositionTestData @5043 @SOL @RS20034
  Scenario Outline: New To Canada_RS20034_5043_SOL Create test data for accept or delete disposition
    * def testDataFileName = NTCtestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Date to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generating Future Date For inserting into BBDWSC_SC_EXPIRY_DATE Column in the ACCT_DIM
    * def scExpiryDate = <BBDWSC_SC_EXPIRY_DATE> == 'NULL' ? 'NULL' : futureDateInDays(<BBDWSC_SC_EXPIRY_DATE>)
    * print "BBDWSC SC Expiry Date is : "+scExpiryDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Expiry Date into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@BBDWSC_SC_EXPIRY_DATE_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                         | BBDWSC_SC_EXPIRY_DATE | DOB  |
      | "5043_Perform Accept Disposition and offer should not display" | "65"                  | "33" |
      | "5043_Perform Delete Disposition and offer should not display" | "70"                  | "34" |

  @NewToCanada @NewToCanada_VWD_RML_NTY_ATP_DispositionTestData @5043 @SOL @RS20043
  Scenario Outline: New To Canada_RS20043_5043_SOL Create test data for view or remind me later or no thank you or accept in progress disposition
    * def testDataFileName = NTCtestDataFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Date to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generating Future Date For inserting into BBDWSC_SC_EXPIRY_DATE Column in the ACCT_DIM
    * def scExpiryDate = <BBDWSC_SC_EXPIRY_DATE> == 'NULL' ? 'NULL' : futureDateInDays(<BBDWSC_SC_EXPIRY_DATE>)
    * print "BBDWSC SC Expiry Date is : "+scExpiryDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Expiry Date into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@BBDWSC_SC_EXPIRY_DATE_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                   | BBDWSC_SC_EXPIRY_DATE | DOB  |
      | "5043_Perform Viewed Disposition and offer should display"               | "70"                  | "33" |
      | "5043_Perform Remind me later Disposition and offer should display"      | "69"                  | "32" |
      | "5043_Perform Accepted In Progress Disposition and offer should display" | "68"                  | "23" |
      | "5043_Perform No Thank You Disposition and offer should display"         | "67"                  | "30" |
