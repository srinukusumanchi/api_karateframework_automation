@ET14061 @AS400
Feature: Create test data for AS400 - Mortgage Renewals Disposition and suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @MortgageRenewal @MortgageRenewal_AS400_SingleAccount_Disposition_TestCases_TestData @T6 @1430 @AS400 @ET04024
  Scenario Outline: Mortgage Renewals AS400 Create test data for Single Account Disposition Generic Test Cases of T6
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
      | TestID                                                                                                                              | MaturityDate |
      | "Perform Customer Defer (RML) disposition in AS400 Channel and give a SOAP call in AS400 channel then offer should display"         | "01"         |
      | "Perform Customer Self-Serve (CSE) disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display"   | "02"         |
      | "Perform Refer to Other Team disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display"         | "03"         |
      | "Perform Refer to Sales disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display"              | "04"         |
      | "Perform Book Appointment disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display"            | "05"         |
      | "Perform Decline disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should not display in next 90 days" | "06"         |
      | "Perform Accept disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should not display"                  | "07"         |