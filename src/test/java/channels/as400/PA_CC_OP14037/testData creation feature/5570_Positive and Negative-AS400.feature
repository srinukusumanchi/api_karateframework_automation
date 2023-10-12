@PA_CC_PositiveAndNegative_TestData_5570_AS400
Feature: Create test data for PA_CC-5570 AS400 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @PACCAS400 @PA_CC_AS400_TestData_5570 @5570 @OP14037 @WithOutCustInsights
  Scenario Outline: PA CC_OP14037_5570_AS400 Create test data for Positive Test Cases Without Cust Insights

    * def testDataFileName = PACCTestDataAS400FileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the PA_CCUL_CUSTOMER Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')
  # insert the created CID into the PA_CCUL_CUSTOMER database
    * call read('classpath:channels/as400/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    Examples:
      | TestID                                                                                                                   |
      | "5570_AS400_Customer Not Deceased"                                                                                       |
      | "5570_AS400_CUST_TP_CD = PSNL"                                                                                           |
      | "5570_AS400_LANG_CD = E"                                                                                                 |
      | "5570_AS400_LANG_CD = EN"                                                                                                |
      | "5570_AS400_LANG_CD = F"                                                                                                 |
      | "5570_AS400_LANG_CD = FR"                                                                                                |
      | "5570_AS400_LANG_CD = LowerCase_e"                                                                                       |
      | "5570_AS400_LANG_CD = LowerCase_en"                                                                                      |
      | "5570_AS400_LANG_CD = LowerCase_f"                                                                                       |
      | "5570_AS400_LANG_CD = LowerCase_fr"                                                                                      |
      | "5570_AS400_CLOSEST_TRANSIT_NUM !=NULL or RESP_TRNST_NUM !=NULL or ASSIGNED_FA_TRANSIT !=NULL"                           |
      | "5570_AS400_PRIM_ADDR_LINE_1 !=NULL && PRIM_PROV_CD !=NULL"                                                              |
      | "5570_AS400_PRIM_CITY_NM !=NULL && PRIM_POST_CD !=NULL"                                                                  |
      | "5570_AS400_INDV_FRST_NM !=NULL && INDV_LAST_NM !=NULL && GIVEN_NAME!=NULL"                                              |
      | "5570_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD! in (VCL,VLR,VGD,AXG,AXP,AXS,VFF,VFA,VUS) && SRC_ACCT_STAT_CD!=Active" |
      | "5570_AS400_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                                                   |
      | "5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VCL"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"                                                              |
      | "5570_AS400_PA_CCUL_CUSTOMER.Coexist Product Code = VIC"                                                                 |
      | "5570_AS400_PA_CCUL_CUSTOMER.Coexist Sub Product Code = RG"                                                              |
      | "N-5570_AS400_offer should not return 5 days before file delivery date in scheduler table"                               |
      | "N-5570_AS400_DECEASED_F=Y"                                                                                              |
      | "N-5570_AS400_DECEASED_F=NULL"                                                                                           |
      | "N-5570_AS400_CUST_TP_CD!= PSNL"                                                                                         |
      | "N-5570_AS400_CUST_TP_CD = NULL"                                                                                         |
      | "N-5570_AS400_LANG_CD = K"                                                                                               |
      | "N-5570_AS400_LANG_CD = NE"                                                                                              |
      | "N-5570_AS400_LANG_CD = NULL"                                                                                            |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VCL && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VLR && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VGD && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXG && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXP && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in AXS && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFF && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VFA && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_ACCT_SUBSYS_ID= KS &&SRC_SYS_PRD_CD in VUS && SRC_ACCT_STAT_CD=Active"                                     |
      | "N-5570_AS400_FIRST NAME = NULL"                                                                                         |
      | "N-5570_AS400_LAST NAME = NULL"                                                                                          |
      | "N-5570_AS400_GIVEN NAME = NULL"                                                                                         |
      | "N-5570_AS400_TTL NAME = NULL"                                                                                           |
      | "N-5570_AS400_PRIM_ADDR_LINE1 = NULL"                                                                                    |
      | "N-5570_AS400_PRIM_PROV_CD = NULL"                                                                                       |
      | "N-5570_AS400_PRIM_POST_CD = NULL"                                                                                       |
      | "N-5570_AS400_PRIM_CITY_CD = NULL"                                                                                       |
      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code != VCL"                                                              |
      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code != DM"                                                           |
#      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VCL && PA_CCUL_CUSTOMER.Primary Sub Product Code = NULL"           |
#      | "N-5570_AS400_PA_CCUL_CUSTOMER.Primary Product Code = NULL && PA_CCUL_CUSTOMER.Primary Sub Product Code = DM"            |
      | "N-5570_AS400_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL"                            |
#      | "N-5570_AS400_PA_CCUL_Customer is Blank "                                                                                |
      | "N-5570_AS400_PA_CCUL_Customer.preapprvd start date  = NULL"                                                             |
      | "N-5570_AS400_PA_CCUL_Customer.preapprvd end date  = NULL"                                                               |
      | "5570_AS400_Customer Defer_Disposition"                                                                                  |
      | "5570_AS400_Customer Self-Serve_Disposition"                                                                             |
      | "5570_AS400_Refer to Other Team_Disposition"                                                                             |
      | "5570_AS400_Refer to Sales_Disposition"                                                                                  |
      | "5570_AS400_Book Appointment_Disposition"                                                                                |
      | "5570_AS400_Decline_Disposition"                                                                                         |
      | "5570_AS400_Accept_Disposition"                                                                                          |
      | "5570_AS400_Control_Y"                                                                                                   |



