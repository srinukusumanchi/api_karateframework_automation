@NOVANBA

Feature: Creates test data for NOVA channel campaign offers

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @4479NovaContextual_Testdata
  Scenario Outline: 4479_NBA_10 Create test data to get NBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def cid = randGen(15)
    * print  "Random generated CID is "+cid
 # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(cid),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(cid),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(cid),"CIS_CUST_ID")
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
      | TestID                            |
      | "Validate NOVA Response for 4479" |


  @2423Nova_Testdata
  Scenario Outline: 2423_NBA_09 Create test data to get NBA response data elements and structure

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
      | TestID                                                                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-NF_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-SV_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-NF_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-RG_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-SP_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-ST_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-NF_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-RG_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-SS_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-ZZ_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-RG_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-ST_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-DM_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - AXS-SC_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - AXS-SS_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - AXG-GC_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - AXG-GS_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-RC_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VFF-TR_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VFF-TS_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - 18yrs_SOM"                 |
      | "Validate NOVA response for Min-Pay-2423 - 40yrs_SOL"                 |
      | "Validate NOVA response for Min-Pay-2423 - 69yrs_MOB"                 |
      | "Validate NOVA response for Min-Pay-2423 - E_SOM"                     |
      | "Validate NOVA response for Min-Pay-2423 - EN_SOL"                    |
      | "Validate NOVA response for Min-Pay-2423 - F_MOB"                     |
      | "Validate NOVA response for Min-Pay-2423 - FR_SOM"                    |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL-Blank_SOL"  |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL - NULL_MOB" |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL - C_SOM"    |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL -XH_SOL"    |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT_LessthanZero_MOB"      |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT_Zero_MOB"              |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT - NULL_MOB"            |
      | "Validate NOVA response for Min-Pay-2423 - reissu_cd - Blank_MOB"     |
      | "Validate NOVA response for Min-Pay-2423 - reissu_cd - NULL_SOM"      |


  @2423NovaNegativeScenario_Testdata
  Scenario Outline: 2423_NBA_09 Create test data to get NBA response data elements and structure - Negative Condition

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
      | TestID                                                                        |
      | "N-Validate NOVA response for Min-Pay-2423 - Non_PSNL_SOL"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - DNS -Y_MOB"                      |
      | "N-Validate NOVA response for Min-Pay-2423 - Age 17yr_SOM"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - Age 70yr_SOL"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - MRKTBLE_F- N_MOB"                |
      | "N-Validate NOVA response for Min-Pay-2423 - Deceased - Y_SOM"                |
      | "N-Validate NOVA response for Min-Pay-2423 - Language KA_SOL"                 |
      | "N-Validate NOVA response for Min-Pay-2423 - Indv_Brth_Dt -NULL_MOB"          |
      | "N-Validate NOVA response for Min-Pay-2423 - Prod_cd - VLR- SV_SOM"           |
      | "N-Validate NOVA response for Min-Pay-2423 - SUBSYS_ID - BB_SOL"              |
      | "N-Validate NOVA response for Min-Pay-2423 - BLOCK and RECL-AB_MOB"           |
      | "N-Validate NOVA response for Min-Pay-2423 - chrgf_cd - 1_SOM"                |
      | "N-Validate NOVA response for Min-Pay-2423 - chrgf_cd - NULL_SOL"             |
      | "N-Validate NOVA response for Min-Pay-2423 - SRC_ACCT_STAT_CD - 1_MOB"        |
      | "N-Validate NOVA response for Min-Pay-2423 - SRC_ACCT_STAT_CD - NULL_SOM"     |
      | "N-Validate NOVA response for Min-Pay-2423 - CR_CRD_PRTCTN_F - Y_SOL"         |
      | "N-Validate NOVA response for Min-Pay-2423 - CR_CRD_PRTCTN_F - NULL_MOB"      |
      | "N-Validate NOVA response for Min-Pay-2423 - Primary-Holder - N_SOM"          |
      | "N-Validate NOVA response for Min-Pay-2423 - reissu_cd - R_SOL"               |
      | "N-Validate NOVA response for Min-Pay-2423 - acct_rltnp - SUBSYS_ID - BB_MOB" |
      | "N-Validate NOVA response for Min-Pay-2423 - SOL_MOB_Login_Null"              |
      | "N-Validate NOVA response for 2423 - TOT_DLQ_AMT - greaterThanzero_MOB"       |

