@RS20034 @5043 @PositiveAndNegative_TestData_5043
Feature: Create test data for New To Canada - 5043 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NewToCanada @NewToCanada_IH_Validation_TestData @5043 @SOL @RS20034
  Scenario Outline: New To Canada_RS20034_5043_SOL Create test data for validating IH field values
    * def testDataFileName = NTCtestDataFileName
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
      | TestID                                               | DOB  | BBDWSC_SC_EXPIRY_DATE |
      | "5043_Validate IH Record fields against Proposition" | "33" | "70"                  |

  @NewToCanada @NewToCanada_Positive_TestCases_TestData @NewToCanada_Positive @5043 @SOL @RS20034
  Scenario Outline: NewToCanada_RS20034_5043_SOL Create test data for Positive Test Cases
    * def testDataFileName = NTCtestDataFileName
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
      | TestID                                                          | DOB  | BBDWSC_SC_EXPIRY_DATE |
      | "Validating SOL for 5043 - Personal customer"                   | "19" | "70"                  |
      | "Validating SOL for 5043 - DNS as N"                            | "20" | "70"                  |
      | "Validating SOL for 5043 - DNS as NULL"                         | "21" | "70"                  |
      | "Validating SOL for 5043 - Age equal to 18 years"               | "18" | "70"                  |
      | "Validating SOL for 5043 - Age greater than 18 years"           | "30" | "70"                  |
      | "Validating SOL for 5043 - Marketable Flag as Y"                | "21" | "70"                  |
      | "Validating SOL for 5043 - Deceased Flag as N"                  | "22" | "70"                  |
      | "Validating SOL for 5043 - Language Code as EN"                 | "23" | "70"                  |
      | "Validating SOL for 5043 - Language Code as FR"                 | "24" | "70"                  |
      | "Validating SOL for 5043 - Language Code as E"                  | "25" | "70"                  |
      | "Validating SOL for 5043 - Language Code as F"                  | "26" | "70"                  |
      | "Validating SOL for 5043 - Language Code as small case =en"     | "27" | "70"                  |
      | "Validating SOL for 5043 - Language Code as small case =fr"     | "28" | "70"                  |
      | "Validating SOL for 5043 - Language Code as small case =e"      | "29" | "70"                  |
      | "Validating SOL for 5043 - Language Code as small case =f"      | "30" | "70"                  |
      | "Validating SOL for 5043 - IMMGRTN_CAT_CD ! = S"                | "32" | "70"                  |
      | "Validating SOL for 5043 - IMMGRTN_CAT_CD is NULL"              | "21" | "70"                  |
      | "Validating SOL for 5043 - MCB_IND - Y"                         | "34" | "70"                  |
      | "Validating SOL for 5043 - Country Code - CA"                   | "35" | "70"                  |
      | "Validating SOL for 5043 - EMPLOYEE_STAFF_F - N"                | "36" | "70"                  |
      | "Validating SOL for 5043 - EMPLOYEE_STAFF_F - NULL"             | "21" | "70"                  |
      | "Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG = 1"            | "37" | "70"                  |
      | "Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE = NTC"        | "38" | "70"                  |
      | "Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE = 60th DAY"    | "39" | "60"                  |
      | "Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE > 60 and < 70" | "40" | "65"                  |
      | "Validating SOL for 5043 - Fee Waiver Expiry Date = 70th DAY"   | "41" | "70"                  |
      | "Validating SOL for 5043 - Primary Account Holder - Y"          | "42" | "70"                  |
      | "Validating SOL for 5043 - Acct_subsys_id = BB"                 | "43" | "70"                  |
      | "Validating SOL for 5043 - Acct_subsys_id = KS"                 | "43" | "70"                  |
      | "Validating SOL for 5043 - Acct_subsys_id = AV"                 | "43" | "70"                  |

  @NewToCanada @NewToCanada_Negative_TestCases_TestData @5043 @SOL @RS20034
  Scenario Outline: New To Canada_RS20034_5043_SOL Create test data for Negative Test Cases
    * def testDataFileName = NTCtestDataFileName
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
      | TestID                                                                   | DOB    | BBDWSC_SC_EXPIRY_DATE |
      | "N-Validating SOL for 5043 - Non Personal customer"                      | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Country Code - other than CA"               | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Country Code NULL"                          | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Age Less than 18 years"                     | "15"   | "70"                  |
      | "N-Validating SOL for 5043 - Age is NULL"                                | "NULL" | "70"                  |
      | "N-Validating SOL for 5043 - DNS as Y"                                   | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Marketable Flag as N"                       | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Marketable Flag as NULL"                    | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Deceased Flag as Y"                         | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Deceased Flag as NULL"                      | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Language Code NE"                           | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Language Code K"                            | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Language Code NULL"                         | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - IMMGRTN_CAT_CD is S"                        | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - IMMGRTN_CAT_CD is S00"                      | "33"   | "70"                  |
      | "N-Validating SOL for 5043 - MCB_IND - N"                                | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - MCB_IND - NULL"                             | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - EMPLOYEE_STAFF_F - Y"                       | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG - other than 1"        | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - BBDWSC_SC_WAIVE_FLAG as NULL"               | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE - other than NTC"    | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - BBDWSC_FEE_WAIVER_TYPE as NULL"             | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Fee Waiver Expiry Date less than 60 days"   | "21"   | "59"                  |
      | "N-Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE greater than 70 days" | "21"   | "71"                  |
      | "N-Validating SOL for 5043 - BBDWSC_SC_EXPIRY_DATE NULL"                 | "21"   | "NULL"                |
      | "N-Validating SOL for 5043 - Primary Account Holder - N"                 | "21"   | "70"                  |
      | "N-Validating SOL for 5043 - Primary Account Holder - NULL"              | "21"   | "70"                  |

  @NewToCanada @NewToCanada_CUST_OPND_DT<7_Negative_TestCases_TestData @5043 @SOL @RS20034
  Scenario Outline: NewToCanada_RS20034_5043_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days
    * def testDataFileName = NTCtestDataFileName
#     Reading testId from Example section
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

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating Future Date For inserting into BBDWSC_SC_EXPIRY_DATE Column in the ACCT_DIM
    * def scExpiryDate = <BBDWSC_SC_EXPIRY_DATE> == 'NULL' ? 'NULL' : futureDateInDays(<BBDWSC_SC_EXPIRY_DATE>)
    * print "BBDWSC SC Expiry Date is : "+scExpiryDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')
    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
    # insert the created DOB into the CUST_DIM Testdata excel sheet
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
    # insert the created Expiry Date into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@BBDWSC_SC_EXPIRY_DATE_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                 | DOB  | CUST_OPND_DT | BBDWSC_SC_EXPIRY_DATE |
      | "N-5043_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" | "45" | "4"          | "65"                  |
