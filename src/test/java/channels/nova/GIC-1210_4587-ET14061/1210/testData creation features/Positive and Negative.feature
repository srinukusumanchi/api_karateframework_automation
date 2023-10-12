@ET14061
@NOVA_1210


Feature: Create test data for NOVA - GIC Renewal Investments Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @GICTestData_NOVA @GIC_NOVA_Positive_TestCases_TestData @GIC_NOVA_GenericPositiveTestCases_1210 @1210  @NOVA @ET14061
  Scenario Outline: GIC Renewal Investments_NOVA Create test data for Positive Generic Test Cases Of 1210

    * def testDataFileName = GICtestDataFileName


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT



    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')


          # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')


    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

     # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

     # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                                  | MaturityDate |
      | "1210_ISSUE =Renewal Group=Investments"                                                                                 | "21"         |
      | "1210_PRIM_CNTRY_CD= CA"                                                                                                | "21"         |
      | "1210_CUST_TYP= PSNL"                                                                                                   | "21"         |
      | "1210_CUST_AGE greater than 18"                                                                                         | "21"         |
      | "1210_CUST_AGE equal to 18"                                                                                             | "21"         |
      | "1210_MRKTBLE_F=Y"                                                                                                      | "21"         |
      | "1210_DECEASED_F=N"                                                                                                     | "21"         |
      | "1210_LANG_CD=E"                                                                                                        | "21"         |
      | "1210_LANG_CD=EN"                                                                                                       | "21"         |
      | "1210_LANG_CD=F"                                                                                                        | "21"         |
      | "1210_LANG_CD=FR"                                                                                                       | "21"         |
      | "1210_LANG_CD_small case=e"                                                                                             | "21"         |
      | "1210_LANG_CD_small case=en"                                                                                            | "21"         |
      | "1210_LANG_CD_small case=f"                                                                                             | "21"         |
      | "1210_LANG_CD_small case=fr"                                                                                            | "21"         |
      | "1210_SRC_SYS_PRD_CD=NRS"                                                                                               | "21"         |
      | "1210_SRC_SYS_PRD_CD=TFSSB"                                                                                             | "21"         |
      | "1210_SRC_SYS_PRD_CD=RRSSB"                                                                                             | "21"         |
      | "1210_SRC_SYS_PRD_CD=NRSPR"                                                                                             | "21"         |
      | "1210_SRC_SYS_PRD_CD=TFS"                                                                                               | "21"         |
      | "1210_SRC_SYS_PRD_CD=RRS"                                                                                               | "21"         |
      | "1210_PRD_CD_MASTER!=NULL"                                                                                              | "21"         |
      | "1210_PRD_CD_MASTER!=BLANK"                                                                                             | "21"         |
      | "1210_PRD_CD_MASTER!=ACC"                                                                                               | "21"         |
      | "1210_PRD_CD_MASTER!=FLE"                                                                                               | "21"         |
      | "1210_PRD_CD_MASTER!=UTL"                                                                                               | "21"         |
      | "1210_PRD_ACCT_STAT_CD=A"                                                                                               | "21"         |
      | "1210_PLN_ACCT_CD_MASTER!=(RDSP,CT,CU,CV,TU,CTI,CUI,CVI,TUI,RESP,RRIF)"                                                 | "21"         |
      | "1210_CRNT_BAL_AMT>$500"                                                                                                | "21"         |
      | "1210_crnt_bal_amt=500"                                                                                                 | "21"         |
      | "1210_MAT_DT IS CURRENT DATE"                                                                                           | "1"          |
      | "1210_MAT_DT-Current Date<28 DAYS"                                                                                      | "21"         |
      | "1210_MAT_DT-Current Date =28 DAYS"                                                                                     | "28"         |
      | "1210_TERM_MTH!=0"                                                                                                      | "21"         |
      | "1210_SRC_ACCT_STAT_CD=Active"                                                                                          | "21"         |
      | "1210_IP_PRD_CD!=BLANK"                                                                                                 | "21"         |
      | "1210_IP_PRD_CD!=NULL"                                                                                                  | "21"         |
      | "1210_ACCT_CRFC_NUM!=BLANK"                                                                                             | "21"         |
      | "1210_ACCT_CRFC_NUM!=NULL"                                                                                              | "21"         |
      | "1210_MAT_VAL_AMT>0"                                                                                                    | "21"         |
      | "1210_ACCT_SUBSYS_ID=UF"                                                                                                | "21"         |
      | "1210_ACCT_NUM IS 23 DIGIT"                                                                                             | "21"         |
      | "1210_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K"                                                         | "21"         |
      | "1210_PRIMARY_ACCT_HOLDER_FLAG=Y"                                                                                       | "21"         |
      | "1210_Validate IH Record fields against Proposition"                                                                    | "21"         |
      | "1210_PLN_ACCT_CD_MASTER=NRS"                                                                                           | "21"         |
      | "1210_PLN_ACCT_CD_MASTER=TFSA"                                                                                          | "21"         |
      | "1210_PLN_ACCT_CD_MASTER=LRSP"                                                                                          | "21"         |
      | "1210_PLN_ACCT_CD_MASTER=RLSP"                                                                                          | "21"         |
      | "1210_PLN_ACCT_CD_MASTER=RRSP"                                                                                          | "21"         |
      | "1210_PLN_ACCT_DLR = BNS"                                                                                               | "21"         |
      | "1210_PLN_ACCT_DLR = SSI"                                                                                               | "21"         |
      | "1210_Validate that prestaged GIC offer takes precedence over inbound for 1210 offer"                                   | "21"         |
      | "1210_Validate that if a customer already accepted the contextual lead for 1210, the prestaged lead will be suppressed" | "21"         |
      | "1210_Validate that inbound GIC offer 1210 never goes into control"                                                     | "21"         |


  @GICTestData_NOVA @GIC_NOVA_Negative_TestCases_TestData @GIC_NOVA_GenericNegativeTestcases_1210 @1210  @NOVA @ET14061
  Scenario Outline: GIC Renewal Investments_NOVA Create test data for Generic Negative Test Cases Of 1210


    * def testDataFileName = GICtestDataFileName


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate Random certificate to insert into database
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT



    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

    # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_NOVA_Sheet')

    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')


          # insert the complete Row into the cust_dim database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the Complete Row into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/nova/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')

    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

     # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

     # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/nova/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


    Examples:
      | TestID                                                            | MaturityDate |
#      | "1210_N_PRIM_CNTRY_CD!= CA Eg:AC"                                 | "21"         |
#      | "1210_N_PRIM_CNTRY_CD=NULL"                                       | "21"         |
#      | "1210_N_CUST_TYP != PSNL (Eg:- Non_PSNL)"                         | "21"         |
#      | "1210_N_CUST_TYP =  Null"                                         | "21"         |
#      | "1210_N_CUST_AGE Less Than 18"                                    | "21"         |
#      | "1210_N_CUST_AGE =  Null"                                         | "21"         |
#      | "1210_N_MRKTBLE_F=N"                                              | "21"         |
#      | "1210_N_MRKTBLE_F=NULL"                                           | "21"         |
#      | "1210_N_LANG_CD=K"                                                | "21"         |
#      | "1210_N_LANG_CD=NE"                                               | "21"         |
#      | "1210_N_LANG_CD=Null"                                             | "21"         |
#      | "1210_N_Deceased_F=Y"                                             | "21"         |
#      | "1210_N_Deceased_F=NULL"                                          | "21"         |
#      | "1210_N_SRC_SYS_PRD_CD=01"                                        | "21"         |
#      | "1210_N_SRC_SYS_PRD_CD=null"                                      | "21"         |
#      | "1210_N_PRD_CD_MASTER=NULL"                                       | "21"         |
#      | "1210_N_PRD_CD_MASTER=BLANK"                                      | "21"         |
#      | "1210_N_PRD_CD_MASTER=ACC"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=FLE"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=ROC"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=UTL"                                        | "21"         |
#      | "1210_N_PRD_ACCT_STAT_CD!=A"                                      | "21"         |
#      | "1210_N_PRD_ACCT_STAT_CD=null"                                    | "21"         |
#      | "1210_N_PLN_ACCT_CD_MASTER=RDSP"                                  | "21"         |
#      | "1210_N_PRD_CD_MASTER=CT"                                         | "21"         |
#      | "1210_N_PRD_CD_MASTER=CU"                                         | "21"         |
#      | "1210_N_PRD_CD_MASTER=CV"                                         | "21"         |
#      | "1210_N_PRD_CD_MASTER=TU"                                         | "21"         |
#      | "1210_N_PRD_CD_MASTER=CTI"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=CUI"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=CVI"                                        | "21"         |
#      | "1210_N_PRD_CD_MASTER=TUI"                                        | "21"         |
#      | "1210_N_PLN_ACCT_CD_MASTER=RESP"                                  | "21"         |
#      | "1210_N_PLN_ACCT_CD_MASTER=RRIF"                                  | "21"         |
#      | "1210_N_CRNT_BAL_AMT<500"                                         | "21"         |
#      | "1210_N_CRNT_BAL_AMT=499"                                         | "21"         |
#      | "1210_N_CRNT_BAL_AMT=0"                                           | "21"         |
      | "1210_N_MAT_DT  = 29 days"                                        | "29"         |
#      | "1210_N_MAT_DT-Current Date>28 DAYS"                              | "50"         |
#      | "1210_N_SRC_ACCT_STAT_CD=Not Active"                              | "21"         |
#      | "1210_N_SRC_ACCT_STAT_CD=null"                                    | "21"         |
#      | "1210_N_ACCT_SUBSYS_ID!=UF"                                       | "21"         |
#      | "1210_N_ACCT_SUBSYS_ID=null"                                      | "21"         |
#      | "1210_N_Mat_val_amt=100001"                                       | "21"         |
#      | "1210_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC>100K" | "21"         |
#      | "1210_N_PRIMARY_ACCT_HOLDER_FLAG=N"                               | "21"         |
#      | "1210_N_PRIMARY_ACCT_HOLDER_FLAG=NULL"                            | "21"         |
#      | "1210_N_PLN_ACCT_CD_MASTER!=(NRS,TFSA,LRSP,RLSP,RRSP)"            | "21"         |
#      | "1210_N_PLN_ACCT_CD_MASTER=NULL"                                  | "21"         |
#      | "1210_N_PLN_ACCT_DLR! = (BNS,SSI)"                                | "21"         |
#      | "1210_N_PLN_ACCT_DLR! = NULL"                                     | "21"         |

