@CIMCAMP-391 @Dispositions_TestData_4315_NOVA
Feature: Create test data for D2D Engagement Fund Account-4315 NOVA Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DFundAccount_ATC_VWD_DispositionTestData_NOVA @D2DEngagementFundAccount_ATC_VWD_Disposition_TestData_NOVA @4315 @NOVA @RS18022
  Scenario Outline: D2D Engagement Fund Account_RS18022_4315_NOVA Create test data for accept or Viewed disposition
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
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

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
      | TestID                                                                                          | Acct_Odt | DOB  |
      | "4315_Perform Viewed Disposition and offer should display when Lead scope - ACT"                | "20"     | "21" |
      | "4315_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" | "20"     | "22" |

