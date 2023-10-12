@Inbound_Prestaged
Feature: Create test data for Pre-Approved Credit Limit Increase_InboundPrestaged

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI_INPre_TestData_KSnAC  @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - VS18076
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
      | TestID               |
      | "4479_VCL-RG_I_Pre"  |
      | "4479_VCL-ST_I_Pre"  |
      | "4479_VCL-NF_I_Pre"  |
      | "4479_VCL-DM_I_Pre"  |
      | "4479_VLR-RG_I_Pre"  |
      | "4479_VLR-NF_I_Pre"  |
      | "4479_VGD-RG_I_Pre"  |
      | "4479_VGD-ST_I_Pre"  |
      | "4479_VGD-SP_I_Pre"  |
      | "4479_VGD-NF_I_Pre"  |
      | "4480_AXG-GC_I_Pre"  |
      | "4480_AXG-GS_I_Pre"  |
      | "4480_AXS-SC_I_Pre"  |
      | "4480_AXS-SS_I_Pre"  |
      | "4480_AXP-PC_I_Pre"  |
      | "4480_AXG-GC1_I_Pre" |
      | "4480_AXG-GS1_I_Pre" |
      | "4480_AXS-SC1_I_Pre" |
      | "4480_AXS-SS1_I_Pre" |
      | "4480_AXP-PC1_I_Pre" |


  @CreditLimitIncrease @CLI_InPre_TestData_KS  @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI
        #    Reading testId from Example section
    * def testId = <TestID>

        # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      #     Generating Card number to insert into database
    * def cardNumber = randGen(16)
    * print "card number is " + cardNumber

       # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
          # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet')
          # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet')
       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


        # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
        # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

      # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')


    Examples:
      | TestID               |
      | "4481_VCL-DM_I_Pre"  |
      | "4481_VLR-RG_I_Pre"  |
      | "4481_VLR-NF_I_Pre"  |
#      | "4481_VLR-NF1_I_Pre" |
#      | "4482_AXS-SC_I_Pre"  |
#      | "4482_AXS-SS_I_Pre"  |
#      | "4482_AXP-PC_I_Pre"  |
#      | "4482_AXP-PC1_I_Pre" |

