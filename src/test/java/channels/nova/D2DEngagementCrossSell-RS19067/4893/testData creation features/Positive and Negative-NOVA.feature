@D2D_NOVA_CROSSSELL_BBA

Feature: Create test data for D2D Engagement-CrossSell-BBA-4893 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_BBA_Positive_4893111901 @4893 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_BBA_4893111901_RS19067_4893_NOVA Create test data for Positive Test Cases
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
    * string CUST_OPND_DT =  <CUST_OPND_DT>

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
      | TestID                                          | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4893_ISSUE = CrossSell and Group = Investment" | "45"     | "20" | "30"         |
#      | "4893_DO_NOT_SOLICIT_F= Null"                                                                   | "45"     | "20" | "30"         |
#      | "4893_INDV_BRTH_DT_Equal to 18"                                                                 | "45"     | "18" | "30"         |
#      | "4893_LANG_CD=E"                                                                                | "45"     | "20" | "30"         |
#      | "4893_LANG_CD=EN"                                                                               | "45"     | "20" | "30"         |
#      | "4893_LANG_CD=F"                                                                                | "45"     | "20" | "30"         |
#      | "4893_LANG_CD=FR"                                                                               | "45"     | "20" | "30"         |
#      | "4893_LANG_CD_LowerCase=e"                                                                      | "45"     | "20" | "30"         |
#      | "4893_LANG_CD_LowerCase=en"                                                                     | "45"     | "20" | "30"         |
#      | "4893_LANG_CD_LowerCase=f"                                                                      | "45"     | "20" | "30"         |
#      | "4893_LANG_CD_LowerCase=fr"                                                                     | "45"     | "20" | "30"         |
#      | "4893_EMPLOYEE_STAFF_F=NULL"                                                                    | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 01, SUB PRD CD -01"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 01, SUB PRD CD -02"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 01, SUB PRD CD -03"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 01, SUB PRD CD -04"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 02, SUB PRD CD -01"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 02, SUB PRD CD -02"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 02, SUB PRD CD -03"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -01"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -02"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -03"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -04"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -07"                                                               | "45"     | "20" | "30"         |
#      | "4893_PRD CD- 19, SUB PRD CD -08"                                                               | "45"     | "20" | "30"         |
#      | "4893_Account Open Date equal to 28 days"                                                       | "28"     | "20" | "30"         |
#      | "4893_Account Open Date equal to 58 days"                                                       | "58"     | "20" | "30"         |
#      | "4893_Perform Viewed Disposition and offer should display when Lead scope - ACT"                | "50"     | "40" | "38"         |
#      | "4893_Perform Accepted In Progress Disposition and offer should display when Lead scope - ACT"  | "50"     | "40" | "38"         |
#      | "4893_Perform Accepted Complete Disposition and offer should not display when Lead scope - ACT" | "50"     | "40" | "38"         |
#      | "4893_Validate IH Record fields against Proposition"                                            | "45"     | "20" | "30"         |
      | "4893_NTC_MCB=Y_Arrival Date within 3 years"    | "30"     | "20" | "30"         |
#      | "4893_NTC_BBP_MCB=Y_Arrival Date within 3 years"                                                | "30"     | "20" | "30"         |


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_BBA_Negative_TestCases_TestData @4893 @NOVA @RS19067
  Scenario Outline: D2D Engagement-CrossSell_BBA_RS19067_4893_NOVA Create test data for Negative Test Cases

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
      | "N-4893_PRIM_CNTRY_CD!= CA"                     | "45"     | "20"   | "30"         |
      | "N-4893_PRIM_CNTRY_CD= Null"                    | "45"     | "20"   | "30"         |
      | "N-4893_CUST_TP_CD != PSNL"                     | "45"     | "20"   | "30"         |
      | "N-4893_CUST_TP_CD =  Null"                     | "45"     | "20"   | "30"         |
      | "N-4893_DO_NOT_SOLICIT_F= Y"                    | "45"     | "20"   | "30"         |
      | "N-4893_Indv_Brth_Dt Equal to 17"               | "45"     | "17"   | "30"         |
      | "N-4893_Indv_Brth_Dt Equal to Null"             | "45"     | "NULL" | "30"         |
      | "N-4893_Indv_Brth_Dt with in range (1-16)"      | "45"     | "12"   | "30"         |
      | "N-4893_PRD CD- 01, SUB PRD CD -08"             | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD-02, SUB PRD CD -04"              | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD- 07, SUB PRD CD -08"             | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD-13, SUB PRD CD -12"              | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD- 18, SUB PRD CD -02"             | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD-19, SUB PRD CD -11"              | "45"     | "20"   | "30"         |
      | "N-4893_PRD CD-23, SUB PRD CD -02"              | "45"     | "20"   | "30"         |
      | "N-4893_SRC_ACCT_STAT_CD- B"                    | "45"     | "20"   | "30"         |
      | "N-4893_SRC_ACCT_STAT_CD-Null"                  | "45"     | "20"   | "30"         |
      | "N-4893_Account Open Date greater than 58 days" | "70"     | "20"   | "30"         |
      | "N-4893_Account Open Date equal to Null"        | "NULL"   | "20"   | "30"         |
      | "N-4893_Account Open Date less than 28"         | "10"     | "20"   | "30"         |
      | "N-4893_Account Open Date equal to 27"          | "27"     | "20"   | "30"         |
      | "N-4893_Account Open Date equal to 59"          | "59"     | "20"   | "30"         |
      | "N-4893_Deceased_F= Y"                          | "45"     | "20"   | "30"         |
      | "N-4893_Deceased_F= Null"                       | "45"     | "20"   | "30"         |
      | "N-4893_LANG_CD= K"                             | "45"     | "20"   | "30"         |
      | "N-4893_LANG_CD= NE"                            | "45"     | "20"   | "30"         |
      | "N-4893_LANG_CD= Null"                          | "45"     | "20"   | "30"         |
      | "N-4893_EMPLOYEE_STAFF_F= Y"                    | "45"     | "20"   | "30"         |
      | "N-4893_ACCT_SUBSYS_ID_KS"                      | "45"     | "20"   | "30"         |
      | "N-4893_Prv_Bnk_Ind= Null"                      | "45"     | "20"   | "30"         |
      | "N-4893_Prv_Bnk_Ind= Y"                         | "45"     | "20"   | "30"         |
      | "N-4893_MRKTBLE_F = N"                          | "45"     | "20"   | "30"         |
      | "N-4893_MRKTBLE_F = NULL"                       | "45"     | "20"   | "30"         |


  @D2DEngagementCrossSell @D2DEngagement_CrossSell_BBA_Positive_4893111901_DualAcc @4893 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_BBA_4893111902_RS19067_4893_NOVA Create test data for Positive Test Cases

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
      | TestID                                             | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0101_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0101_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0101_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0102_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0102_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0102_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0103_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0103_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0103_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0104_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0104_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0104_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0201_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0201_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0201_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0202_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0202_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0202_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBAAcc_0203_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBAAcc_0203_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBAAcc_0203_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1901_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1901_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1901_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1902_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1902_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1902_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1903_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1903_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1903_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1904_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1904_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1904_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1907_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1907_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1907_4893111901" | "45"     | "20" | "30"         |
      | "4893_MPSA_Prod_CD_BBB_BBPAcc_1908_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_SubSysId_AB_BBPAcc_1908_4893111901"     | "45"     | "20" | "30"         |
      | "4893_MPSA_Status_InActive_BBPAcc_1908_4893111901" | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0101_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0102_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0103_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0104_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0201_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0202_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBAAcc_0203_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1901_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1902_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1903_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1904_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1907_4893111901"             | "45"     | "20" | "30"         |
      | "N-4893_MPSA_Y_BBPAcc_1908_4893111901"             | "45"     | "20" | "30"         |


     # July 20th 2023 Release

  @D2DEngagementCrossSell  @D2DEngagement_20thJuly2023Release_Exclusion_Positive_Negative_4893 @4893 @NOVA @19067
  Scenario Outline: D2D Engagement-CrossSell_20thJuly2023Release_RS19067_4893_NOVA Create test data<TestID> for Positive and Negative Test Cases
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
    * string CUST_OPND_DT =  <CUST_OPND_DT>

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
      | "4893_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_ne_N"    | "45"     | "20" | "30"         | "2"              | "-2"           |
      | "4893_NOVA_Seg_01_Trig_02_ExtTable_CAMPAIGN_CELL_CODE_FLAG_eq_NULL" | "45"     | "20" | "30"         | "2"              | "-2"           |
      | "4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_lt_Curr_Dt"       | "45"     | "20" | "30"         | "2"              | "1"            |
      | "4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_gt_Curr_Dt"     | "45"     | "20" | "30"         | "-1"             | "-2"           |

#Exclusion Negative

      | "N-4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_gt_Curr_Dt"     | "45"     | "20" | "30"         | "2"              | "-1"           |
      | "N-4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_END_DATE_eq_Curr_Dt"     | "45"     | "20" | "30"         | "2"              | "0"            |
      | "N-4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_lt_Curr_Dt"   | "45"     | "20" | "30"         | "1"              | "-2"           |
      | "N-4893_NOVA_Seg_01_Trig_02_ExtTable_VALID_START_DATE_eq_Curr_Dt"   | "45"     | "20" | "30"         | "0"              | "-2"           |
















