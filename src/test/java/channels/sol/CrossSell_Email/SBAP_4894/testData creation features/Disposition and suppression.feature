@CIMCAMP-461 @CIEPROG-234

Feature: Create test data for D2D Engagement-Cross Sell-Email-SBAP-4894 Disposition and Suppression test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagementCrossSell_Email @D2DEngagementCrossSell_Email_SBAP_ATC_DEL_Disposition_TestData @4894 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_SBAP_RS19067_4894_SOL Create test data for accept or delete disposition


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
      | TestID                                                         | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4894_Perform Accept Disposition and offer should not display" | "28"     | "18" | "30"         |
      | "4894_Perform Delete Disposition and offer should not display" | "29"     | "19" | "40"         |

    @D2DEngagementCrossSell_Email @D2DEngagementCrossSell_Email_SBAP_VWD_RML_NTY_ATP_Disposition_TestData @4894 @SOL @RS19067
  Scenario Outline: D2D Engagement-CrossSell_Email_SBAP_RS19067_4894_SOL Create test data for view or remind me later or no thank you or accept in progress disposition


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
      | TestID                                                                   | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4894_Perform Viewed Disposition and offer should display"               | "30"     | "20" | "20"         |
      | "4894_Perform Remind me later Disposition and offer should display"      | "31"     | "21" | "30"         |
      | "4894_Perform Accepted In Progress Disposition and offer should display" | "32"     | "22" | "40"         |
      | "4894_Perform No Thank You Disposition and offer should display"         | "33"     | "23" | "50"         |