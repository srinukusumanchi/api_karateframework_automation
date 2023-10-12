@PA_CC_PositiveNegative_5570_TestData_ORN
Feature: Create test data for PA CC-5570 ORN test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @PA_CCC_ORNTestData_Inchannel_CrossChannel_Disposition_Suppression
  Scenario Outline: PA_CC_OP14037_5570_ORN Create test data for dispositions and suppressions
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = PACCORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string PREAPPROVE_ST_DT = <PREAPPROVE_ST_DT>
    * string PREAPPROVE_END_DT = <PREAPPROVE_END_DT>
    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')
    # insert the created Preapproved start date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created preapproved end date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    * call read('classpath:channels/ORN/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')
    Examples:
      | TestID                                                                                                            | PREAPPROVE_ST_DT | PREAPPROVE_END_DT |
      | "5570_Perform Viewed Disposition in MOB and offer should display in ORN when Lead scope - ACT"                    |"0"              | "40"              |
      | "5570_Perform Accept in Progress Disposition in MOB and offer should display in ORN when Lead scope - ACT"        |"0"              | "40"              |
      | "5570_Perform Accept completed Disposition in MOB and offer should NOT display in ORN when Lead scope - ACT"      |"0"              | "40"              |
      | "5570_Perform Customer Defer Disposition in AS400 and offer should display in ORN when Lead scope - ACT"          |"0"              | "40"              |
      | "5570_Perform Customer Self-Serve Disposition in AS400 and offer should display in ORN when Lead scope - ACT"     |"0"              | "40"              |
      | "5570_Perform Refer to Other Team Disposition in AS400 and offer should display in ORN when Lead scope - ACT"     |"0"              | "40"              |
      | "5570_Perform Refer to Sales Disposition in AS400 and offer should display in ORN when Lead scope - ACT"          |"0"              | "40"              |
      | "5570_Perform Book Appointment Disposition in AS400 and offer should display in ORN when Lead scope - ACT"        |"0"              | "40"              |
      | "5570_Perform Decline Disposition in AS400 and offer should NOT display in ORN when Lead scope - ACT"             |"0"              | "40"              |
      | "5570_Perform Accept Disposition in AS400 and offer should NOT display in ORN when Lead scope - ACT"              |"0"              | "40"              |
      | "5570_Perform Viewed Disposition  in ORN and offer should display in AS400 when Lead scope - ALL"                 |"0"              | "40"              |
      | "5570_Perform Viewed Disposition  in ORN and offer should display in AS400 when Lead scope - ACT"                 |"0"              | "40"              |
      | "5570_Perform Viewed Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC"             |"0"              | "40"              |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should display in AS400 when Lead scope - ALL"     |"0"              | "40"              |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should display in AS400 when Lead scope - ACT"     |"0"              | "40"              |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC" |"0"              | "40"              |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - ALL"   |"0"              | "40"              |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - ACT"   |"0"              | "40"              |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in AS400 when Lead scope - DEC"   |"0"              | "40"              |
      | "5570_Perform Accept Completed Disposition  in ORN and offer should not display in MOB when Lead scope - ACT"     |"0"              | "40"              |
      | "5570_Perform Viewed Disposition  in ORN and offer should not display in MOB when Lead scope - ACT"               |"0"              | "40"              |
      | "5570_Perform Accept in Progress Disposition  in ORN and offer should display in MOB when Lead scope - ACT"       |"0"              | "40"              |

