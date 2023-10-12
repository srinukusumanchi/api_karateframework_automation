@IH_Pos_Negative_TestData_5151_NOVA
Feature: Create test data for NTC Engagement Curriculum- Mapping Tomorrow NOVA Ih Positive And Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @NTCMappingTomorrow_IH_Pos_TestData_NOVA @5151 @NOVA @RS2098C
  Scenario Outline: NTC Engagement Curiculum- Mapping Tomorrow_RS2098C_5151_NOVA Create test data for IH and Positive Test Cases
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTC5151MobPosTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                                        |
      | "5151_Primary_Country_Cd = CA"                                |
      | "5151_CUST_TP_CD=PSNL"                                        |
      | "5151_DO_NOT_SOLICIT_F=NULL"                                  |
      | "5151_DO_NOT_SOLICIT_F!=Y"                                    |
      | "5151_EMPLOYEE_STAFF_F=N"                                     |
      | "5151_EMPLOYEE_STAFF_F=Null"                                  |
      | "5151_LANG_CD in EN"                                          |
      | "5151_LANG_CD in E"                                           |
      | "5151_LANG_CD in F"                                           |
      | "5151_LANG_CD in FR"                                          |
      | "5151_IMMGRTN_CAT_CD not in S"                                |
      | "5151_IMMGRTN_CAT_CD not in S00"                              |
      | "5151_MCB_IND = Y"                                            |
      | "5151_ARRV_DT is <3 years"                                    |
      | "5151_ARRV_DT is =3 years"                                    |
      | "5151_INDV_BRTH_DT is 18 "                                    |
      | "5151_INDV_BRTH_DT is >18"                                    |
      | "5151_INDV_BRTH_DT !=NULL"                                    |
      | "5151_INDV_BRTH_DT IS NOT NULL"                               |
      | "5151_SRC_ACCT_STAT_CD=A"                                     |
      | "5151_PRIM_ACCT_HOLDER_F = Y"                                 |
      | "5151_CC_VIP_IND not 2"                                       |
      | "5151_CC_VIP_IND not 9"                                       |
      | "5151_Physicians_F = NULL"                                    |
      | "5151_Physicians_F = N"                                       |
      | "5151_MAPP_TMRRW_LAST_SESS_DT != <6 months from current date" |
      | "5151_MAPP_TMRRW_LAST_SESS_DT != NULL"                        |
      | "5151_SRC_PRD CODE=13  SRC_SUB PRD CD=01"                     |
      | "5151_SRC_PRD CODE=13  SRC_SUB PRD CD=03"                     |
      | "5151_SRC_PRD CODE=13  SRC_SUB PRD CD=07"                     |
      | "5151_SRC_PRD CODE=13  SRC_SUB PRD CD=08"                     |
      | "5151_Customer decease = N"                                   |
      | "5151_Account type is opened =181 days"                       |
      | "5151_Account type is opened=200 days"                        |
      | "5151_Account type is opened = 210days"                       |
      | "5151_Validate IH Record fields against Proposition"          |

  @NTCMappingTomorrow_Neg_TestData_NOVA @5151 @NOVA @RS2098C
  Scenario Outline: NTC Engagement Curiculum- Mapping Tomorrow_RS2098C_5151_NOVA Create test data for Negative Test Cases
  #    Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = NTC5151MobNegTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')
    Examples:
      | TestID                                      |
      | "N-5151_PRIM_CNTRY_CD != CA"                |
      | "N-5151_CUST_TP_CD != PSNL"                 |
      | "N-5151_DO_NOT_SOLICIT_F = Y"               |
      | "N-5151_EMPLOYEE_STAFF_F = Y"               |
      | "N-5151_LANG_CD NOT in ( EN, E, FR, F)"     |
      | "N-5151_Customer Decease - Y"               |
      | "N-5151_Customer Decease - NULL"            |
      | "N-5151_IMMGRTN_CAT_CD in S"                |
      | "N-5151_IMMGRTN_CAT_CD in S00"              |
      | "N-5151_MCB_IND !=  Y"                      |
      | "N-5151_MCB_IND =  NULL"                    |
      | "N-5151_ARRV_DT is > 3 years"               |
      | "N-5151_INDV_BRTH_DT < 18 "                 |
      | "N-5151_INDV_BRTH_DT = NULL"                |
      | "N-5151_SRC_ACCT_STAT_CD != A"              |
      | "N-5151_PRIM_ACCT_HOLDER_F != Y"            |
      | "N-5151_PRIM_ACCT_HOLDER_F = NULL"          |
      | "N-5151_CC_VIP_IND is 2"                    |
      | "N-5151_CC_VIP_IND is 9"                    |
      | "N-5151_Physicians_F = Y"                   |
      | "N-5151_MAPP_TMRRW_LAST_SESS_DT < 6 months" |
      | "N-5151_MAPP_TMRRW_LAST_SESS_DT = NULL"     |
      | "N-5151_ACCT_SUBSYS_ID != BB"               |
      | "N-5151_PRD CODE=13  SUB PRD CD=05"         |
      | "N-5151_PRD CODE=19  SUB PRD CD=06"         |
      | "N-5151_PRD CODE=12  SUB PRD CD=04"         |
      | "N-5151_Account type is opened < 181 days"  |
      | "N-5151_Account type is opened > 210 days"  |
      | "N-5151_Account Open Date = Null"           |