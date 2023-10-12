@PA_CC_PositiveNegative_5573_TestData_NOVA
Feature: Create test data for PA CC-5573 Nova test data creation

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @PA_CCC_NOVATestData @5573 @NOVA @OP14037 @WithOutCustInSights
  Scenario Outline: PA_CC_OP14037_5573_NOVA Create test data Without Cust_Insights Sheet

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = PACCTestDataNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
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

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')


    Examples:
      | TestID                                                                                                                  |
      | "5573_NOVA_Customer Not Deceased"                                                                                       |
      | "5573_NOVA_CUST_TP_CD = PSNL"                                                                                           |
      | "5573_NOVA_LANG_CD = E"                                                                                                 |
      | "5573_NOVA_LANG_CD = EN"                                                                                                |
      | "5573_NOVA_LANG_CD = F"                                                                                                 |
      | "5573_NOVA_LANG_CD = FR"                                                                                                |
      | "5573_NOVA_LANG_CD = LowerCase_e"                                                                                       |
      | "5573_NOVA_LANG_CD = LowerCase_en"                                                                                      |
      | "5573_NOVA_LANG_CD = LowerCase_f"                                                                                       |
      | "5573_NOVA_LANG_CD = LowerCase_fr"                                                                                      |
      | "5573_NOVA_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD! in (VCL,VLR,VGD,AXG,AXP,AXS,VFF,VFA,VUS) && SRC_ACCT_STAT_CD!=Active" |
      | "5573_NOVA_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                                                 |
      | "5573_NOVA_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                                                   |
      | "5573_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = AXG"                                                                 |
      | "5573_NOVA_PA_CCUL_CUSTOMER.Primary Sub Product Code = GC"                                                              |
      | "N-5573_NOVA_DECEASED_F=Y"                                                                                              |
      | "N-5573_NOVA_DECEASED_F=NULL"                                                                                           |
      | "N-5573_NOVA_CUST_TP_CD!= PSNL"                                                                                         |
      | "N-5573_NOVA_CUST_TP_CD = NULL"                                                                                         |
      | "N-5573_NOVA_LANG_CD = K"                                                                                               |
      | "N-5573_NOVA_LANG_CD = NE"                                                                                              |
      | "N-5573_NOVA_LANG_CD = NULL"                                                                                            |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VCL && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VLR && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VGD && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXG && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXP && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXS && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFF && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFA && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VUS && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5573_NOVA_PA_CCUL_CUSTOMER.Primary Product Code != AXG"                                                              |
      | "N-5573_NOVA_PA_CCUL_CUSTOMER.Primary Sub Product Code != GC"                                                           |
#      | "N-5573_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = AXG && PA_CCUL_CUSTOMER.Primary Sub Product Code = NULL"           |
#      | "N-5573_NOVA_PA_CCUL_CUSTOMER.Primary Product Code = NULL && PA_CCUL_CUSTOMER.Primary Sub Product Code = GC"            |
#      | "N-5573_NOVA_PA_CCUL_Customer is Blank "                                                                                |
      | "N-5573_NOVA_PA_CCUL_Customer.preapprvd start date  = NULL"                                                             |
      | "N-5573_NOVA_PA_CCUL_Customer.preapprvd end date  = NULL"                                                               |
      | "5573_NOVA_VWD_Disposition"                                                                                             |
      | "5573_NOVA_ACT_Disposition"                                                                                             |
      | "5573_NOVA_ATP_Disposition"                                                                                             |
      | "5573_NOVA_Control_Y"                                                                                                   |
      | "N-5573_NOVA_FIRST NAME = NULL"                                                                                         |
      | "N-5573_NOVA_LAST NAME = NULL"                                                                                          |
      | "N-5573_NOVA_GIVEN NAME = NULL"                                                                                         |
      | "N-5573_NOVA_TTL NAME = NULL"                                                                                           |
      | "N-5573_NOVA_PRIM_ADDR_LINE1 = NULL"                                                                                    |
      | "N-5573_NOVA_PRIM_PROV_CD = NULL"                                                                                       |
      | "N-5573_NOVA_PRIM_POST_CD = NULL"                                                                                       |
      | "N-5573_NOVA_PRIM_CITY_CD = NULL"                                                                                       |
      | "N-5573_NOVA_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL"                            |
      | "5573_NOVA_CLOSEST_TRANSIT_NUM!=NULL"                                                                                   |
      | "5573_NOVA_RESP_TRANSIT_NUM!=NULL"                                                                                      |
      | "5573_NOVA_ASSIGNED_FA_TRANSIT!=NULL"                                                                                   |


  @PA_CCC_NOVATestData @5573 @NOVA @OP14037 @WithCustInSights_CC_NOVA
  Scenario Outline: PA_CC_OP14037_5573_NOVA Create test data With Cust_Insights sheet

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = PACCTestDataNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
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

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                |
      | "5573_NOVA_Abandon Offer"                             |
      | "N-5573_NOVA_Abandon Offer_Disposition_AS400 Accept"  |
      | "N-5573_NOVA_Abandon Offer_Disposition_AS400 Decline" |
      | "N-5573_NOVA_Abandon Offer_Unica Disposition_Accept"  |
      | "N-5573_NOVA_Abandon Offer_Unica Disposition_Decline" |

