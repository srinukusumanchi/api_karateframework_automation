@ET14061
@AS400_4587

Feature: Create test data for AS400 - GIC Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @GIC_AS400 @GIC_AS400_Segmentation_TestCases_TestData @GIC_AS400_4587_SegmentationTestCases_4587 @4587 @NOVA @ET14061
  Scenario Outline: GIC_AS400 Create test data for 4587 Segmentation Test Cases


    * def testDataFileName = GICtestDataFileName
#     Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(5)+randGen(5)
    * print  "Random generated Certificate is "+CERT

#    Compare Maturity date with current date and fix maturity date value
    * def currentDate = getDate('yyyy-MM-dd')
    * def todaysDate = getDate('yyyy-MM-dd')
    * def getDateMonthYearFunction = function(date,index){return date.split('-')[index]}
    * def month = getDateMonthYearFunction(todaysDate,1)
    * def year = getDateMonthYearFunction(todaysDate,0)
    * def maturityDate = year+'-'+month+'-'+<MAT_DT>
    * def datesDifference = findDateDifference(maturityDate,currentDate)
    * def maturityDate = datesDifference>=0 ? year+'-'+(parseInt(month)+1)+'-'+<MAT_DT>: year+'-'+month+'-'+(parseInt(<MAT_DT>)+1)
    * def maturityDate = datemonthyearformat(maturityDate)
    * print 'Date difference'+datesDifference
    * print 'Maturity Date'+maturityDate
    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the complete Row into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')


     # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')



     # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

     # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')



    Examples:
      | TestID                                                                                                              | DOB  |MAT_DT|
      | "4587_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=1"                       | "22" |"01"  |
      | "4587_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE is in between 1 and 7"   | "22" |"05"  |
      | "4587_GDD_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=7"                       | "22" |"07"  |
      | "4587_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=8"                       | "22" |"08"  |
      | "4587_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE is in between 8 and 14"  | "22" |"10"  |
      | "4587_GEE_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=14"                      | "22" |"14"  |
      | "4587_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=15"                      | "22" |"15"  |
      | "4587_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE is in between 15 and 22" | "22" |"20"  |
      | "4587_GFF_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=22"                      | "22" |"22"  |
      | "4587_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE=23"                      | "22" |"23"  |
      | "4587_GGG_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K && MAT_DT_CALENDAR DATE is greater than 23"      | "22" |"35"  |

