@D2D_NOVA_CROSSSELL_SCOTIAONE

Feature: Create test data for D2D Engagement-CrossSell-ScotiaOne-4892 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_ScotiaOne_Positive_TestData_4892 @4892 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_ScotiaOne_4892111901_RS19067_4892_NOVA Create test data for Positive Test Cases
 #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    
        # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt


     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * print "Customer Open date is ", cust_opnd_dt

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
    
           # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')


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
      | TestID                                                               | ACCT_ODT | DOB  | CUST_OPND_DT | Arrive_Dt |
#      | "4892_ISSUE = CrossSell and Group = Investment"                      | "45"     | "20" | "40"         | "45"      |
#      | "4892_DO_NOT_SOLICIT_F= Null"                                                                   | "45"     | "20" | "40"|"45"|
#      | "4892_INDV_BRTH_DT_Equal to 18"                                                                 | "45"     | "18" | "40"|"45"|
#      | "4892_LANG_CD=E"                                                                                | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD=EN"                                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD=F"                                                                                | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD=FR"                                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD_LowerCase=e"                                                                      | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD_LowerCase=en"                                                                     | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD_LowerCase=f"                                                                      | "45"     | "20" | "40"|"45"|
#      | "4892_LANG_CD_LowerCase=fr"                                                                     | "45"     | "20" | "40"|"45"|
#      | "4892_PRD CD- 13, SUB PRD CD -01"                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_PRD CD- 13, SUB PRD CD -03"                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_PRD CD- 13, SUB PRD CD -07"                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_PRD CD- 13, SUB PRD CD -08"                                                               | "45"     | "20" | "40"|"45"|
#      | "4892_Account Open Date equal to 28 days"                                                       | "28"     | "20" | "40"|"45"|
#      | "4892_Account Open Date equal to 58 days"                                                       | "58"     | "20" | "40"|"45"|
#      | "4892_Perform Viewed Disposition and offer should display when Lead scope - ACT"                | "50"     | "20"|"45"|
#      | "4892_Perform Accepted In Progress Disposition and offer should display when Lead scope - ACT"  | "50"     | "20"|"45"|
#      | "4892_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" | "50"     | "20"|"45"|
#      | "4892_Validate IH Record fields against Proposition"                                            | "45"     | "20" | "40"|
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=01" | "45"     | "20" | "40"         | "45"      |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=01"                          | "45"     | "20" | "40"|"45"|
#      | "4892_N-NTC_MCB=N_Arrival Date greater than 3 years_PRD CD=13_SUB PRD CD=03"                    | "45"     | "20" | "40"|"45"|
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=03" | "45"     | "20" | "40"         | "45"      |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=07"                          | "45"     | "20" | "40"|"45"|
#      | "4892_N-NTC_MCB=Y_Arrival Date  greater than 3 years_PRD CD=13_SUB PRD CD=07"                   | "45"     | "20" | "40"|"45"|
#      | "4892_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=08" | "45"     | "20" | "40"         | "1825"    |
#      | "4892_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=13_SUB PRD CD=08"                          | "45"     | "20" | "40"|"45"|
#      | "N-4892_ARRV_DT = 5 years"                                           | "45"     | "20" | "40"         | "1826"    |
      | "N-4892_ARRV_DT > 5 years"                                           | "45"     | "20" | "40"         | "1827"    |
#      | "N-4892_MCB_IND = NULL"                                                                         | "45"     | "20" | "40"|"45"|
#      | "N-4892_ARRV_DT_eq_NULL"                                             | "45"     | "20" | "40"         | "NULL"    |

  @D2DEngagementCrossSell @D2DEngagement_CrossSell_ScotiaOne_Negative_TestData_4892 @4892 @NOVA @RS19067
  Scenario Outline: D2D Engagement-CrossSell_ScotiaOne_RS19067_4892_NOVA Create test data for Negative Test Cases

     #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date
            # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt



    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
           # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')


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
      | TestID                                          | ACCT_ODT | DOB    | CUST_OPND_DT | Arrive_Dt |
      | "N-4892_PRIM_CNTRY_CD!= CA"                     | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRIM_CNTRY_CD= Null"                    | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_CUST_TP_CD != PSNL"                     | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_CUST_TP_CD =  Null"                     | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_DO_NOT_SOLICIT_F= Y"                    | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_Indv_Brth_Dt Equal to 17"               | "45"     | "17"   | "40"         | "45"      |
      | "N-4892_Indv_Brth_Dt Equal to Null"             | "45"     | "NULL" | "40"         | "45"      |
      | "N-4892_Indv_Brth_Dt with in range (1-16)"      | "45"     | "10"   | "40"         | "45"      |
      | "N-4892_PRD CD- 01, SUB PRD CD -08"             | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD-02, SUB PRD CD -04"              | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD- 07, SUB PRD CD -08"             | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD-13, SUB PRD CD -12"              | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD- 18, SUB PRD CD -02"             | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD-19, SUB PRD CD -11"              | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_PRD CD-23, SUB PRD CD -02"              | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_SRC_ACCT_STAT_CD- B"                    | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_SRC_ACCT_STAT_CD-Null"                  | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_Account Open Date greater than 58 days" | "70"     | "20"   | "40"         | "45"      |
      | "N-4892_Account Open Date equal to Null"        | "NULL"   | "20"   | "40"         | "45"      |
      | "N-4892_Account Open Date less than 28"         | "10"     | "20"   | "40"         | "45"      |
      | "N-4892_Account Open Date equal to 27"          | "27"     | "20"   | "40"         | "45"      |
      | "N-4892_Account Open Date equal to 59"          | "59"     | "20"   | "40"         | "45"      |
      | "N-4892_Deceased_F= Y"                          | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_Deceased_F= Null"                       | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_LANG_CD= K"                             | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_LANG_CD= NE"                            | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_LANG_CD= Null"                          | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_EMPLOYEE_STAFF_F= Y"                    | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_ACCT_SUBSYS_ID_KS"                      | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_Prv_Bnk_Ind= Null"                      | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_Prv_Bnk_Ind= Y"                         | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_MRKTBLE_F = N"                          | "45"     | "20"   | "40"         | "45"      |
      | "N-4892_MRKTBLE_F = NULL"                       | "45"     | "20"   | "40"         | "45"      |


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_ScotiaOne_Positive_4892111901_DualAcc @4892 @NOVA @RS19067
  Scenario Outline: D2D Engagement-CrossSell_ScotiaOne_4892111902_RS19067_4892_NOVA Create test data for Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
            # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt


     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

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
               # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')




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
      | TestID                                                   | ACCT_ODT | DOB  | CUST_OPND_DT | Arrive_Dt |
      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1301_4892111901"     | "45"     | "18" | "20"         | "45"      |
      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1301_4892111901"     | "45"     | "18" | "21"         | "45"      |
      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1301_4892111901" | "45"     | "19" | "22"         | "45"      |
      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1303_4892111901"     | "45"     | "21" | "23"         | "45"      |
      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1303_4892111901"     | "45"     | "50" | "24"         | "45"      |
      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1303_4892111901" | "45"     | "40" | "25"         | "45"      |
      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1307_4892111901"     | "45"     | "18" | "26"         | "45"      |
      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1307_4892111901"     | "45"     | "21" | "26"         | "45"      |
      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1307_4892111901" | "45"     | "18" | "20"         | "45"      |
      | "4892_MPSA_Prod_CD_BBB_ScotiaOneAcc_1308_4892111901"     | "45"     | "18" | "21"         | "45"      |
      | "4892_MPSA_SubSysId_AB_ScotiaOneAcc_1308_4892111901"     | "45"     | "19" | "22"         | "45"      |
      | "4892_MPSA_Status_InActive_ScotiaOneAcc_1308_4892111901" | "45"     | "21" | "23"         | "45"      |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1301_4892111901"             | "45"     | "50" | "24"         | "45"      |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1303_4892111901"             | "45"     | "40" | "25"         | "45"      |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1307_4892111901"             | "45"     | "18" | "26"         | "45"      |
      | "N-4892_MPSA_Y_ScotiaOneAcc_1308_4892111901"             | "45"     | "21" | "26"         | "45"      |
      | "N-4892_Account>1"                                       | "45"     | "20" | "40"         | "45"      |
      | "N-4892_MultipleAccounts_Active_Non-Active"              | "45"     | "20" | "40"         | "45"      |

     # July 20th 2023 Release
  @D2DEngagementCrossSell @D2DEngagement_20thJuly2023Release_Exclusion_Positive_Negative_4892 @4892 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_20thJuly2023Release_RS19067_4892_NOVA Create test data<TestID> for Positive and Negative Test Cases
 #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = CrossSellNOVAtestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

        # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt


     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
#    * print "Customer Open date is ", cust_opnd_dt

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

           # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')


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
    #Exclusion Positve
      | TestID                                                              | ACCT_ODT | DOB  | CUST_OPND_DT | Arrive_Dt | VALID_START_DATE | VALID_END_DATE |
#      | "4892_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "45"     | "20" | "40"         | "45"      | "-2"             | "-2"           |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "45"     | "20" | "40"         | "45"      | "2"              | "-2"           |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "45"     | "20" | "40"         | "45"      | "2"              | "-2"           |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "45"     | "20" | "40"         | "45"      | "2"              | "1"            |
      | "4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "45"     | "20" | "40"         | "45"      | "-1"             | "-2"           |

#Exclusion Negative

#      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "45"     | "20" | "40"         | "45"      | "2"              | "-2"           |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "45"     | "20" | "40"         | "45"      | "2"              | "-1"           |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     | "45"     | "20" | "40"         | "45"      | "2"              | "0"            |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   | "45"     | "20" | "40"         | "45"      | "1"              | "-2"           |
      | "N-4892_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   | "45"     | "20" | "40"         | "45"      | "0"              | "-2"           |



