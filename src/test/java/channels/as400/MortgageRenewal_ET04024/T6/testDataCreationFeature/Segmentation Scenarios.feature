@ET14061 @AS400
Feature: Create test data for AS400 - Mortgage Renewals Segmentation test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewal @MortgageRenewal_AS400_Segmentation_Positive_TestCases_TestData @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Segmentation Test Cases of T6
    * def testDataFileName = MortgageRenewalFileName
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
      | TestID                                                                                                                                                                           | MaturityDate |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                                        | "01"         |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                                        | "02"         |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                                             | "03"         |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                                             | "04"         |
      | "AS400_SOL_T6_MOB_LAST_LOGIN_DT_Count <2"                                                                                                                                        | "05"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                                        | "06"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                                        | "07"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                                             | "08"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                                             | "09"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_Count <2"                                                                                                                                        | "10"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN > 26"                                                                                                      | "11"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_AMORTIZATION_REMAIN = 26"                                                                                                      | "12"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT >20000"                                                                                                           | "13"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_CRNT_BAL_AMT =20000"                                                                                                           | "14"         |
      | "AS400_SOL_T6_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count <2"                                                                                                                      | "15"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                               | "16"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000"                       | "17"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                               | "18"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000"                       | "19"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT  has Value AND AMORTIZATION_REMAIN Between 6 to 26"                        | "20"         |
      | "AS400_SOLX- ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000" | "22"         |

  @MortgageRenewal @MortgageRenewal_AS400_Segmentation_Negative_TestCases_TestData  @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Segmentation Test Cases of T6
    * def testDataFileName = MortgageRenewalFileName
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
      | TestID                                                                                                                                                                                        | MaturityDate |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2"                                         | "10"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        | "11"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                 | "12"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                         | "13"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                                        | "14"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"                                       | "15"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        | "16"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                                        | "17"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                                       | "18"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"                | "19"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2"                 | "20"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  = NULL And MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >= 20000 and Count <=2" | "22"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                  | "23"         |
      | "N-AS400_SOL- ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2"                 | "24"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                                           | "25"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26"                                                                      | "26"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6"                                                                       | "27"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000"                                   | "28"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2"                                              | "29"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26"                                                           | "31"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26"                                                                      | "01"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6"                                                                       | "02"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000"                                   | "03"         |
      | "N-AS400_SOLX-ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2"                                              | "04"         |