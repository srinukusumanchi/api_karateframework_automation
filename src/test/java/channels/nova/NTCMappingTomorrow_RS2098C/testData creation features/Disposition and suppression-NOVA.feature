@Dispositions_TestData_5151_NOVA
Feature: Create test data for NTC Engagement Curriculum- Mapping Tomorrow NOVA Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTCMappingTomorrow_DispositionTestData_NOVA @5151 @NOVA @RS2098C
  Scenario Outline: NTC Engagement Curiculum- Mapping Tomorrow_RS2098C_5151_NOVA Create test data for disposition
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTC5151MobPosTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

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
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
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
