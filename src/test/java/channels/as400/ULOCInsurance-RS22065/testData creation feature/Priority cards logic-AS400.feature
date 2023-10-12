@PriorityCards_TestData_2423
Feature: Create test data for Creditor Insurance-2423 Priority cards test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

#  Priority-1(VLR,RG)  offer returns when Priority 3(VCL,NF) has higher credit limit than Priority 1(VLR,RG)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and 3(VCL,NF) cards when Priority-3 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                         | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 3(VCL,NF) has higher credit limit than Priority 1(VLR,RG) for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 3(VCL,NF) has higher credit limit than Priority 1(VLR,RG) for Account 2" | acct_num_One  |


  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 3(VCL,SV)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and 3(VCL,SV) cards when Priority-1 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                         | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 3(VCL,SV) for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 3(VCL,SV) for Account 2" | acct_num_One  |


  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 3(VGD,NF) has equal credit limit
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and 3(VGD,NF) cards when Priority-1&3 has equal credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                              | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 3(VGD,NF) has equal credit limit for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 3(VGD,NF) has equal credit limit for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


    #  Priority-2(VLR,NF)  offer returns when Priority 3(VGD,RG) has higher credit limit than Priority 2(VLR,NF)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-2(VLR,NF) and 3(VGD,RG) cards when Priority-3 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                         | accountNumber |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 3(VGD,RG) has higher credit limit than Priority 2(VLR,NF) for Account 1" | acct_num      |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 3(VGD,RG) has higher credit limit than Priority 2(VLR,NF) for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 3(VGD,SP) for Account 1
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-2(VLR,NF) and 3(VGD,SP) cards when Priority-2 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                          | accountNumber |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 3(VGD,SP) for Account 1"  | acct_num      |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 3(VGD,SP)  for Account 2" | acct_num_One  |


  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) and 3(VCL,SS) has equal credit limit
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-2(VLR,NF) and 3(VCL,SS) cards when Priority-2&3 has equal credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                              | accountNumber |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) and 3(VCL,SS) has equal credit limit for Account 1" | acct_num      |
      | "2423_Priority-2(VLR,NF)  offer returns when Priority 2(VLR,NF) and 3(VCL,SS) has equal credit limit for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


#-----------------------

  #  Priority-1(VLR,RG)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 1(VLR,RG) for Account 1
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and 2(VLR,NF) cards when Priority-2 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                         | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 1(VLR,RG) for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 2(VLR,NF) has higher credit limit than Priority 1(VLR,RG) for Account 2" | acct_num_One  |


  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 2(VLR,NF)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and (VLR,NF) cards when Priority-1 has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                         | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 2(VLR,NF) for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) has higher credit limit than Priority 2(VLR,NF) for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 2(VLR,NF) has equal credit limit
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG) and 2(VLR,NF) cards when Priority-1&2 has equal credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                              | accountNumber |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 2(VLR,NF) has equal credit limit for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG)  offer returns when Priority 1(VLR,RG) and 2(VLR,NF) has equal credit limit for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples



    #  Priority-3(VCL,ZZ)  offer returns when Priority 3(VCL,ZZ) has highest credit limit than Priority 3(VCL,RG)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-3(VCL,ZZ) and 3(VCL,RG) cards when Priority-3(VCL,ZZ) has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                          | accountNumber |
      | "2423_Priority-3(VCL,ZZ)  offer returns when Priority 3(VCL,ZZ) has highest credit limit than Priority 3(VCL,RG) for Account 1" | acct_num      |
      | "2423_Priority-3(VCL,ZZ)  offer returns when Priority 3(VCL,ZZ) has highest credit limit than Priority 3(VCL,RG) for Account 2" | acct_num_One  |

  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

# Priority-3(AXS,SC) OR (VLR, RC) offer returns when Priority 3(AXS,SC) and  (VLR, RC) has equal credit limit
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-3(AXS,SC) or 3(VLR, RC) offer returns both cards has equal credit limits
    * def testDataFileName = CreditorInsurancetestDataFileName
    # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)

    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                           | accountNumber |
      | "2423_Priority-3(AXS,SC) OR (VLR, RC) offer returns when Priority 3(AXS,SC) and  (VLR, RC) has equal credit limit for Account 1" | acct_num      |
      | "2423_Priority-3(AXS,SC) OR (VLR, RC) offer returns when Priority 3(AXS,SC) and  (VLR, RC) has equal credit limit for Account 2" | acct_num_One  |


  # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples

#  Priority-1(VLR,RG) offer returns when Priority 2(VLR,NF) has highest credit limit than Priority 1(VLR,RG) and Priority 3(VFF,TR)
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG), 2(VLR,NF) and 3(VFF,TR)cards when Priority-2(VLR,NF) has highest credit limit
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID



    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def acct_num_Two = '00000000'+randGen(15)
    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                                                | accountNumber |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 2(VLR,NF) has highest credit limit than Priority 1(VLR,RG) and Priority 3(VFF,TR) for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 2(VLR,NF) has highest credit limit than Priority 1(VLR,RG) and Priority 3(VFF,TR) for Account 2" | acct_num_One  |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 2(VLR,NF) has highest credit limit than Priority 1(VLR,RG) and Priority 3(VFF,TR) for Account 3" | acct_num_Two  |

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples



  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


    #  Priority-1(VLR,RG) offer returns when Priority 1(VLR,RG), Priority 2(VLR,NF) and Priority 3(VFF,TS) has equal credit limit
  @CreditorInsurance @CreditorInsurance_PriorityCards_TestData @2423 @AS400 @VS17084
  Scenario: Creditor Insurance_VS17084_2423_AS400 Create test data for Priority-1(VLR,RG), 2(VLR,NF) and 3(VFF,TR)cards when Priority-1,2&3 has equal credit limits
    * def testDataFileName = CreditorInsurancetestDataFileName
      # Generate Random cid to insert into database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account number to insert into database
    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num
    * def acct_num_One = '00000000'+randGen(15)
    * def acct_num_Two = '00000000'+randGen(15)
    # Used table keyword to iterate for any BDD line
    * table examples
      | testId                                                                                                                                          | accountNumber |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 1(VLR,RG), Priority 2(VLR,NF) and Priority 3(VFF,TS) has equal credit limit for Account 1" | acct_num      |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 1(VLR,RG), Priority 2(VLR,NF) and Priority 3(VFF,TS) has equal credit limit for Account 2" | acct_num_One  |
      | "2423_Priority-1(VLR,RG) offer returns when Priority 1(VLR,RG), Priority 2(VLR,NF) and Priority 3(VFF,TS) has equal credit limit for Account 3" | acct_num_Two  |

    # insert the created CID into the AS400 Test data excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_AS400_Sheet') examples

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet') examples

  # insert the created CID into the cust_dim database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

  # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples
    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples

  # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/as400/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples