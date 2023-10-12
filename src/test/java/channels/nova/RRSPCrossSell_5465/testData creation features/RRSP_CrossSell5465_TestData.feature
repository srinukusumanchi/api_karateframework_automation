@RRSP_CrossSell_Nova_5465
Feature: Create test data for RRSP Cross Sell-5465 Nova Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @RRSPCrossSell_NOVA @5465 @NOVA @RS21091 @11111_RRSP
  Scenario Outline: RRSP Cross Sell_RS21091_5465_NOVA Create test data for 11111

    #    Reading testId from Example section
    * def testId = <TestID>
    * print "Test ID is", testId

    * def testDataFileName = RRSPCrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
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


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                                                                                                                            | ACCT_ODT | CUST_OPND_DT |
      | "5465_CUST_TP_CD=PSNL,5465_Primary Country Cd = CA,5465_CUST_AGE >18,5465_DO_NOT_SOLICIT_F = Y,5465_MRKTBLE_F = Y,5465_NOT_AML_KYC = N,5465_Customer Not Decease" | "100"    | "100"        |
#      | "5465_CUST_AGE=18"                                                                                                                                                | "100"    | "100"        |
#      | "5465_CUST_AGE = 70"                                                                                                                                              | "100"    | "100"        |
#      | "5465_LANG_CD in E"                                                                                                                                               | "100"    | "100"        |
#      | "5465_LANG_CD in EN"                                                                                                                                              | "100"    | "100"        |
#      | "5465_LANG_CD in F"                                                                                                                                               | "100"    | "100"        |
#      | "5465_LANG_CD in FR"                                                                                                                                              | "100"    | "100"        |
#      | "5465_LANG_CD in small case_e"                                                                                                                                    | "100"    | "100"        |
#      | "5465_LANG_CD in small case_en"                                                                                                                                   | "100"    | "100"        |
#      | "5465_LANG_CD in small case_f"                                                                                                                                    | "100"    | "100"        |
#      | "5465_LANG_CD in small case_fr"                                                                                                                                   | "100"    | "100"        |
#      | "5465_DO_NOT_SOLICIT_F = NULL"                                                                                                                                    | "100"    | "100"        |
#      | "5465_NOT_AML_KYC = NULL"                                                                                                                                         | "100"    | "100"        |
#      | "5465_CUST_OPND_DT > 90 days"                                                                                                                                     | "100"    | "92"         |
#      | "5465_ACCT_ODT > 90 days"                                                                                                                                         | "92"    | "93"         |
#      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "100"    | "100"        |
#      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "100"    | "100"        |
#      | "5465_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                             | "100"    | "100"        |
#      | "5465_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "100"    | "100"        |
#      | "5465_PRD CODE=01  SUB PRD CD=01"                                                                                                                                 | "100"    | "100"        |
#      | "5465_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                 | "100"    | "100"        |
#      | "N-5465_CUST_TP_CD != PSNL"                                                                                                                                       | "100"    | "100"        |
#      | "N-5465_Primary Country Cd != CA"                                                                                                                                 | "100"    | "100"        |
#      | "N-5465_Primary Country Cd = NULL"                                                                                                                                | "100"    | "100"        |
#      | "N-5465_CUST_AGE < 18"                                                                                                                                            | "100"    | "100"        |
#      | "N-5465_CUST_AGE > 70"                                                                                                                                            | "100"    | "100"        |
#      | "N-5465_CUST_AGE = NULL"                                                                                                                                          | "100"    | "100"        |
#      | "N-5465_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                            | "100"    | "100"        |
#      | "N-5465_LANG_CD = NULL"                                                                                                                                           | "100"    | "100"        |
#      | "N-5465_MRKTBLE_F = N"                                                                                                                                            | "100"    | "100"        |
#      | "N-5465_MRKTBLE_F = NULL"                                                                                                                                         | "100"    | "100"        |
#      | "N-5465_NOT_AML_KYC = Y"                                                                                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_OPNT_DT < 90 days"                                                                                                                                   | "100"    | "90"         |
#      | "N-5465_CUST_OPNT_DT = 90 days"                                                                                                                                   | "100"    | "91"         |
#      | "N-5465_CUST_OPNT_DT = NULL"                                                                                                                                      | "100"    | "NULL"       |
#      | "N-5465_Customer Decease - Y"                                                                                                                                     | "100"    | "100"        |
#      | "N-5465_Customer Decease - NULL"                                                                                                                                  | "100"    | "100"        |
#      | "N-5465_ACCT_ODT < 90 Days"                                                                                                                                       | "90"    | "100"         |
#      | "N-5465_ACCT_ODT = 90 Days"                                                                                                                                       | "91"    | "100"         |
#      | "5465_PRD CD = 02 SUB PRD CD = 05"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = 19 SUB PRD CD = 05"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = 13 SUB PRD CD = 05"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = 07 SUB PRD CD = 01"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = 23 SUB PRD CD = 02"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = VGD SUB PRD CD= AB"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = VCL SUB PRD CD= BC"                                                                                                                              | "100"    | "100"        |
#      | "5465_PRD CD = VLR SUB PRD CD= CD"                                                                                                                              | "100"    | "100"        |
#      | "5465_SRC_ACCT_STAT_CD! =  A"                                                                                                                                   | "100"    | "100"        |
#      | "5465_SRC_ACCT_STAT_CD! = Open"                                                                                                                                 | "100"    | "100"        |
#      | "5465_SRC_ACCT_STAT_CD = NULL"                                                                                                                                  | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                                        | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1"                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD != FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                                                        | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"                                                                           | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1"                                                                             | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL = NULL"                                                                          | "100"    | "100"        |
#      | "N-5465_CUST_INSIGHTS.INSIGHT_CD = NULL and CUST_INSIGHTS.CURR_VAL = NULL"                                                                                        | "100"    | "100"        |
#      | "5465_Perform Viewed Disposition and offer should display when Lead scope - ACT"                                                                                  | "100"    | "100"        |
#      | "5465_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT"                                                                   | "100"    | "100"        |
#      | "5465_Validate IH fields with proposition"                                                                                                                        | "100"    | "100"        |
#      | "5465_Validate Rest period for the offer"                                                                                                                         | "100"    | "100"        |
#      | "5465_Validate Persistence period for the offer"                                                                                                                  | "100"    | "100"        |


  @RRSPCrossSell_NOVA @5465 @NOVA @RS21091 @11221_RRSP
  Scenario Outline: RRSP Cross Sell_RS21091_5465_NOVA Create test data for 11221


    # Reading testId from Example section
    * def testId = <TestID>
    * print "Test ID is", testId

    * def testDataFileName = RRSPCrossSellNovaTestData
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

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

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
      | TestID                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5465_PLN_ACCT_CD_MASTER != RRSP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "5465_PLN_ACCT_CD_MASTER = RRSP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "5465_PLN_ACCT_CD_MASTER = RRSP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  | "100"    | "100"        |
#      | "N-5465_PLN_ACCT_CD_MASTER = RRSP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |


  @RRSPCrossSell_NOVA @5465 @NOVA @RS21091 @11112_RRSP
  Scenario Outline: RRSP Cross Sell_RS21091_5465_NOVA Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * print "Test ID is", testId

    * def testDataFileName = RRSPCrossSellNovaTestData

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
      | TestID                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT  and CUST_INSIGHTS.CURR_VAL = 1" | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"   | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"   | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL != 1" | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1) OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1"    | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1"  | "100"    | "100"        |


  @RRSPCrossSell_NOVA @5465 @NOVA @RS21091 @11113_RRSP
  Scenario Outline: RRSP Cross Sell_RS21091_5465_NOVA Create test data for 11113

    #    Reading testId from Example section
    * def testId = <TestID>
    * print "Test ID is", testId

    * def testDataFileName = RRSPCrossSellNovaTestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
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
      | TestID                                                                                                                                                                                                                                                   | ACCT_ODT | CUST_OPND_DT |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL => 1" | "100"    | "100"        |
      | "5465_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = FLG_RRSP_OUT_PAYMENT  and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RRSP and CUST_INSIGHTS.CURR_VAL < 1" | "100"    | "100"        |


  @RRSPXsell_NOVA_Single_record_ExternalTable_Positive_Negative_Scenarios_TestData @5465 @NOVA @RS21093
  Scenario Outline: RRSPXSell_RS21091_5465_NOVA_TestData <TestID> Create test data for single account with External table positive and negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPCrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#    # Generating account number to insert into database
#    * def accountNumber = '00000000'+CID
#    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

#  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

#  # insert the created Account Number into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
#    # insert the created acct_odt into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
#
#     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
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
      | TestID                                         | VALID_START_DATE | VALID_END_DATE | CUST_OPND_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5465_NOVA_VALID_START_DATE_lt_Curr_Dt"         | 1                | -5             | 100          | 60                | 60                | 50       |
      | "5465_NOVA_VALID_START_DATE_eq_Curr_Dt"         | 0                | -5             | 100          | 60                | 60                | 100      |
      | "5465_NOVA_VALID_END_DATE_gt_Curr_Dt"           | 5                | -1             | 100          | 60                | 60                | 70       |
      | "5465_NOVA_VALID_END_DATE_eq_Curr_Dt"           | 5                | 0              | 100          | 60                | 60                | "NULL"   |
      | "N_5465_NOVA_VALID_START_DATE_gt_Curr_Dt"       | -1               | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_VALID_END_DATE_lt_Curr_Dt"         | 5                | 1              | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_CAMPAIGN_CODE_ne_RS21093"          | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_Seg_CAMPAIGN_CELL_CODE_ne_CIE5465" | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_Seg_CAMPAIGN_CELL_CODE_eq_NULL"    | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_CAMPAIGN_CELL_CODE_FLAG_ne_Y"      | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_CAMPAIGN_CELL_CODE_FLAG_eq_NULL"   | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_NOVA_CHANNEL_ne_Y"                  | 5                | -5             | 100          | 60                | 60                | 50       |
      | "N_5465_NOVA_NOVA_CHANNEL_eq_NULL"               | 5                | -5             | 100          | 60                | 60                | 50       |

  @RRSPXsell_NOVA_multiple_record_ExternalTable_Positive_Negative_Scenarios_TestData @5465 @NOVA @RS21093
  Scenario Outline: RRSPXSell_RS21091_5465_NOVA_TestData <TestID> Create test data for multiple record with External table

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = RRSPCrossSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * string ACCT_ODT = <ACCT_ODT>
    * string VALID_START_DATE1 = <VALID_START_DATE1>
    * string VALID_START_DATE2 = <VALID_START_DATE2>
    * string VALID_END_DATE = <VALID_END_DATE>

    * def ExtRec1 = <TestID>+'_rec1'
    * print 'Record2 Test ID is '+ExtRec1

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

#    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
#    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

#  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
#    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
#
#  # insert the created Account Number into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
#    # insert the created acct_odt into the ACCT_DIM sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
#
#     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


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
      | TestID                                  | VALID_START_DATE1 | VALID_END_DATE | CUST_OPND_DT | VALID_START_DATE2 | MOB_LAST_LOGIN_DT | ACCT_ODT |
      | "5465_NOVA_multiple_Externaltbl_Records" | 1                 | -5             | 100          | 4                 | 60                | 50       |
