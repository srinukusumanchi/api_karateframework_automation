@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-CrossSell-Email-BBP-BBA-4893 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_BBA_IH_Validation_TestData @4893 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_BBP_BBA_RS19067_4893_SOL Create test data for validating IH field values

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
      | "4893_Validate IH Record fields against Proposition" | "28"     | "33" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_BBA_Positive_4893111901 @4893 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_BBP_BBA_4893111901_RS19067_4893_SOL Create test data for Positive Test Cases

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
      | TestID                                                                | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4893_DO_NOT_SOLICIT_F=NULL"                                                                                                   | "28"     | "50" | "24"         |
#      | "4893_INDV_BRTH_DT_Equal to 18"                                                                                                | "28"     | "18" | "26"         |
#      | "4893_LANG_CD=E"                                                                                                               | "28"     | "22" | "27"         |
#      | "4893_LANG_CD=EN"                                                                                                              | "28"     | "23" | "28"         |
#      | "4893_LANG_CD=F"                                                                                                               | "28"     | "24" | "29"         |
#      | "4893_LANG_CD=FR"                                                                                                              | "28"     | "24" | "30"         |
#      | "4893_LANG_CD_LowerCase=e"                                                                                                     | "28"     | "22" | "31"         |
#      | "4893_LANG_CD_LowerCase=en"                                                                                                    | "28"     | "23" | "32"         |
#      | "4893_LANG_CD_LowerCase=f"                                                                                                     | "28"     | "24" | "33"         |
#      | "4893_LANG_CD_LowerCase=fr"                                                                                                    | "28"     | "44" | "34"         |
#      | "4893_EMPLOYEE_STAFF_F=NULL"                                                                                                   | "28"     | "35" | "37"         |
#      | "4893_Account Open Date equal to 28 days"                                                                                      | "28"     | "40" | "43"         |
#      | "4893_Account Open Date equal to 58 days"                                                                                      | "58"     | "40" | "44"         |
#      | "4893_BANKRUPTCY_DT-NULL"                                                                                                      | "28"     | "40" | "50"         |
#      | "4893_Do_Not_Email=N"                                                                                                          | "28"     | "40" | "50"         |
#      | "4893_INDV_FRST_NM=NOTNULL"                                                                                                    | "28"     | "40" | "50"         |
#      | "4893_INDV_LAST_NM =NOTNULL"                                                                                                   | "28"     | "40" | "50"         |
#      | "4893_VLD_EMAIL_F=Y"                                                                                                           | "28"     | "40" | "50"         |
#      | "4893_PRIM_EMAIL_ADDR=NOTNULL"                                                                                                 | "28"     | "40" | "50"         |
#      | "4893_Primary_Acct_Holder_Flag=Y"                                                                                              | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-01"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-02"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-03"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-04"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-07"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-19, SUB PRD CD-08"        | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-01"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-02"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-03"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-04"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-07"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT=6 month last Day  And MPSA-N And PRD CD-19, SUB PRD CD-08"                      | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-01 SUB PRD CD-01"         | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-01, SUB PRD CD-02"        | "28"     | "40" | "60"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-01, SUB PRD CD-03"        | "28"     | "40" | "70"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-01, SUB PRD CD-04"        | "28"     | "40" | "80"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-01, SUB PRD CD-01" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-01, SUB PRD CD-02" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-01, SUB PRD CD-03" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-01, SUB PRD CD-04" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-02 SUB PRD CD-01"         | "28"     | "40" | "50"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-02, SUB PRD CD-02"        | "28"     | "40" | "60"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT<6 months And BANKRUPTCY_DT-NULL And MPSA-N And PRD CD-02, SUB PRD CD-03"        | "28"     | "40" | "70"         |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-02, SUB PRD CD-01" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-02, SUB PRD CD-02" | "28"     | "40" | "214"        |
#      | "4893_4893111901_CreditCard-N And CUST_OPND_DT must be on the Exact 6 month last Day  And MPSA-N And PRD CD-02, SUB PRD CD-03" | "28"     | "40" | "214"        |
#      | "N-4893_4893111901_CC-N And CUST_OPND_DT>6months And MPSA-N"                                                                   | "28"     | "40" | "217"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0101_4893111902"                                                          | "28"     | "18" | "230"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0102_4893111902"                                                          | "28"     | "18" | "230"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0103_4893111902"                                                          | "28"     | "18" | "230"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0104_4893111902"                                                          | "28"     | "18" | "230"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1901_4893111902"                                                          | "28"     | "18" | "340"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1902_4893111902"                                                          | "28"     | "18" | "303"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1903_4893111902"                                                          | "28"     | "18" | "334"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1904_4893111902"                                                          | "28"     | "18" | "332"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1907_4893111902"                                                          | "28"     | "18" | "333"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_1908_4893111902"                                                          | "28"     | "18" | "333"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0201_4893111902"                                                          | "28"     | "18" | "230"        |
#      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0202_4893111902"                                                          | "28"     | "18" | "230"        |
      | "4893_CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_0203_4893111902" | "28"     | "18" | "230"        |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_BBA_Positive_4893111902 @4893 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_BBP_BBA_4893111902_RS19067_4893_SOL Create test data for Positive Test Cases

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
      | TestID                                                                                                              | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1901_AXGGC_SRC_ACCT_STAT_CD _Open_4893111902"          | "28"     | "18" | "216"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1901_VFFTR_4893111902"                                 | "28"     | "18" | "217"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1901_VCLDM_4893111902"                                 | "28"     | "18" | "218"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1901_VLRRG_4893111902"                                 | "28"     | "18" | "219"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1902_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1902_VFFTR_4893111902"                                 | "28"     | "18" | "220"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1902_VCLDM_4893111902"                                 | "28"     | "18" | "232"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1902_VLRRG_4893111902"                                 | "28"     | "18" | "231"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1903_AXGGC_4893111902"                                 | "28"     | "18" | "241"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1903_VFFTR_4893111902"                                 | "28"     | "18" | "243"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1903_VCLDM_4893111902"                                 | "28"     | "18" | "244"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1903_VLRRG_4893111902"                                 | "28"     | "18" | "265"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1904_AXGGC_4893111902"                                 | "28"     | "18" | "279"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1904_VFFTR_4893111902"                                 | "28"     | "18" | "282"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1904_VCLDM_4893111902"                                 | "28"     | "18" | "283"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1904_VLRRG_4893111902"                                 | "28"     | "18" | "289"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1907_AXGGC_4893111902"                                 | "28"     | "18" | "290"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1907_VFFTR_4893111902"                                 | "28"     | "18" | "300"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1907_VCLDM_4893111902"                                 | "28"     | "18" | "310"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1907_VLRRG_4893111902"                                 | "28"     | "18" | "320"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1908_AXGGC_4893111902"                                 | "28"     | "18" | "330"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1908_VFFTR_4893111902"                                 | "28"     | "18" | "340"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1908_VCLDM_4893111902"                                 | "28"     | "18" | "350"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_1908_VLRRG_4893111902"                                 | "28"     | "18" | "350"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1901_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1902_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1903_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1904_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1907_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_1908_VLRRG_4893111902"                       | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0101_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0101_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0101_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0101_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0102_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0102_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0102_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0102_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0103_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0103_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0103_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0103_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0104_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0104_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0104_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0104_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0101_VLRRG_4893111902" | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0102_VLRRG_4893111902" | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0103_VLRRG_4893111902" | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0104_VLRRG_4893111902" | "28"     | "18" | "215"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0201_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0201_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0201_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0201_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0202_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0202_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0202_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0202_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0203_AXGGC_4893111902"                                 | "28"     | "18" | "230"        |
#      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0203_VFFTR_4893111902"                                 | "28"     | "18" | "230"        |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0203_VCLDM_4893111902"                                 | "28"     | "18" | "230"        |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_0203_VLRRG_4893111902"                                 | "28"     | "18" | "230"        |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0201_VLRRG_4893111902" | "28"     | "18" | "215"        |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0202_VLRRG_4893111902" | "28"     | "18" | "215"        |
      | "4893_CC-Y Or CC-N And CUST_OPND_DT month be on the Exact 7 month First Day And MPSA-N_KSAcc_0203_VLRRG_4893111902" | "28"     | "18" | "215"        |
      | "N-4893_4893111902_CC-Y And CUST_OPND_DT<6months And MPSA-N"                                                        | "28"     | "18" | "30"         |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_BBA_Negative_TestCases_TestData @4893 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_BBP_BBA_RS19067_4893_SOL Create test data for Negative Test Cases

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
      | TestID                                     | Acct_Odt | DOB    | CUST_OPND_DT |
#      | "N-4893_PRIM_CNTRY_CD!=CA Eg:- AC"              | "28"     | "34"   | "1"          |
#      | "N-4893_PRIM_CNTRY_CD=Null"                     | "29"     | "20"   | "2"          |
#      | "N-4893_CUST_TP_CD != PSNL (Eg:- Non_PSNL)"     | "30"     | "35"   | "3"          |
#      | "N-4893_CUST_TP_CD = Null"                      | "31"     | "49"   | "4"          |
#      | "N-4893_DO_NOT_SOLICIT_F= Y"                    | "32"     | "45"   | "20"         |
#      | "N-4893_Indv_Brth_Dt Equal to 17"               | "32"     | "17"   | "20"         |
      | "N-4893_Indv_Brth_Dt Equal to Null"        | "32"     | "NULL" | "20"         |
      | "N-4893_Indv_Brth_Dt with in range (1-16)" | "32"     | "5"    | "20"         |
      | "N-4893_PRD CD- 01, SUB PRD CD -08"        | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD- 02, SUB PRD CD -04"             | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD- 07, SUB PRD CD -08"             | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD- 13, SUB PRD CD -12"             | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD- 18, SUB PRD CD -02"             | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD- 19, SUB PRD CD -11"             | "32"     | "45"   | "20"         |
#      | "N-4893_PRD CD-23, SUB PRD CD -02"              | "32"     | "45"   | "20"         |
#      | "N-4893_SRC_ACCT_STAT_CD-B"                     | "32"     | "45"   | "20"         |
#      | "N-4893_SRC_ACCT_STAT_CD-Null"                  | "32"     | "45"   | "20"         |
#      | "N-4893_Account Open Date greater than 58 days" | "60"     | "45"   | "20"         |
#      | "N-4893_Account Open Date equal to Null"        | "NULL"   | "45"   | "20"         |
#      | "N-4893_Account Open Date less than 28"         | "15"     | "45"   | "20"         |
#      | "N-4893_Account Open Date equal to 27"          | "27"     | "45"   | "20"         |
#      | "N-4893_Account Open Date equal to 59"          | "59"     | "45"   | "20"         |
#      | "N-4893_Deceased_F=Y"                           | "32"     | "45"   | "20"         |
#      | "N-4893_Deceased_F=Null"                        | "32"     | "45"   | "20"         |
      | "N-4893_LANG_CD=K"                         | "32"     | "45"   | "20"         |
      | "N-4893_LANG_CD=NE"                        | "32"     | "45"   | "20"         |
      | "N-4893_LANG_CD=Null"                      | "32"     | "45"   | "20"         |
      | "N-4893_EMPLOYEE_STAFF_F=Y"                | "32"     | "45"   | "20"         |
      | "N-4893_ACCT_SUBSYS_ID_KS"                 | "32"     | "45"   | "20"         |
#      | "N-4893_Prv_Bnk_Ind=Null"                       | "32"     | "45"   | "20"         |
#      | "N-4893_Prv_Bnk_Ind=Y"                          | "32"     | "45"   | "20"         |
#      | "N-4893_MRKTBLE_F = N"                          | "32"     | "45"   | "20"         |
#      | "N-4893_MRKTBLE_F = NULL"                       | "32"     | "45"   | "20"         |
#      | "N-4893_BANKRUPTCY_DT is 2020-09-14"            | "32"     | "45"   | "20"         |
#      | "N-4893_Do_Not_Email=Y"                         | "28"     | "48"   | "20"         |
      | "N-4893_Primary_Acct_Holder_Flag=N"        | "28"     | "48"   | "20"         |
      | "N-4893_INDV_FRST_NM=NULL"                 | "28"     | "48"   | "20"         |
      | "N-4893_INDV_LAST_NM=NULL"                 | "28"     | "48"   | "20"         |
      | "N-4893_VLD_EMAIL_F=N"                     | "28"     | "48"   | "20"         |
      | "N-4893_PRIM_EMAIL_ADDR=NULL"              | "28"     | "48"   | "20"         |


  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_BBA_CUST_OPND_DT<7_Negative_TestCases_TestData @4893 @SOL @RS19067
  Scenario Outline: D2D Engagement_CrossSell_Email_ScotiaOne_RS19067_4893_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days

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
      | TestID                                                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "N-4893 is not returned in SOL when offer 5107 or 5106 welcome offer is less than CUST_OPND_DT<7 days" | "30"     | "56" | "4"          |
