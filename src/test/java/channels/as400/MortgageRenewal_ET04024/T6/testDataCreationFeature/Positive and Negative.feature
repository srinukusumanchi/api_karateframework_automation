@ET14061 @AS400 @PositiveAndNegative_TestData_1430
Feature: Create test data for AS400 - Mortgage Renewals Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewal @MortgageRenewal_AS400_SingleAccount_Positive_TestCases_TestData @MortgageRenewal_SingleAccount_AS400_GenericPositiveTestCases @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Single Account Positive Generic Test Cases of T6
    * def testDataFileName = MortgageRenewalFileName
# Reading testId from Example section
    * def testId = <TestID>

# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

# Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID
    * print "UO Account number is " + accountNumber

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
  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

# insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


# insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

      # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

# insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

# insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                                                                   | MaturityDate |
      | "1430_Validate IH Record fields against Proposition"                                                                                                     | "01"         |
      | "AS400_LANG_CD = E"                                                                                                                                      | "01"         |
      | "AS400_LANG_CD = EN"                                                                                                                                     | "02"         |
      | "AS400_LANG_CD = F"                                                                                                                                      | "03"         |
      | "AS400_LANG_CD = FR"                                                                                                                                     | "04"         |
      | "AS400_LANG_CD_LowerCase = e"                                                                                                                            | "05"         |
      | "AS400_LANG_CD_LowerCase = en"                                                                                                                           | "06"         |
      | "AS400_LANG_CD_LowerCase = f"                                                                                                                            | "07"         |
      | "AS400_LANG_CD_LowerCase = fr"                                                                                                                           | "08"         |
      | "AS400_CR_RSK_IND != (D,E)"                                                                                                                              | "09"         |
      | "AS400_CR_RSK_IND = NULL"                                                                                                                                | "10"         |
      | "AS400_RENEW_LIMITED_F = 0"                                                                                                                              | "11"         |
      | "AS400_RENEW_LIMITED_F >2"                                                                                                                               | "12"         |
      | "AS400_CASHBACK_F  = N"                                                                                                                                  | "13"         |
      | "AS400_CASHBACK_F  = NULL"                                                                                                                               | "14"         |
      | "AS400_MORT_NOT_FRCLSR_F = Y"                                                                                                                            | "15"         |
      | "AS400_MORT_NOT_FRCLSR_F = NULL"                                                                                                                         | "16"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 2"                                                                                                                       | "17"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 3"                                                                                                                       | "18"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 4"                                                                                                                       | "19"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 5"                                                                                                                       | "20"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 6"                                                                                                                       | "21"         |
      | "AS400_MORT_PB_TRANSIT_REGION = 7"                                                                                                                       | "22"         |
      | "AS400_MORT_ARREARS_MONTHS < 0"                                                                                                                          | "23"         |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN"                                                                          | "24"         |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS"                                                            | "25"         |
      | "AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS < 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS"                                                            | "25"         |
      | "AS400_MORT_FUND_CODE !=(1900, 1901, 1902, 1912, 1916, 1922)"                                                                                            | "26"         |
      | "AS400_MORT_FUND_CODE !=(1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600) and SERV_TRNST_NUM != 12088"                                   | "26"         |
      | "AS400_INTEREST_RATE = 0"                                                                                                                                | "19"         |
      | "AS400_MORT_COMM_TYPE = Residential"                                                                                                                     | "27"         |
      | "AS400_ACCT_NUM = 23 Digit Numeric Value"                                                                                                                | "28"         |
      | "AS400_IP_AR_RELATN_TYPE_CD = SOL"                                                                                                                       | "29"         |
      | "AS400_IP_AR_RELATN_TYPE_CD = BOR"                                                                                                                       | "30"         |
      | "AS400_ACCT_SUBSYS_ID = UO"                                                                                                                              | "31"         |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2"                     | "01"         |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  =26 and CRNT_BAL_AMT >=20000 and Count <=2"                     | "02"         |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >20000 and Count <=2"                     | "03"         |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT =20000 and Count <=2"                     | "04"         |
      | "AS400_NONSOL SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <2"                     | "05"         |
      | "AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6"                         | "06"         |
      | "AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000" | "07"         |
      | "CoBorrower_AS400_NONSOL_BANKRUPTCY_DT= NULL_COB"                                                                                                        | "15"         |

  @MortgageRenewal @MortgageRenewal_AS400_SingleAccount_Negative_TestCases_TestData  @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Single Account Negative Generic Test Cases of T6
    * def testDataFileName = MortgageRenewalFileName
# Reading testId from Example section
    * def testId = <TestID>

# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

# Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID
    * print "UO Account number is " + accountNumber

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

# insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

# insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


# insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

          # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

# insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

# insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
    Examples:
      | TestID                                                                                                                                                      | MaturityDate |
      | "N-AS400_Primary Customer_BANKRUPTCY_DT != NULL_SOL"                                                                                                        | "01"         |
      | "N-AS400_Primary Customer_BANKRUPTCY_DT != NULL_BOR"                                                                                                        | "02"         |
      | "N-AS400_CUST_TP_CD != PSNL"                                                                                                                                | "03"         |
      | "N-AS400_CUST_TP_CD = NULL"                                                                                                                                 | "04"         |
      | "N-AS400_Deceased_F = Y"                                                                                                                                    | "05"         |
      | "N-AS400_Deceased_F = NULL"                                                                                                                                 | "06"         |
      | "N-AS400_LANG_CD = K"                                                                                                                                       | "07"         |
      | "N-AS400_LANG_CD = NE"                                                                                                                                      | "08"         |
      | "N-AS400_LANG_CD = NULL"                                                                                                                                    | "09"         |
      | "N-AS400_CR_RSK_IND = D"                                                                                                                                    | "10"         |
      | "N-AS400_CR_RSK_IND = E"                                                                                                                                    | "11"         |
      | "N-AS400_RENEW_LIMITED_F = 1"                                                                                                                               | "12"         |
      | "N-AS400_RENEW_LIMITED_F = 2"                                                                                                                               | "13"         |
      | "N-AS400_CASHBACK_F  = Y"                                                                                                                                   | "14"         |
      | "N-AS400_MORT_NOT_FRCLSR_F = N"                                                                                                                             | "15"         |
      | "N-AS400_SRC_SYS_PRD_CD = 911"                                                                                                                              | "16"         |
      | "N-AS400_SRC_SYS_PRD_CD = 931"                                                                                                                              | "17"         |
      | "N-AS400_SRC_SYS_PRD_CD = 951"                                                                                                                              | "18"         |
      | "N-AS400_INTEREST_RATE < 0"                                                                                                                                 | "20"         |
      | "N-AS400_AMORTIZATION_REMAIN < 6"                                                                                                                           | "22"         |
      | "N-AS400_MORT_PB_TRANSIT_REGION!= (2,3,4,5,6,7)"                                                                                                            | "23"         |
      | "N-AS400_MORT_ARREARS_MONTHS > 0"                                                                                                                           | "24"         |
      | "N-AS400_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL"                                                                                                         | "25"         |
      | "N-AS400_MORT_FUND_CODE = 1901"                                                                                                                             | "26"         |
      | "N-AS400_MORT_FUND_CODE = 1902"                                                                                                                             | "26"         |
      | "N-AS400_MORT_FUND_CODE = 1912"                                                                                                                             | "26"         |
      | "N-AS400_MORT_FUND_CODE = 1916"                                                                                                                             | "26"         |
      | "N-AS400_MORT_FUND_CODE = 1922"                                                                                                                             | "26"         |
      | "N-AS400_MORT_FUND_CODE = 1904 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         | "27"         |
      | "N-AS400_MORT_FUND_CODE = 1905 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         | "27"         |
      | "N-AS400_MORT_FUND_CODE = 1910 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         | "27"         |
      | "N-AS400_MORT_FUND_CODE = 1924 and ACCT_DIM.SERV_TRNST_NUM = 12088"                                                                                         | "27"         |
      | "N-AS400_SRC_ACCT_STAT_CD = NULL"                                                                                                                           | "28"         |
      | "N-AS400_SRC_ACCT_STAT_CD = OPEN"                                                                                                                           | "29"         |
      | "N-AS400_MORT_COMM_TYPE != Residential"                                                                                                                     | "30"         |
      | "N-AS400_MORT_COMM_TYPE = NULL"                                                                                                                             | "31"         |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = BLANK"                                                                                                                      | "01"         |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = NULL"                                                                                                                       | "02"         |
      | "N-AS400_IP_AR_RELATN_TYPE_CD = Zero"                                                                                                                       | "03"         |
      | "N-AS400_ACCT_SUBSYS_ID != UO"                                                                                                                              | "04"         |
      | "N-AS400_INDV_FRST_NM = NULL"                                                                                                                               | "05"         |
      | "N-AS400_INDV_LAST_NM = NULL"                                                                                                                               | "06"         |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2"             | "07"         |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2"                    | "08"         |
      | "N-AS400_NONSOL- SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2"                    | "09"         |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has some value and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6"                       | "10"         |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN > 26"                                                   | "11"         |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN < 6"                                                    | "12"         |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT > 20000" | "13"         |
      | "N-AS400_NONSOLX- MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And Count < 2"            | "14"         |


  @MortgageRenewal @MortgageRenewal_AS400_SingleAccount_Negative_TestCases_TestData  @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Single Account Negative Generic Test Cases of T6 greater than 6 months
    * def testDataFileName = MortgageRenewalFileName
# Reading testId from Example section
    * def testId = <TestID>

# Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

# Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID
    * print "UO Account number is " + accountNumber

# T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,7)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = <MaturityDate>
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

# insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

# insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

# insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


# insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

          # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

# insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

# insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
# insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')
    Examples:
      | TestID                             | MaturityDate |
      | "N-AS400_MAT_DT - Current Date >6" | "01"         |