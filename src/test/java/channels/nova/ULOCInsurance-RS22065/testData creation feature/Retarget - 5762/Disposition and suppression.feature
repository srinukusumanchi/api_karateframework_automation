@Dispositions_TestData_2423
Feature: Create test data for Creditor Insurance-2423 Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

#    Accept Disposition Suppresses for Lead scope: ALL, ACT and DEC

  @CreditorInsurance @CreditorInsurance_Disposition_TestData @2423 @NOVA @VS17084
  Scenario Outline: Creditor Insurance_VS17084_2423_NOVA Create test data for dispositions
    * def testDataFileName = CreditorInsurancetestDataFileName
    #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(40)
    * print "MOB Last Login Date is", mobLastLoginDate

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

             # insert the MOB last login date into the CUST_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                                                          |
      | "2423_Perform Viewed Disposition and offer should display when Lead scope - ACT"                |
      | "2423_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" |


