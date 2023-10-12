@ET14061
@AS400_1210


Feature: Create test data for AS400 - GIC Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @GIC_AS400 @GIC_AS400_DispositionAndSuppression_TestData @GIC_AS400DispositionAndSuppression_1210 @1210 @4587 @AS400 @ET14061
  Scenario Outline: GIC_AS400 Create test data for Disposition Test Cases Of 1210

    * def testDataFileName = GICtestDataFileName

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                                           | DOB  |MaturityDate |
      | "1210_Perform Accept Disposition and offer should not display when Lead scope - ALL"                                                  | "22" |"21"|
      | "1210_Perform Accept Disposition and offer should not display when Lead scope - ACT"                                                  | "22" |"21"|
      | "1210_Perform Accept Disposition and offer should not display when Lead scope - DEC"                                                  | "22" |"21"|
      | "1210_Perform Decline Disposition and offer should display when Lead scope - ALL"                                                     | "22" |"21"|
      | "1210_Perform Decline Disposition and offer should not display when Lead scope - ACT"                                                 | "22" |"21"|
      | "1210_Perform Decline Disposition and offer should display when Lead scope - DEC"                                                     | "22" |"21"|
      | "1210_Perform Refer to other team Disposition and offer should display  when Lead scope - ALL"                                        | "22" |"21"|
      | "1210_Perform Refer to other team Disposition and offer should display when Lead scope - ACT"                                         | "22" |"21"|
      | "1210_Perform Refer to other team Disposition and offer should not display when Lead scope - DEC"                                     | "22" |"21"|
      | "1210_Perform Refer to Sales Disposition and offer should display when Lead scope - ALL"                                              | "22" |"21"|
      | "1210_Perform Refer to Sales Disposition and offer should display when Lead scope - ACT"                                              | "22" |"21"|
      | "1210_Perform Refer to Sales Disposition and offer should not display when Lead scope - DEC"                                          | "22" |"21"|
      | "1210_Perform Book appointment Disposition and offer should not display when Lead scope - ALL"                                        | "22" |"21"|
      | "1210_Perform Book appointment Disposition and offer should not display when Lead scope - ACT"                                        | "22" |"21"|
      | "1210_Perform Book appointment Disposition and offer should not display when Lead scope - DEC"                                        | "22" |"21"|
      | "1210_Perform Customer Self Service Disposition and offer should not display when Lead scope - ALL"                                   | "22" |"21"|
      | "1210_Perform Customer Self Service Disposition and offer should not display when Lead scope - ACT"                                   | "22" |"21"|
      | "1210_Perform Customer Self Service Disposition and offer should not display when Lead scope - DEC"                                   | "22" |"21"|
      | "1210_Perform Customer Defer Disposition and offer should display when Lead scope - ALL"                                              | "22" |"21"|
      | "1210_Perform Customer Defer Disposition and offer should display when Lead scope - ACT"                                              | "22" |"21"|
      | "1210_Perform Customer Defer Disposition and offer should not display when Lead scope - DEC"                                          | "22" |"21"|
      | "1210_Perform Accept(ATC) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"                | "22" |"21"|
      | "1210_Perform Book Appointment(CSE) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"      | "22" |"21"|
      | "1210_Perform Refer to Sales(RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"        | "22" |"21"|
      | "1210_Perform Decline (DEC) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should not display"          | "22" |"21"|
      | "1210_Perform Refer to Other Team (RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"  | "22" |"21"|
      | "1210_Perform Customer Self-Serve (CSE) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should  display" | "22" |"21"|
      | "1210_Perform Customer Defer (RML) disposition in AS400 Channel and give a SOAP call in NOVA channel then offer should display"       | "22" |"21"|



