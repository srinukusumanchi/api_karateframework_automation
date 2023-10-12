@CIEPROG-50
Feature: Create test data for D2D Engagement Welcome-BBA-4330 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @testing
  Scenario: date testing
     # Generate Random cid to insert into data base
    * def date = getAge(15)
    * print  "Customer's Age is:- "+date


  @MinimumPayment_PriorityCards_TestData @2423 @SOL @RS17103
  Scenario: Minimum Payment_RS17103_2423_SOL Create test data for validating Priority-1 receives offer when customer having priority 1 & 3 cards
     # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)
    * print "Account ODT is", acct_odt

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                         | accountNumber |
      | "2423_Priority 1(VLR,RG) card" | acct_num      |
      | "2423_Priority 3(VCL,NF) card" | acct_num_One  |

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet') examples

   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    * string testId = examples[0].testId
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

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


  @D2DWelcome_Testdata
  Scenario Outline: D2DWelcome_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                  |
      | "Validating SOL Response for 4330_0101" |
      | "Validating SOL Response for 4330_0102" |
      | "Validating SOL Response for 4330_0103" |
      | "Validating SOL Response for 4330_0104" |
      | "Validating SOL Response for 4330_0201" |
      | "Validating SOL Response for 4330_0202" |
      | "Validating SOL Response for 4330_0203" |
      | "Validating SOL Response for 4331_1901" |
      | "Validating SOL Response for 4331_1902" |
      | "Validating SOL Response for 4331_1903" |
      | "Validating SOL Response for 4331_1904" |
      | "Validating SOL Response for 4331_1907" |
      | "Validating SOL Response for 4331_1908" |
      | "Validating SOL Response for 4332_1301" |
      | "Validating SOL Response for 4332_1303" |
      | "Validating SOL Response for 4332_1307" |
      | "Validating SOL Response for 4332_1308" |
      | "Validating SOL Response for 4333_1801" |
      | "Validating SOL Response for 4333_1803" |
      | "Validating SOL Response for 4333_1807" |
      | "Validating SOL Response for 4334_0711" |
      | "Validating SOL Response for 4334_0712" |
      | "Validating SOL Response for 4658_2301" |
      | "Validating SOL Response for 4658_2303" |


  @D2DDigital_Testdata
  Scenario Outline: D2DDigital_NBA_28 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
   # get the Creative Id from the test Id
    * def creativeId = creativeParse(testId,10)
    * print "CreativeId retreived from the testId is "+creativeId
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(9)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def sol_Last_Login = null
    * def mob_Last_Login = null

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    # To insert SOL_Last_Login or MOB_Last_Login to cust_dim based on creative id
    * eval if(creativeId == '4235121702'?((mob_Last_Login = acct_odt) && (sol_Last_Login = '2019-12-30')):creativeId == '4235121703'?((sol_Last_Login = acct_odt) && (mob_Last_Login = '2019-12-30')):(sol_Last_Login = acct_odt) && (mob_Last_Login = acct_odt));
    * print "The sol last login is" +sol_Last_login
    * print "The Mob last login is " +mob_Last_Login
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",mob_Last_Login,"MOB_LAST_LOGIN_DT")
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",sol_Last_Login,"SOL_LAST_LOGIN_DT")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4235_4235121702" |
      | "Validating SOL Response for 4235_4235121703" |
      | "Validating SOL Response for 4235_4235121704" |


  @D2DFund_Testdata
  Scenario Outline: D2DFund_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
   # get the Creative Id from the test Id
    * def creativeId = creativeParse(testId,10)
    * print "CreativeId retreived from the testId is "+creativeId
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(15)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def bal_amt = 0

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
#    # Assign the balance amount based on creative id
    * eval if(creativeId=='4315011801'?bal_amt = 0:bal_amt = 2000);
   # insert balance amount into ACCT_DIM
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",bal_amt,"CRNT_BAL_AMT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4315_4315011801" |
      | "Validating SOL Response for 4315_4315011802" |

  @D2DBillPay_Testdata
  Scenario Outline: D2DBillPay_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(25)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                          |
      | "Validating SOL Response for 4316_4316041801"   |
      | "Validating SOL Response for 4380_1_4378041801" |
      | "Validating SOL Response for 4380_2_4378041801" |

  @D2DRewards_Testdata
  Scenario Outline: D2DRewards_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(45)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4363_4363041801" |
      | "Validating SOL Response for 4364_4364041801" |
      | "Validating SOL Response for 4366_4366041801" |

  @D2DInteracFlash_Testdata
  Scenario Outline: D2DInteracFlash_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(50)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * def ac_acct_num = acct_num+1
    * print "account number is " + acct_num
    * print "AC account number is " + ac_acct_num

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(ac_acct_num)+"', '"+karate.get(CID)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(ac_acct_num)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4367_4367041801" |

  @D2DVisaDebit_Testdata
  Scenario Outline: D2DVisaDebit_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(59)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * def ac_acct_num = acct_num+1
    * print "account number is " + acct_num
    * print "AC account number is " + ac_acct_num


  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(ac_acct_num)+"', '"+karate.get(CID)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )")

    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(ac_acct_num)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4368_4368041801" |

  @D2DDigitalPayments_Testdata
  Scenario Outline: D2DDigitalPayments_NBA_37 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(77)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * def ac_acct_num = acct_num+1
    * print "account number is " + acct_num
    * print "AC account number is " + ac_acct_num


  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(ac_acct_num)+"', '"+karate.get(CID)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )")

    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt_ac = SetDataBaseData("INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(ac_acct_num)+"', NULL, 'AC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4399_4399071801" |
      | "Validating SOL Response for 4400_4400071801" |
      | "Validating SOL Response for 4401_4401071801" |

  @D2DXsell_Testdata
  Scenario Outline: D2DXsell_NBA_2 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    * print "testId retreived from example is :" +testId
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID
   # get the Creative Id from the test Id
    * def creativeId = creativeParse(testId,10)
    * def ksAccount = creativeParse(testId,13)
    * def prodSubprod = retreiveSubstring(creativeParse(testId,19),0,5)
    * def prodCode = retreiveSubstring(prodSubprod,0,3)
    * def subProdCode = retreiveSubstring(prodSubprod,3,5)
    * print "Prod sub prod retreived are: " +prodSubprod
    * print "Product code is :"+prodCode
    * print "Sub prod code is :"+subProdCode
    * print "CreativeId retreived from the testId is "+creativeId
    * print "ksAccount variable is:" +ksAccount
    * def birthDate = dateFormat(7306)
    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(49)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def cust_Opend_Dt = acct_odt
    * def MPSA_acctnum = '00000002'+CID
    * def KS_acctnum = '00000001'+CID
    * def ksAccount1 =  'KS_'+creativeId
    * print "ksAccoun1variable is"+ ksAccount1


  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    # To insert cust_Opend_Dt to cust_dim based on creative id
    * eval if((creativeId == '4891111901') || (creativeId == '4891111902') || (creativeId == '4892111901')|| (creativeId == '4892111902')|| (creativeId == '4893111901')|| (creativeId == '4894111901')?(cust_Opend_Dt = acct_odt):(cust_Opend_Dt = "2019-05-20"));
    * print "The customer opened date is:" + cust_Opend_Dt
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",cust_Opend_Dt,"CUST_OPND_DT")
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",birthDate,"INDV_BRTH_DT")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt_MPSA = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('0000000"+karate.get(MPSA_acctnum)+"', '"+karate.get(CID)+"', NULL, 'UF', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * eval if((creativeId == '4891111902') || (creativeId == '4891111904') || (creativeId == '4892111902')|| (creativeId == '4892111904')?(SetDataBaseData(cust_acct_rltnpDimInsrt_MPSA)):karate.log("Not a MPSA Account"));
    * def cust_acct_rltnpDimInsrt_KS = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('0000000"+karate.get(KS_acctnum)+"', '"+karate.get(CID)+"', NULL, 'KS', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * eval if((ksAccount == ksAccount1)?(SetDataBaseData(cust_acct_rltnpDimInsrt_KS)):karate.log("Not a Creditcard Account"));
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt_MPSA = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('0000000"+karate.get(MPSA_acctnum)+"', NULL, 'UF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, 'BSAMP', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'O', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * eval if((creativeId == '4891111902') || (creativeId == '4891111904') || (creativeId == '4892111902')?(SetDataBaseData(acct_DimInsrt_MPSA)):karate.log("Not a MPSA Account"));
    * def acct_DimInsrt_KS = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('0000000"+karate.get(KS_acctnum)+"', NULL, 'KS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '"+prodCode+"', NULL, '"+subProdCode+"', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * eval if((ksAccount == ksAccount1)?(SetDataBaseData(acct_DimInsrt_KS)):karate.log("Not a Creditcard Account"));
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                                      |
      | "Validating SOL Response for 4891_2301_4891111901"          |
      | "Validating SOL Response for 4891_2301_4891111902"          |
      | "Validating SOL Response for 4891_2301_4891111903"          |
      | "Validating SOL Response for 4891_2301_4891111904"          |
      | "Validating SOL Response for 4891_2303_4891111901"          |
      | "Validating SOL Response for 4891_2303_4891111902"          |
      | "Validating SOL Response for 4891_2303_4891111903"          |
      | "Validating SOL Response for 4891_2303_4891111904"          |
      | "Validating SOL Response for 4891_2301_AXGGC_KS_4891111903" |
      | "Validating SOL Response for 4891_2301_VFFTR_KS_4891111903" |
      | "Validating SOL Response for 4891_2301_VCLDM_KS_4891111903" |
      | "Validating SOL Response for 4891_2301_VLRRG_KS_4891111903" |
      | "Validating SOL Response for 4891_2303_AXGGC_KS_4891111904" |
      | "Validating SOL Response for 4891_2303_VFFTR_KS_4891111904" |
      | "Validating SOL Response for 4891_2303_VCLDM_KS_4891111904" |
      | "Validating SOL Response for 4891_2303_VLRRG_KS_4891111904" |
      | "Validating SOL Response for 4892_1301_4892111901"          |
      | "Validating SOL Response for 4892_1301_4892111902"          |
      | "Validating SOL Response for 4892_1301_4892111903"          |
      | "Validating SOL Response for 4892_1301_4892111904"          |
      | "Validating SOL Response for 4892_1301_AXGGC_KS_4892111903" |
      | "Validating SOL Response for 4892_1301_VFFTR_KS_4892111903" |
      | "Validating SOL Response for 4892_1301_VCLDM_KS_4892111903" |
      | "Validating SOL Response for 4892_1301_VLRRG_KS_4892111903" |
      | "Validating SOL Response for 4892_1301_AXGGC_KS_4892111904" |
      | "Validating SOL Response for 4892_1301_VFFTR_KS_4892111904" |
      | "Validating SOL Response for 4892_1301_VCLDM_KS_4892111904" |
      | "Validating SOL Response for 4892_1301_VLRRG_KS_4892111904" |
      | "Validating SOL Response for 4893_0101_4893111901"          |
      | "Validating SOL Response for 4893_0101_4893111902"          |
      | "Validating SOL Response for 4893_0102_4893111901"          |
      | "Validating SOL Response for 4893_0102_4893111902"          |
      | "Validating SOL Response for 4893_0103_4893111901"          |
      | "Validating SOL Response for 4893_0103_4893111902"          |
      | "Validating SOL Response for 4893_0104_4893111901"          |
      | "Validating SOL Response for 4893_0104_4893111902"          |
      | "Validating SOL Response for 4893_0201_4893111901"          |
      | "Validating SOL Response for 4893_0201_4893111902"          |
      | "Validating SOL Response for 4893_0202_4893111901"          |
      | "Validating SOL Response for 4893_0202_4893111902"          |
      | "Validating SOL Response for 4893_0203_4893111901"          |
      | "Validating SOL Response for 4893_0203_4893111902"          |
      | "Validating SOL Response for 4893_0101_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0101_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0101_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0101_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0102_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0102_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0102_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0102_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0103_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0103_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0103_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0103_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0104_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0104_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0104_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0104_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0201_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0201_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0201_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0201_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0202_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0202_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0202_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0202_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4893_0203_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0203_VFFTR_KS_4893111902" |
      | "Validating SOL Response for 4893_0203_VCLDM_KS_4893111902" |
      | "Validating SOL Response for 4893_0203_VLRRG_KS_4893111902" |
      | "Validating SOL Response for 4894_0711_4894111901"          |
      | "Validating SOL Response for 4894_0712_4894111901"          |


  @MiniPmtInsurance_Testdata
  Scenario Outline: MinimumPaymentCreditorInsurance_NBA_9 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * print "The data read is :"+ data
  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print "The offer code read from excel is" +offerCode
  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    * print "The testid is: " +testId
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def testDate = dateFormat(60);
    * print "Test Date is :" + testDate
    * def loginDate = creativeParse(testId,3)
    * print "Logindate retreived is:" + loginDate
    * def mob_Last_Login = null;
    * def sol_Last_Login = null;

  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")
    * print "Wrote the cid generated to excel"

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * print "Wrote to cust_dim page"
    * eval if(loginDate == 'SOL'?((mob_Last_Login = '2019-10-20') && (sol_Last_Login = testDate)):loginDate == 'MOB'?((sol_Last_Login = '2019-10-20') && (mob_Last_Login = testDate)):((sol_Last_Login = acct_odt) && (mob_Last_Login = testDate)));
    #* eval if(loginDate == 'SOL'?(sol_Last_Login = testDate):loginDate == 'MOB'?(mob_Last_Login = testDate):((sol_Last_Login = testDate) && (mob_Last_Login = testDate)));
    * print "The sol last login is" +sol_Last_Login
    * print "The Mob last login is " +mob_Last_Login
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",sol_Last_Login,"SOL_LAST_LOGIN_DT")
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",mob_Last_Login,"MOB_LAST_LOGIN_DT")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * print "data to be inserted in cust_dim is:" + dataCustDim
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)


    Examples:
      | TestID                                                          |
      | "Validating SOL Response for 2423_VCLNF_SOL"                    |
      | "Validating SOL Response for 2423_VCLSV_MOB"                    |
      | "Validating SOL Response for 2423_VGDNF_SOL"                    |
      | "Validating SOL Response for 2423_VGDRG_MOB"                    |
      | "Validating SOL Response for 2423_VGDSP_SOL"                    |
      | "Validating SOL Response for 2423_VGDST_SOM"                    |
      | "Validating SOL Response for 2423_VLRNF_SOL"                    |
      | "Validating SOL Response for 2423_VLRRG_MOB"                    |
      | "Validating SOL Response for 2423_VCLSS_SOM"                    |
      | "Validating SOL Response for 2423_VCLZZ_SOL"                    |
      | "Validating SOL Response for 2423_VCLRG_MOB"                    |
      | "Validating SOL Response for 2423_VCLST_SOL"                    |
      | "Validating SOL Response for 2423_VCLDM_MOB"                    |
      | "Validating SOL Response for 2423_AXSSC_SOM"                    |
      | "Validating SOL Response for 2423_AXSSS_SOL"                    |
      | "Validating SOL Response for 2423_AXGGC_MOB"                    |
      | "Validating SOL Response for 2423_AXGGS_SOM"                    |
      | "Validating SOL Response for 2423_VLRRC_SOM"                    |
      | "Validating SOL Response for 2423_VFFTR_SOL"                    |
      | "Validating SOL Response for 2423_VFFTS_MOB"                    |
      | "Validate SOL response for 2423 - 18yrs_SOL"                    |
      | "Validate SOL response for 2423 - 40yrs_MOB"                    |
      | "Validate SOL response for 2423 - 69yrs_SOM"                    |
      | "Validate SOL response for 2423 - E_SOL"                        |
      | "Validate SOL response for 2423 - EN_MOB"                       |
      | "Validate SOL response for 2423 - F_SOM"                        |
      | "Validate SOL response for 2423 - FR_SOL"                       |
      | "Validate SOL response for 2423 - BLOCK and RECL-Blank_SOL"     |
      | "Validate SOL response for 2423 - BLOCK and RECL - NULL_MOB"    |
      | "Validate SOL response for 2423 - BLOCK and RECL - C_SOL"       |
      | "Validate SOL response for 2423 - BLOCK and RECL -XH_MOB"       |
      | "Validate SOL response for2423 - reissu_cd - Blank_SOL"         |
      | "Validate SOL response for 2423 - reissu_cd - NULL_MOB"         |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT_LessthanZero_MOB" |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT_Zero_MOB"         |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT - NULL_MOB"       |




  # Negative Scenario's for Minimum Payment 2423
  @2423_NegativeScenario_Testdata
  Scenario Outline: Minimum payment_NBA_9 Validate getNBA response data elements and structure - Negative Scenario
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def testDate = dateFormat(60);
    * print "Test Date is :" + testDate
    * def loginDate = creativeParse(testId,3)
    * print "Logindate retreived is:" + loginDate
    * def mob_Last_Login = null;
    * def sol_Last_Login = null;

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * eval if(loginDate == 'SOL'?((mob_Last_Login = '2019-10-20') && (sol_Last_Login = testDate)):loginDate == 'MOB'?((sol_Last_Login = '2019-10-20') && (mob_Last_Login = testDate)):((sol_Last_Login = acct_odt) && (mob_Last_Login = testDate)));
    #* eval if(loginDate == 'SOL'?(sol_Last_Login = testDate):loginDate == 'MOB'?(mob_Last_Login = testDate):((sol_Last_Login = testDate) && (mob_Last_Login = testDate)));
    * print "The sol last login is" +sol_Last_Login
    * print "The Mob last login is " +mob_Last_Login
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",sol_Last_Login,"SOL_LAST_LOGIN_DT")
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",mob_Last_Login,"MOB_LAST_LOGIN_DT")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                                                 |
      | "N-Validate SOL response for 2423 - Non_PSNL_SOL"                      |
      | "N-Validate SOL response for 2423 - DNS -Y_MOB"                        |
      | "N-Validate SOL response for 2423 - Age 17yr_SOM"                      |
      | "N-Validate SOL response for 2423 - Age 70yr_SOL"                      |
      | "N-Validate SOL response for 2423 - MRKTBLE_F- N_SOM"                  |
      | "N-Validate SOL response for 2423 - Deceased - Y_SOL"                  |
      | "N-Validate SOL response for 2423 - Language KA_MOB"                   |
      | "N-Validate SOL response for 2423 - Indv_Brth_Dt -NULL_SOL"            |
      | "N-Validate SOL response for 2423 - Prod_cd - VLR- SV_MOB"             |
      | "N-Validate SOL response for 2423 - SUBSYS_ID - BB_SOM"                |
      | "N-Validate SOL response for 2423 - BLOCK and RECL-AB_MOB"             |
      | "N-Validate SOL response for 2423 - chrgf_cd - 1_SOM"                  |
      | "N-Validate SOL response for 2423 - chrgf_cd - NULL_SOL"               |
      | "N-Validate SOL response for 2423 - SRC_ACCT_STAT_CD - 1_MOB"          |
      | "N-Validate SOL response for 2423 - SRC_ACCT_STAT_CD - NULL_SOM"       |
      | "N-Validate SOL response for 2423 - CR_CRD_PRTCTN_F - Y_SOL"           |
      | "N-Validate SOL response for 2423 - CR_CRD_PRTCTN_F - NULL_MOB"        |
      | "N-Validate SOL response for 2423 - Primary-Holder - N_SOM"            |
      | "N-Validate SOL response for 2423 - reissu_cd - R_SOL"                 |
      | "N-Validate SOL response for 2423 - acct_rltnp - SUBSYS_ID - BB_MOB"   |
      | "N-Validate SOL response for 2423 - SOL_MOB_Login - NULL"              |
      | "N-Validate SOL response for 2423 - TOT_DLQ_AMT - greaterThanzero_MOB" |

  @PAD_Testdata
  Scenario Outline: PAD_NBA_39 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(100)
    * print "Account ODT is", acct_odt
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def Last_Bill_Payment = dateFormat(15)
    * print "last_Bill_Payment is", Last_Bill_Payment


  # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",Last_Bill_Payment,"LAST_BILL_PAYMENT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                  |
      | "Validating SOL Response for 2496_0101" |
      | "Validating SOL Response for 2496_0102" |
      | "Validating SOL Response for 2496_0103" |
      | "Validating SOL Response for 2496_0104" |
      | "Validating SOL Response for 2496_0201" |
      | "Validating SOL Response for 2496_0202" |
      | "Validating SOL Response for 2496_0203" |
      | "Validating SOL Response for 2496_1901" |
      | "Validating SOL Response for 2496_1902" |
      | "Validating SOL Response for 2496_1903" |
      | "Validating SOL Response for 2496_1904" |
      | "Validating SOL Response for 2496_1907" |
      | "Validating SOL Response for 2496_1908" |
      | "Validating SOL Response for 2496_1301" |
      | "Validating SOL Response for 2496_1303" |
      | "Validating SOL Response for 2496_1307" |
      | "Validating SOL Response for 2496_1308" |
      | "Validating SOL Response for 2496_1801" |
      | "Validating SOL Response for 2496_1803" |
      | "Validating SOL Response for 2496_1807" |
      | "Validating SOL Response for 2496_0711" |
      | "Validating SOL Response for 2496_0712" |



