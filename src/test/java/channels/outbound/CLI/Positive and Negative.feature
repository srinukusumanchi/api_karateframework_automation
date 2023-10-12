@PositiveAndNegative_TestData_Outbound
Feature: Create test data for Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower-4479 Positive and Negative test cases

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')

  @CreditLimitIncrease @CLI_Outbound_Positive_TestData_KSnAC @4479 @OUTBOUND_SOL @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_OUTBOUND Create test data for validating IH field values
    #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

    # Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number

    #Generating Scotia card Number to insert into Database
    * def scd_num = randGen(13)
    * print "ScotiaCard is " + scd_num

    * def ACAcc = <TestID>+'_AC'
    * print 'AC Account Test ID is '+ACAcc

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

     # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ScotiaCardNumber | cardNumber  |
      | <TestID> | acct_num1     | ""               | card_Number |
      | ACAcc    | acct_num2     | scd_num          | ""          |

        # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

        # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

     # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                    |
      | "4479_SOL_ABM"                                            |
      | "4479_VCL-RG,CUSTAGE=18"                                  |
      | "4479_VCL-DM,CUSTAGE=70"                                  |
      | "4479_VCL-DM,CLI Offer Expiry Date equal to current date" |
      | "4479_VCL-DM,CLI Offer Start Date equal to current date"  |
      | "4479_VCL-RG"                                             |
      | "4479_VCL-ST"                                             |
      | "4479_VCL-NF"                                             |
      | "4479_VCL-DM"                                             |
      | "4479_VLR-RG"                                             |
      | "4479_VLR-NF"                                             |
      | "4479_VGD-RG"                                             |
      | "4479_VGD-ST"                                             |
      | "4479_VGD-SP"                                             |
      | "4479_VGD-NF"                                             |
      | "4479_VUS-RG"                                             |
      | "4479_VLR-RC"                                             |
      | "4479_VCL-ZZ"                                             |
      | "4479_VFA-A1"                                             |
      | "4479_VFF-F1"                                             |
      | "4479_VFF-TR"                                             |
      | "4479_VFF-TS"                                             |
      | "4480_AXG-GC"                                             |
      | "4480_AXG-GS"                                             |
      | "4480_AXS-SC"                                             |
      | "4480_AXS-SS"                                             |
      | "4480_AXP-PC"                                             |


  @CreditLimitIncrease @CLI_Outbound_Positive_TestData_KS @4479 @OUTBOUND @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_OUTBOUND Create test data for validating IH field values
      #    Reading testId from Example section
    * def testId = <TestID>

        # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  #     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

      #     Generating Card number to insert into database
    * def cardNumber = randGen(16)
    * print "card number is " + cardNumber

       # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
      # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

      # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
          # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet')
          # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet')
       # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


        # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
        # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

      # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')


    Examples:
      | TestID                           |
#      | "4479_DIAOnly"                     |
#      | "4479_DIA_DNS=Y,NoPhnNumber"       |
#      | "4479_DIA_DNC=Y,NoPhnNumber"       |
#      | "4479_DIA_DNS=Y,DNC=Y,NoPhnNumber" |
#      | "4481_VCL-RG"                      |
#      | "4481_VCL-ST"                      |
#      | "4481_VCL-NF"                      |
#      | "4481_VCL-DM"                      |
#      | "4481_VLR-RG"                      |
#      | "4481_VLR-NF"                      |
#      | "4481_VGD-RG"                      |
#      | "4481_VGD-ST"                      |
#      | "4481_VGD-SP"                      |
#      | "4481_VGD-NF"                      |
#      | "4481_VUS-RG"                      |
#      | "4481_VLR-RC"                      |
#      | "4481_VCL-ZZ"                      |
#      | "4481_VFA-A1"                      |
#      | "4481_VFF-F1"                      |
#      | "4481_VFF-TR"                      |
#      | "4481_VFF-TS"                      |
#      | "4482_AXG-GC"                      |
#      | "4482_AXG-GS"                      |
#      | "4482_AXS-SC"                      |
#      | "4482_AXS-SS"                      |
#      | "4482_AXP-PC"                      |
      | "4479_VCL-RG_KillFileValidation" |
      | "4479_VCL-ST_KillFileValidation" |
      | "4479_VCL-NF_KillFileValidation" |
      | "4480_AXG-GC_KillFileValidation" |
      | "4480_AXG-GS_KillFileValidation" |
      | "4480_AXS-SC_KillFileValidation" |
      | "4481_VCL-DM_KillFileValidation" |
      | "4481_VLR-RG_KillFileValidation" |
      | "4481_VLR-NF_KillFileValidation" |
      | "4482_AXS-SC_KillFileValidation" |
      | "4482_AXS-SS_KillFileValidation" |
      | "4482_AXP-PC_KillFileValidation" |
      | "4479_VCL-RG_InboundOutbound"    |
      | "4479_VCL-ST_InboundOutbound"    |
      | "4479_VCL-NF_InboundOutbound"    |
      | "4480_AXG-GC_InboundOutbound"    |
      | "4480_AXG-GS_InboundOutbound"    |
      | "4480_AXS-SC_InboundOutbound"    |
      | "4481_VCL-DM_InboundOutbound"    |
      | "4481_VLR-RG_InboundOutbound"    |
      | "4481_VLR-NF_InboundOutbound"    |
      | "4482_AXS-SC_InboundOutbound"    |
      | "4482_AXS-SS_InboundOutbound"    |
      | "4482_AXP-PC_InboundOutbound"    |

  @CreditLimitIncrease @CLI_Outbound_Negative_TestData_KSnAC @4479 @OUTBOUND_SOL_Negative @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase - VISA CLI - Sole Borrower_VS18076_4479_OUTBOUND Create test data for validating IH field values
  #    Reading testId from Example section
    * def testId = <TestID>

    # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

  # Generating account numbers to insert into database
    * def acct_num1 = '00000000'+CID
    * print "account number is " + acct_num1
    * def acct_num2 = '00000000'+randGen(15)
    * print "Account Number2 is " + acct_num2

  # Generating Card number to insert into database
    * def card_Number = randGen(16)
    * print "card number is " + card_Number

  #Generating Scotia card Number to insert into Database
    * def scd_num = randGen(13)
    * def ACAcc = <TestID>+'_AC'
    * print 'AC Account Test ID is '+ACAcc

   # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
  # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

   # Used table keyword to iterate for any BDD line
    * table examples
      | testId   | accountNumber | ScotiaCardNumber | cardNumber  |
      | <TestID> | acct_num1     | ""               | card_Number |
      | ACAcc    | acct_num2     | scd_num          | ""          |

      # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet') examples

      # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet') examples

      # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet') examples

      # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_ACCT_DIM_Sheet') examples

     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database') examples


    # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

    # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

   # insert the created Scotia card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet') examples

  # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database') examples


    Examples:
      | TestID                                                     |
      | "N_4479_INDV_TTL_NM"                                       |
      | "N_4479_INDV_FRST_NM"                                      |
      | "N_4479_INDV_LAST_NM"                                      |
      | "N_4479_GIVEN_NAME"                                        |
      | "N_4479_LANG_CD"                                           |
      | "N_4479_PRIM_ADDR_LINE_1"                                  |
      | "N_4479_PRIM_CITY_NM"                                      |
      | "N_4479_PRIM_PROV_CD"                                      |
      | "N_4479_PRIM_POST_CD"                                      |
      | "N_4479_ASSIGNED_FA_TRANSIT and RESP_TRNST_NUM"            |
      | "N_4479_CR_CRD_LMT_AMT"                                    |
      | "N_4479_CLI_APRVD_CR_LMT"                                  |
      | "N_4479_CR_CRD_NUM"                                        |
      | "N_4479_SRC_SYS_PRD_CD"                                    |
      | "N_4479_SRC_SYS_SUB_PRD_CD"                                |

      | "N_4479_CUST_DIM.PRIM_CNTRY_CD!=CAEg:-AC"                  |
      | "N_4479_CUST_DIM.PRIM_CNTRY_CD=Null"                       |
      | "N_4479_CUST_DIM.CUST_TP_CD!=PSNL(Eg:-Non_PSNL)"           |
      | "N_4479_CUST_DIM.CUST_TP_CD=Null"                          |
      | "N_4479_CUST_DIM.CustAgelessthan18"                        |
      | "N_4479_CUST_DIM.CustAgegreaterthan70"                     |
      | "N_4479_CUST_DIM.CUSTAge=Null"                             |
      | "N_4479_CUST_DIM.MRKTBLE_F=N"                              |
      | "N_4479_CUST_DIM.MRKTBLE_F=NULL"                           |
      | "N_4479_CUST_DIM.Deceased_F=Y"                             |
      | "N_4479_CUST_DIM.Deceased_F=Null"                          |
      | "N_4479_CUST_DIM.LANG_CD=K"                                |
      | "N_4479_CUST_DIM.LANG_CD=NE"                               |
      | "N_4479_CUST_DIM.LANG_CD=Null"                             |
      | "N_4479_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SP"                    |
      | "N_4479_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SV"                    |
      | "N_4479_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SS"                    |
      | "N_4479_ACCT_DIM.ACCT_SUBSYS_ID_BB"                        |
      | "N_4479_ACCT_DIM.ACCT_SUBSYS_ID_Null"                      |
      | "N_4479_ACCT_DIM.CLI_OFR_F<>Z"                             |
      | "N_4479_ACCT_DIM.CLI_OFR_F=Null"                           |
      | "N_4479_ACCT_DIM.CLI_OFR_ST_DTgreaterthancurrentdate"      |
      | "N_4479_ACCT_DIM.CLI_OFR_ST_DTnull"                        |
      | "N_4479_ACCT_DIM.CLI_OFR_EXP_DTlesserthancurrentdate"      |
      | "N_4479_ACCT_DIM.CLI_OFR_EXP_DTisnull"                     |
      | "N_4479_ACCT_DIM.CLI_APRVD_CR_LMTlesserthanCR_CRD_LMT_AMT" |
      | "N_4479_ACCT_DIM.CLI_APRVD_CR_LMTequaltoCR_CRD_LMT_AMT"    |
      | "N_4479_ACCT_DIM.CLI_OFR_CRNT_F-N"                         |
      | "N_4479_ACCT_DIM.CLI_OFR_CRNT_F-Null"                      |
      | "N_4479_ACCT_DIM.CC_STEP_LINK_F-Y"                         |
      | "N_4479_ACCT_DIM.CC_STEP_LINK_F-Null"                      |
      | "N_4479_ACCT_DIM.CC_ACCT_VIP_IND-2"                        |
      | "N_4479_ACCT_DIM.CC_ACCT_VIP_IND-9"                        |
      | "N_4479_ACCT_DIM.CLI_OFR_EXP_DT<Currentmonth+2months"      |
      | "N_4479_CUST_ACCT_RLTNP_DIM.PRIMARY_ACCT_HOLDER_FLAG-N"    |
      | "N_4479_CUST_ACCT_RLTNP_DIM.PRIMARY_ACCT_HOLDER_FLAG-Null" |
      | "N_4479_DIA_EMAIL_CUST_DIM.DO_NOT_SOLICIT_F=Y"             |
      | "N_4479_DIA_EMAIL_CUST_DIM.DO_NOT_CALL_F=Y"                |
      | "N_4479_DIA_CUST_DIM.INDV_HOME_TEL_NUM=Null"               |
      | "N_4479_DIA_CUST_DIM.INDV_HOME_TEL_NUM=Blank"              |
      | "N_4479_DIA_CUST_DIM.VLD_PH_F=N"                           |
      | "N_4479_DIA_CUST_DIM.VLD_PH_F=Null"                        |
      | "N_4479_EMAIL_CUST_DIM.DO_NOT_EMAIL_F=Y"                   |
      | "N_4479_EMAIL_CUST_DIM.DO_NOT_EMAIL_F=Null"                |
      | "N_4479_DM_CUST_DIM.DM_ELIG_F=N"                           |
      | "N_4479_DM_CUST_DIM.DM_ELIG_F=Null"                        |
      | "N_4479_SOL_ABM_ACCT_DIM.SCD_NUM=Null"                     |
      | "N_4479-presentinEdpegat.CUST_EXCLSN_REF"                  |
      | "N_4480_CUST_DIM.PRIM_CNTRY_CD!=CAEg:-AC"                  |
      | "N_4480_CUST_DIM.PRIM_CNTRY_CD=Null"                       |
      | "N_4480_CUST_DIM.CUST_TP_CD!=PSNL(Eg:-Non_PSNL)"           |
      | "N_4480_CUST_DIM.CUST_TP_CD=Null"                          |
      | "N_4480_CUST_DIM.CustAgelessthan18"                        |
      | "N_4480_CUST_DIM.CustAgegreaterthan70"                     |
      | "N_4480_CUST_DIM.CUSTAge=Null"                             |
      | "N_4480_CUST_DIM.MRKTBLE_F=N"                              |
      | "N_4480_CUST_DIM.MRKTBLE_F=NULL"                           |
      | "N_4480_CUST_DIM.Deceased_F=Y"                             |
      | "N_4480_CUST_DIM.Deceased_F=Null"                          |
      | "N_4480_CUST_DIM.LANG_CD=K"                                |
      | "N_4480_CUST_DIM.LANG_CD=NE"                               |
      | "N_4480_CUST_DIM.LANG_CD=Null"                             |
      | "N_4480_ACCT_DIM.PRDCD-AXG,SUBPRDCD-SX"                    |
      | "N_4480_ACCT_DIM.PRDCD-AXS,SUBPRDCD-PP"                    |
      | "N_4480_ACCT_DIM.PRDCD-AXP,SUBPRDCD-PX"                    |
      | "N_4480_ACCT_DIM.ACCT_SUBSYS_ID_BB"                        |
      | "N_4480_ACCT_DIM.ACCT_SUBSYS_ID_Null"                      |
      | "N_4480_ACCT_DIM.CLI_OFR_F<>Z"                             |
      | "N_4480_ACCT_DIM.CLI_OFR_F=Null"                           |
      | "N_4480_ACCT_DIM.CLI_OFR_ST_DTgreaterthancurrentdate"      |
      | "N_4480_ACCT_DIM.CLI_OFR_ST_DTnull"                        |
      | "N_4480_ACCT_DIM.CLI_OFR_EXP_DTlesserthancurrentdate"      |
      | "N_4480_ACCT_DIM.CLI_OFR_EXP_DTisnull"                     |
      | "N_4480_ACCT_DIM.CLI_APRVD_CR_LMTlesserthanCR_CRD_LMT_AMT" |
      | "N_4480_ACCT_DIM.CLI_APRVD_CR_LMTequaltoCR_CRD_LMT_AMT"    |
      | "N_4480_ACCT_DIM.CLI_OFR_CRNT_F-N"                         |
      | "N_4480_ACCT_DIM.CLI_OFR_CRNT_F-Null"                      |
      | "N_4480_ACCT_DIM.CC_STEP_LINK_F-Y"                         |
      | "N_4480_ACCT_DIM.CC_STEP_LINK_F-Null"                      |
      | "N_4480_ACCT_DIM.CC_ACCT_VIP_IND-2"                        |
      | "N_4480_ACCT_DIM.CC_ACCT_VIP_IND-9"                        |
      | "N_4480_ACCT_DIM.CLI_OFR_EXP_DT<Currentmonth+2months"      |
      | "N_4480_CUST_ACCT_RLTNP_DIM.PRIMARY_ACCT_HOLDER_FLAG-N"    |
      | "N_4480_CUST_ACCT_RLTNP_DIM.PRIMARY_ACCT_HOLDER_FLAG-Null" |
      | "N_4480_DIA_EMAIL_CUST_DIM.DO_NOT_SOLICIT_F=Y"             |
      | "N_4480_DIA_EMAIL_CUST_DIM.DO_NOT_CALL_F=Y"                |
      | "N_4480_DIA_CUST_DIM.INDV_HOME_TEL_NUM=Null"               |
      | "N_4480_DIA_CUST_DIM.INDV_HOME_TEL_NUM=Blank"              |
      | "N_4480_DIA_CUST_DIM.VLD_PH_F=N"                           |
      | "N_4480_DIA_CUST_DIM.VLD_PH_F=Null"                        |
      | "N_4480_EMAIL_CUST_DIM.DO_NOT_EMAIL_F=Y"                   |
      | "N_4480_EMAIL_CUST_DIM.DO_NOT_EMAIL_F=Null"                |
      | "N_4480_DM_CUST_DIM.DM_ELIG_F=N"                           |
      | "N_4480_DM_CUST_DIM.DM_ELIG_F=Null"                        |
      | "N_4480_SOL_ABM_ACCT_DIM.SCD_NUM=Null"                     |
      | "N_4480-presentinEdpegat.CUST_EXCLSN_REF"                  |
      | "4479_GIVEN_NAME=NULL"                                     |
      | "4480_GIVEN_NAME=NULL"                                     |
      | "4479_PRIM_ADDR_LINE_1=NULL"                               |
      | "4480_PRIM_ADDR_LINE_1=NULL"                               |
      | "4479_PRIM_CITY_NM=NULL"                                   |
      | "4480_PRIM_CITY_NM=NULL"                                   |
      | "4479_PRIM_PROV_CD=NULL"                                   |
      | "4480_PRIM_PROV_CD=NULL"                                   |
      | "4479_PRIM_POST_CD=NULL"                                   |
      | "4480_PRIM_POST_CD=NULL"                                   |
      | "4479_ASSIGNED_FA_TRANSIT=NULL"                            |
      | "4480_ASSIGNED_FA_TRANSIT=NULL"                            |
      | "4479_GIVEN_NAME=BLANK"                                    |
      | "4480_GIVEN_NAME=BLANK"                                    |
      | "4479_PRIM_ADDR_LINE_1=BLANK"                              |
      | "4480_PRIM_ADDR_LINE_1=BLANK"                              |
      | "4479_PRIM_CITY_NM=BLANK"                                  |
      | "4480_PRIM_CITY_NM=BLANK"                                  |
      | "4479_PRIM_PROV_CD=BLANK"                                  |
      | "4480_PRIM_PROV_CD=BLANK"                                  |
      | "4479_PRIM_POST_CD=BLANK"                                  |
      | "4480_PRIM_POST_CD=BLANK"                                  |
      | "4479_ASSIGNED_FA_TRANSIT=BLANK"                           |
      | "4480_ASSIGNED_FA_TRANSIT=BLANK"                           |


  @CreditLimitIncrease @CreditLimitIncrease_Outbound_Negative_TestData @OUTBOUND @VS18076
  Scenario Outline: Pre-Approved Credit Limit Increase_VS18076_OUTBOUND Create test data for Negative Test Cases
 #    Reading testId from Example section
    * def testId = <TestID>

      # Generate Random cid to insert into data base
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

#     Generating account number to insert into database
    * def accountNumber = '00000000'+CID
    * print "account number is " + accountNumber

    #     Generating Card number to insert into database
    * def cardNumber = randGen(16)
    * print "card number is " + cardNumber

     # insert the created CID into the CUST_DIM Testdata excel sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_DIM_Sheet')
    # insert the created CID into the cust_dim database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_DIM_Insertion_Database')

    # insert the created Account Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_ACCT_DIM_Sheet')
        # insert the created Card Number into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_ACCT_DIM_Sheet')
        # insert the created Card Number Last 3 digits into the ACCT_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet')
     # insert the created  Account Number into the ACCT_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_DIM_Insertion_Database')


      # insert the created CID into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
      # insert the created Account Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Card Number into the CUST_ACCT_RLTNP_DIM sheet
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')
    # insert the created Card Number Last 3 digits into the CUST_ACCT_RLTNP_DIM sheet
#    * call read('classpath:channels/outbound/ReusableScenarios.feature@CR_CRD_LAST_3_DGT_NUM_Insertion_CUST_ACCT_RLTNP_DIM_Sheet')

    # insert the created CID and Account Number into the CUST_ACCT_RLTNP_DIM database
    * call read('classpath:channels/outbound/ReusableScenarios.feature@CUST_ACCT_RLTNP_DIM_Insertion_Database')


    Examples:
      | TestID                                                         |
      | "N_4481_CUST_DIM.PRIM_CNTRY_CD!=CAEg:-AC"                      |
      | "N_4481_CUST_DIM.PRIM_CNTRY_CD=Null"                           |
      | "N_4481_CUST_DIM.CUST_TP_CD!=PSNL(Eg:-Non_PSNL)"               |
      | "N_4481_CUST_DIM.CUST_TP_CD=Null"                              |
      | "N_4481_CUST_DIM.CustAgelessthan18"                            |
      | "N_4481_CUST_DIM.CustAgegreaterthan70"                         |
      | "N_4481_CUST_DIM.CUSTAGE=Null"                                 |
      | "N_4481_CUST_DIM.MRKTBLE_F=N"                                  |
      | "N_4481_CUST_DIM.MRKTBLE_F=NULL"                               |
      | "N_4481_CUST_DIM.Deceased_F=Y"                                 |
      | "N_4481_CUST_DIM.Deceased_F=Null"                              |
      | "N_4481_CUST_DIM.LANG_CD=K"                                    |
      | "N_4481_CUST_DIM.LANG_CD=NE"                                   |
      | "N_4481_CUST_DIM.LANG_CD=Null"                                 |
      | "N_4481_CIS_CUST_ID=CC_SCNRY_CUST_ID"                          |
      | "N_4481_ACCT_DIM.CC_SCNRY_CUST_ID=Null"                        |
      | "N_4481_ACCT_DIM.CC_SCNRY_CUST_ID="                            |
      | "N_4481_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SP&CC_SCNRY_CUST_ID!=Null" |
      | "N_4481_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SV&CC_SCNRY_CUST_ID!=Null" |
      | "N_4481_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SS&CC_SCNRY_CUST_ID!=Null" |
      | "N_4481_ACCT_DIM.PRDCD-VFA,SUBPRDCD-A3&CC_SCNRY_CUST_ID!=Null" |
      | "N_4481_ACCT_DIM.ACCT_SUBSYS_ID_BB"                            |
      | "N_4481_ACCT_DIM.ACCT_SUBSYS_ID_Null"                          |
      | "N_4481_ACCT_DIM.CLI_OFR_F<>Z"                                 |
      | "N_4481_ACCT_DIM.CLI_OFR_F=Null"                               |
      | "N_4481_ACCT_DIM.CLI_OFR_ST_DTgreaterthancurrentdate"          |
      | "N_4481_ACCT_DIM.CLI_OFR_ST_DTnull"                            |
      | "N_4481_ACCT_DIM.CLI_OFR_EXP_DTlesserthancurrentdate"          |
      | "N_4481_ACCT_DIM.CLI_OFR_EXP_DTisnull"                         |
      | "N_4481_ACCT_DIM.CLI_APRVD_CR_LMTlesserthanCR_CRD_LMT_AMT"     |
      | "N_4481_ACCT_DIM.CLI_APRVD_CR_LMTequaltoCR_CRD_LMT_AMT"        |
      | "N_4481_ACCT_DIM.CLI_OFR_CRNT_F-N"                             |
      | "N_4481_ACCT_DIM.CLI_OFR_CRNT_F-Null"                          |
      | "N_4481_ACCT_DIM.CC_STEP_LINK_F-Y"                             |
      | "N_4481_ACCT_DIM.CC_STEP_LINK_F-Null"                          |
      | "N_4481_ACCT_DIM.CC_ACCT_VIP_IND-2"                            |
      | "N_4481_ACCT_DIM.CC_ACCT_VIP_IND-9"                            |
      | "N_4481_ACCT_DIM.CLI_OFR_EXP_DT<Currentmonth+2months"          |
      | "N_4481_PRIMARY_ACCT_HOLDER_FLAG-N"                            |
      | "N_4481_PRIMARY_ACCT_HOLDER_FLAG-Null"                         |
      | "N_4481_DIA_EMAIL_DO_NOT_SOLICIT_F=Y"                          |
      | "N_4481_DIA_EMAIL_DO_NOT_CALL_F=Y"                             |
      | "N_4481_DIA_INDV_HOME_TEL_NUM=Null"                            |
      | "N_4481_DIA_INDV_HOME_TEL_NUM=Blank"                           |
      | "N_4481_DIA_VLD_PH_F=N"                                        |
      | "N_4481_DIA_VLD_PH_F=Null"                                     |
      | "N_4481_SOL_ABM_SCD_NUM!=Null"                                 |
      | "N_4481_EMAIL_DO_NOT_EMAIL_F=Y"                                |
      | "N_4481_EMAIL_DO_NOT_EMAIL_F=Null"                             |
      | "N_4481_DMAIL_DM_ELIG_F=N"                                     |
      | "N_4481_DMAIL_DM_ELIG_F=Null"                                  |
      | "N_4481-presentinEdpegat.CUST_EXCLSN_REF"                      |
      | "N_4482_CUST_DIM.PRIM_CNTRY_CD!=CAEg:-AC"                      |
      | "N_4482_CUST_DIM.PRIM_CNTRY_CD=Null"                           |
      | "N_4482_CUST_DIM.CUST_TP_CD!=PSNL(Eg:-Non_PSNL)"               |
      | "N_4482_CUST_DIM.CUST_TP_CD=Null"                              |
      | "N_4482_CUST_DIM.CustAgelessthan18"                            |
      | "N_4482_CUST_DIM.CustAgegreaterthan70"                         |
      | "N_4482_CUST_DIM.CUSTAGE=Null"                                 |
      | "N_4482_CUST_DIM.MRKTBLE_F=N"                                  |
      | "N_4482_CUST_DIM.MRKTBLE_F=NULL"                               |
      | "N_4482_CUST_DIM.Deceased_F=Y"                                 |
      | "N_4482_CUST_DIM.Deceased_F=Null"                              |
      | "N_4482_CUST_DIM.LANG_CD=K"                                    |
      | "N_4482_CUST_DIM.LANG_CD=NE"                                   |
      | "N_4482_CUST_DIM.LANG_CD=Null"                                 |
      | "N_4482_CIS_CUST_ID=CC_SCNRY_CUST_ID"                          |
      | "N_4482_ACCT_DIM.CC_SCNRY_CUST_ID=Null"                        |
      | "N_4482_ACCT_DIM.CC_SCNRY_CUST_ID=BLANK"                       |
      | "N_4482_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SP&CC_SCNRY_CUST_ID!=Null" |
      | "N_4482_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SV&CC_SCNRY_CUST_ID!=Null" |
      | "N_4482_ACCT_DIM.PRDCD-VCL,SUBPRDCD-SS&CC_SCNRY_CUST_ID!=Null" |
      | "N_4482_ACCT_DIM.PRDCD-VFA,SUBPRDCD-A3&CC_SCNRY_CUST_ID!=Null" |
      | "N_4482_ACCT_DIM.ACCT_SUBSYS_ID_BB"                            |
      | "N_4482_ACCT_DIM.ACCT_SUBSYS_ID_Null"                          |
      | "N_4482_ACCT_DIM.CLI_OFR_F<>Z"                                 |
      | "N_4482_ACCT_DIM.CLI_OFR_F=Null"                               |
      | "N_4482_ACCT_DIM.CLI_OFR_ST_DTgreaterthancurrentdate"          |
      | "N_4482_ACCT_DIM.CLI_OFR_ST_DTnull"                            |
      | "N_4482_ACCT_DIM.CLI_OFR_EXP_DTlesserthancurrentdate"          |
      | "N_4482_ACCT_DIM.CLI_OFR_EXP_DTisnull"                         |
      | "N_4482_ACCT_DIM.CLI_APRVD_CR_LMTlesserthanCR_CRD_LMT_AMT"     |
      | "N_4482_ACCT_DIM.CLI_APRVD_CR_LMTequaltoCR_CRD_LMT_AMT"        |
      | "N_4482_ACCT_DIM.CLI_OFR_CRNT_F-N"                             |
      | "N_4482_ACCT_DIM.CLI_OFR_CRNT_F-Null"                          |
      | "N_4482_ACCT_DIM.CC_STEP_LINK_F-Y"                             |
      | "N_4482_ACCT_DIM.CC_STEP_LINK_F-Null"                          |
      | "N_4482_ACCT_DIM.CC_ACCT_VIP_IND-2"                            |
      | "N_4482_ACCT_DIM.CC_ACCT_VIP_IND-9"                            |
      | "N_4482_ACCT_DIM.CLI_OFR_EXP_DT<Currentmonth+2months"          |
      | "N_4482_PRIMARY_ACCT_HOLDER_FLAG-N"                            |
      | "N_4482_PRIMARY_ACCT_HOLDER_FLAG-Null"                         |
      | "N_4482_DIA_EMAIL_DO_NOT_SOLICIT_F=Y"                          |
      | "N_4482_DIA_EMAIL_DO_NOT_CALL_F=Y"                             |
      | "N_4482_DIA_INDV_HOME_TEL_NUM=Null"                            |
      | "N_4482_DIA_INDV_HOME_TEL_NUM=Blank"                           |
      | "N_4482_DIA_VLD_PH_F=N"                                        |
      | "N_4482_DIA_VLD_PH_F=Null"                                     |
      | "N_4482_SOL_ABM_SCD_NUM!=Null"                                 |
      | "N_4482_EMAIL_DO_NOT_EMAIL_F=Y"                                |
      | "N_4482_EMAIL_DO_NOT_EMAIL_F=Null"                             |
      | "N_4482_DMAIL_DM_ELIG_F=N"                                     |
      | "N_4482_DMAIL_DM_ELIG_F=Null"                                  |
      | "N_4482-presentinEdpegat.CUST_EXCLSN_REF"                      |
      | "4481_GIVEN_NAME=NULL"                                         |
      | "4482_GIVEN_NAME=NULL"                                         |
      | "4481_PRIM_ADDR_LINE_1=NULL"                                   |
      | "4482_PRIM_ADDR_LINE_1=NULL"                                   |
      | "4481_PRIM_CITY_NM=NULL"                                       |
      | "4482_PRIM_CITY_NM=NULL"                                       |
      | "4481_PRIM_PROV_CD=NULL"                                       |
      | "4482_PRIM_PROV_CD=NULL"                                       |
      | "4481_PRIM_POST_CD=NULL"                                       |
      | "4482_PRIM_POST_CD=NULL"                                       |
      | "4481_ASSIGNED_FA_TRANSIT=NULL"                                |
      | "4482_ASSIGNED_FA_TRANSIT=NULL"                                |
      | "4481_GIVEN_NAME=BLANK"                                        |
      | "4482_GIVEN_NAME=BLANK"                                        |
      | "4481_PRIM_ADDR_LINE_1=BLANK"                                  |
      | "4482_PRIM_ADDR_LINE_1=BLANK"                                  |
      | "4481_PRIM_CITY_NM=BLANK"                                      |
      | "4482_PRIM_CITY_NM=BLANK"                                      |
      | "4481_PRIM_PROV_CD=BLANK"                                      |
      | "4482_PRIM_PROV_CD=BLANK"                                      |
      | "4481_PRIM_POST_CD=BLANK"                                      |
      | "4482_PRIM_POST_CD=BLANK"                                      |
      | "4481_ASSIGNED_FA_TRANSIT=BLANK"                               |
      | "4482_ASSIGNED_FA_TRANSIT=BLANK"                               |
