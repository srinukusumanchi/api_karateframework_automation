@CIEPROG-50  @PositiveNegative_TestData_4331
Feature: Create test data for D2D Engagement Welcome-BBP-4331 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @D2DWelcome @D2DEngagementWelcomeBBP_IH_Validation_TestData @4331 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for validating IH field values
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
      | "4331_Validate IH Record fields against Proposition" | "2"      | "20" |


  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBP_ACCTODT>30_Negative_TestCases_TestData @4331 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for Negative Test Cases acct odt>30 days
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
      | TestID                                          | Acct_Odt | DOB  |
      | "N-4331_Account Open Date greater than 30 days" | "31"     | "40" |

  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBP_CUST_OPND_DT<7_Negative_TestCases_TestData @4331 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days
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
      | "N-4331_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" | "5"      | "86" | "4"          |

     # Multiple BB Accounts
  @D2DWelcome @D2DEngagementWelcomeBBP_MultipleBBAccounts_TestData @4331 @SOL @RS17103
  Scenario: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for multiple BB accounts
    * def testDataFileName = WelcometestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = '30'
    * print  "Customer's Age is:- "+date

   # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                | accountNumber |
      | "4331_Multiple BB Accounts for Account -1 4331 offer" | acct_num      |
      | "4331_Multiple BB Accounts for Account -2 4332 offer" | acct_num_One  |


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


#    Positive and Negative Test cases for release 1 - Set 1
  @D2DWelcome @D2DEngagementWelcomeBBP_Positive_TestCases_TestData @4331 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for Positive Test Cases

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
      | TestID                                     | Acct_Odt | DOB  |
      | "4331_INDV_BRTH_DT_Equal to 16"           | "10"     | "16" |
      | "4331_DO_NOT_SOLICIT_F= Null"             | "10"     | "21" |
      | "4331_LANG_CD=E"                          | "10"     | "45" |
      | "4331_LANG_CD=EN"                         | "20"     | "50" |
      | "4331_LANG_CD=F"                          | "20"     | "55" |
      | "4331_LANG_CD=FR"                         | "20"     | "60" |
      | "4331_LANG_CD_LowerCase=e"                | "15"     | "45" |
      | "4331_LANG_CD_LowerCase=en"               | "15"     | "50" |
      | "4331_LANG_CD_LowerCase=f"                | "15"     | "55" |
      | "4331_LANG_CD_LowerCase=fr"               | "15"     | "60" |
      | "4331_EMPLOYEE_STAFF_F=NULL"              | "25"     | "75" |
      | "4331_PRD CD- 19, SUB PRD CD -01"         | "25"     | "90" |
      | "4331_PRD CD- 19, SUB PRD CD -02"         | "25"     | "95" |
      | "4331_PRD CD- 19, SUB PRD CD -03"         | "25"     | "62" |
      | "4331_PRD CD- 19, SUB PRD CD -04"         | "29"     | "72" |
      | "4331_PRD CD- 19, SUB PRD CD -07"         | "29"     | "82" |
      | "4331_PRD CD- 19, SUB PRD CD -08"         | "29"     | "52" |
      | "4331_Account Open Date equal to 30 days"  | "30"     | "77" |

  @D2DWelcome_Negative_TestCases_TestData @D2DEngagementWelcomeBBP_Negative_TestCases_TestData @4331 @SOL @RS17103
  Scenario Outline: D2D Engagement Welcome-BBP_RS17103_4331_SOL Create test data for Negative Test Cases
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
      | TestID                                     | Acct_Odt | DOB    |
      | "N-4331_PRIM_CNTRY_CD!= CA"                | "1"      | "20"   |
      | "N-4331_PRIM_CNTRY_CD= Null"               | "1"      | "23"   |
      | "N-4331_CUST_TP_CD != PSNL"                | "1"      | "25"   |
      | "N-4331_CUST_TP_CD =  Null"                | "1"      | "27"   |
      | "N-4331_DO_NOT_SOLICIT_F= Y"               | "1"      | "29"   |
      | "N-4331_Indv_Brth_Dt Equal to 15"          | "1"      | "15"   |
      | "N-4331_Indv_Brth_Dt Equal to Null"        | "1"      | "NULL" |
      | "N-4331_Indv_Brth_Dt with in range (1-14)" | "1"      | "10"   |
      | "N-4331_PRD CD- 19, SUB PRD CD -05"        | "1"      | "24"   |
      | "N-4331_PRD CD-19, SUB PRD CD -09"         | "1"      | "30"   |
      | "N-4331_SRC_ACCT_STAT_CD- B"               | "1"      | "34"   |
      | "N-4331_SRC_ACCT_STAT_CD-Null"             | "1"      | "39"   |
      | "N-4331_Account Open Date equal to Null"   | "NULL"   | "43"   |
      | "N-4331_Deceased_F= Y"                     | "1"      | "45"   |
      | "N-4331_Deceased_F= Null"                  | "1"      | "50"   |
      | "N-4331_LANG_CD= K"                        | "1"      | "65"   |
      | "N-4331_LANG_CD= NE"                       | "1"      | "68"   |
      | "N-4331_LANG_CD= Null"                     | "1"      | "70"   |
      | "N-4331_LANG_CD= A"                        | "1"      | "72"   |
      | "N-4331_LANG_CD= RF"                       | "1"      | "73"   |
      | "N-4331_EMPLOYEE_STAFF_F= Y"               | "1"      | "75"   |
      | "N-4331_ACCT_SUBSYS_ID_KS"                 | "1"      | "78"   |
      | "N-4331_Prv_Bnk_Ind= Null"                 | "1"      | "80"   |
      | "N-4331_Prv_Bnk_Ind= Y"                    | "1"      | "82"   |