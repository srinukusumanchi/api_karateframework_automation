@HighestCreditAndLowestAcctNumbers_OutBound_TestData
Feature: Create test data for  Pre-Approved Credit Limit Increase Highest approved credit limit and lowest account number test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  # Highest approved credit limit - Visa sole_Visa Co borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_VisaSole_VisaCoborrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Visa sole_Visa Co borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Visa sole_Visa Co borrower_VS" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Visa sole_Visa Co borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Visa sole_Visa Co borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_VisaSole_VisaCoborrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Visa sole_Visa Co borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Visa Co borrower_VS" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Visa Co borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

  # Highest approved credit limit - Visa sole_Amex Co borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_VisaSole_AmexCoborrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Visa sole_Amex Co borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Visa sole_Amex co borrower_VS" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Visa sole_Amex co borrower_AC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Visa sole_Amex Co borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_VisaSole_AmexCoborrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Visa sole_Amex Co borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Amex Co borrower_VS" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Amex Co borrower_AC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Highest approved credit limit - Visa sole_Amex Sole
  @CreditLimitIncrease_HighestCreditTestData @CLI_VisaSole_AmexSole_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Visa sole_Amex Sole

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Visa sole_Amex sole_VS" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Visa sole_Amex sole_AS" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Visa sole_Amex Sole
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_VisaSole_AmexSole_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Visa sole_Amex Sole
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Amex Sole_VS" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Amex Sole_AS" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

       # Highest approved credit limit - Visa sole_Visa Sole
  @CreditLimitIncrease_HighestCreditTestData @CLI_VisaSole_VisaSole_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Visa sole_Visa Sole

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Visa sole_Visa sole_VS1" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Visa sole_Visa sole_VS2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Visa sole_Visa Sole
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_VisaSole_VisaSole_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Visa sole_Visa Sole
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Visa Sole_VS1" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Visa sole_Visa Sole_VS2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Highest approved credit limit - Amex sole_Amex Sole
  @CreditLimitIncrease_HighestCreditTestData @CLI_AmexSole_AmexSole_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Amex sole_Amex Sole

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Amex sole_Amex sole_AS1" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Amex sole_Amex sole_AS2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Amex sole_Amex Sole
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_AmexSole_AmexSole_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Amex sole_Amex Sole
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_Amex Sole_AS1" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_Amex Sole_AS2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

      # Highest approved credit limit - Amex sole_Amex Co Borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_AmexSole_AmexCoBorrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Amex sole_Amex Co Borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Amex sole_Amex Co Borrower_AS" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Amex sole_Amex Co Borrower_AC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Amex sole_Amex Co Borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_AmexSole_AmexCoBorrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Amex sole_Amex Co Borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_Amex Co Borrower_AS" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_Amex Co Borrower_AC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Highest approved credit limit - Amex sole_VISA Co Borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_AmexSole_VISACoBorrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Amex sole_VISA Co Borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000045'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Amex sole_VISA Co Borrower_AS" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Amex sole_VISA Co Borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
# insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples
     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Amex sole_VISA Co Borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_AmexSole_VisaCoBorrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Amex sole_VISA Co Borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000045'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_VISA Co Borrower_AS" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Amex sole_VISA Co Borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

        # Highest approved credit limit - Amex Co Borrower_Amex Co Borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_AmexCoBorrower_AmexCoBorrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Amex Co Borrower_Amex Co Borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Amex Co Borrower_Amex Co Borrower_AC1" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Amex Co Borrower_Amex Co Borrower_AC2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Amex Co Borrower_Amex Co Borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_AmexCo_AmexCoBorrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Amex Co Borrower_Amex Co Borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000037'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Amex Co Borrower_Amex Co Borrower_AC1" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Amex Co Borrower_Amex Co Borrower_AC2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

     # Highest approved credit limit - Amex Co Borrower_Visa Co Borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_AmexCoBorrower_VisaCoBorrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Amex Co Borrower_Visa Co Borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000045'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Amex Co Borrower_VISA Co Borrower_AC" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Amex Co Borrower_VISA Co Borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Amex Co Borrower_Visa Co Borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_AmexCo_VisaCoBorrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Amex Co Borrower_Visa Co Borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000037'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000045'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Amex Co Borrower_VISA Co Borrower_AC" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Amex Co Borrower_VISA Co Borrower_VC" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

       # Highest approved credit limit - Visa Co Borrower_Visa Co Borrower
  @CreditLimitIncrease_HighestCreditTestData @CLI_VisaCoBorrower_VisaCoBorrower_HighestCredit_TestData @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for Highest approved credit limit for Visa Co Borrower_Visa Co Borrower

    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                          | accountNumber | cardNumber      |
      | "multiple accounts_highest approved credit limit_Visa Co Borrower_Visa Co Borrower_VC1" | acct_num      | card_Number     |
      | "multiple accounts_highest approved credit limit_Visa Co Borrower_Visa Co Borrower_VC2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

    # Lowest Account Number - Visa Co Borrower_Visa Co Borrower
  @CreditLimitIncrease_LowestAcctNumTestData @@CLI_VisaCo_VisaCoBorrower_LowestActNum_TestData  @OUTBOUND @VS18076
  Scenario: VS18076_OUTBOUND Create test data for lowest account number for Visa Co Borrower_Visa Co Borrower
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    #Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number
    * def card_Number_One = randGen(16)
    * print "card number is " + card_Number_One

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                         | accountNumber | cardNumber      |
      | "multiple accounts_Lowest account number when amount is tie for Visa Co Borrower_Visa Co Borrower_VC1" | acct_num      | card_Number     |
      | "multiple accounts_Lowest account number when amount is tie for Visa Co Borrower_Visa Co Borrower_VC2" | acct_num_One  | card_Number_One |

      # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created *******CID********** into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created ******Account Number************ into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created data into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

      # insert the created ********Account Number********* into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

    # insert the *****************Card Number*********** into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples
    # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

     # insert the created Data into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples
