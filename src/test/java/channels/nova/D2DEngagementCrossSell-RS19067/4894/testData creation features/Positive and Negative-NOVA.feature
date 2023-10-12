@D2D_NOVA_CROSSSELL_SBAP

Feature: Create test data for D2D Engagement-CrossSell-SBAP-4894 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_SBAP_Positive_4894111901 @4894 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_SBAP_4894111901_RS19067_4894_NOVA Create test data for Positive Test Cases
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

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT
            # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt


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
      | TestID                                                                                          | ACCT_ODT | DOB  | CUST_OPND_DT |Arrive_Dt |
#      | "4894_ISSUE = CrossSell and Group = Investment"                                                 | "45"     | "20" | "30"         |"45"|
#      | "4894_DO_NOT_SOLICIT_F= Null"                                                                   | "45"     | "20" | "30"         |"45"|
#      | "4894_INDV_BRTH_DT_Equal to 18"                                                                 | "45"     | "18" | "30"         |"45"|
#      | "4894_LANG_CD=E"                                                                                | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD=EN"                                                                               | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD=F"                                                                                | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD=FR"                                                                               | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD_LowerCase=e"                                                                      | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD_LowerCase=en"                                                                     | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD_LowerCase=f"                                                                      | "45"     | "20" | "30"         |"45"|
#      | "4894_LANG_CD_LowerCase=fr"                                                                     | "45"     | "20" | "30"         |"45"|
#      | "4894_PRD CD- 07, SUB PRD CD -11"                                                               | "45"     | "20" | "30"         |"45"|
#      | "4894_PRD CD- 07, SUB PRD CD -12"                                                               | "45"     | "20" | "30"         |"45"|
#      | "4894_EMPLOYEE_STAFF_F=NULL"                                                                    | "45"     | "20" | "30"         |"45"|
#      | "4894_Account Open Date equal to 28 days"                                                       | "28"     | "20" | "30"         |"45"|
#      | "4894_Account Open Date equal to 58 days"                                                       | "58"     | "20" | "30"         |"45"|
#      | "4894_Perform Viewed Disposition and offer should display when Lead scope - ACT"                | "50"     | "40" | "38"         |"45"|
#      | "4894_Perform Accepted In Progress Disposition and offer should display when Lead scope - ACT"  | "50"     | "40" | "38"         |"45"|
#      | "4894_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" | "50"     | "40" | "38"         |"45"|
#      | "4894_Validate IH Record fields against Proposition"                                            | "50"     | "20" | "30"         |"45"|
#      | "4894_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=07_SUB PRD CD=11"                            | "45"     | "20" | "30"         |"45"|
#      | "4894_N-NTC_MCB=N_Arrival Date within 3 years_PRD CD=07_SUB PRD CD=11"                          | "45"     | "20" | "30"         |"45"|
#      | "4894_N-NTC_MCB=Y_Arrival Date greater than 3 years_PRD CD=07_SUB PRD CD=12"                    | "45"     | "20" | "30"         |"45"|
#      | "4894_NTC_MCB=Y_Arrival Date within 3 years_PRD CD=07_SUB PRD CD=12"                            | "45"     | "20" | "30"         |"1825"|
#      | "N-4894_ARRV_DT = 5 years"                                                                      | "45"     | "20" | "30"         |"1826"|
      | "N-4894_ARRV_DT > 5 years"                                                                      | "45"     | "20" | "30"         |"1827"|
      # | "N-4894_MCB_IND = NULL"                                                                         | "45"     | "20" | "30"         |"45"|
#      | "N-4894_ARRV_DT_eq_NULL"                                             | "45"     | "20" | "40"         | "NULL"    |

  @D2DEngagementCrossSell @D2DEngagement_CrossSell_SBAP_Negative_TestCases_TestData @4894 @NOVA @RS19067
  Scenario Outline: D2D Engagement-CrossSell_SBAP_RS19067_4894_NOVA Create test data for Negative Test Cases

     #    Reading testId from Example section
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
      | TestID                                          | ACCT_ODT | DOB    | CUST_OPND_DT |Arrive_Dt |
      | "N-4894_PRIM_CNTRY_CD!= CA"                     | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRIM_CNTRY_CD= Null"                    | "50"     | "20"   | "30"         |"45"|
      | "N-4894_CUST_TP_CD != PSNL"                     | "50"     | "20"   | "30"         |"45"|
      | "N-4894_CUST_TP_CD =  Null"                     | "50"     | "20"   | "30"         |"45"|
      | "N-4894_DO_NOT_SOLICIT_F= Y"                    | "50"     | "20"   | "30"         |"45"|
      | "N-4894_Indv_Brth_Dt Equal to 17"               | "50"     | "17"   | "30"         |"45"|
      | "N-4894_Indv_Brth_Dt Equal to Null"             | "50"     | "NULL" | "30"         |"45"|
      | "N-4894_Indv_Brth_Dt with in range (1-16)"      | "50"     | "10"   | "30"         |"45"|
      | "N-4894_PRD CD- 01, SUB PRD CD -08"             | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD-02, SUB PRD CD -04"              | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD- 07, SUB PRD CD -08"             | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD-13, SUB PRD CD -12"              | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD- 18, SUB PRD CD -02"             | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD-19, SUB PRD CD -11"              | "50"     | "20"   | "30"         |"45"|
      | "N-4894_PRD CD-23, SUB PRD CD -02"              | "50"     | "20"   | "30"         |"45"|
      | "N-4894_SRC_ACCT_STAT_CD- B"                    | "50"     | "20"   | "30"         |"45"|
      | "N-4894_SRC_ACCT_STAT_CD-Null"                  | "50"     | "20"   | "30"         |"45"|
      | "N-4894_Account Open Date greater than 58 days" | "70"     | "20"   | "30"         |"45"|
      | "N-4894_Account Open Date equal to Null"        | "NULL"   | "20"   | "30"         |"45"|
      | "N-4894_Account Open Date less than 28"         | "10"     | "20"   | "30"         |"45"|
      | "N-4894_Account Open Date equal to 27"          | "27"     | "20"   | "30"         |"45"|
      | "N-4894_Account Open Date equal to 59"          | "59"     | "20"   | "30"         |"45"|
      | "N-4894_Deceased_F= Y"                          | "50"     | "20"   | "30"         |"45"|
      | "N-4894_Deceased_F= Null"                       | "50"     | "20"   | "30"         |"45"|
      | "N-4894_LANG_CD= K"                             | "50"     | "20"   | "30"         |"45"|
      | "N-4894_LANG_CD= NE"                            | "50"     | "20"   | "30"         |"45"|
      | "N-4894_LANG_CD= Null"                          | "50"     | "20"   | "30"         |"45"|
      | "N-4894_EMPLOYEE_STAFF_F= Y"                    | "50"     | "20"   | "30"         |"45"|
      | "N-4894_ACCT_SUBSYS_ID_KS"                      | "50"     | "20"   | "30"         |"45"|
      | "N-4894_Prv_Bnk_Ind= Null"                      | "50"     | "20"   | "30"         |"45"|
      | "N-4894_Prv_Bnk_Ind= Y"                         | "50"     | "20"   | "30"         |"45"|
      | "N-4894_MRKTBLE_F = N"                          | "50"     | "20"   | "30"         |"45"|
      | "N-4894_MRKTBLE_F = NULL"                       | "50"     | "20"   | "30"         |"45"|

  @D2DEngagementCrossSell @D2DEngagement_CrossSell_SBAP_Positive_4894111901_DualAcc @4894 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_SBAP_4894111902_RS19067_4894_NOVA Create test data for Positive Test Cases

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
      | TestID                                              | ACCT_ODT | DOB  | CUST_OPND_DT |Arrive_Dt |
      | "4894_MPSA_Prod_CD_BBB_SBAPAcc_0711_4894111901"     | "50"     | "20" | "30"         |"45"|
      | "4894_MPSA_SubSysId_AB_SBAPAcc_0711_4894111901"     | "50"     | "20" | "30"         |"45"|
      | "4894_MPSA_Status_InActive_SBAPAcc_0711_4894111901" | "50"     | "20" | "30"         |"45"|
      | "4894_MPSA_Prod_CD_BBB_SBAPAcc_0712_4894111901"     | "50"     | "20" | "30"         |"45"|
      | "4894_MPSA_SubSysId_AB_SBAPAcc_0712_4894111901"     | "50"     | "20" | "30"         |"45"|
      | "4894_MPSA_Status_InActive_SBAPAcc_0712_4894111901" | "50"     | "20" | "30"         |"45"|
      | "N-4894_MPSA_Y_SBAPAcc_0711_4894111901"             | "50"     | "20" | "30"         |"45"|
      | "N-4894_MPSA_Y_SBAPAcc_0712_4894111901"             | "50"     | "20" | "30"         |"45"|
      | "N-4894_Account>1"                                  | "45"     | "20" | "30"         |"45"|
      | "N-4894_MultipleAccounts_Active_Non-Active"         | "45"     | "20" | "30"         |"45"|


     # July 20th 2023 Release
  @D2DEngagementCrossSell @ @D2DEngagement_20thJuly2023Release_Exclusion_Positive_Negative_4894 @4894 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_20thJuly2023Release_RS19067_4894_NOVA Create test data<TestID> for Positive and Negative Test Cases
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

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", CUST_OPND_DT
            # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

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
    #Exclusion Positive
      | TestID                                                              | ACCT_ODT | DOB  | CUST_OPND_DT | Arrive_Dt | VALID_START_DATE | VALID_END_DATE |
      | "4894_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "45"     | "20" | "30"         | "45"      | "2"              | "-2"           |
      | "4894_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "45"     | "20" | "30"         | "45"      | "2"              | "-2"           |
      | "4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "45"     | "20" | "30"         | "45"      | "2"              | "1"            |
      | "4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "45"     | "20" | "30"         | "45"      | "-1"             | "-2"           |

   #Exclusion Negative

      | "N-4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "50"     | "20" | "30"         | "45"      | "2"              | "-1"           |
      | "N-4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     | "50"     | "20" | "30"         | "45"      | "2"              | "0"            |
      | "N-4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   | "50"     | "20" | "30"         | "45"      | "1"              | "-2"           |
      | "N-4894_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   | "50"     | "20" | "30"         | "45"      | "0"              | "-2"           |




