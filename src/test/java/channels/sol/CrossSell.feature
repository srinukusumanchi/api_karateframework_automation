Feature: Create Test Data For D2D Extended Engagement - Cross Sell Positive Test Case

  Background:
    # Reading Common Feature File
    * call read('classpath:CommonFunctions.feature')

  @D2DEngagement_CrossSell_Positive
  Scenario Outline: D2D Engagement-CrossSell Create test data for Positive Test Cases

 #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

  # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')

  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet')

  # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet')

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    #insert Account ODT in the Account DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_ODT_ACCT_DIM_Sheet')

 # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')

      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
     # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')

    Examples:
      | TestID                                       | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4891_ISSUE = CrossSell and Group = Bundles" | "28"     | "18" | "20"         |

  @D2DEngagement_CrossSell_4891111902_Positive_TestCases_TestData
  Scenario Outline: D2D Engagement-Cross Sell Create test data for Getting The 4891111902 Positive Test Cases

    #    Reading testId from Example section
    * def testId = <TestID>

     # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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
    * print "Account number1 is " + acct_num
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet')

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
      | testId   | accountNumber |
      | <TestID> | acct_num1     |
      | MPSAAcc  | acct_num2     |

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

    Examples:
      | TestID                                                                 | Acct_Odt | DOB  | CUST_OPND_DT |
      | "4891_CC-N And CUST_OPND_DT<6months And MPSA-Y_UltimateAcc_4891111902" | "28"     | "18" | "30"         |

  @D2DEngagement_CrossSell_4891111903_Positive_TestCases_TestData
  Scenario Outline: D2D Engagement-Cross Sell Create test data for Multiple BB Accounts Positive Test Cases


     # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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
    * print "account number is " + acct_num
    * def acct_num2 = '00000000'+randGen(15)


    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                | accountNumber |
      | "4891_CC-Y CC-N And CUST_OPND_DT>6months And MPSA-N_KSAcc_4891111903" | acct_num1     |
      | "4891_CC-Y CC-N And CUST_OPND_DT>6months And MPSA-N_BBAcc_4891111903" | acct_num2     |



  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet') examples

   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    * string testId = examples[0].testId

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet') examples

      # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet') examples

      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


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
    Examples:
      | Acct_Odt | DOB  | CUST_OPND_DT |
      | "28"     | "18" | "200"        |

  @D2DEngagement_CrossSell_4891111904_Positive_TestCases_TestData
  Scenario Outline: D2D Engagement-Cross Sell Create test data for Multiple BB Accounts Positive Test Cases


    # Generate Random cid to insert into dadtabase
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

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
    * print "account number is " + acct_num
    * def acct_num2 = '00000000'+randGen(15)
    * def acct_num3 = '00000000'+randGen(15)



    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                  | accountNumber |
      | "4891_CC-Y CC-N And CUST_OPND_DT>6months And MPSA-Y_KSAcc_4891111904"   | acct_num1     |
      | "4891_CC-Y CC-N And CUST_OPND_DT>6months And MPSA-Y_BBAcc_4891111904"   | acct_num2     |
      | "4891_CC-Y CC-N And CUST_OPND_DT>6months And MPSA-Y_MPSAAcc_4891111904" | acct_num3     |



  # insert the created CID into the SOL Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_SOL_Sheet') examples

   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
    * string testId = examples[0].testId

    # insert the customer opened date into the CUST_DIM Test data excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_OPND_DT_Insertion_CUST_DIM_Sheet') examples

      # insert the created DOB into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/sol/ReusableScenarios.feature@DOB_Insertion_CUST_DIM_Sheet') examples

      # insert the created CID into the cust_dim database
    * call read('classpath:channels/sol/ReusableScenarios.feature@CUST_DIM_Insertion_Database')


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
    Examples:
      | Acct_Odt | DOB  | CUST_OPND_DT |
      | "30"     | "19" | "200"        |