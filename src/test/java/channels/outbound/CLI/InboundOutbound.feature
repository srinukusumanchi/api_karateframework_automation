@InboundOutbound_CLI
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI_InboundOutbound_KSnAC  @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase_VS18076
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
      | TestID                  |
      | "4479_IO_ODisp_VGD-RG"  |
      | "4479_IO_ODisp_VGD-ST"  |
      | "4479_IO_ODisp_VGD-SP"  |
      | "4479_IO_ODisp_VGD-NF"  |
      | "4479_IO_ODisp_VUS-RG"  |
      | "4479_IO_ODisp_VLR-RC"  |
      | "4480_IO_ODisp_AXG-GC"  |
      | "4480_IO_ODisp_AXG-GS"  |
      | "4480_IO_ODisp_AXS-SC"  |
      | "4480_IO_ODisp_AXS-SS"  |
      | "4480_IO_ODisp_AXP-PC"  |
      | "4480_IO_ODisp_AXG-GS1" |

  @CreditLimitIncrease @CLI_InboundOutbound_KS @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase VS18076
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
      | TestID                   |
      | "4479_VCL-RG_IO_InBound" |
      | "4479_VCL-ST_IO_InBound" |
      | "4479_VCL-NF_IO_InBound" |
      | "4480_AXG-GC_IO_InBound" |
      | "4480_AXG-GS_IO_InBound" |
      | "4480_AXS-SC_IO_InBound" |
      | "4481_VCL-DM_IO_InBound" |
      | "4481_VLR-RG_IO_InBound" |
      | "4481_VLR-NF_IO_InBound" |
      | "4482_AXS-SC_IO_InBound" |
      | "4482_AXS-SS_IO_InBound" |
      | "4482_AXP-PC_IO_InBound" |
      | "4481_IO_ODisp_VCL-RG"   |
      | "4481_IO_ODisp_VCL-ST"   |
      | "4481_IO_ODisp_VCL-NF"   |
      | "4481_IO_ODisp_VCL-DM"   |
      | "4482_IO_ODisp_AXG-GC"   |
      | "4482_IO_ODisp_AXG-GS"   |
      | "4482_IO_ODisp_AXS-SC"   |
      | "4482_IO_ODisp_AXS-SS"   |


