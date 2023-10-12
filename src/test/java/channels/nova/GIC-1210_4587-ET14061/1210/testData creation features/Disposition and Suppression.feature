@ET14061
@NOVA_1210

Feature: Create test data for NOVA - GIC Renewal Investments Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @GICTestData_NOVA @GIC_NOVA_DispositionSuppression_TestCases_TestData @GIC_NOVA_DispositionSuppressionTestCases_1210 @1210  @NOVA @ET14061
  Scenario Outline: GIC Renewal Investments_NOVA Create test data for Disposition and Suppression Test Cases Of 1210

    * def testDataFileName = GICtestDataFileName


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT



    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')


          # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')


    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

     # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                                                                                                                         | MaturityDate |
      | "1210_Perform Accept Completed Disposition and offer should display when Lead scope - ACT"                                                                     | "21"         |
      | "1210_Perform Viewed Disposition and offer should display when Lead scope - ACT"                                                                               | "21"         |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=ALL then offer should not display"        | "21"         |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=DEC then offer should not display"        | "21"         |
      | "1210_Perform Accept Completed(ATC) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=TP3 or ACT then offer should not display" | "21"         |
      | "1210_Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=TP3 or ACT then offer should display"               | "21"         |
      | "1210_Perform Viewed(VWD)  disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=DEC then offer should not display"                 | "21"         |
      | "1210_Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in AS400 channel with LeadScope=ALL then offer should display"                      | "21"         |
