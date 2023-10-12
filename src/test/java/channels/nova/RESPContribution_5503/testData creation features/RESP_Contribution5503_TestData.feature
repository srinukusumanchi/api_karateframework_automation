@RESP_Contribution_PosNeg_Nova_5503
Feature: Create test data for RESP Contribution-5503 Nova Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @RESPContribution_NOVA_Positive_Negative_TestdataCreation @5503 @NOVA @RS21096 @11112_RESP
  Scenario Outline: RESP Contribution_RS21096_5503_NOVA Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPContributionNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
     * string ACCT_ODT = <ACCT_ODT>
     * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", cust_opnd_dt

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                            | ACCT_ODT | CUST_OPND_DT |
      | "5503_CUST_TP_CD=PSNL,5503_Primary Country Cd = CA,5503_CUST_AGE >18,5503_DO_NOT_SOLICIT_F = Y,5503_MRKTBLE_F = Y,5503_NOT_AML_KYC = N,5503_Customer Not Decease" | "94"     | "95"         |
      | "5503_CUST_AGE=18"                                                                                                                                                | "94"     | "95"         |
      | "5503_LANG_CD in E"                                                                                                                                               | "94"     | "95"         |
      | "5503_LANG_CD in EN"                                                                                                                                              | "94"     | "95"         |
      | "5503_LANG_CD in F"                                                                                                                                               | "94"     | "95"         |
      | "5503_LANG_CD in FR"                                                                                                                                              | "94"     | "95"         |
      | "5503_LANG_CD in small case_e"                                                                                                                                    | "94"     | "95"         |
      | "5503_LANG_CD in small case_en"                                                                                                                                   | "94"     | "95"         |
      | "5503_LANG_CD in small case_f"                                                                                                                                    | "94"     | "95"         |
      | "5503_LANG_CD in small case_fr"                                                                                                                                   | "94"     | "95"         |
      | "5503_DO_NOT_SOLICIT_F = NULL"                                                                                                                                    | "94"     | "95"         |
      | "5503_NOT_AML_KYC = NULL"                                                                                                                                         | "94"     | "95"         |
      | "5503_CUST_OPND_DT > 90 days"                                                                                                                                     | "94"     | "95"         |
      | "5503_ACCT_ODT > 90 days"                                                                                                                                         | "94"     | "95"         |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "94"     | "95"         |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                             | "94"     | "95"         |
      | "5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "94"     | "95"         |
      | "5503_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                            | "94"     | "95"         |
      | "N-5503_PLN_ACCT_CD_MASTER != RESP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"                                                                        | "94"     | "95"         |
      | "N-5503_PLN_ACCT_CD_MASTER = RESP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"                                                                        | "94"     | "95"         |
      | "N-5503_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"                                                                         | "94"     | "95"         |
      | "N-5503_CUST_TP_CD != PSNL"                                                                                                                                       | "94"     | "95"         |
      | "N-5503_Primary Country Cd != CA"                                                                                                                                 | "94"     | "95"         |
      | "N-5503_Primary Country Cd = NULL"                                                                                                                                | "94"     | "95"         |
      | "N-5503_CUST_AGE < 18"                                                                                                                                            | "94"     | "95"         |
      | "N-5503_CUST_AGE = NULL"                                                                                                                                          | "94"     | "95"         |
      | "N-5503_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                            | "94"     | "95"         |
      | "N-5503_LANG_CD = NULL"                                                                                                                                           | "94"     | "95"         |
      | "N-5503_MRKTBLE_F = N"                                                                                                                                            | "94"     | "95"         |
      | "N-5503_MRKTBLE_F = NULL"                                                                                                                                         | "94"     | "95"         |
      | "N-5503_NOT_AML_KYC = Y"                                                                                                                                          | "94"     | "95"         |
      | "N-5503_CUST_OPNT_DT < 90 days"                                                                                                                                   | "94"     | "89"         |
      | "N-5503_CUST_OPNT_DT = 90 days"                                                                                                                                   | "94"     | "90"         |
      | "N-5503_CUST_OPNT_DT = NULL"                                                                                                                                      | "94"     | "NULL"       |
      | "N-5503_Customer Decease - Y"                                                                                                                                      | "94"     | "95"         |
      | "N-5503_Customer Decease - NULL"                                                                                                                                  | "94"     | "95"         |
      | "N-5503_ACCT_ODT < 90 Days"                                                                                                                                       | "89"     | "95"         |
      | "N-5503_ACCT_ODT = 90 Days"                                                                                                                                       | "90"     | "95"         |
      | "N-5503_SRC_ACCT_STAT_CD = NULL"                                                                                                                                  | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                                           | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"                                                                             | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL = NULL"                                                                          | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                          | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL!= 1"                                                                           | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                                                        | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL != 0"                                                                         | "94"     | "95"         |
      | "N-5503_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0"                                                                         | "94"     | "95"         |
      | "N-5503_PRIMARY_ACCT_HOLDER_FLAG = N"                                                                                                                             | "94"     | "95"         |
      | "N-5503_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                                                                                          | "94"     | "95"         |

  @RESPContribution_Multiple_Insights_NOVA @5503 @NOVA @RS21096 @11113_RESP
  Scenario Outline: RESP Contribution_RS21096_5503_NOVA Create test data for 11113

    # Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPContributionNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
     * string ACCT_ODT = <ACCT_ODT>
     * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

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
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                                                                                                                                                                                                                                                           | ACCT_ODT | CUST_OPND_DT |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"   | "94"     | "95"         |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1)"    | "94"     | "95"         |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL >=  1)" | "94"     | "95"         |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"  | "94"     | "95"         |
      | "5503_(CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 0) and (CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1)"  | "94"     | "95"         |

  @RESPContribution_multiple_Accts_NOVA @5503 @NOVA @RS21096 @11222_RESP
  Scenario Outline: RESP Contribution_RS21096_5503_NOVA Create test data for 11222

    # Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPContributionNovaTestData
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

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

    # Used table keyword to iterate for any BDD line
    * table custInsightsEx
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') custInsightsEx
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') custInsightsEx

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
      | TestID                             | ACCT_ODT | CUST_OPND_DT |
      | "5503_PRD CD = 02 SUB PRD CD = 05" | "94"     | "95"         |
      | "5503_PRD CD = 19 SUB PRD CD = 05" | "94"     | "95"         |
      | "5503_PRD CD = 13 SUB PRD CD = 05" | "94"     | "95"         |
      | "5503_PRD CD = 07 SUB PRD CD = 01" | "94"     | "95"         |
      | "5503_PRD CD = 23 SUB PRD CD = 02" | "94"     | "95"         |
      | "5503_PRD CD = VGD SUB PRD CD= AB" | "94"     | "95"         |
      | "5503_PRD CD = VCL SUB PRD CD= BC" | "94"     | "95"         |
      | "5503_PRD CD = VLR SUB PRD CD= CD" | "94"     | "95"         |
      | "5503_PRD CODE=01  SUB PRD CD=01"  | "94"     | "95"         |
      | "5503_PRD CODE=VGD SUB PRD CD=NF"  | "94"     | "95"         |
      | "5503_SRC_ACCT_STAT_CD! =  A"      | "94"     | "95"         |
      | "5503_SRC_ACCT_STAT_CD! = Open"    | "94"     | "95"         |