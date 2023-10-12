Feature:Create test data for AS400 - CLI 4481 Multiple Customers test cases

  Background:

# Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CreditLimitIncreaseVISACoBorrower_IH_SecCustomer_Validation_TestData @4481 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co-Borrower_VS18076_4481_IH Sec _Customer_AS400 Create test data for validating IH field values

    * def testDataFileName = CLItestDataFileName
      #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Random cid to insert into database
    * def secondaryCid = randGen(15)
    * print  "Secondary CID is "+secondaryCid

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')


      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

      # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

  # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId   | CID          |
      | <TestID> | CID          |
      | secCust  | secondaryCid |


  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim
    Examples:
      | TestID                                               |
      | "4481_Validate IH Record fields against Proposition" |