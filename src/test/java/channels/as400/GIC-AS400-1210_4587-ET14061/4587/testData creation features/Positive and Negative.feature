@ET14061
@AS400_4587

Feature: Create test data for AS400 - GIC Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @GIC_AS400 @GIC_AS400_Positive_TestCases_TestData @GIC_AS400GenericPositiveTestCases_4587  @4587  @ET14061
  Scenario Outline: GIC_AS400 Create test data for Positive Generic Test Cases Of  And 4587

    * def testDataFileName = GICtestDataFileName


    # Reading testId from Example section
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
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

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


    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                                                                                  | DOB  | MaturityDate |
      | "4587_ISSUE =Renewal Group=Investments"                                                                                 | "22" | "21"         |
      | "4587_PRIM_CNTRY_CD= CA"                                                                                                | "22" | "21"         |
      | "4587_CUST_TYP= PSNL"                                                                                                   | "22" | "21"         |
      | "4587_CUST_AGE greater than 18"                                                                                         | "22" | "21"         |
      | "4587_CUST_AGE equal to 18"                                                                                             | "18" | "21"         |
      | "4587_MRKTBLE_F=Y"                                                                                                      | "22" | "21"         |
      | "4587_DECEASED_F=N"                                                                                                     | "22" | "21"         |
      | "4587_LANG_CD=E"                                                                                                        | "22" | "21"         |
      | "4587_LANG_CD=EN"                                                                                                       | "22" | "21"         |
      | "4587_LANG_CD=F"                                                                                                        | "22" | "21"         |
      | "4587_LANG_CD=FR"                                                                                                       | "22" | "21"         |
      | "4587_LANG_CD_small case=e"                                                                                             | "22" | "21"         |
      | "4587_LANG_CD_small case=en"                                                                                            | "22" | "21"         |
      | "4587_LANG_CD_small case=f"                                                                                             | "22" | "21"         |
      | "4587_LANG_CD_small case=fr"                                                                                            | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=NRS"                                                                                               | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=TFSSB"                                                                                             | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=RRSSB"                                                                                             | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=NRSPR"                                                                                             | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=TFS"                                                                                               | "22" | "21"         |
      | "4587_SRC_SYS_PRD_CD=RRS"                                                                                               | "22" | "21"         |
      | "4587_PRD_CD_MASTER!=NULL"                                                                                              | "22" | "21"         |
      | "4587_PRD_CD_MASTER!=BLANK"                                                                                             | "22" | "21"         |
      | "4587_PRD_CD_MASTER!=ACC"                                                                                               | "22" | "21"         |
      | "4587_PRD_CD_MASTER!=FLE"                                                                                               | "22" | "21"         |
      | "4587_PRD_CD_MASTER!=UTL"                                                                                               | "22" | "21"         |
      | "4587_PRD_ACCT_STAT_CD=A"                                                                                               | "22" | "21"         |
      | "4587_PLN_ACCT_CD_MASTER!=(RDSP,CT,CU,CV,TU,CTI,CUI,CVI,TUI,RESP,RRIF)"                                                 | "22" | "21"         |
      | "4587_CRNT_BAL_AMT>$500"                                                                                                | "22" | "21"         |
      | "4587_CRNT_BAL_AMT=$500"                                                                                                | "22" | "21"         |
      | "4587_MAT_DT-Current Date<28 DAYS"                                                                                      | "22" | "21"         |
      | "4587_MAT_DT-Current Date =28 DAYS"                                                                                     | "22" | "28"         |
      | "4587_MAT_DT =CURRENT DATE"                                                                                             | "22" | "1"          |
      | "4587_TERM_MTH!=0"                                                                                                      | "22" | "21"         |
      | "4587_SRC_ACCT_STAT_CD=Active"                                                                                          | "22" | "21"         |
      | "4587_IP_PRD_CD!=BLANK"                                                                                                 | "22" | "21"         |
      | "4587_IP_PRD_CD!=NULL"                                                                                                  | "22" | "21"         |
      | "4587_ACCT_CRFC_NUM!=BLANK"                                                                                             | "22" | "21"         |
      | "4587_ACCT_CRFC_NUM!=NULL"                                                                                              | "22" | "21"         |
      | "4587_MAT_VAL_AMT>$0"                                                                                                   | "22" | "21"         |
      | "4587_MAT_VAL_AMT=100001"                                                                                               | "22" | "21"         |
      | "4587_ACCT_SUBSYS_ID=UF"                                                                                                | "22" | "21"         |
      | "4587_ACCT_NUM IS 23 DIGIT"                                                                                             | "22" | "21"         |
      | "4587_PRIMARY_ACCT_HOLDER_FLAG=Y"                                                                                       | "22" | "21"         |
      | "4587_Validate that prestaged GIC offer takes precedence over inbound for 4587 offer"                                   | "22" | "21"         |
      | "4587_Validate that if a customer already accepted the contextual lead for 4587, the prestaged lead will be suppressed" | "22" | "21"         |
      | "4587_Validate that inbound GIC offer 4587 never goes into control"                                                     | "22" | "21"         |
      | "4587_Validate IH Record fields against Proposition"                                                                    | "22" | "21"         |
      | "4587_PLN_ACCT_CD_MASTER=NRS"                                                                                           | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER=TFSA"                                                                                          | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER=LRSP"                                                                                          | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER=RLSP"                                                                                          | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER=RRSP"                                                                                          | "21" | "20"         |
      | "4587_PLN_ACCT_DLR = BNS"                                                                                               | "21" | "20"         |
      | "4587_PLN_ACCT_DLR = SSI"                                                                                               | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER!=(NRS,TFSA,LRSP,RLSP,RRSP)"                                                                    | "21" | "20"         |
      | "4587_PLN_ACCT_CD_MASTER=NULL"                                                                                          | "21" | "20"         |
      | "4587_PLN_ACCT_DLR! = (BNS,SSI)"                                                                                        | "21" | "20"         |
      | "4587_PLN_ACCT_DLR! = NULL"                                                                                             | "21" | "20"         |


  @GIC_AS400 @GIC_AS400_Negative_TestCases_TestData @GIC_AS400_GenericNegativeTestcases_4587  @4587 @NOVA @ET14061
  Scenario Outline: GIC_AS400 Create test data for Generic Negative Test Cases Of  4587


    * def testDataFileName = GICtestDataFileName


    # Reading testId from Example section
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
    * def CERT = '00000'+randGenCert(10)
    * print  "Random generated Certificate is "+CERT

    # Convert the maturity date  to YYYY-MM-DD format
    * string maturityDate = <MaturityDate> == 'NULL'? 'NULL': futureDateInDays(<MaturityDate>)
    * print "Maturity  Date is", maturityDate

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


    # insert the certificate into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet')

    # insert the maturity date into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@MAT_DT_Insertion_ACCT_DIM_Sheet')

    # insert The Entire Row in the ACCT_DIM DataBase
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

    Examples:
      | TestID                                                            | DOB    | MaturityDate |
      | "4587_N_PRIM_CNTRY_CD!= CA Eg:AC"                                 | "22"   | "21"         |
      | "4587_N_PRIM_CNTRY_CD=NULL"                                       | "22"   | "21"         |
      | "4587_N_CUST_TYP != PSNL (Eg:- Non_PSNL)"                         | "22"   | "21"         |
      | "4587_N_CUST_TYP =  Null"                                         | "22"   | "21"         |
      | "4587_N_CUST_AGE Less Than 18"                                    | "14"   | "21"         |
      | "4587_N_CUST_AGE =  Null"                                         | "NULL" | "21"         |
      | "4587_N_MRKTBLE_F=N"                                              | "22"   | "21"         |
      | "4587_N_MRKTBLE_F=NULL"                                           | "22"   | "21"         |
      | "4587_N_LANG_CD=K"                                                | "22"   | "21"         |
      | "4587_N_LANG_CD=NE"                                               | "22"   | "21"         |
      | "4587_N_LANG_CD=Null"                                             | "22"   | "21"         |
      | "4587_N_Deceased_F=Y"                                             | "22"   | "21"         |
      | "4587_N_Deceased_F=NULL"                                          | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=NULL"                                       | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=BLANK"                                      | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=ACC"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=FLE"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=ROC"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=UTL"                                        | "22"   | "21"         |
      | "4587_N_PRD_ACCT_STAT_CD!=A"                                      | "22"   | "21"         |
      | "4587_N_PRD_ACCT_STAT_CD=null"                                    | "22"   | "21"         |
      | "4587_N_PLN_ACCT_CD_MASTER=RDSP"                                  | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CT"                                         | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CU"                                         | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CV"                                         | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=TU"                                         | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CTI"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CUI"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=CVI"                                        | "22"   | "21"         |
      | "4587_N_PRD_CD_MASTER=TUI"                                        | "22"   | "21"         |
      | "4587_N_PLN_ACCT_CD_MASTER=RESP"                                  | "22"   | "21"         |
      | "4587_N_PLN_ACCT_CD_MASTER=RRIF"                                  | "22"   | "21"         |
      | "4587_N_CRNT_BAL_AMT<$500"                                        | "22"   | "21"         |
      | "4587_N_CRNT_BAL_AMT=499"                                         | "22"   | "21"         |
      | "4587_N_CRNT_BAL_AMT=0"                                           | "22"   | "21"         |
      | "4587_N_MAT_DT-Current Date  = 29 days"                           | "22"   | "29"         |
      | "4587_N_MAT_DT-Current Date>28 DAYS"                              | "22"   | "50"         |
      | "4587_N_SRC_ACCT_STAT_CD=Not Active"                              | "22"   | "21"         |
      | "4587_N_SRC_ACCT_STAT_CD=null"                                    | "22"   | "21"         |
      | "4587_N_ACCT_SUBSYS_ID!=UF"                                       | "22"   | "21"         |
      | "4587_N_ACCT_SUBSYS_ID=null"                                      | "22"   | "21"         |
      | "4587_N_MAT_VAL_AMT=$0"                                           | "22"   | "21"         |
      | "4587_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC<100K" | "22"   | "21"         |
      | "4587_N_SUM OF ALL MAT_VAL_AMT FOR ALLACCT_CRFC_NUM FOR GIC=100K" | "22"   | "21"         |
      | "4587_N_PRIMARY_ACCT_HOLDER_FLAG=N"                               | "22"   | "21"         |
      | "4587_N_PRIMARY_ACCT_HOLDER_FLAG=NULL"                            | "22"   | "21"         |
      | "4587_N_PLN_ACCT_CD_MASTER=NRS"                                   | "21"   | "20"         |
      | "4587_N_PLN_ACCT_CD_MASTER=TFSA"                                  | "21"   | "20"         |
      | "4587_N_PLN_ACCT_CD_MASTER=LRSP"                                  | "21"   | "20"         |
      | "4587_N_PLN_ACCT_CD_MASTER=RLSP"                                  | "21"   | "20"         |
      | "4587_N_PLN_ACCT_CD_MASTER=RRSP"                                  | "21"   | "20"         |
      | "4587_N_PLN_ACCT_DLR = BNS"                                       | "21"   | "20"         |
      | "4587_N_PLN_ACCT_DLR = SSI"                                       | "21"   | "20"         |