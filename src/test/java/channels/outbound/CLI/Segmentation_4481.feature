@Segmentation_TestData @CLI4481_OutboundSegmentation_TestCases_TestData
Feature: Create test data for Pre-Approved Credit Limit Increase - Segmentation test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI4481_Outbound_Segmentation_TestCases_TestData @4481 @OUTBOUND @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - CoBorrower_VS18076_4481_OUTBOUND Create test data for Positive Test Cases


    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    * def acct_num_two = '00000000'+randGen(15)
    * def scd_num_one = randGen(13)

    # Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                           | accountNumber | ScotiaCardNumber | cardNumber  |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard_XBX10"                        | acct_num      | ""               | card_Number |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard_XBX10_AC_1(LESSER acct_odt)"  | acct_num_One  | scd_num          | ""          |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard_XBX10_AC_2(greater acct_odt)" | acct_num_two  | scd_num_one      | ""          |

  # insert the created CID into the OUTBOUND Test data excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_OUTBOUND_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
 # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples


     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @CLI4481_Outbound_Segmentation_TestCases_TestData @4481 @OUTBOUND @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - CoBorrower_VS18076_4481_OUTBOUND Create test data for Positive Test Cases
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

     # Generating Card number to insert into database
    * def cardNumber = randGen(16)
    * print "card number is " + cardNumber

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

 # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                   |
      | "4481_DNS=N,PRIM_PROV_CD=Quebec,No ScotiaCard_XBX10"     |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,No ScotiaCard_XBX10" |
      | "4481_DNS=Y,PRIM_PROV_CD=Quebec,No ScotiaCard_XBX10"     |
      | "4481_DNS=Y,PRIM_PROV_CD=Non-Quebec,No ScotiaCard_XBX10" |


  @CreditLimitIncrease @CLI4481_Outbound_Segmentation_TestCases_TestData @4481 @OUTBOUND @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Co Borrower_VS18076_4481_OUTBOUND Segmentation
      #    Reading testId from Example section
    * def testId = <TestID>

        # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

      # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
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

       # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
      # insert the created CID into the cust_dim database
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


        # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

        # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

       # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                                              |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL<30Days & MOB>30days_XBX10"   |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL<30Days & MOB is NULL_XBX10"  |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL>30Days & MOB<30days_XBX10"   |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL is NULL & MOB<30days_XBX10"  |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL<30Days & MOB<30days_XBX10"   |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL>30Days & MOB>30days_XBX10"   |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL>30Days & MOB is NULL_XBX10"  |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL is NULL & MOB>30days_XBX10"  |
      | "4481_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard,SOL is NULL & MOB is NULL_XBX10" |
      | "4481_DNS=N,PRIM_PROV_CD=Quebec,has ScotiaCard_XBX10"                               |
      | "4481_DNS=Y,PRIM_PROV_CD=Non-Quebec,has ScotiaCard_XBX10"                           |
      | "4481_DNS=Y,PRIM_PROV_CD=Quebec,has ScotiaCard_XBX10"                               |
