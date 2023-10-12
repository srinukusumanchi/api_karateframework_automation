@HighestApprovedCreditAndLowestAcctNumbers_TestData_4479_ORN
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Highest credit and lowest account number test cases for ORN channel

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

# Highest Credit limit - VISA Solo and Amex Solo - Scenario -1
  @CreditLimitIncrease_HighestCreditTestData_ORN @CreditLimitIncreaseVISAAmexSoloBorrower_HighestCredit_TestData_ORN @4479 @ORN @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Highest credit limit for solo borrowers(Visa and Amex)
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

      # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                             | accountNumber |
      | "4479_Highest approved credit limit shows offer for Visa solo borrower_Scenario-1" | acct_num      |
      | "4479_Highest approved credit limit shows offer for Amex solo borrower_Scenario-1" | acct_num_One  |


  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples


     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - VISA Solo and Amex Solo - Scenario -1
  @CreditLimitIncrease_HighestCreditTestData_ORN @CreditLimitIncreaseVISASoloBorrower_lowestAcctNum_TestData_ORN @4479 @ORN @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for lowest account number for solo borrowers(Visa and Amex)
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = '37'+randGen(13)
    * print  "Random generated CID is "+CID

      # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '0000000047'+randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                        | accountNumber |
      | "4479_Lowest account number shows offer when amount is tie for Visa solo borrower_Scenario-1" | acct_num      |
      | "4479_Lowest account number shows offer when amount is tie for Amex solo borrower_Scenario-1" | acct_num_One  |


  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples


     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet') examples


    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Highest Credit limit - VISA Solo and VISA Solo - Scenario -2
  @CreditLimitIncrease_HighestCreditTestData_ORN @CreditLimitIncreaseVISASoloBorrowers_HighestCredit_TestData_ORN @4479 @ORN @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for Highest credit limit for solo borrowers(Visa and Visa)
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                               | accountNumber |
      | "4479_Highest approved credit limit shows offer for Visa-1 solo borrower_Scenario-2" | acct_num      |
      | "4479_Highest approved credit limit shows offer for Visa-2 solo borrower_Scenario-2" | acct_num_One  |


  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples


     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

     # Lowest Account Number - VISA Solo and VISA Solo - Scenario -2
  @CreditLimitIncrease_HighestCreditTestData_ORN @CreditLimitIncreaseVISASoloBorrower_lowestAcctNum_TestData_ORN @4479 @ORN @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_ORN Create test data for lowest account number for solo(Visa and Visa)
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = '37'+randGen(13)
    * print  "Random generated CID is "+CID

      # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '0000000047'+randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                          | accountNumber |
      | "4479_Lowest account number shows offer when amount is tie for Visa-1 solo borrower_Scenario-2" | acct_num      |
      | "4479_Lowest account number shows offer when amount is tie for Visa-2 solo borrower_Scenario-2" | acct_num_One  |


  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples


     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples