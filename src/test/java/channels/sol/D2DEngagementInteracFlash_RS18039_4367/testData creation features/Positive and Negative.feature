@CIMCAMP-404 @CIEPROG-120

Feature: Create test data for D2D Engagement-InteracFlash-4367 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementInteracFlash @D2DEngagement_InteracFlash_IH_Validation_TestData @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Create test data for validating IH field values

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InteractestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt


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
      | TestID                                               | Acct_Odt | DOB  |
      | "4367_Validate IH Record fields against Proposition" | "50"     | "22" |

  @D2DEngagementInteracFlash @D2DEngagement_InteracFlash_Positive @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Create test data for Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InteractestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

      # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt


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
      | TestID                                       | Acct_Odt | DOB  |
      | "4367_ISSUE = Engagement and Group = D2D"    | "49"     | "18" |
      | "4367_CUST_TP_CD=PSNL"                       | "50"     | "18" |
      | "4367_PRIM_CNTRY_CD= CA"                     | "50"     | "19" |
      | "4367_DO_NOT_SOLICIT_F=N"                    | "50"     | "21" |
      | "4367_DO_NOT_SOLICIT_F= Null"                | "50"     | "50" |
      | "4367_INDV_BRTH_DT_Greater than 16"          | "50"     | "20" |
      | "4367_INDV_BRTH_DT_Equal to 16"              | "50"     | "16" |
      | "4367_Deceased_F=N"                          | "50"     | "21" |
      | "4367_LANG_CD=E"                             | "50"     | "22" |
      | "4367_LANG_CD_LowerCase=e"                   | "50"     | "22" |
      | "4367_LANG_CD=EN"                            | "50"     | "23" |
      | "4367_LANG_CD_LowerCase=en"                  | "50"     | "23" |
      | "4367_LANG_CD=F"                             | "50"     | "24" |
      | "4367_LANG_CD_LowerCase=f"                   | "50"     | "24" |
      | "4367_LANG_CD=FR"                            | "50"     | "24" |
      | "4367_LANG_CD_LowerCase=fr"                  | "50"     | "44" |
      | "4367_Prv_Bnk_Ind=N"                         | "50"     | "34" |
      | "4367_EMPLOYEE_STAFF_F=N"                    | "50"     | "65" |
      | "4367_EMPLOYEE_STAFF_F=NULL"                 | "50"     | "35" |
      | "4367_SRC_ACCT_STAT_CD-A"                    | "50"     | "65" |
      | "4367_ACCT_SUBSYS_ID_BB"                     | "50"     | "72" |
      | "4367_PRD CD- 01, SUB PRD CD -01"            | "50"     | "54" |
      | "4367_PRD CD- 01, SUB PRD CD -02"            | "50"     | "54" |
      | "4367_PRD CD- 01, SUB PRD CD -03"            | "50"     | "54" |
      | "4367_PRD CD- 01, SUB PRD CD -04"            | "50"     | "54" |
      | "4367_PRD CD- 02, SUB PRD CD -01"            | "50"     | "45" |
      | "4367_PRD CD- 02, SUB PRD CD -02"            | "50"     | "45" |
      | "4367_PRD CD- 02, SUB PRD CD -03"            | "50"     | "45" |
      | "4367_PRD CD- 13, SUB PRD CD -01"            | "50"     | "76" |
      | "4367_PRD CD- 13, SUB PRD CD -03"            | "50"     | "76" |
      | "4367_PRD CD- 13, SUB PRD CD -07"            | "50"     | "76" |
      | "4367_PRD CD- 13, SUB PRD CD -08"            | "50"     | "76" |
      | "4367_PRD CD- 07, SUB PRD CD -11"            | "50"     | "43" |
      | "4367_PRD CD- 07, SUB PRD CD -12"            | "50"     | "43" |
      | "4367_PRD CD- 19, SUB PRD CD -01"            | "50"     | "59" |
      | "4367_PRD CD- 19, SUB PRD CD -02"            | "50"     | "59" |
      | "4367_PRD CD- 19, SUB PRD CD -03"            | "50"     | "59" |
      | "4367_PRD CD- 19, SUB PRD CD -04"            | "50"     | "59" |
      | "4367_PRD CD- 19, SUB PRD CD -07"            | "50"     | "59" |
      | "4367_PRD CD- 19, SUB PRD CD -08"            | "50"     | "59" |
      | "4367_PRD CD- 23, SUB PRD CD -01"            | "50"     | "65" |
      | "4367_PRD CD- 23, SUB PRD CD -03"            | "50"     | "65" |
      | "4367_Account Open Date equal to 49 days"    | "49"     | "88" |
      | "4367_Account Open Date equal to 68 days"    | "68"     | "90" |
      | "4367_Account Open Date >= 49 and <=68 days" | "53"     | "85" |
      | "4367_LAST_FLASH_TXN_DT = NULL"              | "50"     | "85" |

  @D2DEngagementInteracFlash @D2DEngagement_InteracFlash_Negative_TestCases_TestData @4367 @SOL @RS18039
  Scenario Outline: D2D Engagement-InteracFlash_RS18039_4367_SOL Create test data for Negative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = InteractestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt


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
      | TestID                                          | Acct_Odt | DOB    |
      | "N-4367_PRIM_CNTRY_CD!= CA"                     | "49"     | "34"   |
      | "N-4367_PRIM_CNTRY_CD= Null"                    | "50"     | "20"   |
      | "N-4367_CUST_TP_CD != PSNL"                     | "50"     | "35"   |
      | "N-4367_CUST_TP_CD =  Null"                     | "50"     | "49"   |
      | "N-4367_DO_NOT_SOLICIT_F= Y"                    | "50"     | "45"   |
      | "N-4367_Indv_Brth_Dt Equal to 15"               | "50"     | "15"   |
      | "N-4367_Indv_Brth_Dt Equal to Null"             | "50"     | "NULL" |
      | "N-4367_Indv_Brth_Dt with in range (1-14)"      | "50"     | "5"    |
      | "N-4367_PRD CD- 01, SUB PRD CD -08"             | "50"     | "55"   |
      | "N-4367_PRD CD-02, SUB PRD CD -04"              | "50"     | "45"   |
      | "N-4367_PRD CD- 07, SUB PRD CD -08"             | "50"     | "45"   |
      | "N-4367_PRD CD-13, SUB PRD CD -12"              | "50"     | "45"   |
      | "N-4367_PRD CD- 18, SUB PRD CD -02"             | "50"     | "45"   |
      | "N-4367_PRD CD-19, SUB PRD CD -11"              | "50"     | "45"   |
      | "N-4367_PRD CD-23, SUB PRD CD -02"              | "50"     | "45"   |
      | "N-4367_SRC_ACCT_STAT_CD- B"                    | "50"     | "65"   |
      | "N-4367_SRC_ACCT_STAT_CD-Null"                  | "50"     | "76"   |
      | "N-4367_Account Open Date greater than 68 days" | "70"     | "86"   |
      | "N-4367_Account Open Date equal to Null"        | "NULL"   | "45"   |
      | "N-4367_Account Open Date less than 49"         | "44"     | "45"   |
      | "N-4367_Account Open Date equals to 48"         | "48"     | "45"   |
      | "N-4367_Account Open Date equals to 69"         | "69"     | "45"   |
      | "N-4367_Deceased_F= Y"                          | "50"     | "55"   |
      | "N-4367_Deceased_F= Null"                       | "50"     | "65"   |
      | "N-4367_LANG_CD= K"                             | "50"     | "75"   |
      | "N-4367_LANG_CD= NE"                            | "50"     | "67"   |
      | "N-4367_LANG_CD= Null"                          | "50"     | "77"   |
      | "N-4367_EMPLOYEE_STAFF_F= Y"                    | "50"     | "88"   |
      | "N-4367_ACCT_SUBSYS_ID_KS"                      | "50"     | "87"   |
      | "N-4367_Prv_Bnk_Ind= Null"                      | "50"     | "85"   |
      | "N-4367_Prv_Bnk_Ind= Y"                         | "50"     | "98"   |
      | "N-4367_PRD CD- 18, SUB PRD CD -01"             | "50"     | "54"   |
      | "N-4367_PRD CD- 18, SUB PRD CD -07"             | "50"     | "54"   |
      | "N-4367_PRD CD- 18, SUB PRD CD -03"             | "50"     | "54"   |

