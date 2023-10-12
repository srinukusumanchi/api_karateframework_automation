@ExclusionCIDs_TestData
Feature: Create test data for Pre-Approved Credit Limit Increase_ExclusionCIDs

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI_ExclusionCIDs_TestData_KSnAC  @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase Create test data for ExclusionCIDs
    #    Reading testId from Example section
    * def testId = <TestID>

     # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+randGen(15)
    * print "Account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number

    #Generating Scotia card Number to insert into Database
    * def scd_num = randGen(13)
    * print "ScotiaCard is " + scd_num

    * def ACAcc = <TestID>+'_AC'
    * print 'AC Account Test ID is '+ACAcc

    # insert the CUST DIM sheet data into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

     # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ScotiaCardNumber | cardNumber  |
      | <TestID> | acct_num1     | ""               | card_Number |
      | ACAcc    | acct_num2     | scd_num          | ""          |

        # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

     # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID         |
      | "ExclusionCIDs1" |

