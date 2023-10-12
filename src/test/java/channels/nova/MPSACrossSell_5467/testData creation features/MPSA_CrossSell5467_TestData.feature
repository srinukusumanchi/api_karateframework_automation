@MPSA_CrossSell_Nova_5467_Positive_Negative_TestData
Feature: Create test data for MPSA Cross Sell-5467 Nova Positive And Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MPSACrossSell_NOVA_11111_WithOutEventDate @5467 @NOVA @RS21097 @11111
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                         | ACCT_ODT |
#      | "5467_CUST_TP_CD=PSNL,5467_Primary Country Cd = CA,5467_MRKTBLE_F = Y,5467_Customer Not Decease" | "92"     |
#      | "5467_CUST_AGE >18"                                                                                                                                    | "93"     |
#      | "5467_CUST_AGE=18"                                                                                                                                     | "93"     |
#      | "5467_LANG_CD in small case_en"                                                                                                                        | "94"     |
#      | "5467_LANG_CD in small case_fr"                                                                                                                        | "95"     |
#      | "5467_NOT_AML_KYC = N"                                                                                                                                 | "93"     |
#      | "5467_NOT_AML_KYC = NULL"                                                                                                                              | "93"     |
#      | "5467_ACCT_ODT>90"                                                                                                                                     | "92"     |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                  | "93"     |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                  | "93"     |
#      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                  | "93"     |
#      | "5467_PRD CODE=01  SUB PRD CD=01"                                                                                                                      | "93"     |
#      | "5467_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                      | "93"     |
#      | "5467_PRD CODE=AXP SUB PRD CD=PC"                                                                                                                      | "93"     |
#      | "5467_PRD CODE=VLR SUB PRD CD=RC"                                                                                                                      | "93"     |
#      | "5467_PRD CODE=VFF SUB PRD CD=TR"                                                                                                                      | "93"     |
#      | "5467_PRD CODE=VGD SUB PRD CD=RG"                                                                                                                      | "93"     |
#      | "N-5467_CUST_TP_CD != PSNL"                                                                                                                            | "93"     |
#      | "N-5467_Primary Country Cd != CA"                                                                                                                      | "93"     |
#      | "N-5467_Primary Country Cd = NULL"                                                                                                                     | "93"     |
#      | "N-5467_CUST_AGE < 18"                                                                                                                                 | "93"     |
#      | "N-5467_CUST_AGE = NULL"                                                                                                                               | "93"     |
#      | "N-5467_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                 | "93"     |
#      | "N-5467_LANG_CD = NULL"                                                                                                                                | "93"     |
#      | "N-5467_MRKTBLE_F = N"                                                                                                                                 | "93"     |
#      | "N-5467_MRKTBLE_F = NULL"                                                                                                                              | "93"     |
#      | "N-5467_NOT_AML_KYC = Y"                                                                                                                               | "93"     |
#      | "N-5467_Customer Decease - Y"                                                                                                                          | "93"     |
#      | "N-5467_Customer Decease - NULL"                                                                                                                       | "93"     |
#      | "N-5467_ACCT_ODT < 90 Days"                                                                                                                            | "90"     |
#      | "N-5467_ACCT_ODT = 90 Days"                                                                                                                            | "91"     |
#      | "5467_ACCT_ODT = NULL"                                                                                                                                 | "NULL"   |
#      | "5467_PRD CD = 01 SUB PRD CD = 07"                                                                                                                     | "93"     |
#      | "5467_PRD CD = 02 SUB PRD CD = 05"                                                                                                                     | "93"     |
#      | "5467_PRD CD = 19 SUB PRD CD = 05"                                                                                                                     | "93"     |
#      | "5467_PRD CD = 13 SUB PRD CD = 05"                                                                                                                     | "93"     |
#      | "5467_PRD CD = 07 SUB PRD CD = 01"                                                                                                                     | "93"     |
#      | "5467_PRD CD = 23 SUB PRD CD = 02"                                                                                                                     | "93"     |
#      | "5467_PRD CD = VGD SUB PRD CD= AB"                                                                                                                     | "93"     |
#      | "5467_PRD CD = VCL SUB PRD CD= BC"                                                                                                                     | "93"     |
#      | "5467_PRD CD = VLR SUB PRD CD= CD"                                                                                                                     | "93"     |
#      | "5467_SRC_ACCT_STAT_CD! =  A"                                                                                                                          | "93"     |
#      | "5467_SRC_ACCT_STAT_CD! = Open"                                                                                                                        | "93"     |
#      | "5467_SRC_ACCT_STAT_CD = NULL"                                                                                                                         | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                               | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                               | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                             | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL => 1"                                                                | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"                                                                  | "93"     |
#      | "N-5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = NULL"                                                               | "93"     |
#      | "5467_PHYSICIANS_F = NULL"                                                                                                                             | "93"     |
#      | "5467_MD_FINANCIAL_F = NULL"                                                                                                                           | "93"     |
#      | "5467_ITRADE_MCLEOD_F = NULL"                                                                                                                          | "93"     |
#      | "5467_DEDICATED_INVSTMNT_ADVISOR_F = NULL"                                                                                                             | "93"     |
#      | "N-5467_PHYSICIANS_F = Y"                                                                                                                              | "93"     |
#      | "N-5467_MD_FINANCIAL_F = Y"                                                                                                                            | "93"     |
#      | "N-5467_ITRADE_MCLEOD_F = Y"                                                                                                                           | "93"     |
#      | "N-5467_DEDICATED_INVSTMNT_ADVISOR_F = Y"                                                                                                              | "93"     |
#      | "N-5467_PRD CD = 01 SUB PRD CD = 04 And Acct_odt<=90"                                                                                                  | "89"     |
#      | "N-5467_PRD CD = 02 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  | "88"     |
#      | "N-5467_PRD CD = 19 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  | "87"     |
#      | "N-5467_PRD CD = 13 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  | "86"     |
#      | "N-5467_PRD CD = 07 SUB PRD CD = 11 And Acct_odt<=90"                                                                                                  | "85"     |
#      | "N-5467_PRD CD = 23 SUB PRD CD = 01 And Acct_odt<=90"                                                                                                  | "84"     |
#      | "N-5467_PRD CD = VGD SUB PRD CD = NF And Acct_odt<=90"                                                                                                 | "83"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = ZZ And Acct_odt<=90"                                                                                                 | "82"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = SS And Acct_odt<=90"                                                                                                 | "81"     |
#      | "N-5467_PRD CD = VLR SUB PRD CD = RG And Acct_odt<=90"                                                                                                 | "80"     |
#      | "N-5467_PRD CD = VLR SUB PRD CD = NF And Acct_odt<=90"                                                                                                 | "79"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = DM And Acct_odt<=90"                                                                                                 | "78"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = RG And Acct_odt<=90"                                                                                                 | "77"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = NF And Acct_odt<=90"                                                                                                 | "76"     |
#      | "N-5467_PRD CD = VCL SUB PRD CD = SV And Acct_odt<=90"                                                                                                 | "75"     |
#      | "N-5467_PRD CD = VFA SUB PRD CD = A1 And Acct_odt<=90"                                                                                                 | "74"     |
#      | "N-5467_PRD CD = VFF SUB PRD CD = F1 And Acct_odt<=90"                                                                                                 | "73"     |
#      | "N-5467_PRD CD = AXG SUB PRD CD = GC And Acct_odt<=90"                                                                                                 | "72"     |
#      | "N-5467_PRD CD = AXS SUB PRD CD = SC And Acct_odt<=90"                                                                                                 | "71"     |
#      | "N-5467_PRD CD = AXP SUB PRD CD = PC And Acct_odt<=90"                                                                                                 | "70"     |
#      | "N-5467_PRD CD = VLR SUB PRD CD = RC And Acct_odt<=90"                                                                                                 | "69"     |
#      | "N-5467_PRD CD = VFF SUB PRD CD = TR And Acct_odt<=90"                                                                                                 | "68"     |
#      | "N-5467_PRD CD = VGD SUB PRD CD = RG And Acct_odt<=90"                                                                                                 | "67"     |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account"                                              | "94"     |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And ACCT_SUBSYS_ID != BB"                     | "95"     |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And SRC_ACCT_STAT_CD != A"                    | "96"     |
#      | "N-5467_NOVA_01_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Ultimate Account And PRIMARY_ACCT_HOLDER_FLAG != Y"            | "97"     |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account"                                         | "98"     |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account"                                             | "99"     |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred"                                   | "93"     |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account"                                                                                        | "93"     |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account"                                                                                   | "93"     |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account"                                                                                       | "93"     |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred"                                                                             | "93"     |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And ACCT_SUBSYS_ID != BB"                | "93"     |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And SRC_ACCT_STAT_CD != A"               | "93"     |
#      | "N-5467_NOVA_02_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With MCB Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"       | "93"     |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And ACCT_SUBSYS_ID != BB"                    | "93"     |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And SRC_ACCT_STAT_CD != A"                   | "93"     |
#      | "N-5467_NOVA_03_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"           | "93"     |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And ACCT_SUBSYS_ID != BB"          | "93"     |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And SRC_ACCT_STAT_CD != A"         | "93"     |
#      | "N-5467_NOVA_04_Creative_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1 With Other no Ultimate-Preferred And PRIMARY_ACCT_HOLDER_FLAG != Y" | "93"     |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And ACCT_SUBSYS_ID != BB"                                                               | "93"     |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And SRC_ACCT_STAT_CD != A"                                                              | "93"     |
#      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                      | "93"     |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And ACCT_SUBSYS_ID != BB"                                                          | "93"     |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And SRC_ACCT_STAT_CD != A"                                                         | "93"     |
#      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                 | "93"     |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And ACCT_SUBSYS_ID != BB"                                                              | "93"     |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And SRC_ACCT_STAT_CD != A"                                                             | "93"     |
#      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account And PRIMARY_ACCT_HOLDER_FLAG != Y"                                                     | "93"     |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And ACCT_SUBSYS_ID != BB"                                                    | "93"     |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And SRC_ACCT_STAT_CD != A"                                                   | "93"     |
#      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred And PRIMARY_ACCT_HOLDER_FLAG != Y"                                           | "93"     |
#      | "N_5467_HAS_CLOSED_MPSA_F !=  N"                                                                                                                       | "93"     |
#      | "N_5467_HAS_CLOSED_MPSA_F =  NULL"                                                                                                                     | "93"     |

  ## Added for april 13 2023 rel ## Removed DNS for inbound
      | "5467_DO_NOT_SOLICIT_F = Y"    | "92"     |
      | "5467_DO_NOT_SOLICIT_F = NULL" | "92"     |
      | "5467_DO_NOT_SOLICIT_F = N"    | "92"     |

    ## Added for april 13 2023 rel ## Trigger5 with CUST_EV_EB.EV_RT_HISA_XSELL >= DSS setting
  @MPSACrossSell_NOVA_11111_WithOutCUSTINSIGHTS_TESTDATA @5467 @NOVA @RS21097 @11111
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11111 WithOutCUSTINSIGHTS

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                     | ACCT_ODT |
#      | "5467_Trigger5"                                               | "92"     |
#      | "5467_EV_RT_HISA_XSELL _eq_DSS_Name_MPSA_Xsell_RS21097"       | "92"     |
#      | "5467_EV_RT_HISA_XSELL_gt_DSS_Name_MPSA_Xsell_RS21097"        | "92"     |
#      | "N_5467_Trigger5_EV_RT_HISA_XSELL _lt_DSS_MPSA_Xsell_RS21097" | "92"     |
      | "N_5467_Trigger5_EV_RT_HISA_XSELL_eq_NULL" | "92"     |


  @MPSACrossSell_NOVA_11111_With_EventDate @5467 @NOVA @RS21097 @11111WithEventDate
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11111 With Event Date

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                                               | ACCT_ODT | Event_Date |
      | "5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"    | "92"     | "29"       |
      | "5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"    | "93"     | "30"       |
      | "N-5467_INSIGHT_CD != FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" | "94"     | "1"        |
      | "N-5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL != 1 and CURRENT_DATE - EVENT_DATE < 30 days" | "95"     | "5"        |
      | "N-5467_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE > 30 days"  | "96"     | "31"       |

  @MPSACrossSell_NOVA_11221WithoutEventDate @5467 @NOVA @RS21097 @11221
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11221

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

   # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    * def Acc2 = <TestID>+'_Account_2'
    * print 'Account 2 Test ID is '+Acc2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                                                                                | ACCT_ODT |
      | "5467_SRC_SYS_PRD_CD != BSAMP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" | "92"     |
      | "5467_SRC_SYS_PRD_CD = BSAMP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" | "93"     |
      | "5467_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  | "94"     |
      | "N-5467_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active" | "95"     |
      | "5467_NOVA_05_07_with Ultimate_Preferred_Account_MCB_IND != Y"                        | "96"     |
      | "5467_NOVA_05_07_with Ultimate_Preferred_Account_MCB_IND = Y"                         | "94"     |

  @MPSACrossSell_NOVA_11112_With_EventDate @5467 @NOVA @RS21097 @11112_WithEventDate
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11112 With Event Date

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

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
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_Account_2'
    * print 'Customer 2 Test ID is '+Cust2

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') examples

      # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                               | ACCT_ODT | Event_Date |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1"                               | "93"     | "NULL"     |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1"                               | "92"     | "NULL"     |
      | "5467_CUST_INSIGHTS.INSIGHT_CD =FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1)  AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"                              | "92"     | "NULL"     |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL! = 1)  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1)"                            | "92"     | "NULL"     |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" | "92"     | "29"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days" | "92"     | "30"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"   | "92"     | "28"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days"   | "92"     | "1"        |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"   | "92"     | "30"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days"   | "92"     | "30"       |
      | "5467_NOVA_05_Creative_Not Auto-Enrolled with Ultimate Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                           | "94"     | "NULL"     |
      | "5467_NOVA_06_Creative_Not Auto-Enrolled with MCB Preferred Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                      | "94"     | "NULL"     |
      | "5467_NOVA_07_Creative_Not Auto-Enrolled with Preferred Account_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                          | "94"     | "NULL"     |
      | "5467_NOVA_08_Creative_Not Auto-Enrolled with Other no Ultimate-Preferred_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                | "94"     | "NULL"     |
      | "N-5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_CONTROL and CURR_VAL=1"                                                                                                                               | "94"     | "NULL"     |
      | "N-5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL = 1"                                                                                                                              | "94"     | "NULL"     |
      | "5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_CONTROL and CURR_VAL!=1"                                                                                                                                | "94"     | "NULL"     |
      | "5467_NOVA_INSIGHT_CD = FLG_MPSA_ACQ_RS22021_TARGET and CURR_VAL != 1"                                                                                                                               | "94"     | "NULL"     |

  @MPSACrossSell_NOVA_11113_With_EventDate @5467 @NOVA @RS21097 @11113_WithEventDate
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for 11113 With Event Date

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

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
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_Account_2'
    * print 'Customer 2 Test ID is '+Cust2

    * def Cust3 = <TestID>+'_Account_3'
    * print 'Customer 3 Test ID is '+Cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |
      | Cust3    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') examples

      # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                                                                                                | ACCT_ODT | Event_Date |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" | "92"     | "29"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE < 30 days" | "92"     | "5"        |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days" | "93"     | "30"       |
      | "5467_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1 AND INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CUST_INSIGHTS.CURR_VAL = 1 and CURRENT_DATE - EVENT_DATE = 30 days" | "94"     | "30"       |

    ##Added for april 13 2023 rel trigger4
  @MPSACrossSell_NOVA_11111_External_input_table_testdata @5467 @NOVA @RS21097 @11111
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for External input table

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
#

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

   ###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')


    Examples:
      | TestID                                             | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
      | "5467_Trigger4"                                    | "92"     | 5                | -5
      | "5467_Current Date_eq_VALID_START_DATE"            | "92"     | 0                | -5             |
      | "5467_VALID_END_DATE_eq_Current Date"              | "92"     | 5                | 0              |
      | "N_5467_Trigger4_CAMPAIGN_CODE_ne_RS21097"         | "92"     | 5                | -5             |
      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_ne_5467"       | "92"     | 5                | -5             |
      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_eq_NULL"       | "92"     | 5                | -5             |
      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_FLAG_eq_N"     | "92"     | 5                | -5             |
      | "N_5467_Trigger4_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"  | "92"     | 5                | -5             |
      | "N_5467_Trigger4_Current Date_lt_VALID_START_DATE" | "92"     | -1               | -5             |
      | "N_5467_Trigger4_VALID_END_DATE_lt_Current Date"   | "92"     | 5                | 1              |
      | "N_5467_Trigger4_NOVA_CHANNEL_eq_N"                | "92"     | 5                | -5             |
      | "N_5467_Trigger4_NOVA_CHANNEL_eq_NULL"             | "92"     | 5                | -5             |
      | "N_5467_Trigger4_CAMPAIGN_CELL_DESC_eq_NULL"       | "92"     | 5                | -5             |

              ## Added for JUNE 22 2023 REL Exclusion Scenarios

  @MPSACrossSell_NOVA_11111_External_input_table_Exclusion_testdata @5467 @NOVA @RS21097 @11111
  Scenario Outline: MPSA Cross Sell_RS21097_5467_NOVA Create test data for External input table exclusion

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
#

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

        # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
      # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
      # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

     ###To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')


    Examples:
      | TestID                                                                                       | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
  ##Positive
      | "5467_NOVA_Trigger4_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"                                   | "95"     | "5"              | "-5"           |
      | "5467_NOVA_Trigger4_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"                                | "95"     | "5"              | "-5"           |
      | "5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_lt_Curr_Dt"                                      | "95"     | "2"              | "1"            |
      | "5467_NOVA_Trigger4_ExtTable_ExtTable_VALID_START_DATE_gt_Curr_Dt"                           | "95"     | "-1"             | "-2"           |
      | "5467_NOVA_Trigger4_ExtTable_ExtTable_CAMPAIGN_CODE_ne_RS21097"                              | "95"     | "5"              | "-5"           |
  ##Negative
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_gt_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y"   | "95"     | "2"              | "-1"           |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_END_DATE_eq_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y"   | "95"     | "2"              | "0"            |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_START_DATE_lt_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y" | "95"     | "1"              | "-2"           |
      | "N_5467_NOVA_Trigger4_ExtTable_VALID_START_DATE_eq_Curr_Dt_AND_CAMPAIGN_CELL_CODE_FLAG_ne_Y" | "95"     | "0"              | "-2"           |

  @MPSAContribution_NOVA_multiple_record_ExternalTable_Eclusion_Positive_Negative_Scenarios_TestData @5467 @NOVA @RS21097
  Scenario Outline: MPSAContribution_RS21097_5467_NOVA_TestData <TestID> Create test data for multiple record with External table fro exclusion

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSACrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE1 = <VALID_START_DATE1>
    * string VALID_START_DATE2 = <VALID_START_DATE2>
    * string VALID_END_DATE = <VALID_END_DATE>

    * def ExtRec1 = <TestID>+'_rec1'
    * print 'Record2 Test ID is '+ExtRec1

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

        # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
      # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
      # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')


###To add into External input table


  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | VALID_START_DATE  |
      | <TestID> | CID | VALID_START_DATE1 |
      | ExtRec1  | CID | VALID_START_DATE2 |

     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet') examples
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database') examples


    Examples:
      | TestID                                     | VALID_START_DATE1 | VALID_END_DATE | VALID_START_DATE2 | ACCT_ODT |
      | "N_5467_NOVA_multiple_Externaltbl_Records" | "5"               | "-5"           | "4"               | "95"     |
