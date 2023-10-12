@Dispositions_TestData_5151
Feature: Create test data for NTC Engagement Curriculum - Mapping Tomorrow Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTCEngagementMappingTomorrowTestDataDisp @5151 @SOL @RS2098C
  Scenario Outline: D2D Engagement Curiculum - Mapping Tomorrow SOL Create test data for disposition
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTC5151PosTestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

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

    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                                                                   |
      | "5151_Perform Accept Disposition and offer should not display"                                           |
      | "5151_Perform Viewed Disposition and offer should display"                                               |
      | "5151_Perform Remind me later Disposition and offer should display"                                      |
      | "5151_Perform Delete Disposition and offer should not display"                                           |
      | "5151_Perform Delete and offer should not display change date to +90 days from now offer should display" |
      | "5151_Perform No Thank You Disposition and offer should display"                                         |
      | "5151_Perform Accepted In Progress Disposition and offer should display"                                 |
      | "5151_Perform Accepted completed Disposition and offer should display"                                   |
