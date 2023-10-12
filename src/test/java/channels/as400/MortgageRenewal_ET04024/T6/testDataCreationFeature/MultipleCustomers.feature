Feature:Create test data for AS400 - Mortgage Renewals Multiple Customers test cases

  Background:

# Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @MortgageRenewalTestData_AS400 @MortgageRenewal_AS400_TwoOneTwo_Customer_TestCases_TestData @MortgageRenewal_AS400_TwoOneTwoCustomer @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Two One Two Customer Test Cases

  # Reading testId from Example section
    * def testId = <TestID>

  # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2


  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet_2Customers')


    # Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID1
    * print "UO Account number is " + accountNumber

# T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,6)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = "01"
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

# insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
 # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')
# insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

  # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId   | CID  |
      | <TestID> | CID1 |
      | secCust  | CID2 |

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

  # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim


  # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId   | CID  | accountNumber |
      | <TestID> | CID1 | accountNumber |
      | secCust  | CID2 | accountNumber |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
  # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                                          |
      | "CoBorrower_AS400_NONSOL_BANKRUPTCY_DT= NULL_COB"                               |
      | "CoBorrower_AS400_NONSOL_BANKRUPTCY_DT= NULL_COS"                               |
      | "AS400_NONSOL_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower" |
      | "AS400_NONSOL_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower" |
      | "AS400_Deceased_F = N for COB"                                                  |
      | "AS400_Deceased_F = N for COS"                                                  |
      | "AS400_T6_NONSOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count=2"              |
      | "N-CoBorrower_AS400_NONSOL_BANKRUPTCY_DT=! NULL_COB"                            |
      | "N-CoBorrower_AS400_NONSOL_BANKRUPTCY_DT=! NULL_COS"                            |
      | "N-AS400_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB"       |
      | "N-AS400_Deceased_F = Y for COB"                                                |
      | "N-AS400_Deceased_F = Y for COS"                                                |

  @MortgageRenewalTestData_AS400 @MortgageRenewal_AS400_TwoTwoThree_Customer_TestCases_TestData @MortgageRenewal_AS400_TwoTwoThree_Customer @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Two Two Three Test Cases of T6

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet_2Customers')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

    # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId   | CID  |
      | <TestID> | CID1 |
      | secCust  | CID2 |

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID1
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber

    # T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,6)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = "01"
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

    # Generating 13 Digit SCD Number For AC Account
    * def SCDNumber = randGen(13)
    * print "SCD Number For AC Account is " + SCDNumber

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc



    # Used table keyword to iterate for any BDD line
    * table acctDim
      | testId   | accountNumber   |
      | <TestID> | UOAccountNumber |
      | ACAcc    | ACAccountNumber |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

       # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim
        # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim


    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId   | CID  | accountNumber   |
      | <TestID> | CID1 | UOAccountNumber |
      | ACAcc    | CID1 | ACAccountNumber |
      | secCust  | CID2 | UOAccountNumber |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                     |
      | "AS400_T6_SOL_MOB_LAST_LOGIN_DT_Count=2"                   |
      | "AS400_T6_SOL_SOL_LAST_LOGIN_DT_Count=2"                   |
      | "AS400_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count=2" |

  @MortgageRenewalTestData_AS400 @MortgageRenewal_AS400_ThreeTwoFour_Customer_TestCases_TestData @MortgageRenewal_AS400_ThreeTwoFour_Customer @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Three Two Four Test Cases of T6

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID2 is "+CID3

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet_2Customers')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

    * def thirdCust = <TestID>+'_3'
    * print 'Third Customer Test ID is '+thirdCust

    # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId    | CID  |
      | <TestID>  | CID1 |
      | secCust   | CID2 |
      | thirdCust | CID3 |

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim

    # Generating account numbers to insert into database
    * def UOAccountNumber = '00000000'+CID1
    * print "UO Account number is " + UOAccountNumber
    * def ACAccountNumber = '00000000'+randGen(15)
    * print "AC Account Number is " + ACAccountNumber


    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc



    # Used table keyword to iterate for any BDD line
    * table acctDim
      | testId   | accountNumber   |
      | <TestID> | UOAccountNumber |
      | ACAcc    | ACAccountNumber |

# T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,6)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = "01"
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

       # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim


    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId    | CID  | accountNumber   |
      | <TestID>  | CID1 | UOAccountNumber |
      | ACAcc     | CID1 | ACAccountNumber |
      | secCust   | CID2 | UOAccountNumber |
      | thirdCust | CID3 | UOAccountNumber |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                             |
      | "AS400_T6_SOLX_MOB_LAST_LOGIN_DT_Count>2"                          |
      | "AS400_T6_SOLX_SOL_LAST_LOGIN_DT_Count>2"                          |
      | "AS400_T6_SOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"        |
      | "N-AS400_T6_SOL_MOB_LAST_LOGIN_DT_Count>2"                         |
      | "N-AS400_T6_SOL_SOL_LAST_LOGIN_DT_Count>2"                         |
      | "N-AS400_T6_SOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_Count>2"       |
      | "N-AS400_T6_SOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2" |

  @MortgageRenewalTestData_AS400 @MortgageRenewal_AS400_ThreeOneThree_Customer_TestCases_TestData @MortgageRenewal_AS400_ThreeOneThreeCustomer @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Three One Three Customer Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID3 is "+CID3

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet_2Customers')

# T6 -  Maturity date is 6 months from today
    * def date = getDate('yyyy-MM-dd')
    * def maturityDate = addMonthAndDateToCurrentDate(1,6)
    * def splitDate = function(date,index){return date.split('-')[index]}
    * def daysInaMonth = daysInMonth(splitDate(maturityDate,1),splitDate(maturityDate,0))
    * def year = splitDate(maturityDate,0)
    * def month = splitDate(maturityDate,1)
    * def dateValue = "01"
    * def maturityDate = parseInt(dateValue) >= parseInt(daysInaMonth) ? (year+'-'+month+'-'+daysInaMonth): (year+'-'+month+'-'+dateValue)
    * print 'Maturity Date is'+maturityDate

    # Generating account numbers to insert into database
    * def accountNumber = '00000000'+CID1
    * print "UO Account number is " + accountNumber

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

       # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    * def secCust = <TestID>+'_2'
    * print 'Secondary Customer Test ID is '+secCust

    * def thirdCust = <TestID>+'_3'
    * print 'Third Customer Test ID is '+thirdCust

    # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId    | CID  |
      | <TestID>  | CID1 |
      | secCust   | CID2 |
      | thirdCust | CID3 |

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim


    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctDim
      | testId    | CID  | accountNumber |
      | <TestID>  | CID1 | accountNumber |
      | secCust   | CID2 | accountNumber |
      | thirdCust | CID3 | accountNumber |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctDim

    Examples:
      | TestID                                                               |
      | "AS400_T6_NONSOLX_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2"  |
      | "N-AS400_T6_NONSOL_SOL_LAST_LOGIN_DT_MOB_LAST_LOGIN_DT_NULL_Count>2" |

#-------------------------Multiple CID's and verifying offer is displaying when Bankruptance or Deaceased flag is given to co-borrowers

  @MortgageRenewal @MortgageRenewal_AS400_Three_Customer_TestCases_TestData @BANKRUPTCY!=NULL_COB @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for bankruptcy not null for COB for primary and co-borrower customers test cases
    * def testDataFileName = MortgageRenewalFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID3 is "+CID3

     # Generating primary account number to insert into database
    * def accountNumber1 = '00000000'+CID1
    * print "UO Account number is " + accountNumber1

    # Generating primary account number to insert into database
    * def accountNumber2 = '00000000'+CID2
    * print "UO Account number is " + accountNumber2

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

     # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId                                                                                          | CID  |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1" | CID1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-2" | CID2 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-3" | CID3 |

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

        # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim
    * table acctDim
      | testId                                                                                          | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1" | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-2" | accountNumber2 |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim

    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctRelDim
      | testId                                                                                                      | CID  | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1"             | CID1 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1_2nd Account" | CID1 | accountNumber2 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-2_1st Account" | CID2 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-3_2nd Account" | CID2 | accountNumber2 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctRelDim

    Examples:
      | TestID                                                                                          | MaturityDate |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account_Customer-1" | "01"         |


  @MortgageRenewal @MortgageRenewal_AS400_Three_Customer_TestCases_TestData @BANKRUPTCY!=NULL_COS @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for bankruptcy not null for COS for primary and co-borrower customers test cases
    * def testDataFileName = MortgageRenewalFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID3 is "+CID3

     # Generating primary account number to insert into database
    * def accountNumber1 = '00000000'+CID1
    * print "UO Account number is " + accountNumber1

    # Generating primary account number to insert into database
    * def accountNumber2 = '00000000'+CID2
    * print "UO Account number is " + accountNumber2

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

     # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId                                                                                          | CID  |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1" | CID1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-2" | CID2 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-3" | CID3 |

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

        # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim
    * table acctDim
      | testId                                                                                          | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1" | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-2" | accountNumber2 |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim

    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctRelDim
      | testId                                                                                                      | CID  | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1"             | CID1 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1_2nd Account" | CID1 | accountNumber2 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-2_1st Account" | CID2 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-3_2nd Account" | CID2 | accountNumber2 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctRelDim

    Examples:
      | TestID                                                                                          | MaturityDate |
      | "AS400_Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account_Customer-1" | "25"         |


  @MortgageRenewal @MortgageRenewal_AS400_Three_Customer_TestCases_TestData @DeceasedFlag=NULL_COB @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for deceased flag null for COB for primary and co-borrower customers test cases
    * def testDataFileName = MortgageRenewalFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID3 is "+CID3

     # Generating primary account number to insert into database
    * def accountNumber1 = '00000000'+CID1
    * print "UO Account number is " + accountNumber1

    # Generating primary account number to insert into database
    * def accountNumber2 = '00000000'+CID2
    * print "UO Account number is " + accountNumber2

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

     # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId                                                                                      | CID  |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1" | CID1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-2" | CID2 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-3" | CID3 |

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

        # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim
    * table acctDim
      | testId                                                                                      | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1" | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-2" | accountNumber2 |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim

    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctRelDim
      | testId                                                                                                  | CID  | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1"             | CID1 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1_2nd Account" | CID1 | accountNumber2 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-2_1st Account" | CID2 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-3_2nd Account" | CID2 | accountNumber2 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctRelDim

    Examples:
      | TestID                                                                                      | MaturityDate |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account_Customer-1" | "01"         |


  @MortgageRenewal @MortgageRenewal_AS400_Three_Customer_TestCases_TestData @DeceasedFlag=NULL_COS @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for deceased flag null for COS for primary and co-borrower customers test cases
    * def testDataFileName = MortgageRenewalFileName
    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID1 = randGen(15)
    * print  "Random generated CID1 is "+CID1

    * def CID2 = randGen(15)
    * print  "Random generated CID2 is "+CID2

    * def CID3 = randGen(15)
    * print  "Random generated CID3 is "+CID3

     # Generating primary account number to insert into database
    * def accountNumber1 = '00000000'+CID1
    * print "UO Account number is " + accountNumber1

    # Generating primary account number to insert into database
    * def accountNumber2 = '00000000'+CID2
    * print "UO Account number is " + accountNumber2

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

     # Used custDim Table to Iterate the CUST_DIM
    * table custDim
      | testId                                                                                      | CID  |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1" | CID1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-2" | CID2 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-3" | CID3 |

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') custDim

        # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database') custDim
    * table acctDim
      | testId                                                                                      | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1" | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-2" | accountNumber2 |


    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') acctDim

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet') acctDim

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') acctDim

    # Used Cust_Acct_Rltn Table to Iterate the CUST_ACCT_RLTN_DIM
    * table custAcctRelDim
      | testId                                                                                                  | CID  | acct_num       |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1"             | CID1 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1_2nd Account" | CID1 | accountNumber2 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-2_1st Account" | CID2 | accountNumber1 |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-3_2nd Account" | CID2 | accountNumber2 |

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') custAcctRelDim
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') custAcctRelDim

    Examples:
      | TestID                                                                                      | MaturityDate |
      | "AS400_Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account_Customer-1" | "25"         |


