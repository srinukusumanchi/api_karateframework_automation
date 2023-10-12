@ODPRightSizing_Nova_5614
Feature: Create test data for ODP Right Sizing Nova Disposition Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @ODPRightSizing_NOVA_11111 @5614 @NOVA @RS21131 @11111
  Scenario Outline: ODP Right Sizing_RS21131_5614_NOVA Create test data for 11111

    # Reading testId from Example section
    * def testId = <TestID>
    * def testDataFileName = ODPRightSizingNovaTestData
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the EVENT_DATE to YYYY-MM-DD format
    * string event_date = <Event_Date>=='NULL'?'NULL': dateFormat(<Event_Date>)
    * print "Event Date is ",event_date

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

    # insert the created CID into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CID_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Current Val Update Timestamp into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet')
    # insert the Event Date into the EVENT_DATE Sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created Account Number into the CUST_INSIGHTS sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_INSIGHTS_Sheet')
    # insert the created CID  into the CUST_INSIGHTS_DIM database
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@CUST_INSIGHTS_Insertion_Database')

    Examples:
      | TestID                                            | Event_Date |
      | "5614_NOVA_Customer Not Deceased"                 | "3"        |
      | "5614_NOVA_CUST_AGE=18"                           | "4"        |
      | "5614_NOVA_LANG_CD=E"                             | "5"        |
      | "5614_NOVA_LANG_CD=EN"                            | "6"        |
      | "5614_NOVA_LANG_CD=F"                             | "3"        |
      | "5614_NOVA_LANG_CD=FR"                            | "3"        |
      | "5614_NOVA_LANG_CD=LowerCase_e"                   | "3"        |
      | "5614_NOVA_LANG_CD=LowerCase_en"                  | "3"        |
      | "5614_NOVA_LANG_CD=LowerCase_f"                   | "3"        |
      | "5614_NOVA_LANG_CD=LowerCase_fr"                  | "3"        |
      | "5614_NOVA_DO_NOT_SOLICIT_F=NULL"                 | "3"        |
      | "5614_NOVA_PRIM_PROV_CD!=QC"                      | "3"        |
#      | "5614_NOVA_Segment_1_Sole"                        | "3"        |
#      | "5614_NOVA_01_01_Sole"                            | "3"        |
#      | "5614_NOVA_01_02_Sole"                            | "3"        |
#      | "5614_NOVA_01_03_Sole"                            | "3"        |
#      | "5614_NOVA_01_04_Sole"                            | "3"        |
#      | "5614_NOVA_02_01_Sole"                            | "3"        |
#      | "5614_NOVA_02_02_Sole"                            | "3"        |
#      | "5614_NOVA_02_03_Sole"                            | "3"        |
#      | "5614_NOVA_19_01_Sole"                            | "3"        |
#      | "5614_NOVA_19_02_Sole"                            | "3"        |
#      | "5614_NOVA_19_03_Sole"                            | "3"        |
#      | "5614_NOVA_19_04_Sole"                            | "3"        |
#      | "5614_NOVA_19_07_Sole"                            | "3"        |
#      | "5614_NOVA_19_08_Sole"                            | "3"        |
#      | "5614_NOVA_13_01_Sole"                            | "3"        |
#      | "5614_NOVA_13_03_Sole"                            | "3"        |
#      | "5614_NOVA_13_07_Sole"                            | "3"        |
#      | "5614_NOVA_13_08_Sole"                            | "3"        |
#      | "5614_NOVA_07_11_Sole"                            | "3"        |
#      | "5614_NOVA_07_12_Sole"                            | "3"        |
#      | "5614_NOVA_Segment_1_Joint"                       | "3"        |
#      | "5614_NOVA_01_01_Joint"                           | "3"        |
#      | "5614_NOVA_01_02_Joint"                           | "3"        |
#      | "5614_NOVA_01_03_Joint"                           | "3"        |
#      | "5614_NOVA_01_04_Joint"                           | "3"        |
#      | "5614_NOVA_02_01_Joint"                           | "3"        |
#      | "5614_NOVA_02_02_Joint"                           | "3"        |
#      | "5614_NOVA_02_03_Joint"                           | "3"        |
#      | "5614_NOVA_19_01_Joint"                           | "3"        |
#      | "5614_NOVA_19_02_Joint"                           | "3"        |
#      | "5614_NOVA_19_03_Joint"                           | "3"        |
#      | "5614_NOVA_19_04_Joint"                           | "3"        |
#      | "5614_NOVA_19_07_Joint"                           | "3"        |
#      | "5614_NOVA_19_08_Joint"                           | "12"       |
#      | "5614_NOVA_13_01_Joint"                           | "11"       |
#      | "5614_NOVA_13_03_Joint"                           | "10"       |
#      | "5614_NOVA_13_07_Joint"                           | "7"        |
#      | "5614_NOVA_13_08_Joint"                           | "28"       |
#      | "5614_NOVA_07_11_Joint"                           | "30"       |
#      | "5614_NOVA_07_12_Joint"                           | "29"       |
#      | "N-5614_NOVA_Deceased=Y"                          | "3"        |
#      | "N-5614_NOVA_Deceased=NULL"                       | "3"        |
#      | "N-5614_NOVA_CUST_TP_CD!=PSNL"                    | "3"        |
#      | "N-5614_NOVA_CUST_TP_CD=NULL"                     | "3"        |
#      | "N-5614_NOVA_PRIM_CNTRY_CD!=CA"                   | "3"        |
#      | "N-5614_NOVA_PRIM_CNTRY_CD=NULL"                  | "3"        |
#      | "N-5614_NOVA_CUST_AGE=NULL"                       | "3"        |
#      | "N-5614_NOVA_CUST_AGE<18"                         | "3"        |
#      | "N-5614_NOVA_LANG_CD=G"                           | "3"        |
#      | "N-5614_NOVA_LANG_CD=NULL"                        | "3"        |
#      | "N-5614_NOVA_DO_NOT_SOLICIT_F=Y"                  | "3"        |
#      | "N-5614_NOVA_MRKTBLE_F=N"                         | "3"        |
#      | "N-5614_NOVA_MRKTBLE_F=NULL"                      | "3"        |
#      | "N-5614_NOVA_PRIM_PROV_CD=QC"                     | "3"        |
#      | "5614_NOVA_PRIM_PROV_CD=NULL"                     | "3"        |
#      | "N-5614_NOVA_INSIGHT_CD != IND_ODP_USAGE"         | "3"        |
#      | "N-5614_NOVA_CURR_VAL != 1 or 2 "                 | "3"        |
#      | "N-5614_NOVA_EVENT_DATE GT 30 days"               | "31"       |
#      | "N-5614_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=01" | "3"        |
#      | "5614_NOVA_23_01_SRC_ACCT_STAT_CD!=A"             | "3"        |
#      | "N-5614_NOVA_SRC_PRD_CD=23 and SRC_SUB_PRD_CD=03" | "3"        |
#      | "5614_NOVA_ACCT_SUBSYS_ID!=BB"                    | "3"        |
#      | "5614_NOVA_SRC_ACCT_STAT_CD!=A"                   | "3"        |
#      | "5614_NOVA_SRC_PRD_CD=01 and SRC_SUB_PRD_CD=05"   | "3"        |
#      | "5614_NOVA_SRC_PRD_CD=02 and SRC_SUB_PRD_CD=04"   | "3"        |
#      | "5614_NOVA_SRC_PRD_CD=19 and SRC_SUB_PRD_CD=05"   | "3"        |
#      | "5614_NOVA_SRC_PRD_CD=13 and SRC_SUB_PRD_CD=02"   | "3"        |
#      | "5614_NOVA_SRC_PRD_CD=07 and SRC_SUB_PRD_CD=01"   | "3"        |