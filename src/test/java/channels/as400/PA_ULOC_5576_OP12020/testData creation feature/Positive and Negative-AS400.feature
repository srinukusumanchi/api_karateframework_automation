@PA_ULOC_PositiveAndNegative_TestData_5576_AS400
Feature: Create test data for PA_ULOC-5576 AS400 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @PAULOCAS400 @PA_ULOC_AS400_TestData @5576 @OP12020 @WithOutCustInsights
  Scenario Outline: PA ULOC_OP12020_5576_AS400 Create test data for Positive Test Cases Without Cust Insights

    * def testDataFileName = PAULOCTestDataAS400FileName
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
      | TestID                                                                                          |
#      | "5576_AS400_Customer Not Deceased"                                                              |
#      | "5576_AS400_offer should return only 5 days after file delivery date in scheduler table"        |
#      | "5576_AS400_CUST_TP_CD = PSNL"                                                                  |
#      | "5576_AS400_LANG_CD = E"                                                                        |
#      | "5576_AS400_LANG_CD = EN"                                                                       |
#      | "5576_AS400_LANG_CD = F"                                                                        |
#      | "5576_AS400_LANG_CD = FR"                                                                       |
#      | "5576_AS400_LANG_CD = LowerCase_e"                                                              |
#      | "5576_AS400_LANG_CD = LowerCase_en"                                                             |
#      | "5576_AS400_LANG_CD = LowerCase_f"                                                              |
#      | "5576_AS400_LANG_CD = LowerCase_fr"                                                             |
#      | "5576_AS400_CLOSEST_TRANSIT_NUM !=NULL or RESP_TRNST_NUM !=NULL or ASSIGNED_FA_TRANSIT !=NULL"  |
#      | "5576_AS400_PRIM_ADDR_LINE_1 !=NULL && PRIM_PROV_CD !=NULL"                                     |
#      | "5576_AS400_PRIM_CITY_NM !=NULL && PRIM_POST_CD !=NULL"                                         |
#      | "5576_AS400_INDV_FRST_NM !=NULL && INDV_LAST_NM !=NULL && GIVEN_NAME!=NULL"                     |
#      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = INE"          |
#      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = SCL and SRC_SYS_SUB_PRD_CD = CS"           |
#      | "5576_AS400_ACCT_SUBSYS_ID!= KS && SRC_SYS_PRD_CD  = VIC and SRC_SYS_SUB_PRD_CD = RG"           |
#      | "5576_AS400_PA_CCUL_CUSTOMER.preapprvd start date!=NULL"                                        |
#      | "5576_AS400_PA_CCUL_CUSTOMER.preapprvd end date!=NULL"                                          |
#      | "5576_AS400_PA_CCUL_CUSTOMER.Primary Product Code = VIC"                                        |
#      | "5576_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code = RG"                                     |
      | "5576_AS400_PA_CCUL_CUSTOMER.Coexist_Preapproved_End_Date !=NULL"                               |
      | "5576_AS400_PA_CCUL_CUSTOMER.CoExist_Product_Code != NULL "                                     |
      | "5576_AS400_PA_CCUL_CUSTOMER.CoExist_Sub_Product_Code != NULL"                                  |
#      | "5576_AS400_PA_CCUL_CUSTOMER.PA_CC_LIMIT !=NULL"                                                |
#      | "5576_AS400_PA_CCUL_CUSTOMER.USPO_RATE !=NULL"                                                  |
#      | "5576_AS400_PA_CCUL_CUSTOMER.BILL_CODE !=NULL"                                                  |
#      | "N-5576_AS400_offer should not return 5 days before file delivery date in scheduler table"      |
#      | "N-5576_AS400_DECEASED_F=Y"                                                                     |
#      | "N-5576_AS400_DECEASED_F=NULL"                                                                  |
#      | "N-5576_AS400_CUST_TP_CD!= PSNL"                                                                |
#      | "N-5576_AS400_LANG_CD = K"                                                                      |
#      | "N-5576_AS400_LANG_CD = NE"                                                                     |
#      | "N-5576_AS400_LANG_CD = NULL"                                                                   |
#      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is INE"       |
#      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is SCL and SRC_SYS_SUB_PRD_CD is CS"        |
#      | "N-5576_AS400_ACCT_SUBSYS_ID = KS && SRC_SYS_PRD_CD is VIC and SRC_SYS_SUB_PRD_CD is RG"        |
#      | "N-5576_AS400_PA_CCUL_CUSTOMER.Primary Product Code != VIC"                                     |
#      | "N-5576_AS400_PA_CCUL_CUSTOMER.Primary Sub Product Code != RG"                                  |
#      | "N-5576_AS400_CLOSEST_TRANSIT_NUM =NULL && RESP_TRNST_NUM =NULL && ASSIGNED_FA_TRANSIT =NULL"   |
#      | "N-5576_AS400_PRIM_ADDR_LINE_1 =NULL"                                                           |
#      | "N-5576_AS400_PRIM_PROV_CD =NULL"                                                               |
#      | "N-5576_AS400_PRIM_CITY_NM =NULL"                                                               |
#      | "N-5576_AS400_PRIM_POST_CD =NULL"                                                               |
#      | "N-5576_AS400_INDV_FRST_NM =NULL"                                                               |
#      | "N-5576_AS400_INDV_LAST_NM =NULL"                                                               |
#      | "N-5576_AS400_GIVEN_NAME =NULL"                                                                 |
#      | "N-5576_AS400_PA_CCUL_Customer.preapprvd start date  = After The Present Date"                  |
#      | "N-5576_AS400_PA_CCUL_Customer.preapprvd end date  = Before The Present Date"                   |
#      | "5576_AS400_Customer Defer_Disposition"                                                         |
#      | "5576_AS400_Customer Self-Serve_Disposition"                                                    |
#      | "5576_AS400_Refer to Other Team_Disposition"                                                    |
#      | "5576_AS400_Refer to Sales_Disposition"                                                         |
#      | "5576_AS400_Book Appointment_Disposition"                                                       |
#      | "5576_AS400_Decline_Disposition"                                                                |
#      | "5576_AS400_Accept_Disposition"                                                                 |
#      | "5576_AS400_Perform Accept Disposition  in AS400 and offer should not display in MOB"           |
#      | "5576_AS400_Perform Decline Disposition in AS400 and offer should not display in MOB"           |
#      | "5576_AS400_Perform Refer to other team Disposition in AS400 and offer should display in MOB"   |
#      | "5576_AS400_Perform Refer to Sales Disposition in AS400 and offer should display in MOB"        |
#      | "5576_AS400_Perform Book appointment Disposition in AS400 and offer should display in MOB"      |
#      | "5576_AS400_Perform Customer Self Service Disposition in AS400 and offer should display in MOB" |
#      | "5576_AS400_Perform Customer Defer Disposition in AS400 and offer should display in MOB"        |
#      | "5576_AS400_Control_Y"                                                                          |