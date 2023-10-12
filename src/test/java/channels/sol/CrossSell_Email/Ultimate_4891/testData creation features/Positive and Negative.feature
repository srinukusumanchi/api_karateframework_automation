@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-CrossSell-Email-Ultimate-4891 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_IH_Validation_TestData @4891 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_RS19067_4891_SOL Create test data for validating IH field values

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
      | "4891_Validate IH Record fields against Proposition" | "28"     | "33" | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_Positive_4891111901 @4891 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4891111901_RS19067_4891_SOL Create test data for Positive Test Cases

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
      | TestID                                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4891_ISSUE = CrossSell and Group = Bundles"                                           | "28"     | "18" | "20"         |
#      | "4891_DO_NOT_SOLICIT_F= Null"                                                          | "28"     | "50" | "24"         |
#      | "4891_INDV_BRTH_DT_Equal to 18"                                                        | "28"     | "18" | "26"         |
#      | "4891_Deceased_F=N"                                                                    | "28"     | "21" | "26"         |
#      | "4891_LANG_CD=E"                                                                       | "28"     | "22" | "27"         |
#      | "4891_LANG_CD=EN"                                                                      | "28"     | "23" | "28"         |
#      | "4891_LANG_CD=F"                                                                       | "28"     | "24" | "29"         |
#      | "4891_LANG_CD=FR"                                                                      | "28"     | "24" | "30"         |
#      | "4891_LANG_CD_LowerCase=e"                                                             | "28"     | "22" | "31"         |
#      | "4891_LANG_CD_LowerCase=en"                                                            | "28"     | "23" | "32"         |
#      | "4891_LANG_CD_LowerCase=f"                                                             | "28"     | "24" | "33"         |
#      | "4891_LANG_CD_LowerCase=fr"                                                            | "28"     | "44" | "34"         |
#      | "4891_EMPLOYEE_STAFF_F=NULL"                                                           | "28"     | "40" | "37"         |
#      | "4891_Account Open Date equal to 28 days"                                              | "28"     | "40" | "43"         |
#      | "4891_Account Open Date equal to 58 days"                                              | "58"     | "40" | "44"         |
#      | "4891_BANKRUPTCY_DT-NULL"                                                              | "28"     | "40" | "50"         |
      | "4891_Do_Not_Email=N"                                                                  | "28"     | "40" | "50"         |
      | "4891_INDV_FRST_NM=NOTNULL"                                                            | "28"     | "40" | "50"         |
      | "4891_INDV_LAST_NM =NOTNULL"                                                           | "28"     | "40" | "50"         |
      | "4891_VLD_EMAIL_F=Y"                                                                   | "28"     | "40" | "50"         |
      | "4891_PRIM_EMAIL_ADDR=NOTNULL"                                                         | "28"     | "40" | "50"         |
      | "4891_Primary_Acct_Holder_Flag=Y"                                                      | "28"     | "40" | "50"         |
      | "4891_CC-N And CUST_OPND_DT<6months And MPSA-N_UltimateAcc_2301_4891111901"            | "28"     | "40" | "50"         |
      | "4891_CC-N And CUST_OPND_DT<6months And MPSA-N_UltimateAcc_2303_4891111901"            | "28"     | "40" | "100"        |
      | "4891_CC-N And CUST_OPND_DT=6th month Last Day And MPSA-N_UltimateAcc_2301_4891111901" | "28"     | "40" | "214"        |
      | "4891_CC-N And CUST_OPND_DT=6th month Last Day And MPSA-N_UltimateAcc_2303_4891111901" | "28"     | "40" | "214"        |
      | "4891_CC-N And CUST_OPND_DT>6months And MPSA-N_UltimateAcc_2301_4891111903"            | "28"     | "40" | "218"        |
      | "4891_CC-N And CUST_OPND_DT>6months And MPSA-N_UltimateAcc_2303_4891111903"            | "28"     | "40" | "219"        |
      | "N-4891_4891111901_CC-N And CUST_OPND_DT>6months And MPSA-N_UltimateAcc"               | "28"     | "40" | "217"        |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell__Email_Ultimate_Positive_4891111902 @4891 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4891111902_RS19067_4891_SOL Create test data for Positive Test Cases

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
      | TestID                                                                      | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "4891_CC-N And CUST_OPND_DT<6months And MPSA-Y_UltimateAcc_2301_4891111902"            | "28"     | "18" | "30"         |
#      | "4891_CC-N And CUST_OPND_DT<6months And MPSA-Y_UltimateAcc_2303_4891111902"            | "28"     | "18" | "90"         |
#      | "4891_CC-N And CUST_OPND_DT=6th month Last Day And MPSA-Y_UltimateAcc_2301_4891111902" | "28"     | "18" | "214"        |
#      | "4891_CC-N And CUST_OPND_DT=6th monthLast Day And MPSA-Y_UltimateAcc_2303_4891111902"  | "28"     | "18" | "214"        |
#      | "4891_CC-N And CUST_OPND_DT>6months And MPSA-Y_UltimateAcc_2301_SRC_ACCT_STAT_CD_Active_4891111904"            | "28"     | "18" | "217"        |
      | "4891_CC-N And CUST_OPND_DT>6months And MPSA-Y_UltimateAcc_2303_4891111904" | "28"     | "18" | "216"        |
      | "N-4891_4891111902_CC-N And CUST_OPND_DT>6months And MPSA-Y_UltimateAcc"    | "28"     | "18" | "240"        |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_Positive_4891111903 @4891 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4891111903_RS19067_4891_SOL Create test data for Positive Test Cases

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
      | TestID                                                                                        | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2301_AXGGC_4891111903"           | "28"     | "18" | "217"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2301_VFFTR_4891111903"           | "28"     | "18" | "216"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2301_VCLDM_4891111903"           | "28"     | "18" | "220"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2301_VLRRG_4891111903"           | "28"     | "18" | "300"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2303_AXGGC_4891111903"           | "28"     | "18" | "400"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2303_VFFTR_4891111903"           | "28"     | "18" | "500"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2303_VCLDM_4891111903"           | "28"     | "18" | "600"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_2303_VLRRG_4891111903"           | "28"     | "18" | "321"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_2301_VLRRG_4891111903" | "28"     | "18" | "215"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-N_KSAcc_2303_VLRRG_4891111903" | "28"     | "18" | "215"        |
      | "N-4891_4891111904_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc"                    | "28"     | "18" | "310"        |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_Positive_4891111904 @4891 @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4891111904_RS19067_4891_SOL Create test data for Positive Test Cases

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
      | TestID                                                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2301_AXGGC_ACCT_STAT_CD _Open_4891111904" | "28"     | "18" | "220"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2301_VFFTR_4891111904"                    | "28"     | "18" | "230"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2301_VCLDM_4891111904"                    | "28"     | "18" | "240"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2301_VLRRG_4891111904"                    | "28"     | "18" | "250"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2303_AXGGC_4891111904"                    | "28"     | "18" | "260"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2303_VFFTR_4891111904"                    | "28"     | "18" | "270"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2303_VCLDM_4891111904"                    | "28"     | "18" | "280"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_2303_VLRRG_4891111904"                    | "28"     | "18" | "290"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_2301_VLRRG_4891111904"          | "28"     | "18" | "215"        |
      | "4891_CC-Y Or CC-N And CUST_OPND_DT=7 month First Day And MPSA-Y_KSAcc_2303_VLRRG_4891111904"          | "28"     | "18" | "215"        |
      | "N-4891_4891111903_CC-Y Or CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc"                             | "28"     | "18" | "290"        |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_Negative_TestCases_TestData @4891 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_RS19067_4891_SOL Create test data for Negative Test Cases

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
      | TestID                     | Acct_Odt | DOB  | CUST_OPND_DT |
#      | "N-4891_PRIM_CNTRY_CD!= CA"                     | "28"     | "34"   | "20"         |
#      | "N-4891_PRIM_CNTRY_CD= Null"                    | "28"     | "20"   | "20"         |
#      | "N-4891_CUST_TP_CD != PSNL"                     | "28"     | "35"   | "20"         |
#      | "N-4891_CUST_TP_CD =  Null"                     | "28"     | "49"   | "20"         |
#      | "N-4891_DO_NOT_SOLICIT_F= Y"                    | "28"     | "45"   | "20"         |
#      | "N-4891_Indv_Brth_Dt Equal to 17"               | "28"     | "17"   | "20"         |
#      | "N-4891_Indv_Brth_Dt Equal to Null"             | "28"     | "NULL" | "20"         |
#      | "N-4891_Indv_Brth_Dt with in range (1-16)"      | "28"     | "5"    | "20"         |
#      | "N-4891_PRD CD- 01, SUB PRD CD -08"             | "28"     | "55"   | "20"         |
#      | "N-4891_PRD CD-02, SUB PRD CD -04"              | "28"     | "45"   | "20"         |
#      | "N-4891_PRD CD- 07, SUB PRD CD -08"             | "28"     | "45"   | "20"         |
#      | "N-4891_PRD CD-13, SUB PRD CD -12"              | "28"     | "45"   | "20"         |
#      | "N-4891_PRD CD- 18, SUB PRD CD -02"             | "28"     | "45"   | "20"         |
#      | "N-4891_PRD CD-19, SUB PRD CD -11"              | "28"     | "45"   | "20"         |
#      | "N-4891_PRD CD-23, SUB PRD CD -02"              | "28"     | "45"   | "20"         |
#      | "N-4891_SRC_ACCT_STAT_CD- B"                    | "28"     | "65"   | "20"         |
#      | "N-4891_SRC_ACCT_STAT_CD-Null"                  | "28"     | "48"   | "20"         |
#      | "N-4891_Account Open Date greater than 58 days" | "70"     | "48"   | "20"         |
#      | "N-4891_Account Open Date equal to Null"        | "NULL"   | "45"   | "20"         |
#      | "N-4891_Account Open Date less than 28"         | "28"     | "45"   | "20"         |
#      | "N-4891_Account Open Date equals to 27"         | "27"     | "45"   | "20"         |
#      | "N-4891_Account Open Date equals to 59"         | "59"     | "45"   | "20"         |
#      | "N-4891_Deceased_F= Y"                          | "28"     | "55"   | "20"         |
#      | "N-4891_Deceased_F= Null"                       | "28"     | "65"   | "20"         |
#      | "N-4891_LANG_CD= K"                             | "28"     | "48"   | "20"         |
#      | "N-4891_LANG_CD= NE"                            | "28"     | "48"   | "20"         |
#      | "N-4891_LANG_CD= Null"                          | "28"     | "48"   | "20"         |
#      | "N-4891_EMPLOYEE_STAFF_F= Y"                    | "28"     | "48"   | "20"         |
#      | "N-4891_ACCT_SUBSYS_ID_KS"                      | "28"     | "48"   | "20"         |
#      | "N-4891_Prv_Bnk_Ind= Null"                      | "28"     | "48"   | "20"         |
#      | "N-4891_Prv_Bnk_Ind= Y"                         | "28"     | "48"   | "20"         |
#      | "N-4891_MRKTBLE_F = N"                          | "28"     | "48"   | "20"         |
#      | "N-4891_MRKTBLE_F = NULL"                       | "28"     | "48"   | "20"         |
#      | "N-4891_Do_Not_Email=Y"                         | "28"     | "48"   | "20"         |
#      | "N-4891_Primary_Acct_Holder_Flag=N"             | "28"     | "48"   | "20"         |
#      | "N-4891_INDV_FRST_NM=NULL"                      | "28"     | "48"   | "20"         |
      | "N-4891_INDV_LAST_NM=NULL" | "28"     | "48" | "20"         |
      | "N-4891_VLD_EMAIL_F=N"     | "28"     | "48" | "20"         |
#      | "N-4891_PRIM_EMAIL_ADDR=NULL"                   | "28"     | "48"   | "20"         |
#      | "N-4891_BANKRUPTCY_DT is 2020-09-14"            | "28"     | "48"   | "20"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_Ultimate_CUST_OPND_DT<7_Negative_TestCases_TestData @4891 @SOL @RS19067
  Scenario Outline: D2D Engagement_CrossSell_Email_Ultimate_RS19067_4891_SOL Create test data for Negative Test Case CUST_OPND_DT<7 days

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
      | TestID                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "N-4891_Offer 5106 or 5107 should not return when CUST_OPND_DT<7 days" | "30"     | "45" | "4"          |
