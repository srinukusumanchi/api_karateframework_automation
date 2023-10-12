@MPSA_ContributionPosNegAll_Nova_5504
Feature: Create test data for MPSA Contribution-5504 Nova Positive Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MPSAContribution_NOVA_11111 @5504 @NOVA @RS21098 @11111
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

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
      | TestID                                                                                           | ACCT_ODT |
#      | "5504_CUST_TP_CD=PSNL,5504_Primary Country Cd = CA,5504_MRKTBLE_F = Y,5504_Customer Not Decease" | "94"     |
#      | "5504_CUST_AGE >18"                                                                              | "94"     |
#      | "5504_CUST_AGE=18"                                                                               | "94"     |
#      | "5504_LANG_CD in E"                                                                              | "94"     |
#      | "5504_LANG_CD in EN"                                                                             | "94"     |
#      | "5504_LANG_CD in F"                                                                              | "94"     |
#      | "5504_LANG_CD in FR"                                                                             | "94"     |
#      | "5504_LANG_CD in small case_e"                                                                   | "94"     |
#      | "5504_LANG_CD in small case_en"                                                                  | "94"     |
#      | "5504_LANG_CD in small case_f"                                                                   | "94"     |
#      | "5504_LANG_CD in small case_fr"                                                                  | "94"     |
#      | "5504_DO_NOT_SOLICIT_F = N"                                                                      | "94"     |
#      | "5504_DO_NOT_SOLICIT_F = NULL"                                                                   | "94"     |
#      | "5504_NOT_AML_KYC = N"                                                                           | "94"     |
#      | "5504_NOT_AML_KYC = NULL"                                                                        | "94"     |
#      | "5504_ACCT_ODT>90"                                                                               | "92"     |
#      | "5504_ACCT_ODT = NULL"                                                                           | "NULL"   |
#      | "5504_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                              | "94"     |
#      | "5504_BUSINESS_SEGMENT = Retail"                                                                 | "94"     |
#      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"            | "94"     |
#      | "5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL > 1"            | "94"     |
#      | "5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL = 1"            | "94"     |
#      | "5504_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"              | "94"     |
#      | "N-5504_SRC_ACCT_STAT_CD = NULL"                                                                 | "94"     |
#      | "N-5504_CUST_TP_CD != PSNL"                                                                      | "94"     |
#      | "N-5504_Primary Country Cd != CA"                                                                | "94"     |
#      | "N-5504_Primary Country Cd = NULL"                                                               | "94"     |
#      | "N-5504_CUST_AGE < 18"                                                                           | "94"     |
#      | "N-5504_CUST_AGE = NULL"                                                                         | "94"     |
#      | "N-5504_LANG_CD NOT in (EN, E, FR, F)"                                                           | "94"     |
#      | "N-5504_LANG_CD = NULL"                                                                          | "94"     |
#      | "N-5504_DO_NOT_SOLICIT_F = Y"                                                                    | "94"     |
#      | "N-5504_MRKTBLE_F = N"                                                                           | "94"     |
#      | "N-5504_MRKTBLE_F = NULL"                                                                        | "94"     |
#      | "N-5504_NOT_AML_KYC = Y"                                                                         | "94"     |
#      | "N-5504_Customer Decease - Y"                                                                    | "94"     |
#      | "N-5504_Customer Decease - NULL"                                                                 | "94"     |
#      | "N-5504_PRIMARY_ACCT_HOLDER_FLAG = N"                                                            | "94"     |
#      | "N-5504_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                         | "94"     |
#      | "N-5504_BUSINESS_SEGMENT != Retail"                                                              | "94"     |
#      | "N-5504_BUSINESS_SEGMENT = NULL"                                                                 | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1"         | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"         | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"         | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"       | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL => 1"          | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"            | "94"     |
#      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = NULL"         | "94"     |
#      | "N-5504_SRC_SYS_PRD_CD != BSAMP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"          | "94"     |
#      | "N-5504_SRC_SYS_PRD_CD = BSAMP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"          | "94"     |
#      | "N-5504_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"           | "94"     |
#      | "5504_Validate Rest period for the offer"                                                        | "94"     |
#      | "5504_Validate Persistence period for the offer"                                                 | "94"     |
#      | "N_5504_PHYSICIANS_F = Y"                                                                        | "95"     |
#      | "N_5504_MD_FINANCIAL_F = Y"                                                                      | "95"     |
#      | "N_5504_ITRADE_MCLEOD_F = Y"                                                                     | "95"     |
#      | "N_5504_DEDICATED_INVSTMNT_ADVISOR_F = Y"                                                        | "95"     |
#      | "5504_CellGroup.PRI && CellGroup.NEW"                                                            | "23"     |
#      | "5504_CellGroup.MPC && CellGroup.NEW"                                                            | "23"     |
#      | "5504_CellGroup.TXR && CellGroup.NEW"                                                            | "23"     |
#      | "5504_5504032205_Other (no Ultimate/Preferred) with MPSA PAC"                                    | "80"     |
#      | "5504_5504032206_Other (no Ultimate/Preferred) without MPSA PAC"                                 | "80"     |


  @MPSAContribution_NOVA_11221 @5504 @NOVA @RS21098 @11221
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11221

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
#   # * print "Account ODT is", acct_odt

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
      | TestID                                                                                            | ACCT_ODT |
#      | "5504_PRD CODE=01  SUB PRD CD=01"                                                                 | "93"     |
#      | "5504_PRD CODE=VGD SUB PRD CD=NF"                                                                 | "93"     |
#      | "5504_PRD CD = 01 SUB PRD CD = 07"                                                                | "93"     |
#      | "5504_PRD CD = 02 SUB PRD CD = 05"                                                                | "93"     |
#      | "5504_PRD CD = 19 SUB PRD CD = 05"                                                                | "93"     |
#      | "5504_PRD CD = 13 SUB PRD CD = 05"                                                                | "93"     |
#      | "5504_PRD CD = 07 SUB PRD CD = 01"                                                                | "93"     |
#      | "5504_PRD CD = 23 SUB PRD CD = 02"                                                                | "93"     |
#      | "5504_PRD CD = VGD SUB PRD CD= AB"                                                                | "93"     |
#      | "5504_PRD CD = VCL SUB PRD CD= BC"                                                                | "93"     |
#      | "5504_PRD CD = VLR SUB PRD CD= CD"                                                                | "93"     |
#      | "5504_SRC_ACCT_STAT_CD! =  A"                                                                     | "93"     |
#      | "5504_SRC_ACCT_STAT_CD! = Open"                                                                   | "93"     |
#      | "5504_5504032201_Ultimate Account holders with MPSA PAC"                                          | "95"     |
#      | "5504_5504032202_Ultimate Account holders without MPSA PAC"                                       | "95"     |
#      | "5504_5504032203_Preferred Account holders with MPSA PAC"                                         | "95"     |
#      | "5504_5504032204_Preferred Account holders without MPSA PAC"                                      | "95"     |
#      | "5504_PRD CD IN 01 && SUB PRD CD IN (01,02,03,04) && ACCOUNT_ODT >90"                             | "95"     |
#      | "5504_PRD CD IN 02 && SUB PRD CD IN (01,02,03) && ACCOUNT_ODT < 90 && inactive"                   | "89"     |
#      | "5504_PRD CD IN 19 && SUB PRD CD IN (01,02,03,04,07,08) && ACCOUNT_ODT >90"                       | "95"     |
#      | "5504_PRD CD IN 07 && SUB PRD CD IN (11,12) && ACCOUNT_ODT >90"                                   | "91"     |
#      | "5504_PRD CD IN VGD  && SUB PRD CD IN (NF) && ACCOUNT_ODT >90"                                    | "91"     |
#      | "5504_PRD CD IN VCL  && SUB PRD CD IN (DM) && ACCOUNT_ODT < 90 && inactive"                       | "85"     |
#      | "5504_PRD CD IN VLR  && SUB PRD CD IN (RC) && ACCOUNT_ODT >90"                                    | "95"     |
#      | "5504_PRD CD IN VCL  && SUB PRD CD IN (NF) && ACCOUNT_ODT >90"                                    | "95"     |
#      | "5504_PRD CD IN VFA  && SUB PRD CD IN (A1) && ACCOUNT_ODT >90"                                    | "95"     |
#      | "N_5504_PRD CD IN 01  &&  SUB PRD CD IN (01,02,03,04) && ACCOUNT_ODT  < 90"                       | "89"     |
#      | "N_5504_PRD CD IN 02  &&  SUB PRD CD IN (01,02,03) && ACCOUNT_ODT  = 90"                          | "90"     |
#      | "N_5504_PRD CD IN 19  &&  SUB PRD CD IN (01,02,03,04,07,08) && ACCOUNT_ODT = 90"                  | "90"     |
#      | "N_5504_PRD CD IN 07  &&  SUB PRD CD IN (11,12) && ACCOUNT_ODT <90"                               | "80"     |
#      | "N_5504_PRD CD IN 13  &&  SUB PRD CD IN (01,03,07,08) && ACCOUNT_ODT <90"                         | "80"     |
#      | "N_5504_PRD CD IN 23  &&  SUB PRD CD IN (01,03) && ACCOUNT_ODT <90"                               | "80"     |
#      | "N_5504_PRD CD IN VGD && SUB PRD CD IN (NF) && ACCOUNT_ODT = 90"                                  | "90"     |
#      | "N_5504_PRD CD IN VCL  && SUB PRD CD IN (DM) && ACCOUNT_ODT = 90"                                 | "90"     |
#      | "N_5504_PRD CD IN VLR  && SUB PRD CD IN (RC) && ACCOUNT_ODT = 90"                                 | "90"     |
#      | "N_5504_PRD CD IN VCL  && SUB PRD CD IN (NF) && ACCOUNT_ODT < 90"                                 | "80"     |
#      | "N_5504_PRD CD IN VFA  && SUB PRD CD IN (A1) && ACCOUNT_ODT < 90"                                 | "80"     |
#      | "N_5504032201_Ultimate Account holders with MPSA PAC_No Ultimate Account"                         | "95"     |
#      | "N_5504032201_Ultimate Account holders with MPSA PAC_ACCT_SUBSYS_ID! = BB"                        | "95"     |
#      | "N_5504032201_Ultimate Account holders with MPSA PAC_SRC_SYS_PRD_CD! = 23"                        | "95"     |
#      | "N_5504032201_Ultimate Account holders with MPSA PAC_SRC_ACCT_STAT_CD! = A"                       | "95"     |
#      | "N_5504032201_Ultimate Account holders with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"               | "95"     |
#      | "N_5504032202_Ultimate Account holders with No MPSA PAC_No Ultimate Account"                      | "95"     |
#      | "N_5504032202_Ultimate Account holders with No MPSA PAC_ACCT_SUBSYS_ID! = BB"                     | "95"     |
#      | "N_5504032202_Ultimate Account holders with No MPSA PAC_SRC_SYS_PRD_CD! = 23"                     | "95"     |
#      | "N_5504032202_Ultimate Account holders with No MPSA PAC_SRC_ACCT_STAT_CD! = A"                    | "95"     |
#      | "N_5504032202_Ultimate Account holders with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"            | "95"     |
#      | "N_5504032203_Preffered Account holders with MPSA PAC_No Preferred Account"                       | "95"     |
#      | "N_5504032203_Preffered Account holders with MPSA PAC_ACCT_SUBSYS_ID! = BB"                       | "95"     |
#      | "N_5504032203_Preffered Account holders with MPSA PAC_SRC_SYS_PRD_CD! = 23"                       | "95"     |
#      | "N_5504032203_Preffered Account holders with MPSA PAC_SRC_ACCT_STAT_CD! = A"                      | "95"     |
#      | "N_5504032203_Preffered Account holders with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"              | "95"     |
#      | "N_5504032204_Preffered Account holders with No MPSA PAC_No Preferred Account"                    | "95"     |
#      | "N_5504032204_Preffered Account holders with No MPSA PAC_ACCT_SUBSYS_ID! = BB"                    | "95"     |
#      | "N_5504032204_Preffered Account holders with No MPSA PAC_SRC_SYS_PRD_CD! = 23"                    | "95"     |
#      | "N_5504032204_Preffered Account holders with No MPSA PAC_SRC_ACCT_STAT_CD! = A"                   | "95"     |
#      | "N_5504032204_Preffered Account holders with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"           | "95"     |
#      | "5504032205_Other Accounts with MPSA PAC_Preffered Account with SRC_ACCT_STAT_CD!= A"             | "95"     |
#      | "5504032205_Other Accounts with MPSA PAC_Ultimate Account with SRC_ACCT_STAT_CD!= A"              | "95"     |
#      | "5504032205_Other Accounts with MPSA PAC_Preffered Account with PRIMARY_ACCT_HOLDER_FLAG != Y"    | "95"     |
#      | "5504032205_Other Accounts with MPSA PAC_Ultimate Account with PRIMARY_ACCT_HOLDER_FLAG != Y"     | "95"     |
#      | "N_5504032205_Other Accounts with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                         | "95"     |
#      | "N_5504032205_Other Accounts with MPSA PAC_SRC_ACCT_STAT_CD!= A"                                  | "95"     |
#      | "5504032206_Other Accounts with No MPSA PAC_Preffered Account with SRC_ACCT_STAT_CD!= A"          | "95"     |
#      | "5504032206_Other Accounts with No MPSA PAC_Ultimate Account with SRC_ACCT_STAT_CD!= A"           | "95"     |
#      | "5504032206_Other Accounts with No MPSA PAC_Preffered Account with PRIMARY_ACCT_HOLDER_FLAG != Y" | "95"     |
#      | "5504032206_Other Accounts with No MPSA PAC_Ultimate Account with PRIMARY_ACCT_HOLDER_FLAG != Y"  | "95"     |
#      | "N_5504032206_Other Accounts with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                      | "95"     |
#      | "N_5504032206_Other Accounts with No MPSA PAC_SRC_ACCT_STAT_CD!= A"                               | "95"     |
#      | "N_5504_PRD CD IN VCL && SUB PRD CD IN ZZ  && ACCOUNT_ODT = 90"                                   | "90"     |
#      | "N_5504_PRD CD IN VCL && SUB PRD CD IN SS  && ACCOUNT_ODT = 90"                                   | "90"     |
#      | "N_5504_PRD CD IN VLR && SUB PRD CD IN RG  && ACCOUNT_ODT < 90"                                   | "89"     |
#      | "N_5504_PRD CD IN VLR && SUB PRD CD IN NF  && ACCOUNT_ODT < 90"                                   | "89"     |
#      | "N_5504_PRD CD IN VCL && SUB PRD CD IN RG  && ACCOUNT_ODT < 90"                                   | "89"     |
#      | "N_5504_PRD CD IN VCL && SUB PRD CD IN SV  && ACCOUNT_ODT = 90"                                   | "90"     |
#      | "N_5504_PRD CD IN VFF && SUB PRD CD IN F1  && ACCOUNT_ODT = 90"                                   | "90"     |
#      | "N_5504_PRD CD IN AXG && SUB PRD CD IN GC  && ACCOUNT_ODT = 90"                                   | "90"     |
#      | "N_5504_PRD CD IN AXS && SUB PRD CD IN SC  && ACCOUNT_ODT < 90"                                   | "80"     |
#      | "N_5504_PRD CD IN AXP && SUB PRD CD IN PC  && ACCOUNT_ODT < 90"                                   | "80"     |
#      | "N_5504_PRD CD IN VFF && SUB PRD CD IN TR  && ACCOUNT_ODT < 90"                                   | "80"     |
#      | "N_5504_PRD CD IN VGD && SUB PRD CD IN RG  && ACCOUNT_ODT = 90"                                   | "90"     |


  @MPSAContribution_NOVA_11112 @5504 @NOVA @RS21098 @11112
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt
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

    * def Cust2 = <TestID>+'_cust_2'
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
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                    | Acct_Odt | Event_Date |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1"    | "93"     | "NULL"     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1"    | "93"     | "NULL"     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD =FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1)  AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"   | "93"     | "NULL"     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL! = 1)  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1)" | "93"     | "NULL"     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL! = 1 and Current date - CUST_INSIGHTS.EVENT_DATE < 60"                                  | "95"     | "59"       |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE > 60"                                   | "95"     | "61"       |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE < 60"                                 | "95"     | "59"       |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE = 60"                                 | "95"     | "60"       |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_ENG_RS22022_TARGET_CONTROL && CUST_INSIGHT.CURR_VAL! = 1"                                                                       | "95"     | "NULL"     |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_ENG_RS22022_TARGET_CONTROL && CUST_INSIGHT.CURR_VAL = 1"                                                                      | "95"     | "NULL"     |

  @MPSAContribution_NOVA_1111 @5504 @NOVA @RS21098 @1111
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 1111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt

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

    Examples:
      | TestID                                                                                 | ACCT_ODT |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT = 20 days"          | "20"     |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT = 30 days"          | "30"     |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT > 20 and < 30 days" | "25"     |
      | "N_5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT < 20 days"        | "19"     |
      | "N_5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT > 30 days"        | "31"     |
      | "N_5504_CellGroup.NEW_New MPSA account with balance! = 0 && ACCT_ODT < 30 days"       | "25"     |

  @MPSAContribution_NOVA_EventDt_11111 @5504 @NOVA @RS21098 @11111
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt

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
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                                  | ACCT_ODT | Event_Date |
      | "5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE < 30 days"      | "95"     | "29"       |
      | "5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE = 30 days"      | "95"     | "30"       |
      | "N_5504_CellGroup.TXR_N_INSIGHT_CD! = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE < 30 days" | "95"     | "25"       |
      | "N_5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL! = 1 and EVENT_DATE < 30 days"   | "95"     | "25"       |
      | "N_5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE > 30 days"    | "95"     | "31"       |


  @MPSAContribution_NOVA_11331 @5504 @NOVA @RS21098 @11331
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11331

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num3
    # insert the created CID into the NOVA T3st data excel sheet
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

    * def Acc3 = <TestID>+'_Account_3'
    * print 'Account 3 Test ID is '+Acc3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Acc2     | acct_num2     |
      | Acc3     | acct_num3     |

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
      | TestID                                                                        | ACCT_ODT |
      | "5504_MPSA with PAC && ULTIMATE && PREFERRED - Ultimate and Preferred"        | "95"     |
      | "5504_MPSA without PAC PAC && ULTIMATE && PREFERRED - Ultimate and Preferred" | "95"     |

  @MPSAContribution_NOVA_11112 @5504 @NOVA @RS21098 @11112
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

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

    * def Cust2 = <TestID>+'_cust_2'
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
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                 | ACCT_ODT | Event_Date |
      | "5504_CellGroup.MPC && CellGroup.TXR && CellGroup.NEW" | "25"     | 1          |
      | "5504_CellGroup.NEW && CellGroup.TXR && CellGroup.PRI" | "25"     | 1          |
      | "5504_CellGroup.MPC && CellGroup.PRI && CellGroup.NEW" | "25"     | 1          |
      | "5504_CellGroup.PRI && CellGroup.TXR"                  | "95"     | 1          |
      | "5504_CellGroup.MPC && CellGroup.TXR"                  | "95"     | 1          |

  @MPSAContribution_NOVA_11113 @5504 @NOVA @RS21098 @11113
  Scenario Outline: MPSA Contribution_RS21098_5504_NOVA Create test data for 11113

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = MPSAContributionNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
   # * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date
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

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    * def Cust3 = <TestID>+'_cust_3'
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
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                  | ACCT_ODT | Event_Date |
      | "5504_CellGroup.PRI && CellGroup.MPC && CellGroup.TXR && CellGroup.NEW" | "25"     | 1          |
      | "5504_CellGroup.MPC && CellGroup.TXR && CellGroup.PRI"                  | "95"     | 1          |


