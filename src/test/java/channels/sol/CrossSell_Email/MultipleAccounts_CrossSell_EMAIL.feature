@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-CrossSell-Email-Multiple Accounts

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell__Email_Ultimate_4MultipleAccounts @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_Ultimate_4MultipleAccounts_SOL Create test data for 4 Multiple Accounts

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generate 12 digit Random Alpha Numeric purl to Insert into PURL_CUST_PROFILE
    * def purlAcc1 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc1 is: "+purlAcc1
    * def purlAcc2 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc2 is: "+purlAcc2
    * def purlAcc3 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc3 is: "+purlAcc3
    * def purlAcc4 = PurlAlphaNumeric(12)
    * print "Random 12 digit Aplha Numeric PurlAcc4 is: "+purlAcc4

    # Generate HashKey to insert into PURL_CUST_PROFILE
    * def hashKeyValAcc1 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc1
    * def hashKeyValAcc2 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc2
    * def hashKeyValAcc3 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc3
    * def hashKeyValAcc4 = generateHashKey()
    * print "Hash Key Value is : "+ hashKeyValAcc4


    # Generate Last Seq Used to Insert into PURL_CUST_PROFILE
    * def lastSeqUsedAcc1 = genLastSeqUsed()
    * print "Last Seq Used is : "+ lastSeqUsedAcc1
    * def lastSeqUsedAcc2 = genLastSeqUsedAcc2()
    * print "Last Seq Used is : "+ lastSeqUsedAcc2
    * def lastSeqUsedAcc3 = genLastSeqUsedAcc3()
    * print "Last Seq Used is : "+ lastSeqUsedAcc3
    * def lastSeqUsedAcc4 = genLastSeqUsedAcc4()
    * print "Last Seq Used is : "+ lastSeqUsedAcc4

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
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number3 is " + acct_num
    * def acct_num4 = '00000000'+randGen(15)
    * print "Account Number4 is " + acct_num4


    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def ScotiaOne = <TestID>+'_ScotiaOne'
    * print 'Scotia One Account Test ID is '+ScotiaOne

    * def BBP = <TestID>+'_BBP'
    * print 'BBP Account Test ID is '+BBP

    * def StuBank = <TestID>+'_StuBank'
    * print 'Student Banking Account Test ID is '+StuBank

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId    | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID>  | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | ScotiaOne | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |
      | BBP       | acct_num3     | purlAcc3 | hashKeyValAcc3 | lastSeqUsedAcc3 |
      | StuBank   | acct_num4     | purlAcc4 | hashKeyValAcc4 | lastSeqUsedAcc4 |

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
      | TestID                                      | Acct_Odt | DOB  | CUST_OPND_DT |
      | "CrossSell_Ultimate_Email_MultipleAccounts" | "28"     | "18" | "30"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell__Email_ScotiaOne_3MultipleAccounts @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_ScotiaOne_3MultipleAccounts_SOL Create test data for 3 Multiple Accounts

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
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
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2
    * def acct_num3 = '00000000'+randGen(15)
    * print "Account Number3 is " + acct_num


    # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

    # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')


      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    * def BBP = <TestID>+'_BBP'
    * print 'BBP Account Test ID is '+BBP

    * def StuBank = <TestID>+'_StuBank'
    * print 'Student Banking Account Test ID is '+StuBank

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | BBP      | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |
      | StuBank  | acct_num3     | purlAcc3 | hashKeyValAcc3 | lastSeqUsedAcc3 |

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
      | TestID                                       | Acct_Odt | DOB  | CUST_OPND_DT |
      | "CrossSell_ScotiaOne_Email_MultipleAccounts" | "28"     | "18" | "30"         |

  @D2DEngagementCrossSell_Email @D2DEngagement_CrossSell_Email_BBP_2MultipleAccounts @SOL @19067
  Scenario Outline: D2D Engagement-CrossSell_Email_BBP_2MultipleAccounts_SOL Create test data for 2 Multiple Accounts

    # Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into database
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

    * def StuBank = <TestID>+'_StuBank'
    * print 'Student Banking Account Test ID is '+StuBank

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | StuBank  | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |

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
      | TestID                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "CrossSell_BBP_Email_MultipleAccounts" | "28"     | "18" | "30"         |
