@RESP_CrossSell_Nova_5466
Feature: Create test data for RESP Cross Sell-5466 Nova Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @RESPCrossSell_NOVA @5466 @NOVA @RS21095 @11111_RESP
  Scenario Outline: RESP Cross Sell_RS21095_5466_NOVA Create test data for 11111

    #    Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPCrossSellNovaTestData
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
      | "5466_CUST_TP_CD=PSNL,5466_Primary Country Cd = CA,5466_CUST_AGE >18,5466_DO_NOT_SOLICIT_F = Y,5466_MRKTBLE_F = Y,5466_NOT_AML_KYC = N,5466_Customer Not Decease" | "100"    | "100"        |
      | "5466_CUST_AGE=18"                                                                                                                                                | "100"    | "100"        |
      | "5466_LANG_CD in E"                                                                                                                                               | "100"    | "100"        |
      | "5466_LANG_CD in EN"                                                                                                                                              | "100"    | "100"        |
      | "5466_LANG_CD in F"                                                                                                                                               | "100"    | "100"        |
      | "5466_LANG_CD in FR"                                                                                                                                              | "100"    | "100"        |
      | "5466_LANG_CD in small case_e"                                                                                                                                    | "100"    | "100"        |
      | "5466_LANG_CD in small case_en"                                                                                                                                   | "100"    | "100"        |
      | "5466_LANG_CD in small case_f"                                                                                                                                    | "100"    | "100"        |
      | "5466_LANG_CD in small case_fr"                                                                                                                                   | "100"    | "100"        |
      | "5466_DO_NOT_SOLICIT_F = NULL"                                                                                                                                    | "100"    | "100"        |
      | "5466_NOT_AML_KYC = NULL"                                                                                                                                         | "100"    | "100"        |
      | "5466_CUST_OPND_DT > 90 days"                                                                                                                                     | "100"    | "92"         |
      | "5466_ACCT_ODT > 90 days"                                                                                                                                         | "92"     | "100"        |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "100"    | "100"        |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL > 1"                                                                             | "100"    | "100"        |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP   and CUST_INSIGHTS.CURR_VAL = 1"                                                                             | "100"    | "100"        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                      | "100"    | "100"        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE > 30 days OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                           | "100"    | "100"        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                     | "100"    | "100"        |
      | "5466_CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL! = 1"                             | "100"    | "100"        |
      | "5466_PRD CODE=01  SUB PRD CD=01"                                                                                                                                 | "100"    | "100"        |
      | "5466_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                 | "100"    | "100"        |
      | "N-5466_CUST_TP_CD != PSNL "                                                                                                                                      | "100"    | "100"        |
      | "N-5466_Primary Country Cd != CA"                                                                                                                                 | "100"    | "100"        |
      | "N-5466_Primary Country Cd = NULL"                                                                                                                                | "100"    | "100"        |
      | "N-5466_CUST_AGE < 18"                                                                                                                                            | "100"    | "100"        |
      | "N-5466_CUST_AGE = NULL"                                                                                                                                          | "100"    | "100"        |
      | "N-5466_LANG_CD NOT in (EN, E, FR, F)"                                                                                                                            | "100"    | "100"        |
      | "N-5466_LANG_CD = NULL"                                                                                                                                           | "100"    | "100"        |
      | "N-5466_MRKTBLE_F = N"                                                                                                                                            | "100"    | "100"        |
      | "N-5466_MRKTBLE_F = NULL"                                                                                                                                         | "100"    | "100"        |
      | "N-5466_NOT_AML_KYC = Y"                                                                                                                                          | "100"    | "100"        |
      | "N-5466_CUST_OPNT_DT < 90 days"                                                                                                                                   | "100"    | "89"         |
      | "N-5466_CUST_OPNT_DT = 90 days"                                                                                                                                   | "100"    | "90"         |
      | "N-5466_CUST_OPNT_DT = NULL"                                                                                                                                      | "100"    | "NULL"       |
#      | "N-5466_Customer Decease - Y"                                                                                                                                     | "100"    | "100"        |
#      | "N-5466_Customer Decease - NULL"                                                                                                                                  | "100"    | "100"        |
#      | "N-5466_ACCT_ODT < 90 Days"                                                                                                                                       | "90"     | "100"        |
#      | "N-5466_ACCT_ODT = 90 Days"                                                                                                                                       | "91"     | "100"        |
#      | "5466_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                | "100"    | "100"        |
#      | "5466_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                | "100"    | "100"        |
#      | "5466_SRC_ACCT_STAT_CD! =  A"                                                                                                                                     | "100"    | "100"        |
#      | "5466_SRC_ACCT_STAT_CD! = Open"                                                                                                                                   | "100"    | "100"        |
#      | "5466_SRC_ACCT_STAT_CD = NULL"                                                                                                                                    | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                                           | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"                                                                             | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL = NULL"                                                                          | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD != FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1"                                                                          | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL!= 1"                                                                           | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = NULL"                                                                        | "100"    | "100"        |
#      | "N-5466_CUST_INSIGHTS.INSIGHT_CD = NULL and CUST_INSIGHTS.CURR_VAL = NULL and CUST_DIM.CHILD_TAX_BENEFIT_START_DATE = NULL"                                       | "100"    | "100"        |
#      | "5466_Perform Viewed Disposition and offer should display when Lead scope - ACT"                                                                                  | "100"    | "100"        |
#      | "5466_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT"                                                                   | "100"    | "100"        |
#      | "5466_Validate IH fields with proposition"                                                                                                                        | "100"    | "100"        |
#      | "5466_Validate Rest period for the offer"                                                                                                                         | "100"    | "100"        |
#      | "5466_Validate Persistence period for the offer"                                                                                                                  | "100"    | "100"        |

  @RESPCrossSell_NOVA @5466 @NOVA @RS21095 @11221_RESP
  Scenario Outline: RESP Cross Sell_RS21095_5466_NOVA Create test data for 11221

    # Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPCrossSellNovaTestData
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
      | "5466_PLN_ACCT_CD_MASTER != RESP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "5466_PLN_ACCT_CD_MASTER = RESP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |
      | "5466_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"  | "100"    | "100"        |
      | "N-5466_PLN_ACCT_CD_MASTER = RESP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active" | "100"    | "100"        |


  @RESPCrossSell_NOVA @5466 @NOVA @RS21095 @11112_RESP
  Scenario Outline: RESP Cross Sell_RS21095_5466_NOVA Create test data for 11112

    # Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPCrossSellNovaTestData

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
      | TestID                                                                                                                                                                                                                         | ACCT_ODT | CUST_OPND_DT |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1"                                                         | "100"    | "100"        |
      | "5466_CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"                                                          | "100"    | "100"        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL => 1" | "100"    | "100"        |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days OR CUST_INSIGHTS.INSIGHT_CD = FLG_RESP_OUT_PAYMENT and CUST_INSIGHTS.CURR_VAL = 1 OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_RESP and CUST_INSIGHTS.CURR_VAL < 1"  | "100"    | "100"        |


  @RESPCrossSell_NOVA @5466 @NOVA @RS21095 @1111_RESP
  Scenario Outline: RESP Cross Sell_RS21095_5466_NOVA Create test data for 1111

    #    Reading testId from Example section
    * def testId = <TestID>
    * print  "Test ID is "+testId

    * def testDataFileName = RESPCrossSellNovaTestData
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


        # Convert the Tax Date to YYYY-MM-DD format
    * string tax_dt = <TAX_Date> == 'NULL'? 'NULL' : dateFormat(<TAX_Date>)
    * print "Tax date is ", tax_dt


    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

        # insert the created CHILD_TAX_BENEFIT_START_DATE into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@TAX_DATE_Insertion_CUST_DIM_Sheet')


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



    Examples:
      | TestID                                                      | ACCT_ODT | CUST_OPND_DT | TAX_Date |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE within 30 days" | "100"    | "100"        | "25"     |
      | "5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE = 30 days"      | "100"    | "100"        | "30"     |
      | "N-5466_CUST_DIM.CHILD_TAX_BENEFIT_START_DATE > 30 days"    | "100"    | "100"        | "32"     |

