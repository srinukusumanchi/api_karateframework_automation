@Inbound_CLI_Adhoc
Feature: Create test data for Pre-Approved Credit Limit Increase_Inbound

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI_Inbound_Adhoc_TestData_KS  @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI
        #    Reading testId from Example section
    * def testId = <TestID>

        # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def subString =
    """
    function(stringValue,startIndex,endIndex){
    return stringValue.toString().substring(startIndex,endIndex);
    }
    """
  #     Generating account number to insert into database
    * def accountNumber = '0000000000'+ subString(CID,2,15)
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
      | TestID              |
#      | "4479_InboundGuru1" |
      | "4479_InboundGuru2" |
      | "4479_InboundGuru3" |
      | "4479_InboundGuru4" |
      | "4480_InboundGuru1" |
      | "4480_InboundGuru2" |
      | "4480_InboundGuru3" |
      | "4480_InboundGuru4" |
      | "4481_InboundGuru1" |
      | "4481_InboundGuru2" |
      | "4481_InboundGuru3" |
      | "4481_InboundGuru4" |
      | "4482_InboundGuru1" |
      | "4482_InboundGuru2" |
      | "4482_InboundGuru3" |
      | "4482_InboundGuru4" |

