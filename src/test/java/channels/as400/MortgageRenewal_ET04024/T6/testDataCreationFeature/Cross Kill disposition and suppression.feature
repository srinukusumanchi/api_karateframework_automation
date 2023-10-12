@ET14061 @CrossKillDispositions_TestData_1430
Feature: Create test data for AS400 - Cross Kill Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewal @MortgageRenewal_AS400_CrossKillDisposition_TestData  @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data Cross kill dispositions of T6
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
      | TestID                                                                                    | MaturityDate |
      | "1430_Perform Accept Disposition  in AS400 and offer should not display in MOB"           | "01"         |
      | "1430_Perform Decline Disposition in AS400 and offer should not display in MOB"           | "02"         |
      | "1430_Perform Refer to other team Disposition in AS400 and offer should display in MOB"   | "03"         |
      | "1430_Perform Refer to Sales Disposition in AS400 and offer should display in MOB"        | "04"         |
      | "1430_Perform Book appointment Disposition in AS400 and offer should display in MOB"      | "05"         |
      | "1430_Perform Customer Self Service Disposition in AS400 and offer should display in MOB" | "06"         |
      | "1430_Perform Customer Defer Disposition in AS400 and offer should display in MOB"        | "07"         |