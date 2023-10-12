@Travel_Insurance_Nova_5715_TestData_Creation
Feature: Create test data for Travel Insurance- 5715 Nova test data creation

  Background:
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @Travel_Insurance_NOVA_Sanity_TestData @5715 @NOVA @RS22049 @Sanity
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for single account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
     # insert the created  Account Number into the ACCT_DIM database
#    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID              | Event_Date |
      | "5715_NOVA_BASE_01" | "1"        |
      | "5715_NOVA_BASE_02" | "2"        |


  @Travel_Insurance_NOVA_Single_Account_insight_Positive_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for single account single insight positive scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                                       | Event_Date |
#      | "5715_NOVA_lang_cd_eq_fr"                                    | "3"        |
#      | "5715_NOVA_cust_age_eq_18"                                   | "4"        |
#      | "5715_NOVA_DNS_eq_NULL"                                      | "5"        |
#      | "5715_NOVA_DNS_eq_N"                                         | "5"        |
#      | "5715_NOVA_PROV_CD_eq_NULL"                                  | "6"        |
      | "5715_NOVA_PROD_CD_eq_AXG_SUB_PROD_eq_GS"                    | "12"       |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_NF"                    | "13"       |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_PB"                    | "14"       |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_RG"                    | "15"       |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_SP"                    | "16"       |
      | "5715_NOVA_PROD_CD_eq_VGD_SUB_PROD_eq_ST"                    | "17"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_DM"                    | "18"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ST"                    | "19"       |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_TR"                    | "20"       |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_TS"                    | "21"       |
      | "5715_NOVA_PROD_CD_eq_BLV_SUB_PROD_eq_YY"                    | "22"       |
      | "5715_NOVA_PROD_CD_eq_AXP_SUB_PROD_eq_PC"                    | "23"       |
      | "5715_NOVA_PROD_CD_eq_AXS_SUB_PROD_eq_SC"                    | "24"       |
      | "5715_NOVA_PROD_CD_eq_AXS_SUB_PROD_eq_SS"                    | "25"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SV"                    | "26"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ZZ"                    | "27"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SS"                    | "28"       |
      | "5715_NOVA_PROD_CD_eq_VFF_SUB_PROD_eq_F1"                    | "29"       |
      | "5715_NOVA_PROD_CD_eq_VFA_SUB_PROD_eq_A1"                    | "1"        |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_NF"                    | "2"        |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG"                    | "3"        |
      | "5715_NOVA_PROD_CD_eq_VFA_SUB_PROD_eq_A3"                    | "4"        |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_NF"                    | "5"        |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_RG"                    | "6"        |
      | "5715_NOVA_PROD_CD_eq_VLR_SUB_PROD_eq_RC"                    | "7"        |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SC"                    | "8"        |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_SL"                    | "9"        |
      | "5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_gt_1" | "NULL"     |

  @Travel_Insurance_NOVA_Single_Account_insight_Positive_Scenarios_TestData_BoundaryValue @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_BoundaryValue_NOVA_TestData Create test data for single account single insight positive scenarios for boundary scenarios for event date

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
     # insert the created  Account Number into the ACCT_DIM database

    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')


    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')


    Examples:
      | TestID                                                              | Event_Date |
      | "5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_eq_30"           | "30"       |
      | "5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_eq_30"     | "30"       |
      | "5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL"               | "29"       |
      | "5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_eq_30" | "30"       |
      | "5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND"                         | "29"       |
      | "5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND"                   | "29"       |
      | "5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_eq_1"        | "29"       |


#Positive Scenario for multiple cust_insights single account
  @Travel_Insurance_NOVA_Single_Account_multiple_insight_Positive_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for single account multiple insight positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

   # Used table keyword to iterate for any BDD line
    * table mult_insights
      | testId                                   | Event_Date | CID |
      | "5715_NOVA_multiple_insight_cd"          | "20"       | CID |
      | "5715_NOVA_multiple_insight_cd_insight2" | "20"       | CID |
      | "5715_NOVA_multiple_insight_cd_insight3" | "10"       | CID |
      | "5715_NOVA_multiple_insight_cd_insight4" | "25"       | CID |

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet') mult_insights

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database') mult_insights

    Examples:
      | TestID                          | Event_Date |
      | "5715_NOVA_multiple_insight_cd" | "20"       |


  #Positive scenario for multiple account single insight
  @Travel_Insurance_NOVA_multiple_Account_single_insight_Positive_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for multiple account single insight positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating AC account
    * def ACaccountNumber = '0000000000'+'600'+randGen(10)
    * print "AC account number is " + ACaccountNumber
    # Defining TestID for the loop
    * def TEST = testId+'_acct_one'


    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber   |
      | <TestID> | accountNumber   |
      | TEST     | ACaccountNumber |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                                                                 | Event_Date |
      | "5715_NOVA_ACTIVE_BB_Active_AC"                                                        | "20"       |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_RG_PROD_CD_eq_VGD_SUB_PROD_eq_SP_Prioritization" | "20"       |

    #Scenario for creation 3 accounts KS,BB and AC for prioritization of segment
  @Travel_Insurance_NOVA_3_Accounts_single_insight_Positive_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for 3 accounts single insight positive scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating BB account
    * def BBaccountNumber = '0000000'+'1'+CID
    * print "BB account number is " + BBaccountNumber

    # Generating AC account
    * def ACaccountNumber = '0000000000'+'600'+randGen(10)
    * print "AC account number is " + ACaccountNumber
    # Defining TestID for the loop for BB Acct
    * def TESTBB = testId+'_acct_one'
    # Defining TestID for the loop for AC Acct
    * def TESTAC = testId+'_acct_two'

    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table three_accounts
      | testId   | accountNumber   |
      | <TestID> | accountNumber   |
      | TESTBB   | BBaccountNumber |
      | TESTAC   | ACaccountNumber |

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') three_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') three_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') three_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') three_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') three_accounts



    Examples:
      | TestID                                                                 | Event_Date |
      | "5715_NOVA_PROD_CD_eq_VCL_SUB_PROD_eq_ST_BBACCT_ACACCT_Prioritization" | "20"       |

   #Negative Test data creation

  @Travel_Insurance_NOVA_Single_Account_insight_Negative_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for single account single insight Negative scenarios

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')


    Examples:
      | TestID                                                                   | Event_Date |
      | "N-5715_NOVA_DECEASED_F_eq_Y"                                            | "5"        |
      | "N-5715_NOVA_DECEASED_F_eq_NULL"                                         | "5"        |
      | "N-5715_NOVA_CUST_TP_CD_ne_PSNL"                                         | "5"        |
      | "N-5715_NOVA_LANG_CD_eq_K"                                               | "5"        |
      | "N-5715_NOVA_LANG_CD_eq_NULL"                                            | "5"        |
      | "N-5715_NOVA_PRIM_CNTRY_CD_eq_NULL"                                      | "4"        |
      | "N-5715_NOVA_PRIM_CNTRY_CD_ne_CA"                                        | "4"        |
      | "N-5715_NOVA_MKTBL_eq_N"                                                 | "4"        |
      | "N-5715_NOVA_MKTBL_eq_NULL"                                              | "4"        |
      | "N_5715_NOVA_DNS_eq_Y"                                                   | "4"        |
      | "N_5715_NOVA_PRIM_PROV_CD_eq_QC"                                         | "4"        |
      | "N_5715_NOVA_CUST_AGE_lt_18"                                             | "4"        |
      | "N_5715_NOVA_CUST_AGE_eq_NULL"                                           | "4"        |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_curr_val_ne_1"              | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_curr_val_eq_null"           | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_gt_30"              | "31"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_curr_val_ne_1"        | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_curr_val_eq_null"     | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_gt_30"        | "31"       |
      | "N_5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_lt_1"           | "NULL"     |
      | "N_5715_NOVA_insight_cd_eq_CNT_PAGEVISIT_TRAVEL_curr_val_eq_null"        | "NULL"     |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_curr_val_ne_1"    | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_curr_val_eq_null" | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_gt_30"    | "31"       |
      | "N_5715_NOVA_ACCT_SUBSYS_ID_ne_KS_ie_UO"                                 | "20"       |
      | "N_5715_NOVA_ACCT_STAT_CD_ne_Open"                                       | "20"       |
      | "N_5715_NOVA_ACCT_STAT_CD _eq_ NULL"                                     | "20"       |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_BBB"                                      | "20"       |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_NULL"                                     | "20"       |
      | "N_5715_NOVA_SRC_SYS_SUB_PRD_CD_eq_DD"                                   | "20"       |
      | "N_5715_NOVA_SRC_SYS_SUB_PRD_CD_eq_NULL"                                 | "20"       |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_DM"             | "20"       |
      | "N_5715_NOVA_SRC_SYS_PRD_CD_eq_AXG_SRC_SYS_SUB_PRD_CD_eq_MB"             | "20"       |
      | "N_5715_NOVA_insight_cd_eq_FLG_AIRLINE_SPEND_evnt_dt_eq_null"            | "NULL"     |
      | "N_5715_NOVA_insight_cd_eq_FLG_TRAVEL_AGENCY_SPEND_evnt_dt_eq_null"      | "NULL"     |
      | "N_5715_NOVA_insight_cd_eq_FLG_FOREIGN_CURR_WITHDRAWAL_evnt_dt_eq_null"  | "NULL"     |


      #Negative scenario for multiple accounts single insight
  @Travel_Insurance_NOVA_multiple_Account_single_insight_Negative_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for multiple account single insight negative scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating AC account
    * def ACaccountNumber = '0000000000'+'600'+randGen(10)
    * print "AC account number is " + ACaccountNumber
    # Defining TestID for the loop
    * def TEST = testId+'_acct_one'


    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber   |
      | <TestID> | accountNumber   |
      | TEST     | ACaccountNumber |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                                                 | Event_Date |
      | "N_5715_NOVA_Not_Active_BB_Active_AC"                                  | "20"       |
      | "N_5715_NOVA_Active_ACCT_SUBSYS_ID_ne_BB_Active_AC"                    | "20"       |
      | "N_5715_NOVA_Active_BB_Active_AC_PROD_HEIR_LEVEL_ne_Chequing Accounts" | "20"       |
      | "N_5715_NOVA_Active_BB_NOT_Active_AC"                                  | "20"       |
      | "N_5715_NOVA_Active_BB_Active_ACCT_SUBSYS_ID_ne_AC"                    | "20"       |
      | "N_5715_NOVA_SRC_ACCT_STAT_CD_eq_NULL_BB_Active_AC"                    | "20"       |
      | "N_5715_NOVA_EDW_ACCT_STAT_CD_eq_NULL_ACTIVE_BB_AC"                    | "20"       |
      | "N_5715_NOVA_Active_ACCT_SUBSYS_ID_eq_NULL_Active_AC"                  | "20"       |
      | "N_5715_NOVA_Active_BB_Active_AC_PROD_HEIR_LEVEL_eq_null"              | "20"       |
      | "N_5715_NOVA_Active_BB_Active_AC_ACCT_SUBSYS_ID_eq_NULL"               | "20"       |

    #Negative scenario for AC account not having 600 in positions 13,12,11

  @Travel_Insurance_NOVA_multiple_Account_single_insight_AC_Acct_600_Negative_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data for multiple account single insight negative scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber
    # Generating AC account
    * def ACaccountNumber = '0000000000'+'700'+randGen(10)
    * print "AC account number is " + ACaccountNumber
    # Defining TestID for the loop
    * def TEST = testId+'_acct_one'


    # Generate Event_dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string event_date = <Event_Date> == 'NULL'? 'NULL': dateFormatExcludeDays(<Event_Date>)
    * print "Event Date is", event_date
  # insert the created CID into the NOVA Test data excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

   # insert the created CID into the cust_dim database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')

    # insert the created Event Date into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')

    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    # Used table keyword to iterate for any BDD line
    * table mult_accounts
      | testId   | accountNumber   |
      | <TestID> | accountNumber   |
      | TEST     | ACaccountNumber |


  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') mult_accounts
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') mult_accounts

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') mult_accounts
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') mult_accounts



    Examples:
      | TestID                                             | Event_Date |
      | "N_5715_NOVA_Active_BB_Active_AC_pos131211_ne_600" | "20"       |


  @Travel_Insurance_NOVA_NoInsight_Negative_Scenarios_TestData @5715 @NOVA @RS22049
  Scenario Outline: Travel_Insurance_RS22049_5501_NOVA_TestData Create test data with No Insight negative scenarios
    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = TravelInsuranceNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
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
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')



    Examples:
      | TestID
      | "N_NoInsight" |