@Segmentation_TestData_4479
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Segmentation test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL<30_MOB>30_TestDatata @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL<30, MOB>30
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

       # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(10)
    * print "SOL Last Login Date is", solLastLoginDate

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(40)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-1" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,AC_Scenario-1" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples


     # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL<30_MOB=NULL_TestDatata @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL<30, MOB=NULL
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

    # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(10)
    * print "SOL Last Login Date is", solLastLoginDate


     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                   | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login is NULL,KS_Scenario-2" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login is NULL,AC_Scenario-2" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

      # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL>30_MOB<30_TestDatata @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL>30, MOB<30
    * def testDataFileName = CLItestDataFileName

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

      # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(40)
    * print "SOL Last Login Date is", solLastLoginDate

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(10)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(10)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login < 30days,KS_Scenario-3" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login < 30days,AC_Scenario-3" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

     # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL>NULL_MOB<30_TestDatata @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL>NULL, MOB<30

    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(10)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login < 30days,KS_Scenario-4" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login < 30days,AC_Scenario-4" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

      # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL<30_MOB<30_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL<30, MOB<30
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

        # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(10)
    * print "SOL Last Login Date is", solLastLoginDate

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(20)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login < 30days,KS_Scenario-5" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login < 30days,AC_Scenario-5" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

     # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL>30_MOB>30_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL>30, MOB>30
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(40)
    * print "SOL Last Login Date is", solLastLoginDate

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(50)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login > 30days,KS_Scenario-6" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login > 30days,AC_Scenario-6" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

         # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL>30_MOB=NULL_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL>30, MOB=NULL

    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

      # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(40)
    * print "SOL Last Login Date is", solLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                   | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login is NULL,KS_Scenario-7" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login >30Days & MOB Login is NULL,AC_Scenario-7" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

     # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL=NULL_MOB>30_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL=NULL, MOB>30
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

         # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(50)
    * print "MOB Last Login Date is", mobLastLoginDate

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                    | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login > 30days,KS_Scenario-8" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login > 30days,AC_Scenario-8" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

      # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL=NULL_MOB=NULL_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL=NULL, MOB=NULL

    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                   | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login is NULL,KS_Scenario-9" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login is NULL & MOB Login is NULL,AC_Scenario-9" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples[0]

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_SOL>30_MOB>30_1-KS_2-BB_Accounts_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y, SOL>30, MOB>30 for 1 KS account and 2 BB accounts
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = dateFormat(20)
    * print "SOL Last Login Date is", solLastLoginDate

     # Convert the MOB Last Login Date to YYYY-MM-DD format
    * string mobLastLoginDate = dateFormat(50)
    * print "MOB Last Login Date is", mobLastLoginDate

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    * def acct_num_two = '00000000'+randGen(15)
    * def scd_num_one = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                      | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,KS_Scenario-10"  | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,AC1_Scenario-10" | acct_num_One  | scd_num          |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,Has ScotiaCard, SOL Login <30Days & MOB Login > 30days,AC2_Scenario-10" | acct_num_two  | scd_num_one      |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

       # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet') examples[0]

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_Y_Prov_Y_ScotiaCard_Y_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                             | accountNumber | ScotiaCardNumber |
      | "4479_DNS=Y,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-11" | acct_num      | ""               |
      | "4479_DNS=Y,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,AC_Scenario-11" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples[0]

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_Y_Prov_N_ScotiaCard_Y_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_Y, Prov_N, ScotiaCard_Y
    * def testDataFileName = CLItestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                         | accountNumber | ScotiaCardNumber |
      | "4479_DNS=Y,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-12" | acct_num      | ""               |
      | "4479_DNS=Y,PRIM_PROV_CD=Quebec,has ScotiaCard,AC_Scenario-12" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples[0]

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_Y_ScotiaCard_Y_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_Y, ScotiaCard_Y
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                             | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,KS_Scenario-13" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,has ScotiaCard,AC_Scenario-13" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples[0]

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_N_Prov_N_ScotiaCard_Y_TestData @4479 @AS400 @VS18076
  Scenario: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N, Prov_N, ScotiaCard_Y
    * def testDataFileName = CLItestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def scd_num = randGen(13)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                         | accountNumber | ScotiaCardNumber |
      | "4479_DNS=N,PRIM_PROV_CD=Quebec,has ScotiaCard,KS_Scenario-14" | acct_num      | ""               |
      | "4479_DNS=N,PRIM_PROV_CD=Quebec,has ScotiaCard,AC_Scenario-14" | acct_num_One  | scd_num          |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') examples[0]

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  @CreditLimitIncrease @SegmentationVISASole_DNS_Y_N_Prov_N_ScotiaCard_N_Y_TestData_x @4479 @AS400 @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole_VS18076_4479_AS400 Create test data for Segmentation logic DNS_N,Y, Prov_N, ScotiaCard_N,Y
    * def testDataFileName = CLItestDataFileName
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(20)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(30)

     # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                             |
      | "4479_DNS=Y,PRIM_PROV_CD=Non-Quebec,No ScotiaCard" |
      | "4479_DNS=Y,PRIM_PROV_CD=Quebec,No ScotiaCard"     |
      | "4479_DNS=N,PRIM_PROV_CD=Non-Quebec,No ScotiaCard" |
      | "4479_DNS=N,PRIM_PROV_CD=Quebec,No ScotiaCard"     |




