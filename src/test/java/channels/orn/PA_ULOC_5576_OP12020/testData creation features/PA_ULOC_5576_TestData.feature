@PA_ULOC_PositiveNegative_5576_TestData_ORN
Feature: Create test data for PA ULOC-5576 Nova test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @PA_ULOCC_ORNTestData @5576 @ORN @OP12020 @WithOutCustInSights_PA_ULOC_ORN_5576
  Scenario Outline: PA_ULOC_OP12020_5576_ORN Create test data Without Cust_Insights Sheet

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = PAULOCTestDataORNTestData
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
      | TestID                                                                                      | PREAPPROVE_ST_DT | PREAPPROVE_END_DT |
      | "5576_ORN_Customer Not Deceased"                                                            | "0"              | "40"              |
      | "5576_ORN_CUST_TP_CD = PSNL"                                                                | "0"              | "40"              |
      | "5576_ORN_LANG_CD = E"                                                                      | "0"              | "40"              |
      | "5576_ORN_LANG_CD = EN"                                                                     | "0"              | "40"              |
      | "5576_ORN_LANG_CD = F"                                                                      | "0"              | "40"              |
      | "5576_ORN_LANG_CD = FR"                                                                     | "0"              | "40"              |
      | "5576_ORN_LANG_CD = LowerCase_e"                                                            | "0"              | "40"              |
      | "5576_ORN_LANG_CD = LowerCase_en"                                                           | "0"              | "40"              |
      | "5576_ORN_LANG_CD = LowerCase_f"                                                            | "0"              | "40"              |
      | "5576_ORN_LANG_CD = LowerCase_fr"                                                           | "0"              | "40"              |
      | "N-5570_ORN_FIRST NAME = NULL"                                                              | "0"              | "40"              |
      | "N-5570_ORN_LAST NAME = NULL"                                                               | "0"              | "40"              |
      | "N-5570_ORN_GIVEN NAME = NULL"                                                              | "0"              | "40"              |
      | "N-5570_ORN_PRIM_ADDR_LINE1 = NULL"                                                         | "0"              | "40"              |
      | "N-5570_ORN_PRIM_PROV_CD = NULL"                                                            | "0"              | "40"              |
      | "N-5570_ORN_PRIM_POST_CD = NULL"                                                            | "0"              | "40"              |
      | "N-5570_ORN_PRIM_CITY_CD = NULL"                                                            | "0"              | "40"              |
      | "N-5570_ORN_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL" | "0"              | "40"              |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = INE"        | "0"              | "40"              |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = CS"         | "0"              | "40"              |
      | "5576_ORN_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = VIC and SRC_SYS_SUB_PRD_CD = RG"         | "0"              | "40"              |
      | "5576_ORN_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                      | "0"              | "40"              |
      | "5576_ORN_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                        | "0"              | "40"              |
      | "5576_ORN_PA_CCUL_CUSTOMER.Primary Product Code = VIC"                                      | "0"              | "40"              |
      | "5576_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code = RG"                                   | "0"              | "40"              |
      | "5576_ORN_PA_CCUL_CUSTOMER.PA_ULOC_LIMIT != NULL"                                           | "0"              | "40"              |
      | "5576_ORN_CLOSEST_TRANSIT_NUM!=NULL"                                                        | "0"              | "40"              |
      | "5576_ORN_RESP_TRANSIT_NUM!=NULL"                                                           | "0"              | "40"              |
      | "5576_ORN_ASSIGNED_FA_TRANSIT!=NULL"                                                        | "0"              | "40"              |
      | "5576_ORN_VWD_Disposition"                                                                  | "0"              | "40"              |
      | "5576_ORN_ACT_Disposition"                                                                  | "0"              | "40"              |
      | "5576_ORN_ATP_Disposition"                                                                  | "0"              | "40"              |
      | "5576_ORN_Control_Y"                                                                        | "0"              | "40"              |
      | "N-5576_ORN_DECEASED_F=Y"                                                                   | "0"              | "40"              |
      | "N-5576_ORN_DECEASED_F=NULL"                                                                | "0"              | "40"              |
      | "N-5576_ORN_CUST_TP_CD!= PSNL"                                                              | "0"              | "40"              |
      | "N-5576_ORN_LANG_CD = K"                                                                    | "0"              | "40"              |
      | "N-5576_ORN_LANG_CD = NE"                                                                   | "0"              | "40"              |
      | "N-5576_ORN_LANG_CD = NULL"                                                                 | "0"              | "40"              |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is INE"     | "0"              | "40"              |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is CS"      | "0"              | "40"              |
      | "N-5576_ORN_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is VIC and SRC_SYS_SUB_PRD_CD is RG"      | "0"              | "40"              |
      | "N-5576_ORN_PA_CCUL_CUSTOMER.Primary Product Code != VIC"                                   | "0"              | "40"              |
      | "N-5576_ORN_PA_CCUL_CUSTOMER.Primary Sub Product Code != RG"                                | "0"              | "40"              |
      | "N-5576_ORN_PA_CCUL_Customer.preapprvd start date  = After The Present Date"                | "0"              | "40"              |
      | "N-5576_ORN_PA_CCUL_Customer.preapprvd end date  = Before The Present Date"                 | "0"              | "40"              |

  @PA_ULOCC_ORNTestData @5576 @ORN @OP12020 @WithCustInSights_ULOC_ORN
  Scenario Outline: PA_ULOC_OP12020_5576_ORN Create test data With Cust_Insights sheet

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = PAULOCTestDataORNTestData
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
      | TestID                                               | PREAPPROVE_ST_DT | PREAPPROVE_END_DT |
      | "5576_ORN_Abandon Offer"                             | "0"              | "40"              |
      | "N-5576_ORN_Abandon Offer_Disposition_AS400 Accept"  | "0"              | "40"              |
      | "N-5576_ORN_Abandon Offer_Disposition_AS400 Decline" | "0"              | "40"              |
      | "N-5576_ORN_Abandon Offer_Unica Disposition_Accept"  | "0"              | "40"              |
      | "N-5576_ORN_Abandon Offer_Unica Disposition_Decline" | "0"              | "40"              |

