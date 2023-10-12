@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-CrossSell-Email-SBAP-4894 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_SBAP_IH_Validation_TestData @4894 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_SBAP_RS19067_4894_SOL Create test data for validating IH field values


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purl = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric Purl is: "+purl

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyVal = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyVal

    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsed = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsed

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet')
  # insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database')


    Examples:
      | TestID                                               | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4894_Validate IH Record fields against Proposition" | "28"     | "33" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_SBAP_Positive_4894111901 @4894 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_SBAP_4894111901_RS19067_4894_SOL Create test data for Positive Test Cases


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purl = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric Purl is: "+purl

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyVal = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyVal

    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsed = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsed

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet')
  # insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database')

    Examples:
      | TestID                                                                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4894_DO_NOT_SOLICIT_F=NULL"                                                                                           | "28"     | "19" | "24"         |
#      | "4894_INDV_BRTH_DT_Equal to 18"                                                                                        | "28"     | "18" | "26"         |
#      | "4894_LANG_CD=E"                                                                                                       | "28"     | "20" | "27"         |
#      | "4894_LANG_CD=EN"                                                                                                      | "28"     | "20" | "28"         |
#      | "4894_LANG_CD=F"                                                                                                       | "28"     | "20" | "29"         |
#      | "4894_LANG_CD=FR"                                                                                                      | "28"     | "23" | "30"         |
#      | "4894_LANG_CD_LowerCase=e"                                                                                             | "28"     | "22" | "31"         |
#      | "4894_LANG_CD_LowerCase=en"                                                                                            | "28"     | "23" | "32"         |
#      | "4894_LANG_CD_LowerCase=f"                                                                                             | "28"     | "21" | "33"         |
#      | "4894_LANG_CD_LowerCase=fr"                                                                                            | "28"     | "21" | "34"         |
#      | "4894_EMPLOYEE_STAFF_F=NULL"                                                                                           | "28"     | "21" | "37"         |
#      | "4894_Account Open Date equal to 28 days"                                                                              | "28"     | "21" | "43"         |
#      | "4894_Account Open Date equal to 58 days"                                                                              | "58"     | "21" | "44"         |
#      | "4894_BANKRUPTCY_DT-NULL"                                                                                              | "28"     | "19" | "50"         |
#      | "4894_Do_Not_Email=N"                                                                                           | "28"     | "40" | "50"         |
#      | "4894_INDV_FRST_NM=NOTNULL"                                                                                     | "28"     | "40" | "50"         |
#      | "4894_INDV_LAST_NM =NOTNULL"                                                                                    | "28"     | "40" | "50"         |
#      | "4894_VLD_EMAIL_F=Y"                                                                                            | "28"     | "40" | "50"         |
#      | "4894_PRIM_EMAIL_ADDR=NOTNULL"                                                                                  | "28"     | "40" | "50"         |
#      | "4894_Primary_Acct_Holder_Flag=Y"                                                                               | "28"     | "40" | "50"         |
#      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE >18 < 24 And PRD CD-07, SUB PRD CD-11"            | "28"     | "20" | "50"         |
#      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE >18 < 24 And PRD CD-07, SUB PRD CD-12"            | "28"     | "21" | "214"        |
#      | "4894_4894111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And  CUST_AGE >18 < 24  And PRD CD-07, SUB PRD CD-11" | "28"     | "22" | "214"        |
#      | "4894_4894111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And  CUST_AGE >18 < 24  And PRD CD-07, SUB PRD CD-12" | "28"     | "18" | "50"         |
      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE =18 And PRD CD-07, SUB PRD CD-11"                 | "28"     | "18" | "50"         |
      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE=24 And PRD CD-07, SUB PRD CD-11"                  | "28"     | "24" | "50"         |
      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE =18 And PRD CD-07, SUB PRD CD-12"                 | "28"     | "18" | "50"         |
      | "4894_4894111901_CreditCard-N And CUST_OPND_DT<6 months And CUST_AGE=24 And PRD CD-07, SUB PRD CD-12"                  | "28"     | "24" | "50"         |
      | "N-4894_4894111901_CC-N And CUST_OPND_DT> 6 months AND CUST_Age Between 18 and 24"                                     | "28"     | "23" | "240"        |
      | "N-4894_CreditCard-N And CUST_OPND_DT<6 months And CustomerAge <18"                                                    | "32"     | "15" | "20"         |
      | "N-4894_CreditCard-N And CUST_OPND_DT<6 months And CustomerAge >24"                                                    | "32"     | "30" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_SBAP_Negative_TestCases_TestData @4894 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_SBAP_RS19067_4894_SOL Create test data for Negative Test Cases


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purl = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric Purl is: "+purl

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyVal = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyVal

    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsed = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsed

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet')
  # insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database')

    Examples:
      | TestID                                          | Acct_Odt | DOB    | CUST_OPND_DT |
#      | "N-4894_PRIM_CNTRY_CD!=CA Eg:- AC"              | "28"     | "19"   | "1"          |
#      | "N-4894_PRIM_CNTRY_CD=Null"                     | "29"     | "19"   | "2"          |
#      | "N-4894_CUST_TP_CD != PSNL (Eg:- Non_PSNL)"     | "30"     | "19"   | "3"          |
#      | "N-4894_CUST_TP_CD = Null"                      | "31"     | "19"   | "4"          |
#      | "N-4894_DO_NOT_SOLICIT_F= Y"                    | "32"     | "19"   | "20"         |
#      | "N-4894_Indv_Brth_Dt Equal to 17"               | "32"     | "17"   | "20"         |
#      | "N-4894_Indv_Brth_Dt Equal to Null"             | "32"     | "NULL" | "20"         |
#      | "N-4894_Indv_Brth_Dt with in range (1-16)"      | "32"     | "5"    | "20"         |
#      | "N-4894_PRD CD- 01, SUB PRD CD -08"             | "32"     | "19"   | "20"         |
#      | "N-4894_PRD CD- 02, SUB PRD CD -04"             | "32"     | "19"   | "20"         |
#      | "N-4894_PRD CD- 07, SUB PRD CD -08"             | "32"     | "20"   | "20"         |
#      | "N-4894_PRD CD- 13, SUB PRD CD -12"             | "32"     | "20"   | "20"         |
#      | "N-4894_PRD CD- 18, SUB PRD CD -02"             | "32"     | "20"   | "20"         |
#      | "N-4894_PRD CD- 19, SUB PRD CD -11"             | "32"     | "20"   | "20"         |
#      | "N-4894_PRD CD-23, SUB PRD CD -02"              | "32"     | "20"   | "20"         |
#      | "N-4894_SRC_ACCT_STAT_CD-B"                     | "32"     | "20"   | "20"         |
#      | "N-4894_SRC_ACCT_STAT_CD-Null"                  | "32"     | "20"   | "20"         |
#      | "N-4894_Account Open Date greater than 58 days" | "60"     | "20"   | "20"         |
#      | "N-4894_Account Open Date equal to Null"        | "NULL"   | "20"   | "20"         |
#      | "N-4894_Account Open Date less than 28"         | "15"     | "21"   | "20"         |
#      | "N-4894_Account Open Date equal to 27"          | "27"     | "21"   | "20"         |
#      | "N-4894_Account Open Date equal to 59"          | "59"     | "21"   | "20"         |
#      | "N-4894_Deceased_F=Y"                           | "32"     | "21"   | "20"         |
#      | "N-4894_Deceased_F=Null"                        | "32"     | "21"   | "20"         |
#      | "N-4894_LANG_CD=K"                              | "32"     | "21"   | "20"         |
#      | "N-4894_LANG_CD=NE"                             | "32"     | "21"   | "20"         |
#      | "N-4894_LANG_CD=Null"                           | "32"     | "21"   | "20"         |
#      | "N-4894_EMPLOYEE_STAFF_F=Y"                     | "32"     | "21"   | "20"         |
      | "N-4894_ACCT_SUBSYS_ID_KS"                      | "32"     | "22"   | "20"         |
#      | "N-4894_Prv_Bnk_Ind=Null"                       | "32"     | "22"   | "20"         |
#      | "N-4894_Prv_Bnk_Ind=Y"                          | "32"     | "22"   | "20"         |
#      | "N-4894_MRKTBLE_F = N"                          | "32"     | "22"   | "20"         |
#      | "N-4894_MRKTBLE_F = NULL"                       | "32"     | "22"   | "20"         |
#      | "N-4894_BANKRUPTCY_DT is 2020-09-14"            | "32"     | "22"   | "20"         |
#      | "N-4894_Do_Not_Email=Y"                         | "28"     | "48"   | "20"         |
#      | "N-4894_Primary_Acct_Holder_Flag=N"             | "28"     | "48"   | "20"         |
#      | "N-4894_INDV_FRST_NM=NULL"                      | "28"     | "48"   | "20"         |
#      | "N-4894_INDV_LAST_NM=NULL"                      | "28"     | "48"   | "20"         |
#      | "N-4894_VLD_EMAIL_F=N"                          | "28"     | "48"   | "20"         |
#      | "N-4894_PRIM_EMAIL_ADDR=NULL"                   | "28"     | "48"   | "20"         |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_SBAP_CUST_OPND_DT<7_Negative_TestCases_TestData @4894 @SOL @RS19067
  Scenario Outline: D2D Engagement_CrossSell_Email_SBAP_RS19067_4894_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days


    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purl = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric Purl is: "+purl

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyVal = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyVal

    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsed = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsed

    # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')
  # insert the Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
  # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

  # insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet')
  # insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet')
  # insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database')


    Examples:
      | TestID                                                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "N-4894 is not returned in SOL when offer 5107 or 5106 welcome offer is less than CUST_OPND_DT<7 days" | "30"     | "56" | "4"          |
