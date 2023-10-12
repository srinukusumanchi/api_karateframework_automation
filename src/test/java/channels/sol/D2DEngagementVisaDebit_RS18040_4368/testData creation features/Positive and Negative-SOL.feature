@CIMCAMP-406  @CIEPROG-122

Feature: Create test data for D2DEngagement-VisaDebit-4368 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementVisaDebit @D2DEngagement_VisaDebit_IH_Validation_TestData @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Create test data for validating IH field values

     #    Reading testId from Example section
    * def testId = <TestID>
  * def testDataFileName = VisaDebittestDataFileName
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
      | "4368_Validate IH Record fields against Proposition" | "57"     | "22" |

  @D2DEngagementVisaDebit @D2DEngagement_VisaDebit_Positive_TestCases_TestData @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Create test data for Positive Test Cases

     #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebittestDataFileName
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
      | "4368_ISSUE = Engagement and Group = D2D"    | "56"     | "17" |
#      | "4368_CUST_TP_CD=PSNL"                       | "56"     | "18" |
#      | "4368_PRIM_CNTRY_CD= CA"                     | "57"     | "19" |
#      | "4368_DO_NOT_SOLICIT_F=N"                    | "57"     | "21" |
#      | "4368_DO_NOT_SOLICIT_F= Null"                | "57"     | "50" |
#      | "4368_INDV_BRTH_DT_Greater than 16"          | "57"     | "20" |
#      | "4368_INDV_BRTH_DT_Equal to 16"              | "57"     | "16" |
#      | "4368_Deceased_F=N"                          | "57"     | "21" |
#      | "4368_LANG_CD=E"                             | "57"     | "22" |
#      | "4368_LANG_CD_LowerCase=e"                   | "57"     | "22" |
#      | "4368_LANG_CD=EN"                            | "57"     | "23" |
#      | "4368_LANG_CD_LowerCase=en"                  | "57"     | "23" |
#      | "4368_LANG_CD=F"                             | "57"     | "24" |
#      | "4368_LANG_CD_LowerCase=f"                   | "57"     | "24" |
#      | "4368_LANG_CD=FR"                            | "57"     | "44" |
#      | "4368_LANG_CD_LowerCase=fr"                  | "57"     | "44" |
#      | "4368_Prv_Bnk_Ind=N"                         | "57"     | "34" |
#      | "4368_EMPLOYEE_STAFF_F=N"                    | "57"     | "65" |
#      | "4368_EMPLOYEE_STAFF_F=NULL"                 | "57"     | "35" |
#      | "4368_SRC_ACCT_STAT_CD-A"                    | "57"     | "65" |
#      | "4368_ACCT_SUBSYS_ID_BB"                     | "57"     | "72" |
#      | "4368_PRD CD- 01, SUB PRD CD -01"            | "57"     | "54" |
#      | "4368_PRD CD- 01, SUB PRD CD -02"            | "57"     | "54" |
#      | "4368_PRD CD- 01, SUB PRD CD -03"            | "57"     | "54" |
#      | "4368_PRD CD- 01, SUB PRD CD -04"            | "57"     | "54" |
#      | "4368_PRD CD- 02, SUB PRD CD -01"            | "57"     | "45" |
#      | "4368_PRD CD- 02, SUB PRD CD -02"            | "57"     | "45" |
#      | "4368_PRD CD- 02, SUB PRD CD -03"            | "57"     | "45" |
#      | "4368_PRD CD- 13, SUB PRD CD -01"            | "57"     | "76" |
#      | "4368_PRD CD- 13, SUB PRD CD -03"            | "57"     | "76" |
#      | "4368_PRD CD- 13, SUB PRD CD -07"            | "57"     | "76" |
#      | "4368_PRD CD- 13, SUB PRD CD -08"            | "57"     | "76" |
#      | "4368_PRD CD- 07, SUB PRD CD -11"            | "57"     | "43" |
#      | "4368_PRD CD- 07, SUB PRD CD -12"            | "57"     | "43" |
#      | "4368_PRD CD- 19, SUB PRD CD -01"            | "57"     | "59" |
#      | "4368_PRD CD- 19, SUB PRD CD -02"            | "57"     | "59" |
#      | "4368_PRD CD- 19, SUB PRD CD -03"            | "57"     | "59" |
#      | "4368_PRD CD- 19, SUB PRD CD -04"            | "57"     | "59" |
#      | "4368_PRD CD- 19, SUB PRD CD -07"            | "57"     | "59" |
#      | "4368_PRD CD- 19, SUB PRD CD -08"            | "57"     | "59" |
#      | "4368_PRD CD- 23, SUB PRD CD -01"            | "57"     | "65" |
#      | "4368_PRD CD- 23, SUB PRD CD -03"            | "57"     | "65" |
#      | "4368_Account Open Date equal to 56 days"    | "56"     | "88" |
#      | "4368_Account Open Date equal to 75 days"    | "75"     | "90" |
#      | "4368_Account Open Date >= 56 and <=75 days" | "57"     | "85" |
#      | "4368_LAST_VD_VPOS_TXN_TMSTMP = NULL"        | "57"     | "85" |
#      | "4368_LAST_VD_OPOS_TXN_TMSTMP = NULL"        | "57"     | "85" |

  @D2DEngagementVisaDebit @D2DEngagement_VisaDebit_Negative_TestCases_TestData @4368 @SOL @RS18040
  Scenario Outline: D2D Engagement-VisaDebit_RS18040_4368_SOL Create test data for Negative Test Cases

     #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = VisaDebittestDataFileName
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
      | "N-4368_PRIM_CNTRY_CD!= CA"                     | "56"     | "34"   |
      | "N-4368_PRIM_CNTRY_CD= Null"                    | "56"     | "20"   |
      | "N-4368_CUST_TP_CD != PSNL"                     | "57"     | "35"   |
      | "N-4368_CUST_TP_CD =  Null"                     | "57"     | "49"   |
      | "N-4368_DO_NOT_SOLICIT_F= Y"                    | "57"     | "45"   |
      | "N-4368_Indv_Brth_Dt Equal to 15"               | "57"     | "15"   |
      | "N-4368_Indv_Brth_Dt Equal to Null"             | "57"     | "NULL" |
      | "N-4368_Indv_Brth_Dt with in range (1-14)"      | "57"     | "5"    |
      | "N-4368_PRD CD- 01, SUB PRD CD -08"             | "57"     | "55"   |
      | "N-4368_PRD CD-02, SUB PRD CD -04"              | "57"     | "45"   |
      | "N-4368_PRD CD- 07, SUB PRD CD -08"             | "57"     | "45"   |
      | "N-4368_PRD CD-13, SUB PRD CD -12"              | "57"     | "45"   |
      | "N-4368_PRD CD- 18, SUB PRD CD -02"             | "57"     | "45"   |
      | "N-4368_PRD CD-19, SUB PRD CD -11"              | "57"     | "45"   |
      | "N-4368_PRD CD-23, SUB PRD CD -02"              | "57"     | "45"   |
      | "N-4368_SRC_ACCT_STAT_CD- B"                    | "57"     | "65"   |
      | "N-4368_SRC_ACCT_STAT_CD-Null"                  | "57"     | "76"   |
      | "N-4368_Account Open Date greater than 75 days" | "86"     | "86"   |
      | "N-4368_Account Open Date equal to Null"        | "NULL"   | "45"   |
      | "N-4368_Account Open Date less than 56"         | "44"     | "45"   |
      | "N-4368_Account Open Date equals to 55"         | "55"     | "45"   |
      | "N-4368_Account Open Date equals to 76"         | "76"     | "45"   |
      | "N-4368_Deceased_F= Y"                          | "57"     | "55"   |
      | "N-4368_Deceased_F= Null"                       | "57"     | "65"   |
      | "N-4368_LANG_CD= K"                             | "57"     | "75"   |
      | "N-4368_LANG_CD= NE"                            | "57"     | "67"   |
      | "N-4368_LANG_CD= Null"                          | "57"     | "77"   |
      | "N-4368_EMPLOYEE_STAFF_F= Y"                    | "57"     | "88"   |
      | "N-4368_ACCT_SUBSYS_ID_KS"                      | "57"     | "87"   |
      | "N-4368_Prv_Bnk_Ind= Null"                      | "57"     | "85"   |
      | "N-4368_Prv_Bnk_Ind= Y"                         | "57"     | "98"   |
      | "N-4368_PRD CD- 18, SUB PRD CD -01"             | "57"     | "54"   |
      | "N-4368_PRD CD- 18, SUB PRD CD -07"             | "57"     | "54"   |
      | "N-4368_PRD CD- 18, SUB PRD CD -03"             | "57"     | "54"   |
