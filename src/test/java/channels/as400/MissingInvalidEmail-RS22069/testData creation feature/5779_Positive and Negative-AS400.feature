@MissingInvalidEmail_PositiveAndNegative_TestData_5779_AS400
Feature: Create test data for MissingInvalidEmail 5779 AS400 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MissingInvalidEmailAS400 @MissingInvalidEmail_AS400_5579_Positive_TestData @5779_Testing @RS22069 @Base
  Scenario Outline: MissingInvalidEmail_RS22069_5779_AS400 Create test data for Base Test Cases
    * def testDataFileName = InvalidmissingemailAs400TestData5779
    # Reading testId from Example section
    * def testId = <TestID>
# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
# Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
    * print "SOL Last Login Date is", solLastLoginDate
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = <MOB_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<MOB_LAST_LOGIN_DT>)
    * print "MOB Last Login Date is", mobLastLoginDate

#    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
#    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>

      # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    Examples:
      | TestID               | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5779_AS400_BASE_01" | "120"             | "120"             |

  @MissingInvalidEmailAS400 @MissingInvalidEmail_Positive_AS400_5579_TestData @5779_Testing @RS22069 @Positive
  Scenario Outline: MissingInvalidEmail_RS22069_5779_AS400 Create test data for Positive Test Cases
    * def testDataFileName = InvalidmissingemailAs400TestData5779
    # Reading testId from Example section
    * def testId = <TestID>
# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
# Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
    * print "SOL Last Login Date is", solLastLoginDate
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = <MOB_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<MOB_LAST_LOGIN_DT>)
    * print "MOB Last Login Date is", mobLastLoginDate
      # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    Examples:
      | TestID                                                                  | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5779_AS400_LANG_CD_eq_fr"                                              | "120"             | "120"             |
      | "5779_AS400_UNSUBSCRIBED_F_eq_NULL"                                     | "120"             | "120"             |
      | "5779_AS400_SOL_LAST_LOGIN_DT_eq_blank_AND_MOB_LAST_LOGIN_DT_eq_blank"  | "NULL"            | "NULL"            |
      | "5779_AS400_SOL_LAST_LOGIN_DT_eq_blank_AND_MOB_LAST_LOGIN_DT_gt_90days" | "120"             | "NULL"            |
      | "5779_AS400_SOL_LAST_LOGIN_DT_gt_90days_AND_MOB_LAST_LOGIN_DT_eq_blank" | "NULL"            | "120"             |
      | "5779_AS400_CUST_AGE_eq_18"                                             | "120"             | "120"             |
      | "5779_AS400_CUST_AGE_eq_74"                                             | "120"             | "120"             |
      | "5779_AS400_SOL_LAST_LOGIN_DT_eq_90days"                                | "NULL"            | "90"              |
      | "5779_AS400_MOB_LAST_LOGIN_DT_eq_90days"                                | "90"              | "NULL"            |
      | "5779_AS400_INDV_FRST_NM_eq_NULL"                                       | "120"             | "120"             |
      | "5779_AS400_INDV_LAST_NM_eq_NULL"                                       | "120"             | "120"             |

  @MissingInvalidEmailAS400 @MissingInvalidEmail_AS400_Negative_5579_TestData @5779_NEG_DATA @RS22069 @Negative
  Scenario Outline: MissingInvalidEmail_RS22069_5779_AS400 Create test data for Negative Test Cases

    * def testDataFileName = InvalidmissingemailAs400TestData5779
    # Reading testId from Example section
    * def testId = <TestID>
# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
# Generating account number to insert into database
#    * def accountNumber = '00000000'+CID
#    * print "account number is " + accountNumber
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
    * print "SOL Last Login Date is", solLastLoginDate
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = <MOB_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<MOB_LAST_LOGIN_DT>)
    * print "MOB Last Login Date is", mobLastLoginDate  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    Examples:
      | TestID                                     | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
#      | "N_5779_AS400_DECEASED_F_eq_Y"             | "120"             | "120"             |
#      | "N_5779_AS400_DECEASED_F_eq_NULL"          | "120"             | "120"             |
#      | "N_5779_AS400_PRIM_EMAIL_ADDR_ne_NULL"     | "120"             | "120"             |
#      | "N_5779_AS400_PRIM_CNTRY_CD_ne_CA"         | "120"             | "120"             |
#      | "N_5779_AS400_PRIM_CNTRY_CD_eq_NULL"       | "120"             | "120"             |
#      | "N_5779_AS400_LANG_CD_ne_en"               | "120"             | "120"             |
#      | "N_5779_AS400_LANG_CD_ne_fr"               | "120"             | "120"             |
#      | "N_5779_AS400_LANG_CD_eq_NULL"             | "120"             | "120"             |
#      | "N_5779_AS400_DO_NOT_EMAIL_F_eq_Y"         | "120"             | "120"             |
#      | "N_5779_AS400_DO_NOT_EMAIL_F_eq_NULL"      | "120"             | "120"             |
#      | "N_5779_AS400_UNSUBSCRIBED_F_eq_Y"         | "120"             | "120"             |
#      | "N_5779_AS400_SOL_LAST_LOGIN_DT_lt_90days" | "120"             | "89"              |
#      | "N_5779_AS400_MOB_LAST_LOGIN_DT_lt_90days" | "89"              | "120"             |
#      | "N_5779_AS400_CUST_AGE_lt_18"              | "120"             | "120"             |
#      | "N_5779_AS400_CUST_AGE_gt_74"              | "120"             | "120"             |
#      | "N_5779_AS400_CUST_AGE_eq_NULL"            | "120"             | "120"             |
#      | "N_5779_AS400_CUST_TP_CD_ne_PSNL"          | "120"             | "120"             |
      | "N_5779_AS400_DNS_F_eq_Y"                  | "120"             | "120"             |


  @MissingInvalidEmailAS400 @MissingInvalidEmail_Positive_AS400_5579_TestData_July6th2023Release @5779_Testing @RS22069 @Positive
  Scenario Outline: MissingInvalidEmail_RS22069_5779_AS400_July6th2023Release Create test data for Positive Test Cases
    * def testDataFileName = InvalidmissingemailAs400TestData5779
    # Reading testId from Example section
    * def testId = <TestID>
# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
# Generating account number to insert into database
#    * def accountNumber = '00000000'+CID
#    * print "account number is " + accountNumber
# Convert the Sol Last Login Date to YYYY-MM-DD format
    # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>

#    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
#    * print "SOL Last Login Date is", solLastLoginDate
## Convert the Sol Last Login Date to YYYY-MM-DD format
#    * string mobLastLoginDate = <MOB_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<MOB_LAST_LOGIN_DT>)
#    * print "MOB Last Login Date is", mobLastLoginDate
      # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    Examples:
      | TestID                              | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5779_AS400_DO_NOT_EMAIL_F_eq_Y"    | "120"             | "120"             |
      | "5779_AS400_DO_NOT_EMAIL_F_eq_NULL" | "120"             | "120"             |
      | "5779_AS400_DO_NOT_EMAIL_F_eq_N"    | "120"             | "120"             |
