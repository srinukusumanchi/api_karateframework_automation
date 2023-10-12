@D2D_NOVA_CROSSSELL_ULTIMATE

Feature: Create test data for D2D Engagement-CrossSell-Ultimate-4891 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_Ultimate_Positive_4891111901 @4891 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_Ultimate_4891111901_RS19067_4891_NOVA Create test data<TestID> for Positive Test Cases
 #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    #* print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

 # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                          | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4891_ISSUE = CrossSell and Group = Investment"                                                 | "41"     | "18" | "20"         |
      | "4891_DO_NOT_SOLICIT_F= Null"                                                                   | "41"     | "18" | "21"         |
      | "4891_INDV_BRTH_DT_Equal to 18"                                                                 | "41"     | "18" | "22"         |
      | "4891_LANG_CD=E"                                                                                | "41"     | "21" | "23"         |
      | "4891_LANG_CD=EN"                                                                               | "41"     | "50" | "24"         |
      | "4891_LANG_CD=F"                                                                                | "41"     | "40" | "25"         |
      | "4891_LANG_CD=FR"                                                                               | "41"     | "18" | "26"         |
      | "4891_LANG_CD_LowerCase=e"                                                                      | "41"     | "21" | "26"         |
      | "4891_LANG_CD_LowerCase=en"                                                                     | "41"     | "22" | "27"         |
      | "4891_LANG_CD_LowerCase=f"                                                                      | "41"     | "23" | "28"         |
      | "4891_LANG_CD_LowerCase=fr"                                                                     | "45"     | "24" | "29"         |
      | "4891_PRD CD- 23, SUB PRD CD -01"                                                               | "45"     | "24" | "30"         |
      | "4891_PRD CD- 23, SUB PRD CD -03"                                                               | "45"     | "22" | "31"         |
      | "4891_Account Open Date equal to 28 days"                                                       | "28"     | "23" | "32"         |
      | "4891_Account Open Date equal to 58 days"                                                       | "58"     | "24" | "33"         |
      | "4891_BANKRUPTCY_DT-NULL"                                                                       | "50"     | "44" | "34"         |
      | "4891_Perform Viewed Disposition and offer should display when Lead scope - ACT"                | "50"     | "40" | "38"         |
      | "4891_Perform Accepted In Progress Disposition and offer should display when Lead scope - ACT"  | "50"     | "40" | "38"         |
      | "4891_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" | "50"     | "40" | "38"         |
      | "4891_Validate IH Record fields against Proposition"                                            | "50"     | "40" | "38"         |
      | "4891_NTC_MCB=Y_Arrival Date within 3 years"                                                    | "30"     | "18" | "20"         |
      | "4891_EMPLOYEE_STAFF_F= Y"                                                                      | "50"     | "48" | "20"         |
      | "4891_Prv_Bnk_Ind= Null"                                                                        | "50"     | "48" | "20"         |
      | "4891_Prv_Bnk_Ind= Y"                                                                           | "50"     | "48" | "20"         |
      | "4891_EMPLOYEE_STAFF_F= N"                                                                      | "41"     | "18" | "20"         |
      | "4891_EMPLOYEE_STAFF_F= NULL"                                                                   | "41"     | "18" | "21"         |
      | "4891_Prv_Bnk_Ind= N"                                                                           | "41"     | "18" | "22"         |
      | "4891_NOT_AML_KYC !=Y"                                                                          | "41"     | "21" | "23"         |
      | "4891_NOT_AML_KYC = NULL"                                                                       | "41"     | "50" | "24"         |
      | "N-4891_NOT_AML_KYC = Y"                                                                        | "41"     | "40" | "25"         |


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_Ultimate_Negative_TestCases_TestData @4891 @NOVA @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Ultimate_RS19067_4891_NOVA Create test data for Negative Test Cases

     #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date


    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    #* print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

 # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                                          | ACCT_ODT | DOB    | CUST_OPND_DT |
      | "N-4891_PRIM_CNTRY_CD!= CA"                     | "45"     | "34"   | "20"         |
      | "N-4891_PRIM_CNTRY_CD= Null"                    | "45"     | "20"   | "20"         |
      | "N-4891_CUST_TP_CD != PSNL"                     | "45"     | "35"   | "20"         |
      | "N-4891_CUST_TP_CD =  Null"                     | "45"     | "49"   | "20"         |
      | "N-4891_DO_NOT_SOLICIT_F= Y"                    | "45"     | "45"   | "20"         |
      | "N-4891_Indv_Brth_Dt Equal to 17"               | "45"     | "17"   | "20"         |
      | "N-4891_Indv_Brth_Dt Equal to Null"             | "45"     | "NULL" | "20"         |
      | "N-4891_Indv_Brth_Dt with in range (1-16)"      | "45"     | "5"    | "20"         |
      | "N-4891_PRD CD- 01, SUB PRD CD -08"             | "45"     | "55"   | "20"         |
      | "N-4891_PRD CD-02, SUB PRD CD -04"              | "45"     | "45"   | "20"         |
      | "N-4891_PRD CD- 07, SUB PRD CD -08"             | "45"     | "45"   | "20"         |
      | "N-4891_PRD CD-13, SUB PRD CD -12"              | "45"     | "45"   | "20"         |
      | "N-4891_PRD CD- 18, SUB PRD CD -02"             | "45"     | "45"   | "20"         |
      | "N-4891_PRD CD-19, SUB PRD CD -11"              | "45"     | "45"   | "20"         |
      | "N-4891_PRD CD-23, SUB PRD CD -02"              | "45"     | "45"   | "20"         |
      | "N-4891_SRC_ACCT_STAT_CD- B"                    | "45"     | "65"   | "20"         |
      | "N-4891_SRC_ACCT_STAT_CD-Null"                  | "45"     | "48"   | "20"         |
      | "N-4891_Account Open Date greater than 58 days" | "70"     | "48"   | "20"         |
      | "N-4891_Account Open Date equal to Null"        | "NULL"   | "45"   | "20"         |
      | "N-4891_Account Open Date less than 28"         | "26"     | "45"   | "20"         |
      | "N-4891_Account Open Date equals to 27"         | "27"     | "45"   | "20"         |
      | "N-4891_Account Open Date equals to 59"         | "59"     | "45"   | "20"         |
      | "N-4891_Deceased_F= Y"                          | "50"     | "55"   | "20"         |
      | "N-4891_Deceased_F= Null"                       | "50"     | "65"   | "20"         |
      | "N-4891_LANG_CD= K"                             | "50"     | "48"   | "20"         |
      | "N-4891_LANG_CD= NE"                            | "50"     | "48"   | "20"         |
      | "N-4891_LANG_CD= Null"                          | "50"     | "48"   | "20"         |
      | "N-4891_ACCT_SUBSYS_ID_KS"                      | "50"     | "48"   | "20"         |
      | "N-4891_MRKTBLE_F = N"                          | "50"     | "48"   | "20"         |
      | "N-4891_MRKTBLE_F = NULL"                       | "50"     | "48"   | "20"         |
      | "N-4891_BANKRUPTCY_DT is 2020-09-14"            | "50"     | "48"   | "20"         |
      | "N_4891_HAS_CLOSED_MPSA_F_Null"                 | "45"     | "34"   | "20"         |
      | "N_4891_HAS_CLOSED_MPSA_F_Y"                    | "45"     | "34"   | "20"         |

  @D2DEngagementCrossSell @D2DEngagement_CrossSell_Ultimate_Positive_4891111901_DualAcc @4891 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_Ultimate_4891111902_RS19067_4891_NOVA Create test data for Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT


    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


      # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def Account2 = <TestID>+'_Account_2'
    * print 'Second Account Test ID is '+Account2


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | Account2 | acct_num2     |

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                  | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4891_MPSA_Prod_CD_BBB_UltimateAcc_2301_4891111901"     | "45"     | "18" | "20"         |
      | "4891_MPSA_SubSysId_AB_UltimateAcc_2301_4891111901"     | "45"     | "18" | "21"         |
      | "4891_MPSA_Status_InActive_UltimateAcc_2301_4891111901" | "45"     | "19" | "22"         |
      | "4891_MPSA_Prod_CD_BBB_UltimateAcc_2303_4891111901"     | "45"     | "21" | "23"         |
      | "4891_MPSA_SubSysId_AB_UltimateAcc_2303_4891111901"     | "45"     | "50" | "24"         |
      | "4891_MPSA_Status_InActive_UltimateAcc_2303_4891111901" | "45"     | "40" | "25"         |
      | "N-4891_MPSA_Y_UltimateAcc_2301_4891111901"             | "45"     | "18" | "26"         |
      | "N-4891_MPSA_Y_UltimateAcc_2303_4891111901"             | "45"     | "21" | "26"         |


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_Ultimate_PosNeg_AFILExclusion @4891 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_Ultimate_4891111901_RS19067_4891_NOVA Create test data<TestID> for Positive Test Cases
 #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
  # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date
  # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
  # Convert the acct_odt to YYYY-MM-DD format
    * string Acct_Odt1 = <Acct_Odt1> == 'NULL'? 'NULL': dateFormat(<Acct_Odt1>)
    * print "First Account ODT is", Acct_Odt1
  # Convert the acct_odt to YYYY-MM-DD format
    * string Acct_Odt2 = <Acct_Odt2> == 'NULL'? 'NULL': dateFormatExcludeDays(<Acct_Odt2>)
    * print "Second Account ODT is", Acct_Odt2
  # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    * table examples
      | testId                | accountNumber | ACCT_ODT  |
      | <TestID>              | acct_num1     | Acct_Odt1 |
      | <TestID>+'_Account_2' | acct_num2     | Acct_Odt2 |
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
      | TestID                                                                                                                      | Acct_Odt1 | Acct_Odt2 | DOB  | CUST_OPND_DT |
      | "4891_ACCT_SUBSYS_ID != SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"   | "41"      | "170"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD != Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"   | "41"      | "160"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = NULL and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT <= 6 months"      | "41"      | "150"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD != 9  and Current Date - ACCT_ODT <= 6 months"   | "41"      | "140"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = NULL  and Current Date - ACCT_ODT <= 6 months" | "41"      | "130"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT > 6 months"     | "41"      | "181"     | "18" | "20"         |
      | "4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT = NULL"         | "41"      | "NULL"    | "18" | "20"         |
      | "N-4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT < 6 months"   | "41"      | "179"     | "18" | "20"         |
      | "N-4891_ACCT_SUBSYS_ID = SL and SRC_ACCT_STAT_CD = Active and SRC_SYS_PRD_CD = 9  and Current Date - ACCT_ODT = 6 months"   | "41"      | "180"     | "18" | "20"         |

 # July 20th 2023 Release

  @D2DEngagementCrossSell @D2DEngagement_20thJuly2023Release_Exclusion_Positive_Negative_4891 @4891 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_20thJuly2023Release_RS19067_4891_NOVA Create test data<TestID> for Positive and Negative Test Cases
#    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    #* print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT

    * string VALID_START_DATE = <VALID_START_DATE>
    * string VALID_END_DATE = <VALID_END_DATE>

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

 # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

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
  #Exclusion Positive
      | TestID                                                              | ACCT_ODT | DOB  | CUST_OPND_DT | VALID_START_DATE | VALID_END_DATE |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "41"     | "18" | "20"         | "2"              | "-2"           |
#      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "41"     | "18" | "20"         | "2"              | "-2"           |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "41"     | "18" | "20"         | "2"              | "-2"           |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "41"     | "18" | "20"         | "2"              | "1"            |
      | "4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "41"     | "18" | "20"         | "-1"             | "-2"           |

#Exclusion Negative

      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "45"     | "18" | "20"         | "2"              | "-1"           |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     | "45"     | "18" | "20"         | "2"              | "0"            |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   | "45"     | "18" | "20"         | "1"              | "-2"           |
      | "N-4891_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   | "45"     | "18" | "20"         | "0"              | "-2"           |



    



