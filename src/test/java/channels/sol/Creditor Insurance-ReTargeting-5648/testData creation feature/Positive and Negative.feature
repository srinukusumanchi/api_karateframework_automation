@PositiveAndNegative_RetargetingOffer_TestData_5648
Feature: Create test data for Creditor Insurance-Retargeting Offer-5648 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditorInsurance_Retargeting @CreditorInsurance_RetargetingSOL_Positive_TestData @5648 @SOL @VS17084
  Scenario Outline: Creditor Insurance_Retargeting_VS17084_5648_SOL Create test data for Positive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                             | Event_Date | Acct_Odt |
#      | "5648_SOL_EMPLOYEE_STAFF_F=NULL"                                                                        | "2"        | "53"     |
#      | "5648_SOL_DO_NOT_SOLICIT_F=N"                                                                           | "2"        | "53"     |
#      | "5648_SOL_DO_NOT_SOLICIT_F=NULL"                                                                        | "2"        | "53"     |
#      | "5648_SOL_CUST_AGE=18"                                                                                  | "2"        | "53"     |
#      | "5648_SOL_CUST_AGE=69"                                                                                  | "2"        | "53"     |
#      | "5648_SOL_CUST_AGE=18 to 69"                                                                            | "2"        | "53"     |
#      | "5648_SOL_ACCT_SUBSYS_ID = KS"                                                                          | "2"        | "53"     |
#      | "5648_SOL_SRC_ACCT_STAT_CD = Open"                                                                      | "2"        | "53"     |
#      | "5648_SOL_CR_CRD_PRTCTN_F = N"                                                                          | "2"        | "53"     |
#      | "5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                 | "2"        | "53"     |
#      | "5648_SOL_CR_CRD_LMT_AMT <50000 andCR_CRD_LMT_AMT >0"                                                   | "2"        | "53"     |
#      | "5648_SOL_CR_CRD_LMT_AMT =50000 andCR_CRD_LMT_AMT >0"                                                   | "2"        | "53"     |
#      | "5648_SOL_ACCT_ODT > 50 days"                                                                           | "2"        | "52"     |
#      | "5648_SOL_ACCT_ODT = 51 days"                                                                           | "2"        | "51"     |
#      | "5648_SOL_CRNT_BAL_AMT < (1.2 x CR_CRD_LMT_AMT)"                                                        | "2"        | "53"     |
#      | "5648_SOL_CRNT_BAL_AMT = (1.2 x CR_CRD_LMT_AMT)"                                                        | "2"        | "53"     |
#      | "5648_SOL_AXG_GC"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_AXG_GS"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_AXP_PC"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_AXS_SC"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_AXS_SS"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_DM"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_NF"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_NH"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_RG"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_SC"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_SL"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_SS"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_ST"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_SV"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VCL_ZZ"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VFA_A1"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VFA_A3"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VFF_F1"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VFF_TR"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VFF_TS"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VGD_NF"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VGD_RG"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VGD_SP"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VGD_ST"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VLR_NF"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VLR_RC"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VLR_RG"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_VUS_RG"                                                                                       | "2"        | "53"     |
#      | "5648_SOL_LANG_CD in en"                                                                                | "2"        | "53"     |
#      | "5648_SOL_LANG_CD in fr"                                                                                | "2"        | "53"     |
      | "5648_SOL_INSIGHT_CD = FLG_CC_INS_ABANDON_APP and CURR_VAL = 1 and Current date - EVENT_DATE = 30 days" | "30"       | "53"     |
      | "5648_SOL_INSIGHT_CD = FLG_CC_INS_ABANDON_APP and CURR_VAL = 1 and Current date - EVENT_DATE < 30 days" | "29"       | "53"     |
#      | "5648_Perform Accept (ATC) Disposition and offer should not display"                                    | "2"        | "53"     |
#      | "5648_Perform Delete (DEL) Disposition and offer should not display"                                    | "2"        | "53"     |
#      | "5648_Perform Viewed (VWD) Disposition and offer should display"                                        | "2"        | "53"     |
#      | "5648_Perform Remind me later (RML) Disposition and offer should display"                               | "2"        | "53"     |
#      | "5648_Perform Accepted In Progress (ATP) Disposition and offer should display"                          | "2"        | "53"     |
#      | "5648_Perform No Thank You (NTY) Disposition and offer should display"                                  | "2"        | "53"     |
      | "5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL = 1" | "NULL"     | "53"     |
      | "5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL > 1" | "NULL"     | "53"     |


  @CreditorInsurance_RetargetingSOL @CreditorInsurance_RetargetingSOL_Negative_TestData @5648 @SOL @VS17084
  Scenario Outline: Creditor Insurance_Retargeting_VS17084_5648_SOL Create test data for Negative Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                  | Event_Date | Acct_Odt |
#      | "N-5648_SOL_DECEASED_F=Y"                         | "2"        | "53"     |
#      | "N-5648_SOL_DECEASED_F=NULL"                      | "2"        | "53"     |
#      | "N-5648_SOL_CUST_TP_CD=NONPSNL"                   | "2"        | "53"     |
#      | "N-5648_SOL_PRIM_CNTRY_CD != CA"                  | "2"        | "53"     |
#      | "N-5648_SOL_EMPLOYEE_STAFF_F=Y"                   | "2"        | "53"     |
#      | "N-5648_SOL_MRKTBLE_F = N"                        | "2"        | "53"     |
#      | "N-5648_SOL_MRKTBLE_F = NULL"                     | "2"        | "53"     |
#      | "N-5648_SOL_DO_NOT_SOLICIT_F=Y"                   | "2"        | "53"     |
#      | "N-5648_SOL_CUST_AGE<18"                          | "2"        | "53"     |
#      | "N-5648_SOL_CUST_AGE>69"                          | "2"        | "53"     |
#      | "N-5648_SOL_CUST_AGE=NULL"                        | "2"        | "53"     |
#      | "N-5648_SOL_ACCT_SUBSYS_ID != KS"                 | "2"        | "53"     |
#      | "N-5648_SOL_SRC_ACCT_STAT_CD != Open"             | "2"        | "53"     |
#      | "N-5648_SOL_CR_CRD_PRTCTN_F = Y"                  | "2"        | "53"     |
#      | "N-5648_SOL_CR_CRD_PRTCTN_F = NULL"               | "2"        | "53"     |
#      | "N-5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = N"         | "2"        | "53"     |
#      | "N-5648_SOL_PRIMARY_ACCT_HOLDER_FLAG = NULL"      | "2"        | "53"     |
#      | "N-5648_SOL_CR_CRD_LMT_AMT>50000"                 | "2"        | "53"     |
#      | "N-5648_SOL_CR_CRD_LMT_AMT<0"                     | "2"        | "53"     |
#      | "N-5648_SOL_AXG_AB"                               | "2"        | "53"     |
#      | "N-5648_SOL_AXP_BC"                               | "2"        | "53"     |
#      | "N-5648_SOL_AXS_CD"                               | "2"        | "53"     |
#      | "N-5648_SOL_VCL_EF"                               | "2"        | "53"     |
#      | "N-5648_SOL_VFA_AC"                               | "2"        | "53"     |
#      | "N-5648_SOL_VFF_GH"                               | "2"        | "53"     |
#      | "N-5648_SOL_VGD_EF"                               | "2"        | "53"     |
#      | "N-5648_SOL_VLR_TH"                               | "2"        | "53"     |
#      | "N-5648_SOL_VUS_AS"                               | "2"        | "53"     |
#      | "N-5648_SOL_Current Date - ACCT_ODT < 50 days"    | "2"        | "49"     |
#      | "N-5648_SOL_Current Date - ACCT_ODT = 50 days"    | "2"        | "50"     |
#      | "N-5648_SOL_CRNT_BAL_AMT > 1.2 x CR_CRD_LMT_AMT"  | "2"        | "53"     |
#      | "N-5648_SOL_LANG_CD = NULL"                       | "2"        | "53"     |
#      | "N-5648_SOL_LANG_CD = ft"                         | "2"        | "53"     |
      | "N-5648_SOL_INSIGHT_CD != FLG_CC_INS_ABANDON_APP"                       | "2"        | "53"     |
      | "N-5648_SOL_CURR_VAL != 1"                                              | "2"        | "53"     |
      | "N-5648_SOL_Current date - EVENT_DATE >  30 days"                       | "31"       | "53"     |
      | "N-5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL < 1"    | "NULL"     | "53"     |
      | "N-5648_SOL_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS && CURR_VAL = NULL" | "NULL"     | "53"     |


  @CreditorInsurance_Retargeting @CreditorInsurance_RetargetingSOL_Positive_TestData_MultipleInsights @5648 @SOL @VS17084
  Scenario Outline: Creditor Insurance_Retargeting_VS17084_5648_SOL Create test data for Positive Test Cases for multiple insights
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CreditorInsuranceSOLRetargetingtestDataFile
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    * def accnumcustinsight = '00000000'+ CID
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID                                                                                                                                                      | Event_Date | Acct_Odt |
      | "5648_SOL_RAB_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE <  30" | "29"       | "54"     |
      | "5648_SOL_RAB_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL > 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE =  30" | "30"       | "54"     |
      | "5648_SOL_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL! = 1,Current date - EVENT_DATE <  30"    | "29"       | "54"     |
      | "5648_SOL_RPC_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL = 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE >  30"     | "31"       | "54"     |
      | "5648_SOL_RAB_INSIGHT_CD = CNT_PAGEVISIT_CREDITOR_INS,CURR_VAL != 1 && INSIGHT_CD = FLG_CC_INS_ABANDON_APP,CURR_VAL = 1,Current date - EVENT_DATE <  30"    | "20"       | "54"     |

