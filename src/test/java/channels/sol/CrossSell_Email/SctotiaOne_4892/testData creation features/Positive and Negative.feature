@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-CrossSell-Email-ScotiaOne-4892 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_IH_Validation_TestData @4892 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_RS19067_4892_SOL Create test data for validating IH field values

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
      | "4892_Validate IH Record fields against Proposition" | "28"     | "33" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_Positive_4892111901 @4892 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_4892111901_RS19067_4892_SOL Create test data for Positive Test Cases

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
      | TestID                                                                                                          | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4892_DO_NOT_SOLICIT_F=NULL"                                                                                    | "28"     | "50" | "24"         |
#      | "4892_INDV_BRTH_DT_Equal to 18"                                                                                 | "28"     | "18" | "26"         |
#      | "4892_LANG_CD=E"                                                                                                | "28"     | "22" | "27"         |
#      | "4892_LANG_CD=EN"                                                                                               | "28"     | "23" | "28"         |
#      | "4892_LANG_CD=F"                                                                                                | "28"     | "24" | "29"         |
#      | "4892_LANG_CD=FR"                                                                                               | "28"     | "24" | "30"         |
#      | "4892_LANG_CD_LowerCase=e"                                                                                      | "28"     | "22" | "31"         |
#      | "4892_LANG_CD_LowerCase=en"                                                                                     | "28"     | "23" | "32"         |
#      | "4892_LANG_CD_LowerCase=f"                                                                                      | "29"     | "24" | "33"         |
#      | "4892_LANG_CD_LowerCase=fr"                                                                                     | "29"     | "44" | "34"         |
#      | "4892_EMPLOYEE_STAFF_F=NULL"                                                                                    | "29"     | "35" | "37"         |
#      | "4892_Account Open Date equal to 28 days"                                                                       | "28"     | "30" | "43"         |
#      | "4892_Account Open Date equal to 58 days"                                                                       | "58"     | "40" | "44"         |
#      | "4892_BANKRUPTCY_DT-NULL"                                                                                       | "28"     | "40" | "50"         |
#      | "4892_Do_Not_Email=N"                                                                                           | "28"     | "40" | "50"         |
#      | "4892_INDV_FRST_NM=NOTNULL"                                                                                     | "28"     | "40" | "50"         |
#      | "4892_INDV_LAST_NM =NOTNULL"                                                                                    | "28"     | "40" | "50"         |
      | "4892_VLD_EMAIL_F=Y"                                                                                            | "28"     | "40" | "50"         |
      | "4892_PRIM_EMAIL_ADDR=NOTNULL"                                                                                  | "28"     | "40" | "50"         |
      | "4892_Primary_Acct_Holder_Flag=Y"                                                                               | "28"     | "40" | "50"         |
      | "4892_4892111901_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-13, SUB PRD CD-01" | "29"     | "40" | "50"         |
      | "4892_4892111901_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-13, SUB PRD CD-03" | "30"     | "40" | "60"         |
      | "4892_4892111901_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-13, SUB PRD CD-07" | "30"     | "40" | "70"         |
      | "4892_4892111901_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-13, SUB PRD CD-08" | "30"     | "40" | "80"         |
      | "4892_4892111901_CC-N And CUST_OPND_DT=6 month last Day And MPSA-N And PRD CD-13, SUB PRD CD-01"                | "30"     | "40" | "214"        |
      | "4892_4892111901_CC-N And CUST_OPND_DT=6 month last Day And MPSA-N And PRD CD-13, SUB PRD CD-03"                | "30"     | "41" | "214"        |
      | "4892_4892111901_CC-N And CUST_OPND_DT=6 month last Day And MPSA-N And PRD CD-13, SUB PRD CD-07"                | "30"     | "41" | "214"        |
      | "4892_4892111901_CC-N And CUST_OPND_DT=6 month last Day And MPSA-N And PRD CD-13, SUB PRD CD-08"                | "30"     | "41" | "214"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1301_4892111903"                                           | "30"     | "18" | "232"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1303_4892111903"                                           | "30"     | "18" | "233"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1307_4892111903"                                           | "30"     | "18" | "234"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1308_4892111903"                                           | "30"     | "18" | "235"        |
      | "N-4892_4892111901_CC-N And CUST_OPND_DT>6months And MPSA-N"                                                    | "30"     | "18" | "235"        |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_Positive_4892111902 @4892 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4892111902_RS19067_4892_SOL Create test data for Positive Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purlAcc1 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc1 is: "+purlAcc1
    * def purlAcc2 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc2 is: "+purlAcc2

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyValAcc1 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc1
    * def hashKeyValAcc2 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc2

    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsedAcc1 = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsedAcc1
    * def lastSeqUsedAcc2 = genLastSeqUsedAcc2()
    * print "Last Seq Used is : "+ lastSeqUsedAcc2

     # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

    # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt


    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2


    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def MPSAAcc = <TestID>+'_MPSAAcc'
    * print 'MPSA Account Test ID is '+MPSAAcc


   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | MPSAAcc  | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |

  #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
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


  # insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet') examples
  # insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet') examples
  # insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet') examples
  # insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet') examples
  # insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet') examples
  # insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet') examples
  # insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database') examples


    Examples:
      | TestID                                                                                                                      | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4892_4892111902_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-01"             | "28"     | "18" | "30"         |
      | "4892_4892111902_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-03"             | "28"     | "18" | "190"        |
      | "4892_4892111902_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-07"             | "28"     | "18" | "30"         |
      | "4892_4892111902_CC-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-08"             | "28"     | "18" | "190"        |
      | "4892_4892111902_CC-N And CUST_OPND_DT=6 Month Last Day And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-01"     | "28"     | "18" | "214"        |
      | "4892_4892111902_CC-N And CUST_OPND_DT=6 Month Last Day And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-03"     | "28"     | "18" | "214"        |
      | "4892_4892111902_CC-N And CUST_OPND_DT=6 Month Last Day And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-07"     | "28"     | "18" | "214"        |
      | "4892_4892111902_CC-N And CUST_OPND_DT=6 Month Last Day And BANKRUPTCY_DT-NULL And MPSA-Y And PRD CD-13, SUB PRD CD-08"     | "28"     | "18" | "214"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-Y_BBAcc_SRC_ACCT_STAT_CD_Active_ACCT_SUBSYS_ID_UF_PRDCD-BSAMP-1301_4892111904" | "28"     | "18" | "216"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-Y_BBAcc_1303_4892111904"                                                       | "28"     | "18" | "217"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-Y_BBAcc_1307_4892111904"                                                       | "28"     | "18" | "218"        |
      | "4892_CC-N And CUST_OPND_DT>6months And MPSA-Y_BBAcc_1308_4892111904"                                                       | "28"     | "18" | "219"        |
      | "N-4892_4892111902_CC-N And CUST_OPND_DT>6months And MPSA-Y"                                                                | "28"     | "18" | "219"        |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_Positive_4892111903 @4892 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_4892111903_RS19067_4892_SOL Create test data for Positive Test Cases

  # Reading testId from Example section
    * def testId = <TestID>

  # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purlAcc1 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc1 is: "+purlAcc1
    * def purlAcc2 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc2 is: "+purlAcc2

  # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyValAcc1 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc1
    * def hashKeyValAcc2 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc2

  # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsedAcc1 = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsedAcc1
    * def lastSeqUsedAcc2 = genLastSeqUsedAcc2()
    * print "Last Seq Used is : "+ lastSeqUsedAcc2

   # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

  # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

  # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt


  # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2


  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


    # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def BBAcc = <TestID>+'_BBAcc'
    * print 'BB Account Test ID is '+BBAcc


 # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | BBAcc    | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |

#insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
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


# insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet') examples
# insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database') examples




    Examples:
      | TestID                                                                                                     | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1301_AXGGC_SRC_ACCT_STAT_CD _Open_4892111903" | "28"     | "18" | "216"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1301_VFFTR_4892111903"           | "28"     | "18" | "217"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1301_VCLDM_4892111903"           | "28"     | "18" | "218"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1301_VLRRG_4892111903"           | "28"     | "18" | "219"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1303_AXGGC_4892111903"           | "28"     | "18" | "220"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1303_VFFTR_4892111903"           | "28"     | "18" | "221"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1303_VCLDM_4892111903"                        | "28"     | "18" | "222"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1303_VLRRG_4892111903"                        | "28"     | "18" | "223"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1307_AXGGC_4892111903"                        | "28"     | "18" | "224"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1307_VFFTR_4892111903"                        | "28"     | "18" | "225"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1307_VCLDM_4892111903"                        | "28"     | "18" | "226"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1307_VLRRG_4892111903"                        | "28"     | "18" | "227"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1308_AXGGC_4892111903"                        | "28"     | "18" | "228"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1308_VFFTR_4892111903"                        | "28"     | "18" | "229"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1308_VCLDM_4892111903"                        | "28"     | "18" | "230"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1308_VLRRG_4892111903"                        | "28"     | "18" | "231"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1301_VLRRG_4892111903"              | "28"     | "18" | "216"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1303_VLRRG_4892111903"              | "28"     | "18" | "216"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1307_VLRRG_4892111903"              | "28"     | "18" | "216"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1308_VLRRG_4892111903"              | "28"     | "18" | "216"        |
      | "N-4892_4892111904_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc"                                 | "28"     | "18" | "221"        |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_Positive_4892111904 @4892 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_4892111904_RS19067_4892_SOL Create test data for Positive Test Cases

  # Reading testId from Example section
    * def testId = <TestID>

  # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purlAcc1 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc1 is: "+purlAcc1
    * def purlAcc2 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc2 is: "+purlAcc2
    * def purlAcc3 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc3 is: "+purlAcc3

  # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyValAcc1 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc1
    * def hashKeyValAcc2 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc2
    * def hashKeyValAcc3 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc3

  # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsedAcc1 = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsedAcc1
    * def lastSeqUsedAcc2 = genLastSeqUsedAcc2()
    * print "Last Seq Used is : "+ lastSeqUsedAcc2
    * def lastSeqUsedAcc3 = genLastSeqUsedAcc3()
    * print "Last Seq Used is : "+ lastSeqUsedAcc3

   # Generate Data to insert into the DB
    * def date = <DOB> == 'NULL'? 'NULL': <DOB>
    * print  "Customer's Age is:- "+date

  # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt

  # Convert the CUST_OPND_DT to YYYY-MM-DD format
    * string cust_opnd_dt = dateFormat(<CUST_OPND_DT>)
    * print "Customer Open date is ", cust_opnd_dt

    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "Account number1 is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number3 is " + acct_num3


   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')
      # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def BBAcc = <TestID>+'_BBAcc'
    * print 'BB Account Test ID is '+BBAcc

    * def MPSAAcc = <TestID>+'_MPSAAcc'
    * print 'MPSA Account Test ID is '+MPSAAcc


 # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | BBAcc    | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |
      | MPSAAcc  | acct_num3     | purlAcc3 | hashKeyValAcc3 | lastSeqUsedAcc3 |

#insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
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


# insert the created CID into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert the created Account Number into the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert Account ODT in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_PURL_CUST_PROFILE_Sheet') examples
# insert PURL in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert HashKey in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert Last Seq Used in the PURL_CUST_PROFILE sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet') examples
# insert PURL_CUST_PROFILE sheet rows into the PURL_CUST_PROFILE database
    * call read('classpath:channels/sol/ReusableScenarios.feature@PURL_CUST_PROFILE_Insertion_Database') examples




    Examples:
      | TestID                                                                                        | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1301_AXGGC_4892111904"           | "28"     | "18" | "216"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1301_VFFTR_4892111904"           | "28"     | "18" | "217"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1301_VCLDM_4892111904"           | "28"     | "18" | "218"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1301_VLRRG_4892111904"           | "28"     | "18" | "219"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1303_AXGGC_4892111904"           | "28"     | "18" | "220"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1303_VFFTR_4892111904"           | "28"     | "18" | "221"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1303_VCLDM_4892111904"           | "28"     | "18" | "222"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1303_VLRRG_4892111904"           | "28"     | "18" | "223"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1307_AXGGC_4892111904"           | "28"     | "18" | "224"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1307_VFFTR_4892111904"           | "28"     | "18" | "225"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1307_VCLDM_4892111904"           | "28"     | "18" | "226"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1307_VLRRG_4892111904"           | "28"     | "18" | "227"        |
#      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1308_AXGGC_4892111904"           | "28"     | "18" | "228"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1308_VFFTR_4892111904"           | "28"     | "18" | "229"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1308_VCLDM_4892111904"           | "28"     | "18" | "230"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_1308_VLRRG_4892111904"           | "28"     | "18" | "231"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_1301_VLRRG_4892111904" | "28"     | "18" | "215"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_1303_VLRRG_4892111904" | "28"     | "18" | "215"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_1307_VLRRG_4892111904" | "28"     | "18" | "215"        |
      | "4892_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_1308_VLRRG_4892111904" | "28"     | "18" | "215"        |
      | "N-4892_4892111903_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc"                    | "28"     | "18" | "220"        |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_Negative_TestCases_TestData @4892 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_RS19067_4892_SOL Create test data for Negative Test Cases

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
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
      | TestID                               | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "N-4892_PRIM_CNTRY_CD!=CA Eg:- AC"              | "28"     | "34"   | "1"          |
#      | "N-4892_PRIM_CNTRY_CD=Null"                     | "29"     | "20"   | "2"          |
#      | "N-4892_CUST_TP_CD != PSNL (Eg:- Non_PSNL)"     | "30"     | "35"   | "3"          |
#      | "N-4892_CUST_TP_CD = Null"                      | "31"     | "49"   | "4"          |
#      | "N-4892_DO_NOT_SOLICIT_F= Y"                    | "32"     | "45"   | "20"         |
#      | "N-4892_Indv_Brth_Dt Equal to 17"               | "32"     | "17"   | "20"         |
#      | "N-4892_Indv_Brth_Dt Equal to Null"             | "32"     | "NULL" | "20"         |
#      | "N-4892_Indv_Brth_Dt with in range (1-16)"      | "32"     | "5"    | "20"         |
#      | "N-4892_PRD CD- 01, SUB PRD CD -08"             | "32"     | "23"   | "20"         |
#      | "N-4892_PRD CD- 02, SUB PRD CD -04"             | "32"     | "25"   | "20"         |
#      | "N-4892_PRD CD- 07, SUB PRD CD -08"             | "32"     | "27"   | "20"         |
#      | "N-4892_PRD CD- 13, SUB PRD CD -12"             | "32"     | "30"   | "20"         |
#      | "N-4892_PRD CD- 18, SUB PRD CD -02"             | "32"     | "33"   | "20"         |
#      | "N-4892_PRD CD- 19, SUB PRD CD -11"             | "32"     | "34"   | "20"         |
#      | "N-4892_PRD CD-23, SUB PRD CD -02"              | "32"     | "34"   | "20"         |
#      | "N-4892_SRC_ACCT_STAT_CD-B"                     | "32"     | "35"   | "20"         |
#      | "N-4892_SRC_ACCT_STAT_CD-Null"                  | "32"     | "37"   | "20"         |
#      | "N-4892_Account Open Date greater than 58 days" | "70"     | "38"   | "20"         |
#      | "N-4892_Account Open Date equal to Null"        | "NULL"   | "39"   | "20"         |
#      | "N-4892_Account Open Date less than 28"         | "15"     | "40"   | "20"         |
#      | "N-4892_Account Open Date equal to 27"          | "27"     | "41"   | "20"         |
#      | "N-4892_Account Open Date equal to 59"          | "59"     | "42"   | "20"         |
#      | "N-4892_Deceased_F=Y"                           | "32"     | "43"   | "20"         |
#      | "N-4892_Deceased_F=Null"                        | "32"     | "44"   | "20"         |
#      | "N-4892_LANG_CD=K"                              | "32"     | "45"   | "20"         |
#      | "N-4892_LANG_CD=NE"                             | "32"     | "46"   | "20"         |
#      | "N-4892_LANG_CD=Null"                           | "32"     | "47"   | "20"         |
#      | "N-4892_EMPLOYEE_STAFF_F=Y"                     | "32"     | "48"   | "20"         |
#      | "N-4892_ACCT_SUBSYS_ID_KS"                      | "32"     | "48"   | "20"         |
#      | "N-4892_Prv_Bnk_Ind=Null"                       | "32"     | "49"   | "20"         |
#      | "N-4892_Prv_Bnk_Ind=Y"                          | "32"     | "50"   | "20"         |
#      | "N-4892_MRKTBLE_F = N"                          | "32"     | "51"   | "20"         |
#      | "N-4892_MRKTBLE_F = NULL"                       | "32"     | "52"   | "20"         |
#      | "N-4892_Do_Not_Email=Y"                         | "28"     | "48"   | "20"         |
#      | "N-4892_Primary_Acct_Holder_Flag=N"             | "28"     | "48"   | "20"         |
#      | "N-4892_INDV_FRST_NM=NULL"                      | "28"     | "48"   | "20"         |
#      | "N-4892_INDV_LAST_NM=NULL"                      | "28"     | "48"   | "20"         |
      | "N-4892_VLD_EMAIL_F=N"               | "28"     | "48" | "20"         |
      | "N-4892_PRIM_EMAIL_ADDR=NULL"        | "28"     | "48" | "20"         |
      | "N-4892_BANKRUPTCY_DT is 2020-09-14" | "32"     | "52" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_ScotiaOne_CUST_OPND_DT<7_Negative_TestCases_TestData @4892 @SOL @RS19067
  Scenario Outline: D2D Engagement_CrossSell_Email_ScotiaOne_RS19067_4892_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days

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
      | "N-4892 is not returned in SOL when offer 5107 or 5106 welcome offer is less than CUST_OPND_DT<7 days" | "30"     | "56" | "4"          |
