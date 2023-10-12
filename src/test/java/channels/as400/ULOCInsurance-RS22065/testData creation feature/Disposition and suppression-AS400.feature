@Dispositions_TestData_2423
Feature: Create test data for Creditor Insurance-2423 Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

#    Accept Disposition Suppresses for Lead scope: ALL, ACT and DEC

  @CreditorInsurance @CreditorInsurance_Disposition_TestData @2423 @AS400 @VS17084
  Scenario Outline: Creditor Insurance_VS17084_2423_AS400 Create test data for dispositions
    * def testDataFileName = CreditorInsurancetestDataFileName
    #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
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
    Examples:
      | TestID                                                                                              |
      | "2423_Perform Accept Disposition and offer should not display when Lead scope - ALL"                |
      | "2423_Perform Accept Disposition and offer should not display when Lead scope - ACT"                |
      | "2423_Perform Accept Disposition and offer should not display when Lead scope - DEC"                |
      | "2423_Perform Decline Disposition and offer should display when Lead scope - ALL"                   |
      | "2423_Perform Decline Disposition and offer should not display when Lead scope - ACT"               |
      | "2423_Perform Decline Disposition and offer should display when Lead scope - DEC"                   |
      | "2423_Perform Refer to other team Disposition and offer should display  when Lead scope - ALL"      |
      | "2423_Perform Refer to other team Disposition and offer should display when Lead scope - ACT"       |
      | "2423_Perform Refer to other team Disposition and offer should not display when Lead scope - DEC"   |
      | "2423_Perform Refer to Sales Disposition and offer should display when Lead scope - ALL"            |
      | "2423_Perform Refer to Sales Disposition and offer should display when Lead scope - ACT"            |
      | "2423_Perform Refer to Sales Disposition and offer should not display when Lead scope - DEC"        |
      | "2423_Perform Book appointment Disposition and offer should not display when Lead scope - ALL"      |
      | "2423_Perform Book appointment Disposition and offer should not display when Lead scope - ACT"      |
      | "2423_Perform Book appointment Disposition and offer should not display when Lead scope - DEC"      |
      | "2423_Perform Customer Self Service Disposition and offer should not display when Lead scope - ALL" |
      | "2423_Perform Customer Self Service Disposition and offer should not display when Lead scope - ACT" |
      | "2423_Perform Customer Self Service Disposition and offer should not display when Lead scope - DEC" |
      | "2423_Perform Customer Defer Disposition and offer should display when Lead scope - ALL"            |
      | "2423_Perform Customer Defer Disposition and offer should display when Lead scope - ACT"            |
      | "2423_Perform Customer Defer Disposition and offer should not display when Lead scope - DEC"        |


