Feature: Create test data for D2D Engagement-CrossSell-Ultimate-4891 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagement_EMAIL_CrossSell_SingleAccount
  Scenario Outline: D2D Engagement EMAIL Cross Sell Single Account Test Data Conditioning

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
      | TestID                                    | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4330_ISSUE = Engagement and Group = D2D" | "28"     | "33" | "20"         |

  @D2DEngagement_EMAIL_Testing_Interac_Flash_TwoAccounts
  Scenario Outline: D2D Engagement-Interac_Flash_Email Test Data Conditioning For 2 Accounts

    #    Reading testId from Example section
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
    * def date = <DOB> == 'NULL'? 'NULL': getAge(<DOB>)
    * print  "Customer's Age is:- "+date

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = <Acct_Odt> == 'NULL'? 'NULL': dateFormat(<Acct_Odt>)
    * print "Account ODT is", acct_odt


    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    * def ACAcc = <TestID>+'_ACAcc'
    * print 'AC Account Test ID is '+ACAcc


  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | purl     | hashKeyVal     | lastSeqUsed     |
      | <TestID> | acct_num1     | purlAcc1 | hashKeyValAcc1 | lastSeqUsedAcc1 |
      | ACAcc    | acct_num2     | purlAcc2 | hashKeyValAcc2 | lastSeqUsedAcc2 |

  # insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet') examples
  # insert the Account Number into the ACCT_DIM sheet
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
      | TestID                                               | Acct_Odt | DOB  |
      | "4367_Validate IH Record fields against Proposition" | "50"     | "22" |

