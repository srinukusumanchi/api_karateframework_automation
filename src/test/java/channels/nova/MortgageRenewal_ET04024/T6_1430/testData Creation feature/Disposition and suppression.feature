@ET04024 @NOVA @Dispositions
Feature: Create test data for Mortgage Renewals T6 Offer Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewalTestData_NOVA_T6_Dispositions @MortgageRenewal_NOVA_T6_Dispositions_TestData @T6 @1430 @NOVA @ET04024
  Scenario Outline: Mortgage Renewal T6 Offer - Create test data dispositions

        # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                       |
      | "T6_1430_Perform Viewed Disposition and offer should display when Lead scope"                |
      | "T6_1430_Perform Accepted Complete Disposition and offer should not display when Lead scope" |

  @MortgageRenewalTestData_NOVA_T5_Dispositions @MortgageRenewal_NOVA_T5_Dispositions_TestData @T5 @4862 @NOVA @ET04024
  Scenario Outline: Mortgage Renewal T5 Offer - Create test data dispositions

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                       |
      | "T5_4862_Perform Viewed Disposition and offer should display when Lead scope"                |
      | "T5_4862_Perform Accepted Complete Disposition and offer should not display when Lead scope" |

  @MortgageRenewalTestData_NOVA_T4_Dispositions @MortgageRenewal_NOVA_T4_Dispositions_TestData @T4 @4864 @NOVA @ET04024
  Scenario Outline: Mortgage Renewal T4 Offer - Create test data dispositions

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                       |
      | "T4_4864_Perform Viewed Disposition and offer should display when Lead scope"                |
      | "T4_4864_Perform Accepted Complete Disposition and offer should not display when Lead scope" |

  @MortgageRenewalTestData_NOVA_T3_Dispositions @MortgageRenewal_NOVA_T3_Dispositions_TestData @T3 @4866 @NOVA @ET04024
  Scenario Outline: Mortgage Renewal T3 Offer - Create test data dispositions

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                       |
      | "T3_4866_Perform Viewed Disposition and offer should display when Lead scope"                |
      | "T3_4866_Perform Accepted Complete Disposition and offer should not display when Lead scope" |

  @MortgageRenewalTestData_NOVA_T1_Dispositions @MortgageRenewal_NOVA_T1_Dispositions_TestData @T1 @4870 @NOVA @ET04024
  Scenario Outline: Mortgage Renewal T1 Offer - Create test data dispositions

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber |
      | <TestID> | UOAccountNumber | ""        |
      | ACAcc    | ACAccountNumber | SCDNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                                       |
      | "T1_4870_Perform Viewed Disposition and offer should display when Lead scope"                |
      | "T1_4870_Perform Accepted Complete Disposition and offer should not display when Lead scope" |

