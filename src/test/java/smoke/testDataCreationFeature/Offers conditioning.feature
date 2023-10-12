@SanityCondition
Feature: Create test data for Sanity scenarios for all channels

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  ##########################SOL####################################
  # Single accounts
  @D2DWelcome @D2DFundAccount @D2DBillPayment @D2DRewardReinforcement @D2DCrossSell
    @4330 @4331 @4332 @4334 @4368  @4315 @4316 @4380 @4363 @4364 @4366  @4891 @4892 @4893 @4894 @SOL
    @Sanity-SOL
  Scenario Outline: D2D Engagement SOL Create test data for Sanity

 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

       # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
    * print "SOL Last Login Date is", solLastLoginDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

     # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

     # insert the offer start date into the CUST_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                            | ACCT_ODT | DOB   | CUST_OPND_DT | SOL_LAST_LOGIN_DT |
      | "4330_D2D Welcome_BBA"            | "1"      | "20 " | "130"        | "NULL"            |
      | "4331_D2D Welcome_BBP"            | "2"      | "25"  | "130"        | "NULL"            |
      | "4332_D2D Welcome_ScotiaOne"      | "3"      | "30"  | "130"        | "NULL"            |
      | "4334_D2D Welcome_StudentBanking" | "4"      | "35"  | "130"        | "NULL"            |
      | "4658_D2D Welcome_Ultimate"       | "5"      | "40"  | "130"        | "NULL"            |
      | "4235_D2D Digital Adoption"       | "10"     | "45"  | ""           | "45"              |
      | "4315_Fund Account"               | "20"     | "45"  | ""           | "NULL"            |
      | "4316_Bill Payment"               | "24"     | "50"  | ""           | "NULL"            |
      | "4380_Bill Payment"               | "25"     | "55"  | ""           | "NULL"            |
      | "4363_Reward Reinforcement"       | "50"     | "60"  | ""           | "NULL"            |
      | "4364_Reward Reinforcement"       | "52"     | "65"  | ""           | "NULL"            |
      | "4366_Reward Reinforcement"       | "54"     | "70"  | ""           | "NULL"            |
      | "4891_CrossSell"                  | "28"     | "20"  | "40"         | "NULL"            |
      | "4892_CrossSell"                  | "28"     | "25"  | "34"         | "NULL"            |
      | "4893_CrossSell"                  | "28"     | "30"  | "24"         | "NULL"            |
      | "4894_CrossSell"                  | "28"     | "22"  | "33"         | "NULL"            |

  @D2DEngagementWelcome_SOL @D2DEngagement_Welcome_BASE_5821_IH_Validation_TestData_SOL @5821 @SOL @RS17103  @Sanity-SOL
  Scenario Outline: D2D Engagement-Welcome_RS17103_5821_SOL Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

     # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                    | ACCT_ODT | COD  |
      | "5821_SOL_D2DWelcome_NTB" | "2"      | "33" |

  @NewToCanada  @5043 @SOL
    @Sanity-SOL
  Scenario Outline: NTC SOL Create test data for Sanity
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Date to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generating Future Date For inserting into BBDWSC_SC_EXPIRY_DATE Column in the ACCT_DIM
    * def scExpiryDate = <BBDWSC_SC_EXPIRY_DATE> == 'NULL' ? 'NULL' : futureDateInDays(<BBDWSC_SC_EXPIRY_DATE>)
    * print "BBDWSC SC Expiry Date is : "+scExpiryDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Expiry Date into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@BBDWSC_SC_EXPIRY_DATE_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID     | DOB  | BBDWSC_SC_EXPIRY_DATE |
      | "5043_NTC" | "19" | "62"                  |
  #  Dual accounts
  @D2DInteracFlash @D2dVisaDebit @DigitalPayment
    @4367 @4368 @4399 @4400 @4401 @SOL
    @Sanity-SOL
  Scenario Outline: D2D Engagement SOL Create test data for dual accounts Sanity

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

      # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')


      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | ACAcc    | acct_num2     |

   #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

   # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    Examples:
      | TestID                 | ACCT_ODT | DOB  |
      | "4367_InteracFlash"    | "50"     | "40" |
      | "4368_Visa Debit"      | "57"     | "45" |
      | "4399_Digital Payment" | "63"     | "45" |
      | "4400_Digital Payment" | "63"     | "35" |
      | "4401_Digital Payment" | "63"     | "30" |

  @CreditorInsurance_Sanity @DigitalAdoption @2423 @4235 @SOL
    @Sanity-SOL
  Scenario Outline: Creditor Insurance_VS17084_2423_SOL Create test data for Sanity
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

     # Convert the Sol Last Login Date to YYYY-MM-DD format
    * string solLastLoginDate = <SOL_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<SOL_LAST_LOGIN_DT>)
    * print "SOL Last Login Date is", solLastLoginDate

    * string mobLastLoginDate = <MOB_LAST_LOGIN_DT> == 'NULL'? 'NULL': dateFormat(<MOB_LAST_LOGIN_DT>)
    * print "MOB Last Login Date is", mobLastLoginDate

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

     # insert the offer start date into the CUST_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

      # insert the offer expiry date into the CUST_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                        | DOB  | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT |
      | "2423_Creditor Insurance SOL" | "23" | "20"              | "30"              |

  @CreditorInsurance_Retargeting_Sanity  @5648 @SOL @VS17084   @Sanity-SOL
  Scenario Outline: Creditor Insurance_Retargeting_VS17084_5648_SOL Create test data for Sanity
    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                        | Event_Date | ACCT_ODT |
      | "5648_Creditor Insurance SOL" | "2"        | "53"     |

  @SPSP_Loan_Repay_SOLTestData @5701 @SOL @RS20027 @Sanity-SOL
  Scenario Outline: SPSP_RS20027_5701_SOL Create test data

    # Reading testId from Example section
    * def testId = <TestID>
   # * def testDataFileName = SPSP_Loan_RepaySOLFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Pavani:Added Study End date to be calculated based on current date
    # Generating STUDY_END_DT to insert into database
    * def studyEndDate = dateFormat(130)
    * print "Study End date is:" + studyEndDate


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    #Pavani:To insert Study end date in Excel
    # insert the created Study_End_date into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@StudyEndDate_Insertion_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID          |
      | "5701_SPSP_SOL" |

  @NTBAdvicePlus @NTBAdvicePlus_IH_Validation_TestData @5822 @SOL @RS22111 @Sanity-SOL
  Scenario Outline: NTBAdvicePlus_RS22111_5822_SOL Create test data <TestID> for validating IH field values

    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generate Arrival_Date to insert into the DB
    * def Arrival_dt = <Arrive_Dt> == 'NULL'? 'NULL': dateFormatExcludeDays(<Arrive_Dt>)
    * print  "Arrival date  is: "+Arrival_dt

      # Generate cust_Opnd_Date to insert into the DB
    * def cust_opnd_dt = <COD> == 'NULL'? 'NULL': dateFormatExcludeDays(<COD>)
    * print  "Customer's open date  is:"+cust_opnd_dt

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created Cust open dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created Arrival dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@Arrival_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                           | COD  | ACCT_ODT | Arrive_Dt |
      | "5822_SOL_NTBAdvicePlus_BASE_01" | "45" | "60"     | "100"     |

  @D2DEarlyEngagementOfferReminderSOL @D2DEarlyEngagementOfferReminderSOL__Sanity_BASE_Positive_TestData_Multipleinsights @6050 @SOL @RS23073 @Sanity-SOL
  Scenario Outline: D2DEarlyEngagementOfferReminderSOL_RS23073_6050_SOL Create test data for base Positive Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DOfferFulfilmentReminderSOL
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

      # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/sol/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID             | ACCT_ODT |
      | "6050_SOL_BASE_01" | "45"     |


  @Itrade_Xsell_AlwaysOn_SOL @Itrade_Xsell_AlwaysOn_SOL_Sanity_Base_TestData_6109 @6109 @SOL @RS23101 @Sanity-SOL
  Scenario Outline: Itrade Xsell AlwaysOn 6109 RS23101 SOL Create test data for Base Line test cases
    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = ItradeXsellAlwaysOnSOLTestData
    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

       # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

     # Convert the cust_opnd_dt to YYYY-MM-DD format
    * string cust_opnd_dt = <CUST_OPND_DT>
    * print "Custopnd Date is", cust_opnd_dt

    * string cust_opnd_dt = <CUST_OPND_DT> == 'NULL'? 'NULL': dateFormatExcludeDays(<CUST_OPND_DT>)
    * print "Custopnd Date is", cust_opnd_dt

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
#    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                      | ACCT_ODT | CUST_OPND_DT |
      | "6109_SOL_BASE_Creative_01" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_02" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_03" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_04" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_05" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_06" | "NULL"   | "NULL"       |
      | "6109_SOL_BASE_Creative_07" | "NULL"   | "NULL"       |


  @SSI_FUND_SOLTestData_1account_Sanity_Base @6233 @SOL @RS23174 @1account @Sanity-SOL
  Scenario Outline: SSIFUND_RS23174_6233_SOL Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIFUNDSOLTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6233_SOL_BASE_Seg_01"                                                                                       | "5"      |

  @SSI_PAC_SOLTestData_1account_Sanity_base @6234 @SOL @RS23175 @1account @Sanity-SOL
  Scenario Outline: SSIPAC_RS23175_6234_SOL Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIPACSOLTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/SOL/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6234_SOL_BASE_Seg_01"                                                                                       | "25"     |
  
  ##########################End of SOL#############################

  ##########################AS400##################################
  @CreditorInsurance_Sanity_AS400 @2423 @AS400
    @Sanity-AS400
  Scenario Outline: Creditor Insurance ET04024_2423_AS400 Create test data for Sanity
 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

 # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

 # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

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

        # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                          | DOB  |
      | "2423_Creditor Insurance AS400" | "40" |

  @GIC @1210 @AS400
    @Sanity-AS400
  Scenario Outline: GIC_VS17084- 1210, 4587_AS400 Create test data for Sanity
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')


    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                   | DOB  | MaturityDate |
      | "1210_GIC Renewal_AS400" | "22" | "21"         |
      | "4587_GIC Renewal_AS400" | "23" | "21"         |

  @CreditLimitIncrease @4479 @4480 @4481 @4482 @AS400
    @Sanity-AS400
  Scenario Outline: Credit Limit Increase_VS17084_4479, 4480, 4481, 4482 AS400 Create test data for Sanity

 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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
      | TestID                             | OfferStart | OfferExpiry |
      | "4479_Credit Limit Increase_AS400" | "1"        | "60"        |
      | "4480_Credit Limit Increase_AS400" | "1"        | "60"        |
      | "4481_Credit Limit Increase_AS400" | "1"        | "60"        |
      | "4482_Credit Limit Increase_AS400" | "1"        | "60"        |

  @ReturnMail @4186     @Sanity-AS400
  Scenario Outline: Return Mail_RS17089_4186_AS400 Create test data for Sanity
    #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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

    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

     # insert the created CID into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the account number into the CUST_ACCT_PREF Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet')

    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_PREF_Insertion_Database')
    Examples:
      | TestID                   |
      | "4186_Return Mail_AS400" |

     #  Dual accounts
  @MortgageRenewal @1430
    @Sanity-AS400
  Scenario Outline: Mortgage Renewals_ET04024_1430_AS400 Create test data for Sanity
      # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

     # T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,6)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = <MaturityDate>
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber |
      | <TestID> | UOAccountNumber | ""               |
      | ACAcc    | ACAccountNumber | SCDNumber        |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

           # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') examples[0]

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    Examples:
      | TestID                | MaturityDate |
      | "1430_Mortgage_AS400" | "01"         |

  @PA_CC_ULOCC_Smoke_AS400 @5576 @AS400 @OP12020 @WithOutCustInSights_PA_CC_ULOC_AS400_5576 @Sanity-AS400
  Scenario Outline: PA_CC_ULOC_OP12020_5576_Smoke_AS400 Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the PA_CCUL_CUSTOMER Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')
  # insert the created CID into the PA_CCUL_CUSTOMER database
    * call read('classpath:channels/as400/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    Examples:
      | TestID               |
      | "5576_AS400_PA_ULOC" |
      | "5570_AS400_PACC"    |
      | "5571_AS400_PACC"    |
      | "5572_AS400_PACC"    |
      | "5573_AS400_PACC"    |
      | "5574_AS400_PACC"    |
      | "5575_AS400_PACC"    |
      | "4354_AS400_PACC"    |

  @D2DXSell_AS400_Sanity_5747_TestData @5747 @AS400 @RS22054 @Sanity @Sanity-AS400
  Scenario Outline: D2DXSell_RS22054_5747_AS400_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DXSellAS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created MARRIAGE_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


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

    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')

     # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                            | MORT_FNDNG_DT | MARRIAGE_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | CUST_OPND_DT | ACCT_ODT |
      | "5747_AS400_BASE_01_NewMO"                                        | 30            | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_03_MPSA_Bal_gt_30K"                              | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
      | "5747_AS400_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                | "NULL"        | "15"        | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
##Added for MArch 30th 2023 release
      | "5747_AS400_BASE_09_Trig_2"                                       | "NULL"        | "NULL"      | "NULL"            | 30                | 100          | 100      |
      | "5747_AS400_BASE_08_Trig_2"                                       | "NULL"        | "NULL"      | 30                | "NULL"            | 20           | 30       |

  @D2DXSell_AS400_Sanity_smoke_6037_Top1_TestData @6037 @AS400 @RS22054 @Sanity @Sanity-AS400
  Scenario Outline: D2DXSell_RS22054_6037_AS400_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DXSellTop1AS400TestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format

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

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                               |
      | "6037_AS400_BASE_01_NoMPSA"          |
      | "6037_AS400_BASE_02_MPSA_Bal_lt_30K" |


  @ULOCInsurance @ULOCInsurance_IH_5761_TestData @5761 @AS400 @RS22065 @Sanity-AS400
  Scenario Outline: ULOC Insurance_RS22065_5761_AS400 Create test data<TestID> for validating IH field values
#    * def testDataFileName = PAULOCINSAs400TestData
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
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
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                      | ACCT_ODT |
      | "5761_AS400_ULOC_Insurance" | "120"    |

  @ProactiveDormancy_AS400_Sanity_5805_TestData @5805 @AS400 @ZZ22087 @Sanity-AS400
  Scenario Outline: ProactiveDormancy_ZZ22087_5805_AS400_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
#    * def insight_acct_num = subString(accountNumber,23,14)
#    * print "INsight account number is " + insight_acct_num
   # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date

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


     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created ACCT_NUM into the CUST_INSIGHTS sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_NUM_Insertion_CUST_INSIGHTS_Sheet')


    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')


    Examples:
      | TestID                       | Event_Date |
      | "5805_CSE_ProActiveDormancy" | "30"       |

  @MissingInvalidEmailAS400 @MissingInvalidEmail_AS400_TestData @5778_5579_Test @RS22069 @Base_validation_As400 @Sanity-AS400
  Scenario Outline: MissingInvalidEmail_RS22069_Base_5778_AS400 Create test data for Base Test Cases
    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
## Generating account number to insert into database
#    * def accountNumber = '00000000'+CID
#    * print "account number is " + accountNumber
# Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
        # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    Examples:
      | TestID                           | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5778_AS400_MissingInvalidEmail" | "120"             | "120"             |
      | "5779_AS400_MissingInvalidEmail" | "120"             | "120"             |


  @D2DNearPrimacy_AS400TestData @D2DNearPrimacy_AS400_Smoke_TestData_6185 @6185 @AS400 @RS23147 @Sanity-AS400
  Scenario Outline: D2DNearPrimacy_RS23147_6185_AS400 Create test data for Base Line test cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

       # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
#
    * string ARRV_DT = <ARRV_DT>
    * print "Arrival DT is", ARRV_DT

     # Convert the cust_opnd_dt to YYYY-MM-DD format
    * string CUST_OPND_DT = <CUST_OPND_DT>
    * print "Custopnd Date is", CUST_OPND_DT

    * string VALID_START_DATE = <VALID_START_DATE>
    * print "VALID_START_DATE is", VALID_START_DATE
    * string VALID_END_DATE = <VALID_END_DATE>
    * print "VALID_END_DATE is", VALID_END_DATE

##    * string PREAPPROVE_ST_DT = <PREAPPROVE_ST_DT>
#    * string PREAPPROVE_END_DT = <PREAPPROVE_END_DT>

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    #    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

     # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     ##To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/as400/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')

#    # insert the created Preapproved start date into the PA_CCUL_Customer sheet
#    * call read('classpath:channels/as400/ReusableScenarios.feature@PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created preapproved end date into the PA_CCUL_Customer sheet
#    * call read('classpath:channels/as400/ReusableScenarios.feature@PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    * call read('classpath:channels/as400/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    Examples:
      | TestID                        | CUST_OPND_DT | ARRV_DT | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
      | "6185_AS400_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6186_AS400_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6187_AS400_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6188_AS400_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |


  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6001_Sanity_Base @6001 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI - Base_RS23043_6001_AS400_Smoke Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIAS400TestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6001_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6001_AS400_BASE_Creative_02" | "10"   | "40"    |


  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6002_Sanity_Base @6002 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI - Base_RS23043_6002_AS400_Smoke Create test data for validating IH field values
#    * def testDataFileName = ULOCCLIAS400_Ofr_TestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)


    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6002_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6002_AS400_BASE_Creative_02" | "10"   | "40"    |

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6090_Sanity_Base @6090 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI - Base_RS23043_6090_AS400_Smoke Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIAS400TestData6090
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

   # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6090_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6090_AS400_BASE_Creative_02" | "10"   | "40"    |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_TestData_6218_Sanity_Base @6218 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI Co-Borrower - Base_RS23043_6218_AS400_Smoke Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIAS400TestData6218
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)
    * def secondaryCid = '6'+randGen(12)

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

          # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6218_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6218_AS400_BASE_Creative_02" | "10"   | "40"    |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_TestData_6219_Sanity_Base @6219 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI CoBorrower- Base_RS23043_6219_AS400_Smoke  Create test data for validating IH field values
#    * def testDataFileName = ULOCCLIAS400TestData6219
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)


    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)
    * def secondaryCid = '6'+randGen(12)

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

      # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6219_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6219_AS400_BASE_Creative_02" | "10"   | "40"    |

  @ULOCCLI @ULOCCLICoBorrower_BASE_IH_Validation_TestData_6220_Sanity_Base @6220 @AS400 @RS23043 @Sanity-AS400
  Scenario Outline: ULOC CLI CoBorrower- Base_RS23043_6220_AS400_Smoke  Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIAS400TestData6220
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)
    * def secondaryCid = '6'+randGen(12)

   # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |

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

    # insert the secondary cid into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                        | Ofr_st | Ofr_End |
      | "6220_AS400_BASE_Creative_01" | "10"   | "40"    |
      | "6220_AS400_BASE_Creative_02" | "10"   | "40"    |


  ##########################End of AS400#############################

   ##########################NOVA#############################
  @CreditorInsurance_NOVA_Sanity @2423 @NOVA     @Sanity-NOVA1
  Scenario Outline: Creditor Insurance_VS17084_2423_NOVA Create test data for Sanity
 # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
  # Generate Account Number to insert into data base
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    #Removed the login check in Sept 14th 2023 Release
#  # Convert the Sol Last Login Date to YYYY-MM-DD format
#    * string MOB_LAST_LOGIN_DT = dateFormat(40)
#    * print "MOB Last Login Date is", MOB_LAST_LOGIN_DT
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
#  # insert the offer expiry date into the CUST_DIM sheet
#    * call read('classpath:channels/nova/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                         | ACCT_ODT |
      | "2423_Creditor Insurance NOVA" | "20"     |


  @CreditorInsuranceRetargetingOfferNova_Sanity  @5648 @NOVA @VS17084  @Sanity-NOVA
  Scenario Outline: Creditor Insurance_VS17084_5648_NOVA Create test data for Sanity
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", acct_odt

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is ",event_date

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                         | Event_Date | ACCT_ODT |
      | "5648_Creditor Insurance NOVA" | "3"        | "54"     |

  @CreditLimitIncrease @4479 @4480 @4481 @4482 @NOVA @Sanity-NOVA
  Scenario Outline: Credit Limit Increase_VS17084_4479, 4480_NOVA Create test data for Sanity

 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate = <OfferStart> == 'NULL'? 'NULL': dateFormat(<OfferStart>)
    * print "Offer Start date is", offerStartDate

   # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = <OfferExpiry> == 'NULL'? 'NULL': futureDateInDays(<OfferExpiry>)
    * print "Offer Expiry date is", offerExpiryDate

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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
      | TestID                            | OfferStart | OfferExpiry |
      | "4479_Credit Limit Increase_NOVA" | "1"        | "60"        |
      | "4480_Credit Limit Increase_NOVA" | "1"        | "60"        |

  @GIC @1210 @4587 @NOVA @Sanity-NOVA
  Scenario Outline: GIC_ET14061_1210, 4587_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the maturity date  to YYYY-MM-DD format
    * string MAT_DT = <MAT_DT>
    * print "Maturity  Date is"+ MAT_DT

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

     # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                  | DOB  | MAT_DT |
      | "1210_GIC Renewal_NOVA" | "19" | "21"   |
      | "4587_GIC Renewal_NOVA" | "25" | "22"   |

  #  Dual accounts
  @MortgageRenewal @1430 @4862 @4864 @4866 @4870 @NOVA @Sanity-NOVA
  Scenario Outline: Mortgage Renewals_ET04024_1430, 4862, 4864, 4870_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # Generating 13 Digit SCD Number For AC Account

    * def ScotiaCardNumber = randGen(13)
    * print "SCD Number For AC Account is " + ScotiaCardNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | scdNumber        |
      | <TestID> | UOAccountNumber | ""               |
      | ACAcc    | ACAccountNumber | ScotiaCardNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples[1]
    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    Examples:
      | TestID               |
      | "1430_Mortgage_NOVA" |
      | "4862_Mortgage_NOVA" |
      | "4864_Mortgage_NOVA" |
      | "4866_Mortgage_NOVA" |
      | "4870_Mortgage_NOVA" |

  # TFSA, RESP, RRSP, MPSA And Supplementary Card Cross Sell Campaigns

  @TFSACrossSell @RESPCrossSell @RRSPCrossSell @MPSACrossSell_SANITY  @5464 @5465 @5466 @5467 @5468 @NOVA @Sanity-NOVA

  Scenario Outline: TFSA, RESP, RRSP, MPSA and Supplementary Card Cross Sell_5464_5465_5466_5467_5468_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>

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
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                         | ACCT_ODT | CUST_OPND_DT |
      | "5464_TFSA_CrossSell_NOVA"     | "95"     | "95"         |
      | "5466_RESP_CrossSell_NOVA"     | "100"    | "100"        |
      | "5465_RRSP_CrossSell_NOVA"     | "100"    | "100"        |
      | "5467_MPSA_CrossSell_NOVA"     | "93"     | "NULL"       |
      | "5468_SuppCard_CrossSell_NOVA" | "92"     | "NULL"       |
      | "5504_MPSA_Fund_NOVA"          | "300"    | "NULL"       |

  @TFSAFund_Contribution @RESPFund @RRSPFund @MPSAFund  @5501 @5502 @5503 @5504  @NOVA @Sanity-NOVA
  Scenario Outline: TFSA, RESP, RRSP, MPSA  Contribution_5501_5502_5503_5504 NOVA Create test data for Contribution offers for Sanity

    #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>

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

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID                | ACCT_ODT | CUST_OPND_DT |
      | "5501_TFSA_Fund_NOVA" | "100"    | "100"        |
      | "5502_RRSP_Fund_NOVA" | "100"    | "100"        |
      | "5503_RESP_Fund_NOVA" | "100"    | "100"        |

  # NTC Creatives For D2D Welcome, D2D BillPayment, D2D Fund Account, D2D CrossSell

  @D2DWelcome_Smoke_Nova @D2DEngagement_Welcome_Smoke_Nova @4330 @4331 @4332 @4334 @4658 @NOVA @RS17103 @Sanity-NOVA
  Scenario Outline: D2D Engagement-Welcome_BBA_BBP_ScotiaOne_Ultimate_SBAP_RS17103_Smoke_NOVA Create test data for Smoke Nova Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

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
      | TestID                  | ACCT_ODT | DOB  |
#      | "4330_BBA_NOVA"         | "1"      | "21" |
      | "4331_BBP_NOVA"         | "2"      | "50" |
      | "4332_ScotiaOne_NOVA"   | "5"      | "38" |
#      | "4334_SBAP_NOVA"        | "5"      | "38" |
      | "4658_Ultimate_NOVA"    | "5"      | "43" |
      | "4315_FundAccount_NOVA" | "20"     | "25" |

  @D2DWelcome_Smoke_Nova @D2DEngagement_Welcome_Smoke_Nova_NTCCreative @4332 @4334 @NOVA @RS17103 @Sanity-NOVA
  Scenario Outline: D2D Engagement-Welcome_ScotiaOne_SBAP_RS17103_Smoke_NOVA Create test data for NTC Creative Smoke Nova Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

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
      | TestID                           | ACCT_ODT | DOB  |
      | "4332_ScotiaOne_4332092102_NOVA" | "5"      | "38" |
      | "4334_SBAP_4334092102_NOVA"      | "5"      | "38" |

  @D2DEngagement-BillPayment_Smoke_NOVA @D2DEngagement_BillPayment_Smoke_NOVA @4380 @NOVA @RS18023 @Sanity-NOVA
  Scenario Outline: D2D Engagement-BillPayment_Smoke_RS18023_4380_NOVA Create test data for 01 and 02 Creative Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
#    * print "Account ODT is", acct_odt

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
      | TestID                                             | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4380_BillPayment_Nova"                            | "23"     | "18" | "93"         |
      | "4380_CUST_OPND_DT<90_NTCCreative_4380072102_NOVA" | "23"     | "18" | "50"         |

  @PACC_PA_ULOCC_Smoke_NOVA @5570 @5576 @NOVA @OP12020 @WithOutCustInSights_PACC_ULOC_NOVA_5576 @Sanity-NOVA
  Scenario Outline: PA_ULOC_OP12020_5576_Smoke_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string PREAPPROVE_ST_DT = <PREAPPROVE_ST_DT>
    * string PREAPPROVE_END_DT = <PREAPPROVE_END_DT>
    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created Preapproved start date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created preapproved end date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    * call read('classpath:channels/nova/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')


    Examples:
      | TestID              | PREAPPROVE_ST_DT | PREAPPROVE_END_DT |
      | "5576_NOVA_PA_ULOC" | "0"              | "30"              |
      | "5570_NOVA_PACC"    | "0"              | "30"              |
      | "5571_NOVA_PACC"    | "0"              | "30"              |
      | "5572_NOVA_PACC"    | "0"              | "30"              |
      | "5573_NOVA_PACC"    | "0"              | "30"              |
      | "5574_NOVA_PACC"    | "0"              | "30"              |
      | "5575_NOVA_PACC"    | "0"              | "30"              |
      | "4354_NOVA_PACC"    | "0"              | "30"              |

  @D2DEngagementCrossSell_Smoke_NOVA @NTCCreative @4891 @4892 @4893 @4894 @NOVA @19067 @Sanity-NOVA1
  Scenario Outline: D2D Engagement-CrossSell_RS19067_4891_4892_4893_4894_NOVA And NTC Creative test data<TestID> for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
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
      | TestID                            | ACCT_ODT | DOB  | CUST_OPND_DT |
      | "4892_CrossSell_NTCCreative_NOVA" | "45"     | "20" | "40"         |
      | "4894_CrossSell_NTCCreative_NOVA" | "45"     | "20" | "30"         |
      | "4891_CrossSell_NOVA"             | "41"     | "18" | "20"         |
      | "4892_CrossSell_NOVA"             | "45"     | "20" | "40"         |
      | "4893_CrossSell_NOVA"             | "45"     | "20" | "30"         |
      | "4894_CrossSell_NOVA"             | "45"     | "20" | "30"         |

  @D2DEngagementBillPaymentTxn_Smoke_NOVA  @5616 @Sanity-NOVA2
  Scenario Outline: Bill Payment Txn Migration_RS21133_5616_NOVA Create test data for Sanity
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

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

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_NUM_Insertion_CUST_INSIGHTS_Sheet')

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                | ACCT_ODT | Event_Date | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5616_BillPaymentTxn" | "100"    | "1"        | "89"              | "89"              |

  @D2DEngagementVisaDebitAcq_Smoke_NOVA  @5615 @Sanity-NOVA2
  Scenario Outline: Visa Debit Acq_RS21132_5615_NOVA Create test data for sanity

  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #  Convert the Sol Last Login Date to YYYY-MM-DD format
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the generated SOL LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the generated MOB LAST LOGIN into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': futureDateInDays(<Event_Date>)
    * print "Event Date is", event_date


  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * def accnumcustinsight = accountNumber
    * print "account number is " + accountNumber
    * print "cust insight account number is " + accnumcustinsight


  # Generating AC account number to insert into database
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

  # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

  # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = '600' + randGen(10)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID> + '_Account_2'
    * print 'AC Account Test ID is '+ACAcc

      # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber   | ScotiaCardNumber | ACCT_ODT |
      | <TestID> | accountNumber   | ""               | ACCT_ODT |
      | ACAcc    | ACAccountNumber | SCDNumber        | ""       |

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Odt into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples

  # insert the created Scotia Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2
  # Used table keyword to iterate for any BDD line
    * table cust_insights
      | testId   | accountNumber     | event_date | CID |
      | <TestID> | accnumcustinsight | event_date | CID |
      | Cust2    | accnumcustinsight | ""         | CID |
  # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') cust_insights

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') cust_insights

    Examples:
      | TestID              | Event_Date | ACCT_ODT | MOB_LAST_LOGIN_DT | SOL_LAST_LOGIN_DT |
      | "5615_VisaDebitAcq" | "-1"       | "100"    | "10"              | "10"              |

  @ODPRightSizing_NOVA_Sanity @5614 @NOVA @RS21131  @Sanity-NOVA2
  Scenario Outline: ODP Right Sizing_RS21131_5614_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

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
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                 | Event_Date |
      | "5614_ODP RightSizing" | "3"        |

  @NTCCredit_NOVA_Sanity @5619 @NOVA @RS2098A  @Sanity-NOVA2
  Scenario Outline: NTC Credit_RS2098A_5619_NOVA Create test data<TestID> for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                  | ACCT_ODT |
      | "5619_NTCCreditHistory" | "32"     |

##Pavani:SPS InboundNOVA Testdata Creation
  @SPSP_Loan_Repay_NOVATestData @5701 @NOVA @RS20027  @Sanity-NOVA2
  Scenario Outline: SPSP_RS20027_5701_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    #* def testDataFileName = SPSP_Loan_RepayNOVAFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Pavani:Added Study End date to be calculated based on current date
    # Generating STUDY_END_DT to insert into database
    * def studyEndDate = dateFormat(130)
    * print "Study End date is:" + studyEndDate


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
    #Pavani:To insert Study end date in Excel
    # insert the created Study_End_date into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@StudyEndDate_Insertion_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID           |
      | "5701_SPSP_NOVA" |

  @Travel_Insurance_NOVA_Sanity_TestData @5715 @NOVA @RS22049 @Sanity-NOVA1
  Scenario Outline: Travel_Insurance_RS22049_5715_NOVA_TestData Create test data for sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                       | Event_Date |
      | "5715_NOVA_Travel_Insurance" | "1"        |

  @Insurance_Reminder_NOVA_Sanity_TestData @5784 @NOVA @RS22075 @Sanity-NOVA1
  Scenario Outline: Insurance_Reminder_RS22075_5784_NOVA_TestData Create test data for sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the INSUR_STAT_LAST_CHNG_DT to YYYY-MM-DD format
    * string INSUR_STAT_LAST_CHNG_DT = <INSUR_STAT_LAST_CHNG_DT> =='NULL'?'NULL': dateFormatExcludeDays(<INSUR_STAT_LAST_CHNG_DT>)
    * print "INSUR_STAT_LAST_CHNG_DT is ",INSUR_STAT_LAST_CHNG_DT

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      # Generating credit card number to insert into database
    * def CreditCardNumber = '1'+CID
    * print "creditcard number is " + CreditCardNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created Credit card Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@InsureDate_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')


    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')


    Examples:
      | TestID                             | INSUR_STAT_LAST_CHNG_DT |
      | "5784_NOVA_InsuranceClaimReminder" | "NULL"                  |

  @Scotia_Smart_Money_NOVA_Sanity_TestData @5796 @NOVA @RS22071 @Sanity-NOVA1
  Scenario Outline: Scotia_Smart_Money_RS22071_5796_NOVA_TestData Create test data for Sanity
        # Reading testId from Example section
    * def testId = <TestID>
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                  | Event_Date |
      | "5796_NOVA_SSMAlwaysOn" | "45"       |

  @ULOCInsurance @ULOCInsurance_IH_5761_TestData @5761 @NOVA @RS22065 @Sanity-NOVA1
  Scenario Outline: ULOC Insurance_RS22065_5761_NOVA Create test data for sanity
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                     | ACCT_ODT |
      | "5761_NOVA_ULOC_Insurance" | "120"    |

  @ULOCInsurance @ULOCInsurance_IH_5762_TestData @5762 @NOVA @RS22065 @Sanity-NOVA1
  Scenario Outline: ULOC Insurance_RS22065_5762_NOVA Create test data for Sanity
  # Reading testId from Example section
    * def testId = <TestID>
  # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    * string ACCT_ODT = <ACCT_ODT>
     # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date
  # insert the created CID into the nova Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created Account Open Date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the created Account Number into the Data Base
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                     | ACCT_ODT | Event_Date |
      | "5762_NOVA_ULOC_Insurance" | "120"    | "1"        |

  @D2DXSell_NOVA_Sanity__TestData @5747 @NOVA @RS22054 @Sanity @Sanity-NOVA1
  Scenario Outline: D2DXSell_RS22054_5747_NOVA_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format
    * string MORT_FNDNG_DT = <MORT_FNDNG_DT>
    * string MARRIAGE_DT = <MARRIAGE_DT>
    * string SOL_LAST_LOGIN_DT = <SOL_LAST_LOGIN_DT>
    * string MOB_LAST_LOGIN_DT = <MOB_LAST_LOGIN_DT>
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * string ACCT_ODT = <ACCT_ODT>
    * string MAT_DT = <MAT_DT>

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created MARRIAGE_LIFE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet')
    # insert the created SOL_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@SOL_LAST_LOGIN_DT_CUST_DIM_Sheet')
    # insert the created MOB_LAST_LOGIN_DT into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MOB_LAST_LOGIN_DT_CUST_DIM_Sheet')
# insert the created CUST_OPND_DT into the CUST_DIM Testdata excel sheet
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

    # insert the created Mortgage Find Date into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@Mort_Find_DATE_Insertion_ACCT_DIM_Sheet')

    # insert the created Mortgage Renewal Date aka maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

 # insert the created acct_odt into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                    | MAT_DT | MORT_FNDNG_DT | MARRIAGE_DT | SOL_LAST_LOGIN_DT | MOB_LAST_LOGIN_DT | CUST_OPND_DT | ACCT_ODT |
      | "5747_NOVA_BASE_01_NewMO" | "NULL" | 30            | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
#      | "5747_NOVA_BASE_02_NoMPSA_CUST_DIM_CVI_MULTIFACTOR_SEGMENT_eq_1" | "NULL" | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
#      | "5747_NOVA_BASE_03_MPSA_Bal_gt_30K"                              | "NULL" | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
#      | "5747_NOVA_BASE_04_MPSA_Bal_lt_30K_MarriageEvent"                | "NULL" | "NULL"        | 15          | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
#      | "5747_NOVA_BASE_Seg_07_Trig_13_MAT_DT_eq_8months"                | 240    | "NULL"        | "NULL"      | "NULL"            | "NULL"            | "NULL"       | "NULL"   |
#      #Added for MArch 30th 2023 release
#      | "5747_NOVA_BASE_09_Trig_2"                                       | "NULL" | "NULL"        | "NULL"      | "NULL"            | 30                | 100          | 100      |
#      | "5747_NOVA_BASE_10_Trig_2"                                       | "NULL" | "NULL"        | "NULL"      | 30                | 30                | 80           | 80       |
#      | "5747_NOVA_BASE_08_Trig_2"                                       | "NULL" | "NULL"        | "NULL"      | 30                | "NULL"            | 20           | 30       |
#      | "5747_NOVA_BASE_11_Trig_2"                                       | "NULL" | "NULL"        | "NULL"      | 30                | 30                | "NULL"       | "NULL"   |


  @D2DXSell_NOVA_Sanity_5748_Smoke_TestData @5748 @NOVA @RS22054 @Sanity @Sanity-NOVA2
  Scenario Outline: D2DXSell_RS22054_5748_NOVA_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DXSellNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

    # Generating account number to insert into database
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
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                              | Event_Date |
      | "5748_NOVA_BASE_Preferred_Ultimate" | 1          |
      | "5748_NOVA_BASE_Other_Abandon"      | 1          |


  @D2DXSell_NOVA_Sanity_6037_Top1_SMOKE_TestData @6037 @NOVA @RS22054 @Sanity @Sanity-NOVA1
  Scenario Outline: D2DXSell_RS22054_6037_NOVA_TestData Create test data for base positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DXSellTop1NovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format

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
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                              |
      | "6037_NOVA_BASE_01_NoMPSA"          |
      | "6037_NOVA_BASE_02_MPSA_Bal_lt_30K" |


  @D2DEngagementWelcome_NOVA @D2DEngagement_Welcome_5821_BASE_IH_Validation_TestData_NOVA @5821 @RS17103   @Sanity-NOVA2
  Scenario Outline: D2D Engagement-Welcome_RS17103_5821_NOVA Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
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
      | TestID                     | ACCT_ODT | CUST_OPND_DT |
      | "5821_NOVA_D2DWelcome_NTB" | "2"      | "33"         |

  @NTB_AdvicePlus_NOVA @NTB_AdvicePlus_5822_BASE_IH_Validation_TestData_NOVA @5822 @NOVA @RS22111 @Sanity-NOVA1
  Scenario Outline: NTB_AdvicePlus_RS22111_5822_NOVA Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Arrival_Date to insert into the DB
    * string ARRV_DT = <ARRV_DT>
    * print  "Arrival date  is: "+ARRV_DT

      # Generate cust_Opnd_Date to insert into the DB
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print  "Customer's open date  is:"+CUST_OPND_DT

     # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created cust_opnd_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

       # insert the created Arrival_dt into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ARRIVALDT_Insertion_CUST_DIM_Sheet')

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
      | TestID                    | ARRV_DT | CUST_OPND_DT | ACCT_ODT |
      | "5822_NOVA_NTBAdvicePlus" | "NULL"  | "90"         | "55"     |

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_TestData @5839 @NOVA @RS22116  @Sanity-NOVA2
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_NOVA Create test data for base test case

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    # Generating account number to insert into database
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
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                       | ACCT_ODT |
      | "5839_NOVA_MPSAWelcomeBonus" | "20"     |

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6001 @6001 @NOVA @RS23043 @Sanity-NOVA1
  Scenario Outline: ULOC CLI - Base_RS23043_6001_NOVA Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLINovaTestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                       | Ofr_st | Ofr_End |
      | "6001_NOVA_BASE_Creative_01" | "10"   | "30"    |
      | "6001_NOVA_BASE_Creative_02" | "10"   | "30"    |

  @ULOCCLI @ULOCCLI_BASE_NOVA_Validation_TestData_6002 @6002 @NOVA @RS23043 @Sanity-NOVA2
  Scenario Outline: ULOC CLI - Base_RS23043_6002_NOVA Create test data for validating IH field values
#    * def testDataFileName = ULOCCLINova_Ofr_TestData
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)


    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                       | Ofr_st | Ofr_End |
      | "6002_NOVA_BASE_Creative_01" | "10"   | "30"    |
      | "6002_NOVA_BASE_Creative_02" | "10"   | "30"    |

  @TFSA_RRSP_Remainder_Sanity  @TFSARRSPFund_5927_5955_NOVA_Sanity_TestData @5955 @NOVA @RS21094 @5927 @RS21092 @Sanity-NOVA2
  Scenario Outline: RRSP_TFSA_Fund_RS21094_RS21092_5955_5927_NOVA Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    #     Generating account number to insert into database
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
      | TestID                  | ACCT_ODT |
      | "5927_TFSAPACRemainder" | "10"     |
      | "5955_RRSPPACRemainder" | "10"     |


  @VisaDebitandInterac   @VisaDebitandInterac_Sanity_Scenario_TestData @5970 @NOVA @RS21132 @Sanity-NOVA1
  Scenario Outline: VisaDebitandInterac_Base_RS21132_5970_NOVA Create test data for base scenario

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    #  Generating account number to insert into database
    * def accountNumber1 = '00000000'+CID
    * print "account number is " + accountNumber1
    * def accountNumber2 = '10000000'+CID
    * print "account number is " + accountNumber2
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    # Convert the cashWithdrawaltmstmp to YYYY-MM-DD format and add timestamp
    * string cashwithdrawaltmstmp1 = <CASH_BR_WITHDRAWAL_TMSTMP> == 'NULL'? 'NULL': dateFormatExcludeDaystmstnp(<CASH_BR_WITHDRAWAL_TMSTMP>)
    * print "cashwithdrawalTmstmp is :" +cashwithdrawaltmstmp1

    # Convert the cashWithabmdrawaltmstmp to YYYY-MM-DD format and add timestamp
    * string cashabmwithdrawaltmstmp1 = <CASH_ABM_WITHDRAWAL_TMSTMP> == 'NULL'? 'NULL': dateFormatExcludeDaystmstnp(<CASH_ABM_WITHDRAWAL_TMSTMP>)
    * print "cashabmwithdrawal is :" +cashabmwithdrawaltmstmp1

     # Convert the Last_Flash_Txn_DT to YYYY-MM-DD format
    * string LastFlashtxn1 = <LAST_FLASH_TXN_DT> == 'NULL'? 'NULL': dateFormatExcludeDays(<LAST_FLASH_TXN_DT>)
    * print "LastFlashtxn is :" +LastFlashtxn1

     # Convert the LAST_VD_VPOS_TXN_TMSTMP to YYYY-MM-DD format and add timestamp
    * string LastVPOSTxntmstp1 = <LAST_VD_VPOS_TXN_TMSTMP> == 'NULL'? 'NULL': dateFormatExcludeDaystmstnp(<LAST_VD_VPOS_TXN_TMSTMP>)
    * print "LastVPOSTxntmstp is :" +LastVPOSTxntmstp1

    # Convert the LAST_VD_OPOS_TXN_TMSTMP to YYYY-MM-DD format and add timestamp
    * string LastOPOSTxntmstp1 = <LAST_VD_OPOS_TXN_TMSTMP> == 'NULL'? 'NULL': dateFormatExcludeDaystmstnp(<LAST_VD_OPOS_TXN_TMSTMP>)
    * print "LastOPOSTxntmstp is :" +LastOPOSTxntmstp1

    # Convert the LAST_CHIP_TXN_TMSTMP to YYYY-MM-DD format and add timestamp
    * string lastchiptxntmstmp1 = <LAST_CHIP_TXN_TMSTMP> == 'NULL'? 'NULL': dateFormatExcludeDaystmstnp(<LAST_CHIP_TXN_TMSTMP>)
    * print "lastchiptxntmstmp is :" +lastchiptxntmstmp1


    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    * table examples
      | testId                | accountNumber  | CID | ACCT_ODT | cashwithdrawaltmstmp  | cashabmwithdrawaltmstmp  | LastFlashtxn  | LastVPOSTxntmstp  | LastOPOSTxntmstp  | lastchiptxntmstmp  |
      | <TestID>              | accountNumber1 | CID | ACCT_ODT | cashwithdrawaltmstmp1 | cashabmwithdrawaltmstmp1 | "NULL"        | "NULL"            | "NULL"            | "NULL"             |
      | <TestID>+'_Account_2' | accountNumber2 | CID | "NULL"   | "NULL"                | "NULL"                   | LastFlashtxn1 | LastVPOSTxntmstp1 | LastOPOSTxntmstp1 | lastchiptxntmstmp1 |
    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
#    --------To create below scenarios in reusable scenarios feature file----------
    # insert the created Last_Flash_Txn_DT into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@Last_Flash_Txn_DT_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created last_vd_vpos_txn_tmstmp into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@Last_VPOS_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created last_vd_opos_txn_tmstmp into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@Last_OPOS_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created last_chip_txn_tmstmp into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@Last_chip_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
   #-----------------------------------------------------------------------------------------------------
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
#    ------To create below scenarios in reusable feature file
    # insert the created cash_br_withdrawaltmstmp into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@cash_BR_withdraw_tmstmp_Insertion_ACCT_DIM_Sheet') examples

    # insert the created cash_ABM_withdrawaltmstmp into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@cash_ABM_withdraw_tmstmp_Insertion_ACCT_DIM_Sheet') examples

    #---------------------------------
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # The LAST_FLASH_TXN_DT, LAST_VD_VPOS_TXN_TMSTMP and LAST_VD_OPOS_TXN_TMSTMP are dependant on DSS settings.
    Examples:
      | TestID                       | ACCT_ODT | CASH_BR_WITHDRAWAL_TMSTMP | CASH_ABM_WITHDRAWAL_TMSTMP | LAST_FLASH_TXN_DT | LAST_VD_VPOS_TXN_TMSTMP | LAST_VD_OPOS_TXN_TMSTMP | LAST_CHIP_TXN_TMSTMP |
      | "5970_NOVA_BASE_Creative_01" | "70"     | "5"                       | "NULL"                     | "NULL"            | "NULL"                  | "NULL"                  | "NULL"               |
      | "5970_NOVA_BASE_Creative_02" | "70"     | "NULL"                    | "NULL"                     | "NULL"            | "NULL"                  | "NULL"                  | "5"                  |
      | "5970_NOVA_BASE_Creative_03" | "70"     | "NULL"                    | "NULL"                     | "NULL"            | "3"                     | "3"                     | "NULL"               |
      | "5970_NOVA_BASE_Creative_04" | "70"     | "NULL"                    | "NULL"                     | "3"               | "NULL"                  | "NULL"                  | "NULL"               |

  @D2DEarlyEngagementOfferReminderNOVA @D2DEarlyEngagementOfferReminderNOVA_BASE_Sanity_Positive_TestData_Multipleinsights @6050 @NOVA @RS23073 @Sanity-NOVA1
  Scenario Outline: D2DEarlyEngagementOfferReminderNOVA_RS23073_6050_NOVA Create test data for base Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DOfferFulfilmentReminderNOVA

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID              | ACCT_ODT |
      | "6050_NOVA_BASE_01" | "45"     |


  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6090_Sanity @6090 @NOVA @RS23043 @Sanity-NOVA1
  Scenario Outline: ULOC CLI - Base_RS23043_6090_NOVA Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLINovaTestData6090
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                       | Ofr_st | Ofr_End |
      | "6090_NOVA_BASE_Creative_01" | "10"   | "30"    |
      | "6090_NOVA_BASE_Creative_02" | "10"   | "30"    |

  @International_Money_Transfer_NOVA @International_Money_Transfer_NOVA_Base_TestData_6087 @6087 @NOVA @RS23094 @Sanity-NOVA2
  Scenario Outline: International Money Transfer 6087 RS23094 NOVA Create test data for Base Line test cases

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = InternationalMoneyTransferNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                  | Event_Date |
#      | "6087_NOVA_BASE_Seg_01" | "-9"       |
#      | "6087_NOVA_BASE_Seg_02" | "-9"       |
#      | "6087_NOVA_BASE_Seg_03" | "-9"       |
      | "6087_NOVA_BASE_Seg_04" | "-9"       |
#      | "6087_NOVA_BASE_Seg_05" | "-9"       |

  @Itrade_Xsell_AlwaysOn_NOVA @Itrade_Xsell_AlwaysOn_NOVA_Sanity_Base_TestData_6109 @6109 @NOVA @RS23101 @Sanity-NOVA2
  Scenario Outline: Itrade Xsell AlwaysOn 6109 RS23101 NOVA Create test data for Base Line test cases

    # Reading testId from Example section
    * def testId = <TestID>

#    * def testDataFileName = ItradeXsellAlwaysOnNOVATestData

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format

       # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

     # Convert the cust_opnd_dt to YYYY-MM-DD format
    * string CUST_OPND_DT = <CUST_OPND_DT>
    * print "Custopnd Date is", CUST_OPND_DT

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

     # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')

#    # insert the created Event Date into the CUST_INSIGHTS sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TIMESTAMP_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                       | ACCT_ODT | CUST_OPND_DT |
      | "6109_NOVA_BASE_Creative_01" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_02" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_03" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_04" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_05" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_06" | "NULL"   | "NULL"       |
      | "6109_NOVA_BASE_Creative_07" | "NULL"   | "NULL"       |


  @D2DNearPrimacy_NOVATestData @D2DNearPrimacy_NOVA_Sanity_Base_TestData_6185 @6185 @NOVA @RS23147 @Sanity-NOVA2
  Scenario Outline: D2DNearPrimacy_RS23147_6185_Smoke_NOVA Create test data for Base Line test cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

       # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
#
    * string ARRV_DT = <ARRV_DT>
    * print "Arrival DT is", ARRV_DT

     # Convert the cust_opnd_dt to YYYY-MM-DD format
    * string CUST_OPND_DT = <CUST_OPND_DT>
    * print "Custopnd Date is", CUST_OPND_DT

    * string VALID_START_DATE = <VALID_START_DATE>
    * print "VALID_START_DATE is", VALID_START_DATE
    * string VALID_END_DATE = <VALID_END_DATE>
    * print "VALID_END_DATE is", VALID_END_DATE

#    * string PREAPPROVE_ST_DT = <PREAPPROVE_ST_DT>
#    * string PREAPPROVE_END_DT = <PREAPPROVE_END_DT>

    # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    #    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_CUST_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

     # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     ##To add into External input table
     # insert the created CID into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')

    # insert the created VALID_START_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created VALID_END_DT into the EXTERNAL_INPUT_FILE_LAYOUT Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet')
    # insert the created  EXTERNAL_INPUT_FILE_LAYOUT record into the EXTERNAL_INPUT_FILE_LAYOUT database
    * call read('classpath:channels/nova/ReusableScenarios.feature@EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database')

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')

#    # insert the created Preapproved start date into the PA_CCUL_Customer sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created preapproved end date into the PA_CCUL_Customer sheet
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    * call read('classpath:channels/NOVA/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    Examples:
      | TestID                       | CUST_OPND_DT | ARRV_DT | ACCT_ODT | VALID_START_DATE | VALID_END_DATE |
      | "6185_NOVA_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6186_NOVA_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6187_NOVA_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |
      | "6188_NOVA_BASE_Creative_01" | "0"          | "NULL"  | "130"    | "40"             | "-40"          |

  @SSI_FUND_NOVATestData_1account_Sanity_Base @6233 @NOVA @RS23174 @1account @Sanity-NOVA2
  Scenario Outline: SSIFUND_RS23174_6233_NOVA Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIFUNDNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


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
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6233_NOVA_BASE_Seg_01"                                                                                       | "5"      |

  @SSI_PAC_NOVATestData_1account_Sanity_base @6234 @NOVA @RS23175 @1account @Sanity-NOVA2
  Scenario Outline: SSIPAC_RS23175_6234_NOVA Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIPACNOVATestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


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
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6234_NOVA_BASE_Seg_01"                                                                                       | "25"     |

  ##########################End of NOVA############################

   ##########################ORN#############################

  @PACC_PA_ULOCC_Smoke_ORN @5570 @5576 @NOVA @OP12020 @WithOutCustInSights_PACC_ULOC_PACC_ORN @Sanity-ORN
  Scenario Outline: PA_ULOC_PACC_OP12020_5576_Smoke_NOVA Create test data for Sanity

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    * string PREAPPROVE_ST_DT = <PREAPPROVE_ST_DT>
    * string PREAPPROVE_END_DT = <PREAPPROVE_END_DT>
    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created Preapproved start date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    # insert the created preapproved end date into the PA_CCUL_Customer sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet')

    * call read('classpath:channels/ORN/ReusableScenarios.feature@PA_CCUL_CUSTOMER_Insertion_Database')

    Examples:
      | TestID             | PREAPPROVE_ST_DT | PREAPPROVE_END_DT |
      | "5576_ORN_PA_ULOC" | "0"              | "30"              |
      | "5570_ORN_PACC"    | "0"              | "30"              |
      | "5571_ORN_PACC"    | "0"              | "30"              |
      | "5572_ORN_PACC"    | "0"              | "30"              |
      | "5573_ORN_PACC"    | "0"              | "30"              |
      | "5574_ORN_PACC"    | "0"              | "30"              |
      | "5575_ORN_PACC"    | "0"              | "30"              |
      | "4354_ORN_PACC"    | "0"              | "30"              |

  @CreditLimitIncrease_Sanity @CreditLimitIncrease_TestData_ORN @4479 @ORN @VS18076  @Sanity-ORN
  Scenario Outline: Pre-Approved Credit Limit Increase_VS18076_ORN Create test data for sanity
      #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random credit card to insert into database
    * def CreditCardNumber = randGen(13)
    * print  "Random generated credit card is "+CreditCardNumber

    # Convert the offer start date to YYYY-MM-DD format
    * string offerStartDate =  dateFormat(1)

    # Convert the offer expiry date to YYYY-MM-DD format
    * string offerExpiryDate = futureDateInDays(60)
#     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

     # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

     # insert the created Credit Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CR_CRD_Num_Insertion_ACCT_DIM_Sheet')

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet')

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                           |
      | "4479_Credit Limit Increase_ORN" |
      | "4480_Credit Limit Increase_ORN" |

  @SuppCardCrossSell_ORN_5468_Sanity @5468 @ORN @RS21099 @11111 @Sanity-ORN
  Scenario Outline: SuppCard Cross Sell_RS21099_5468_ORN Create test data for 5468

    # Reading testId from Example section
    * def testId = <TestID>
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #  Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID             | ACCT_ODT |
      | "5468_ORN_BASE_01" | "92"     |
      | "5468_ORN_BASE_02" | "92"     |

  @TFSACrossSell_Positive_negative_ORN_single_account_TestData_Load @5464 @ORN @RS21091 @Sanity-ORN
  Scenario Outline: TFSA Cross Sell_RS21091_5464_ORN <TestID> Create test data for single accounts

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = TFSACrossSellORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    * print  <TestID>

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>
    * print "Customer Open date is ", CUST_OPND_DT

  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID             | ACCT_ODT | CUST_OPND_DT |
      | "5464_ORN_BASE_01" | "92"     | "92"         |


  @RRSPRESPCrossSell_Positive_negative_ORN_single_account_TestData_Load @5465 @5466 @ORN @RS21093 @RS21095 @RRSP_RESP_Xsell @Sanity-ORN
  Scenario Outline: RRSP and RESP Cross Sell_RS21093_RS21095_5465_5466ORN Create test data for positive and negative single account

    #    Reading testId from Example section
    * def testId = <TestID>
    * print "Test ID is", testId

#    * def testDataFileName = RRSPCrossSellORNTestData
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

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID             | ACCT_ODT | CUST_OPND_DT |
      | "5465_ORN_BASE_01" | "100"    | "100"        |
      | "5466_ORN_BASE_01" | "100"    | "100"        |

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6001_Sanity @6001 @ORN_1 @RS23043 @Sanity-ORN
  Scenario Outline: ULOC CLI - Base_RS23043_6001_ORN Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIORNTestData6001
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    Examples:
      | TestID                      | Ofr_st | Ofr_End |
      | "6001_ORN_BASE_Creative_01" | "10"   | "30"    |
      | "6001_ORN_BASE_Creative_02" | "10"   | "30"    |

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6002_ORN_Sanity @6002 @ORN_1 @RS23043 @Sanity-ORN
  Scenario Outline: ULOC CLI - Base_RS23043_6002_ORN Create test data for validating IH field values
#    * def testDataFileName = ULOCCLIORNTestData6002
      #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
    Examples:
      | TestID                      | Ofr_st | Ofr_End |
      | "6002_ORN_BASE_Creative_01" | "10"   | "30"    |
      | "6002_ORN_BASE_Creative_02" | "10"   | "30"    |

  @ULOCCLI @ULOCCLI_BASE_IH_Validation_TestData_6090_ORN @6090 @ORN_1 @RS23043 @Sanity-ORN
  Scenario Outline: ULOC CLI - Base_RS23043_6090_ORN Create test data for validating base line IH field values
#    * def testDataFileName = ULOCCLIORNTestData609
      #    Reading testId from Example sectio
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Convert the offer start date to YYYY-MM-DD format
#    * string offerStartDate1 =  dateFormat(<Ofr_st>)
    * string offerStartDate1 = <Ofr_st> == 'NULL'? 'NULL': dateFormat(<Ofr_st>)

    # Convert the offer expiry date to YYYY-MM-DD format
#    * string offerExpiryDate1 = futureDateInDays(<Ofr_End>)
    * string offerExpiryDate1 = <Ofr_End> == 'NULL'? 'NULL': futureDateInDays(<Ofr_End>)

    # Generating account number to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * def scd_num1 = '6'+randGen(12)

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                | accountNumber | ScotiaCardNumber | offerStartDate  | offerExpiryDate  |
      | <TestID>              | acct_num1     | "NULL"           | offerStartDate1 | offerExpiryDate1 |
      | <TestID>+'_Account_2' | acct_num2     | scd_num1         | "NULL"          | "NULL"           |


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Scotia card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the offer start date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet') examples[0]

      # insert the offer expiry date into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet') examples[0]

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


    Examples:
      | TestID                      | Ofr_st | Ofr_End |
      | "6090_ORN_BASE_Creative_01" | "10"   | "30"    |
      | "6090_ORN_BASE_Creative_02" | "10"   | "30"    |


  @International_Money_Transfer_ORN @International_Money_Transfer_ORN_Base_TestData_6087 @6087 @ORN @RS23094 @Sanity-ORN
  Scenario Outline: International Money Transfer 6087 RS23094 ORN Create test data for Base Line test cases

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = InternationalMoneyTransferORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string EVENT_DT = <Event_Date>
    * print "Event Date is", EVENT_DT
  # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                 | Event_Date |
      | "6087_ORN_BASE_Seg_01" | "-9"       |
      | "6087_ORN_BASE_Seg_02" | "-9"       |
      | "6087_ORN_BASE_Seg_03" | "-9"       |
      | "6087_ORN_BASE_Seg_04" | "-9"       |
      | "6087_ORN_BASE_Seg_05" | "-9"       |


  @TFSAFundContributionRESPFundRRSPFund_ORN_Smoke @5501 @5502 @5503 @ORN @Sanity-ORN

  Scenario Outline: TFSA, RESP, RRSP Contribution_5501_5502_5503 ORN Create test data for Contribution offers for Sanity

    #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber


    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string CUST_OPND_DT =  <CUST_OPND_DT>

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def Cust2 = <TestID>+'_cust_2'
    * print 'Customer 2 Test ID is '+Cust2

  # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID |
      | <TestID> | CID |
      | Cust2    | CID |

   # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples

  # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples

  # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID               | ACCT_ODT | CUST_OPND_DT |
      | "5501_TFSA_Fund_ORN" | "100"    | "92"         |
      | "5502_RRSP_Fund_ORN" | "100"    | "100"        |
      | "5503_RESP_Fund_ORN" | "94"     | "95"         |

  @D2DEarlyEngagementOfferReminderORN @D2DEarlyEngagementOfferReminderORN_BASE_Sanity_Positive_TestData_Multipleinsights @6050 @ORN @RS23073 @Sanity-ORN
  Scenario Outline: D2DEarlyEngagementOfferReminderORN_RS23073_6050_ORN Create test data for base sanity Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = D2DOfferFulfilmentReminderORN

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT

#    # Convert the EVENT_DATE to YYYY-MM-DD format
#    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormatExcludeDays(<Event_Date>)
#    * print "Event Date is ",event_date

    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def cust2 = <TestID>+'_Insight_2'
    * print 'insight 2 Test ID is '+cust2

    * def cust3 = <TestID>+'_Insight_3'
    * print 'insight 3 Test ID is '+cust3

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | CID | ACCT_NUM      |
      | <TestID> | CID | accountNumber |
      | cust2    | CID | accountNumber |
      | cust3    | CID | accountNumber |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') examples
#    # insert the Event Date into the EVENT_DATE Sheet
#    * call read('classpath:channels/orn/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet') examples
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') examples

    Examples:
      | TestID             | ACCT_ODT |
      | "6050_ORN_BASE_01" | "45"     |

  @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_ORN_TestData @5839 @ORN @RS22116 @Sanity-ORN
  Scenario Outline: MPSA Welcome Bonus_RS22116_5839_ORN Create test data for base test case

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT
    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_DIM_Insertion_Database')
    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/orn/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/orn/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID             | ACCT_ODT |
      | "5839_ORN_BASE_01" | "20"     |


  @SSI_FUND_ORNTestData_1account_Sanity_Base @6233 @ORN @RS23174 @1account @Sanity-ORN
  Scenario Outline: SSIFUND_RS23174_6233_ORN Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIFUNDORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6233_ORN_BASE_Seg_01"                                                                                       | "5"      |

  @SSI_PAC_ORNTestData_1account_Sanity_base @6234 @ORN @RS23175 @1account @Sanity-ORN
  Scenario Outline: SSIPAC_RS23175_6234_ORN Create test data

    # Reading testId from Example section
    * def testId = <TestID>
#    * def testDataFileName = SSIPACORNTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the acct_odt to YYYY-MM-DD format
    * string ACCT_ODT = <ACCT_ODT>
    * print "Account ODT is", ACCT_ODT


    # insert the created CID into the ORN Test data excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_ORN_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    # insert the created  Account ODT into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    # insert the created Account Number into the ACCT_DIM database
    * call read('classpath:channels/ORN/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                        | ACCT_ODT |
      | "6234_ORN_BASE_Seg_01"                                                                                       | "25"     |
  
  

  ##########################End of ORN############################




