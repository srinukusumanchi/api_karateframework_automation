@CIEPROG-50  @PositiveNegative_TestData_4330
Feature: Create test data for D2D Engagement Welcome-BBA-4330 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DWelcome @D2DEngagementWelcomeBBA_IH_Validation_TestData @4330 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for validating IH field values
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                               | Acct_Odt | DOB  |
      | "4330_Validate IH Record fields against Proposition" | "2"      | "20" |


  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBA_ACCTODT>30_Negative_TestCases_TestData @4330 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for Negative Test Case acct odt>30 days
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                          | Acct_Odt | DOB  |
      | "N-4330_Account Open Date greater than 30 days" | "31"     | "86" |


  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBA_CUST_OPND_DT<7_Negative_TestCases_TestData @4330 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

 # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

     # insert the customer opened date into the CUST_DIM Test data excel sheet
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
      | TestID                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "N-4330_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" | "5"      | "46" | "4"          |


#    Positive and Negative Test cases for release 1 - Set 1

  @D2DWelcome_Positive_TestCases_TestData @D2DEngagementWelcomeBBA_Positive_TestCases_TestData @4330 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for Positive Test Cases

 #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = WelcometestDataFileName
     # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

   # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                    | Acct_Odt | DOB  |
      | "4330_DO_NOT_SOLICIT_F= Null"             | "5"      | "21" |
      | "4330_INDV_BRTH_DT_Equal to 16"           | "5"      | "16" |
      | "4330_LANG_CD=E"                          | "5"      | "22" |
      | "4330_LANG_CD=EN"                         | "10"     | "23" |
      | "4330_LANG_CD=F"                          | "10"     | "24" |
      | "4330_LANG_CD=FR"                         | "10"     | "44" |
      | "4330_LANG_CD_LowerCase=e"                | "15"     | "22" |
      | "4330_LANG_CD_LowerCase=en"               | "15"     | "23" |
      | "4330_LANG_CD_LowerCase=f"                | "15"     | "24" |
      | "4330_LANG_CD_LowerCase=fr"               | "20"     | "44" |
      | "4330_EMPLOYEE_STAFF_F=NULL"              | "20"     | "35" |
      | "4330_PRD CD- 01, SUB PRD CD -01"         | "20"     | "54" |
      | "4330_PRD CD- 01, SUB PRD CD -02"         | "25"     | "45" |
      | "4330_PRD CD- 01, SUB PRD CD -03"         | "25"     | "76" |
      | "4330_PRD CD- 01, SUB PRD CD -04"         | "25"     | "43" |
      | "4330_PRD CD- 02, SUB PRD CD -01"         | "28"     | "54" |
      | "4330_PRD CD- 02, SUB PRD CD -02"         | "28"     | "59" |
      | "4330_PRD CD- 02, SUB PRD CD -03"         | "28"     | "65" |
      | "4330_Account Open Date equal to 30 days" | "30"     | "90" |


  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBA_Negative_TestCases_TestData @4330 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for Negative Test Cases
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

  # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + acct_num

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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                     | Acct_Odt | DOB    |
      | "N-4330_PRIM_CNTRY_CD!= CA"                | "1"      | "34"   |
      | "N-4330_PRIM_CNTRY_CD= Null"               | "1"      | "20"   |
      | "N-4330_CUST_TP_CD != PSNL"                | "1"      | "35"   |
      | "N-4330_CUST_TP_CD =  Null"                | "1"      | "49"   |
      | "N-4330_DO_NOT_SOLICIT_F= Y"               | "1"      | "45"   |
      | "N-4330_Indv_Brth_Dt Equal to 15"          | "1"      | "15"   |
      | "N-4330_Indv_Brth_Dt Equal to Null"        | "1"      | "NULL" |
      | "N-4330_Indv_Brth_Dt with in range (1-14)" | "1"      | "5"    |
      | "N-4330_PRD CD- 01, SUB PRD CD -05"        | "1"      | "55"   |
      | "N-4330_PRD CD-02, SUB PRD CD -04"         | "1"      | "45"   |
      | "N-4330_SRC_ACCT_STAT_CD- B"               | "1"      | "65"   |
      | "N-4330_SRC_ACCT_STAT_CD-Null"             | "1"      | "76"   |
      | "N-4330_Account Open Date equal to Null"   | "NULL"   | "45"   |
      | "N-4330_Deceased_F= Y"                     | "1"      | "55"   |
      | "N-4330_Deceased_F= Null"                  | "1"      | "65"   |
      | "N-4330_LANG_CD= K"                        | "1"      | "75"   |
      | "N-4330_LANG_CD= NE"                       | "1"      | "67"   |
      | "N-4330_LANG_CD= Null"                     | "1"      | "77"   |
      | "N-4330_LANG_CD= A"                        | "1"      | "72"   |
      | "N-4330_LANG_CD= RF"                       | "1"      | "73"   |
      | "N-4330_EMPLOYEE_STAFF_F= Y"               | "1"      | "88"   |
      | "N-4330_ACCT_SUBSYS_ID_KS"                 | "1"      | "87"   |
      | "N-4330_Prv_Bnk_Ind= Null"                 | "1"      | "85"   |
      | "N-4330_Prv_Bnk_Ind= Y"                    | "1"      | "98"   |


    # Multiple BB Accounts
  @D2DWelcome @D2DEngagementWelcomeBBAMultipleAcc_Positive_TestCases_TestData @4330 @SOL @RS17103
  Scenario: D2D Engagement Welcome-BBA_RS17103_4330_SOL Create test data for multiple BB accounts
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = '30'
    * print  "Customer's Age is:- "+date

   # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(2)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                | accountNumber |
      | "4330_Multiple BB Accounts for Account -1 4330 offer" | acct_num      |
      | "4330_Multiple BB Accounts for Account -2 4331 offer" | acct_num_One  |


  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet') examples

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples