@NTCMortgageAcquisition_Nova_5152
Feature: Create test data for NTC Mortage Acquisition-5152 Nova test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTCMortgageAcquisition_NOVA_1111_PositiveTestData @5152 @NOVA @RS2098D @1111
  Scenario Outline: NTC Mortgage Acquisition_RS2098D_5152_NOVA Create test data for 1111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCMANOVATestData
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

    Examples:
      | TestID                                                     | ACCT_ODT |
      | "5152_DECEASED_F = N"                                      | "272"    |
#      | "5152_CUST_TP_CD = PSNL"                                   | "272"    |
#      | "5152_Primary Country Cd = CA"                             | "272"    |
#      | "5152_CUST_AGE =18"                                        | "272"    |
#      | "5152_CUST_AGE > 18"                                       | "272"    |
#      | "5152_LANG_CD in E"                                        | "272"    |
#      | "5152_LANG_CD in EN"                                       | "272"    |
#      | "5152_LANG_CD in F"                                        | "272"    |
#      | "5152_LANG_CD in FR"                                       | "272"    |
#      | "5152_LANG_CD in Small Case e"                             | "272"    |
#      | "5152_LANG_CD in Small Case en"                            | "272"    |
#      | "5152_LANG_CD in Small Case f"                             | "272"    |
#      | "5152_LANG_CD in Small Case fr"                            | "272"    |
#      | "5152_DO_NOT_SOLICIT_F !=  Y"                              | "272"    |
#      | "5152_DO_NOT_SOLICIT_F =  NULL"                            | "272"    |
#      | "5152_MRKTBLE_F =  Y"                                      | "272"    |
#      | "5152_IMMGRTN_CAT_CD not in (S , S00)"                     | "272"    |
#      | "5152_Physicians_F != Y"                                   | "272"    |
#      | "5152_Physicians_F = NULL"                                 | "272"    |
#      | "5152_MCB_IND = Y"                                         | "272"    |
#      | "5152_ARRV_DT <  3 years"                                  | "272"    |
#      | "5152_ARRV_DT =  3 years"                                  | "272"    |
#      | "5152_ACCT_ODT = 271"                                      | "271"    |
#      | "5152_ACCT_ODT = 301"                                      | "301"    |
#      | "5152_ACCT_SUBSYS_ID = BB"                                 | "272"    |
#      | "5152_SRC_SACCT_STAT_CD = A"                               | "272"    |
#      | "5152_ACCT_ODT in (271-301)"                               | "288"    |
#      | "5152_PRD CD = 13 && SUB PRD CD IN (01 OR 03 OR 07 OR 08)" | "272"    |
#      | "5152_PRIMARY_ACCT_HOLDER_FLAG = Y"                        | "272"    |
#      | "5152_5152022201_IMMGRTN_CAT_CD in FW"                     | "272"    |
#      | "5152_5152022201_IMMGRTN_CAT_CD in FW0"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in C1"                     | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in C2"                     | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in EN2"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in FC1"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in FC2"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in FC3"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in PV1"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in PV2"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in SE2"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in STP"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in SW1"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in SW2"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in SW3"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in NV5"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in 999"                    | "272"    |
#      | "5152_5152022202_IMMGRTN_CAT_CD in 000"                    | "272"    |

  @NTCMortgageAcquisition_NOVA_1111_NegativeTestData @5152 @NOVA @RS2098D @1111
  Scenario Outline: NTC Mortgage Acquisition_RS2098D_5152_NOVA Create test data for Negative Test Data 1111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCMANOVATestData
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

    Examples:
      | TestID                                                    | ACCT_ODT |
      | "N_5152_DECEASED_F = Y"                                   | "272"    |
      | "N_5152_DECEASED_F = NULL"                                | "272"    |
      | "N_5152_CUST_TP_CD != PSNL"                               | "272"    |
      | "N_5152_Primary Country Cd != CA"                         | "272"    |
      | "N_5152_Primary Country Cd = NULL"                        | "272"    |
      | "N_5152_CUST_AGE = 17"                                    | "272"    |
      | "N_5152_CUST_AGE = NULL"                                  | "272"    |
      | "N_5152_LANG_CD in K"                                     | "272"    |
      | "N_5152_LANG_CD in NE"                                    | "272"    |
      | "N_5152_LANG_CD in NULL"                                  | "272"    |
      | "N_5152_DO_NOT_SOLICIT_F =  Y"                            | "272"    |
      | "N_5152_MRKTBLE_F =  N"                                   | "272"    |
      | "N_5152_MRKTBLE_F =  NULL"                                | "272"    |
      | "N_5152_IMMGRTN_CAT_CD not in S00"                        | "272"    |
      | "N_5152_IMMGRTN_CAT_CD not in S"                          | "272"    |
      | "N_5152_IMMGRTN_CAT_CD = NULL"                            | "272"    |
      | "N_5152_Physicians_F = Y"                                 | "272"    |
      | "N_5152_MCB_IND = N"                                      | "272"    |
      | "N_5152_MCB_IND = NULL"                                   | "272"    |
      | "N_5152_ARRV_DT > 3 years"                                | "272"    |
      | "N_5152_ACCT_ODT = 1"                                     | "1"      |
      | "N_5152_ACCT_ODT < 271"                                   | "270"    |
      | "N_5152_ACCT_ODT > 301"                                   | "302"    |
      | "N_5152_ACCT_ODT = NULL"                                  | "NULL"   |
      | "N_5152_ACCT_SUBSYS_ID! = BB"                             | "272"    |
      | "N_5152_SRC_SACCT_STAT_CD! = A"                           | "272"    |
      | "N_5152_PRD CD = 01 && SUB PRD CD IN (01,02,03,04)"       | "272"    |
      | "N_5152_PRD CD = 02 && SUB PRD CD IN (01,02,03)"          | "272"    |
      | "N_5152_PRD CD = 19 && SUB PRD CD IN (01,02,03,04,07,08)" | "272"    |
      | "N_5152_PRD CD = 07 && SUB PRD CD IN (11,12)"             | "272"    |
      | "N_5152_PRD CD = 23 && SUB PRD CD IN (01,03)"             | "272"    |
      | "N_5152_PRIMARY_ACCT_HOLDER_FLAG = N"                     | "272"    |
      | "N_5152_PRIMARY_ACCT_HOLDER_FLAG = NULL"                  | "272"    |

  @NTCMortgageAcquisition_NOVA_1122_TestData @5152 @NOVA @RS2098D @1122
  Scenario Outline: NTC Mortgage Acquisition_RS2098D_5152_NOVA Create test data for 1122

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTCMANOVATestData
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
      | TestID                                                                                                           | ACCT_ODT |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 01 && SUB PRD CD IN (01 or 02 or 03 or 04)"             | "272"    |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 02 && SUB PRD CD IN (01 or 02 or 03)"                   | "272"    |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 19 && SUB PRD CD IN (01 or 02 or 03 or 04 or 07 or 08)" | "272"    |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 07 && SUB PRD CD IN (11 or 12)"                         | "272"    |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 13 && SUB PRD CD IN (01 or 03 or 07 or 08)"             | "272"    |
      | "5152_1Preferred_With_SRC_SACCT_STAT_CD = NA && PRD CD = 23 && SUB PRD CD IN (01 or 03)"                         | "272"    |
      | "5152_1Preferred_With_ACCT_SUBSYS_ID = UO AND SRC_ACCT_STAT_CD! = Active"                                        | "272"    |
      | "5152_1Preferred_With_ACCT_SUBSYS_ID! = UO AND SRC_ACCT_STAT_CD = Active"                                        | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 01 && SUB PRD CD IN (01,02,03,04)"                                              | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 02 && SUB PRD CD IN (01,02,03)"                                                 | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 19 && SUB PRD CD IN (01,02,03,04,07,08)"                                        | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 07 && SUB PRD CD IN (11,12)"                                                    | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 13 && SUB PRD CD IN (01,03,07,08)"                                              | "272"    |
      | "N_5152_1Preferred_With_PRD CD = 23 && SUB PRD CD IN (01,03)"                                                    | "272"    |
      | "N_5152_1Preferred_With_ACCT_SUBSYS_ID = UO AND SRC_ACCT_STAT_CD = Active"                                       | "272"    |