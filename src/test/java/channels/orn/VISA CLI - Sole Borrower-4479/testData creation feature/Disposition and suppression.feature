@CIMCAMP-418 @Dispositions_TestData_4479
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Disposition and Suppression test cases for ORN channel

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease_DispositionTestData @CreditLimitIncreaseVISASoloBorrower_Disposition_TestData_ORN @4479 @ORN @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data dispositions
    * def testDataFileName = CLItestDataFileName
    #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber
    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')


    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                                                          |
      | "4479_Perform Viewed Disposition and offer should display when Lead scope - ACT"                |
      | "4479_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" |




