@AS400NBA

Feature: Get NBA Response

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


  @4479OnlyContextual_Testdata
  Scenario Outline: 4479_ NBA_10 Create test data to get NBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4479" |


  @4480OnlyContextual_Testdata
  Scenario Outline: 4480_ NBA_10 Create test data to get NBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4480" |


  @4481OnlyContextual_Testdata
  Scenario Outline: 4481_ NBA_10 Create test data to get NBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4481" |


  @4482OnlyContextual_Testdata
  Scenario Outline: 4482_ NBA_10 Create test data to get NBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4482" |


# AS400 Scenario-
#--------------------------------------- Pre-Staged-----------------------------------------------------------------
  @5016_Testdata
  Scenario Outline: 5016_ NBA_20 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Get CID from Test data sheet
    * def cid = karate.get('$data.ID')

    Examples:
      | TestID                               |
      | "Validating AS400 Response for 5016" |


    # AS400 scenario for contextual campaign 2423
  @2423AS400_Testdata
  Scenario Outline: Minimumpayment_NBA_9 Create test data to get NBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                                                |
      | "Validate AS400 response for Min-Pay-2423 - VCL-NF"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-SV"                   |
      | "Validate AS400 response for Min-Pay-2423 - VGD-NF"                   |
      | "Validate AS400 response for Min-Pay-2423 - VGD-RG"                   |
      | "Validate AS400 response for Min-Pay-2423 - VGD-SP"                   |
      | "Validate AS400 response for Min-Pay-2423 - VGD-ST"                   |
      | "Validate AS400 response for Min-Pay-2423 - VLR-NF"                   |
      | "Validate AS400 response for Min-Pay-2423 - VLR-RG"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-SS"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-ZZ"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-RG"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-ST"                   |
      | "Validate AS400 response for Min-Pay-2423 - VCL-DM"                   |
      | "Validate AS400 response for Min-Pay-2423 - AXS-SC"                   |
      | "Validate AS400 response for Min-Pay-2423 - AXS-SS"                   |
      | "Validate AS400 response for Min-Pay-2423 - AXG-GC"                   |
      | "Validate AS400 response for Min-Pay-2423 - AXG-GS"                   |
      | "Validate AS400 response for Min-Pay-2423 - VLR-RC"                   |
      | "Validate AS400 response for Min-Pay-2423 - VFF-TR"                   |
      | "Validate AS400 response for Min-Pay-2423 - VFF-TS"                   |
      | "Validate AS400 response for Min-Pay-2423 - 18yrs"                    |
      | "Validate AS400 response for Min-Pay-2423 - 40yrs"                    |
      | "Validate AS400 response for Min-Pay-2423 - 69yrs"                    |
      | "Validate AS400 response for Min-Pay-2423 - E"                        |
      | "Validate AS400 response for Min-Pay-2423 - EN"                       |
      | "Validate AS400 response for Min-Pay-2423 - F"                        |
      | "Validate AS400 response for Min-Pay-2423 - FR"                       |
      | "Validate AS400 response for Min-Pay-2423 - BLOCK and RECL-Blank"     |
      | "Validate AS400 response for Min-Pay-2423 - BLOCK and RECL - NULL"    |
      | "Validate AS400 response for Min-Pay-2423 - BLOCK and RECL - C"       |
      | "Validate AS400 response for Min-Pay-2423 - BLOCK and RECL -XH"       |
      | "Validate AS400 response for Min-Pay-2423 - reissu_cd - Blank"        |
      | "Validate AS400 response for Min-Pay-2423 - reissu_cd - NULL"         |
      | "Validate AS400 response for Min-Pay-2423 - TOT_DLQ_AMT_LessthanZero" |
      | "Validate AS400 response for Min-Pay-2423 - TOT_DLQ_AMT_Zero"         |
      | "Validate AS400 response for Min-Pay-2423 - TOT_DLQ_AMT - NULL"       |

 # Negative Scenario's for Minimum Payment 2423
  @2423_AS400NegativeScenario_Testdata
  Scenario Outline: Minimumpayment_NBA_9 Create test data to get NBA response data elements and structure - Negative Scenario
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Reading testId from Excel AS400 sheet
    * string testId = karate.get('$data.TestID')
    # Insert data into the database
    * def CID = randGen(15)
    * print  "Random generated CID is "+CID

    # Convert the acct_odt to YYYY-MM-DD format
    * string acct_odt = dateFormat(3)

    * def acct_num = '00000000'+CID
    * print "account number is " + acct_num

  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  # insert into cust_dim
    # insert the created CID into the CUST_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"EDPEGAT.CUST_DIM")
#    * def cust_DimInsrt =  SetDataBaseData("INSERT INTO EDPEGAT.CUST_DIM (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,DEVICE_TP, MOB_ACTVTD_DT) VALUES ('PSNL', "+karate.get(CID)+", NULL,'D2D', NULL, 'Welcome', NULL, 'Mr.D2D Welcome', NULL, 'M','1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,'CA', 'ON', NULL, 'Y','Mr.D2D Welcome','LONDON', NULL, NULL, 'N6C2E4', 'N',NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'pavani.vithala@scotiabank.com',NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, '7',NULL, NULL)")
    * def cust_DimInsrt =  SetDataBaseData(cust_dim_querybuilder)

  # insert into cust_acct_rltnp_dim
    # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")
     # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"EDPEGAT.CUST_ACCT_RLTNP_DIM")
#    * def cust_acct_rltnpDimInsrt = "INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD) VALUES ('00000000"+karate.get(acct_num)+"', '"+karate.get(CID)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2020-03-22-14.37.49.760028', NULL, NULL, NULL, NULL,'', NULL,NULL, NULL, NULL, NULL, 'Activated','P' )"
    * def cust_acct_rltnpDimInsrt =  SetDataBaseData(cust_acct_rltnp_querybuilder)

    #insert into acct_dim
    # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")
     # insert the generated acct_odt into the ACCT_DIM  excel sheet under ACCT_ODT column
    * WritetoExcelFile(<TestID>,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"EDPEGAT.ACCT_DIM")
#    * def acct_DimInsrt = "INSERT INTO EDPEGAT.ACCT_DIM (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT, RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD, SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT, CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD, MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F, ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F) VALUES ('00000000"+karate.get(acct_num)+"', NULL, 'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL,'"+acct_odt+"', NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, '01', NULL, '02', NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'H', '0', NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL, NULL, NULL, NULL, 'Z', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N')"
    * def acct_DimInsrt =  SetDataBaseData(acct_dim_querybuilder)

    Examples:
      | TestID                                                                     |
      | "N-Validate AS400 response for Min-Pay-2423 - MRKTBLE_F- N"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Deceased - Y"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Non_PSNL"                    |
      | "N-Validate AS400 response for Min-Pay-2423 - DNS -Y"                      |
      | "N-Validate AS400 response for Min-Pay-2423 - Age 17yr"                    |
      | "N-Validate AS400 response for Min-Pay-2423 - Age 70yr"                    |
      | "N-Validate AS400 response for Min-Pay-2423 - MRKTBLE_F- N"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Deceased - Y"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Language KA"                 |
      | "N-Validate AS400 response for Min-Pay-2423 - Indv_Brth_Dt -NULL"          |
      | "N-Validate AS400 response for Min-Pay-2423 - Prod_cd - VLR- SV"           |
      | "N-Validate AS400 response for Min-Pay-2423 - SUBSYS_ID - BB"              |
      | "N-Validate AS400 response for Min-Pay-2423 - BLOCK and RECL-AB"           |
      | "N-Validate AS400 response for Min-Pay-2423 - chrgf_cd - 1"                |
      | "N-Validate AS400 response for Min-Pay-2423 - chrgf_cd - NULL"             |
      | "N-Validate AS400 response for Min-Pay-2423 - SRC_ACCT_STAT_CD - 1"        |
      | "N-Validate AS400 response for Min-Pay-2423 - SRC_ACCT_STAT_CD - NULL"     |
      | "N-Validate AS400 response for Min-Pay-2423 - CR_CRD_PRTCTN_F - Y"         |
      | "N-Validate AS400 response for Min-Pay-2423 - CR_CRD_PRTCTN_F - NULL"      |
      | "N-Validate AS400 response for Min-Pay-2423 - Primary-Holder - N"          |
      | "N-Validate AS400 response for Min-Pay-2423 - reissu_cd - R"               |
      | "N-Validate AS400 response for Min-Pay-2423 - acct_rltnp - SUBSYS_ID - BB" |
      | "N-Validate AS400 response for Min-Pay-2423 - TOT_DLQ_AMT - morethanZero"  |
      | "N-Validate AS400 response for Min-Pay-2423 - TOT_DLQ_AMT - Blank"         |



#################################### Manual Test cases ##########################################

  Scenario: Validate AS400 response for minimum payment 2423 of age 40yrs
    Given generate a CID and condition in CIM3 database as per eligibility criteria
      """
      ---CUST_DIM---
      Primary Country Cd = 'CA'
      CUST_TP_CD = PSNL
      DO_NOT_SOLICIT_F = N
      Individual birth date = 16+  and not "NULL"
      PRV_BNK_IND = N
      Deceased Flag = N
      Employee_Staff_F=N

      ---ACCT_DIM---
      SRC_ACCT_STAT_CD=A
      ACCT_ODT<30 days
      Concatenation of SRC_SYS_PRD_CD and SRC_SYS_SUB_PRD_CD
      01 - 01,02,03,04  ( offer 4330)

      ---CUST_ACCT_RLTNP_DIM---
      ACCT_SUBSYS_ID = 'BB'
      """
    When insert data in to cust_dim, acct_dim and cust_acct_rltnp_dim tables
     """
    ---CUST_DIM---
    INSERT INTO EDPEGAT.CUST_DIM
    (CUST_TP_CD, CIS_CUST_ID, INDV_TTL_NM, INDV_FRST_NM, INDV_MDL_NM, INDV_LAST_NM, NAME_SUFFIX, GIVEN_NAME, LEGAL_NM, INDV_GNDR_CD,
    INDV_BRTH_DT, LANG_CD, INDV_MRTL_STAT_CD, INDV_HOME_TEL_NUM, INDV_BUS_TEL_NUM, INDV_DEATH_DT, CUST_OPND_DT, SIN, IP_STATUS_CD, IP_TYPE,
    MASTER_SUBSYS_ID, CUST_SUBSYS_ID, CUST_SETP_TRNST_NUM, EFF_END_DT, EFF_START_DT, OCCUP_CAT_CD, OCCUP_CD, OCP_STAT_TP_DESC, OCP_STAT_TP_CD,OCCUP_TYPE_CD,
    ORG_NM, SIC_CD, VALIDATED_FLAG, EMPLOYEE_STAFF_F, BANKRUPTCY_DT, BUS_EST_DT, CDIC_DEP_AGENT_FLAG, CREATE_TS, LAST_UPDT_TS, TRADING_NM,
    BUSINESSEFFECTIVEDATE, DECEASED_F, DO_NOT_CALL_F, DO_NOT_SOLICIT_F, DO_NOT_EMAIL_F, VIP_F, SOL_ACTVTD_DT, SOL_ACTVTD_F, RESP_F, RRSP_F,
    PRIM_CNTRY_CD, PRIM_PROV_CD, SBIZ_WITH_RTL_RLTNP_F, MRKTBLE_F, INDV_FULL_NM, PRIM_CITY_NM, PRIM_ADDR_LINE_1, PRIM_ADDR_LINE_2, PRIM_POST_CD,VLD_PH_F,
    SCOTIA_CRD_WITH_VISA_DR_F, RESP_TRNST_NUM, ORG_TEL_NUM, INSRT_PROCESS_TMSTMP, CR_RSK_IND, PCI_IND, PRV_BNK_IND, RFM_SCORE, TFSA_F, PRIM_EMAIL_ADDR,
    FICO_SCORE, PA_ODP_AMT, CR_CRD_F, VLD_EMAIL_F, BNK_THE_REST_IND, DIGITAL_ACTVTN_F, MOB_LAST_LOGIN_DT, SOL_LAST_LOGIN_DT, INDRCT_AUTO_LOAN_F, CC_VIP_IND,
    DEVICE_TP, MOB_ACTVTD_DT)
    VALUES
    ('PSNL', '140007143907000', NULL,'Tom', NULL, 'Smith', NULL, 'Mr.Tom Smith', NULL, 'M',
    '1970-08-09', 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
      NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
     NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL,
     NULL, 'N', 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL,
     'CA', 'ON', NULL, 'Y','MRS. Auto TEST2','LONDON', NULL, NULL, 'N6C2E4', 'N',
    NULL, NULL, NULL, '2016-11-04-16.07.47.515821', NULL, NULL,'N', NULL, NULL, 'Ranjana.rajnish@scotiabank.com',
     NULL, NULL, 'N', 'Y', NULL, NULL, NULL, NULL, NULL, '7',
     NULL, NULL);

     ---ACCT_DIM---
     INSERT INTO EDPEGAT.CUST_ACCT_RLTNP_DIM
    (ACCT_NUM, CIS_CUST_ID, MDM_ACCT_NUM, ACCT_SUBSYS_ID, CUST_SUBSYS_ID, EFF_START_DT, EFF_END_DT, IP_AR_RELATN_TYPE_CD, RELATN_SUBSYS_ID, PRIMARY_ACCT_HOLDER_FLAG,
    MASTER_SUBSYS_ID, LAST_UPDT_TS, CREATE_TS, BUSINESSEFFECTIVEDATE, INSRT_PROCESS_TMSTMP, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, CRD_STAT, CRD_STAT_DT, REISSU_CD,
     REISSU_ST_DT, LAST_FLASH_TXN_DT,LAST_VD_VPOS_TXN_TMSTMP, LAST_VD_OPOS_TXN_TMSTMP, LAST_E_TFR_DT, CRD_ACTIVATION_STATE,PLASTIC_TP_CD)
    VALUES
    ('00000000004536010000000', '140007143907000', NULL, 'KS', NULL, NULL, NULL, NULL, NULL, 'Y',
    NULL, NULL, NULL, NULL, '2017-08-22-14.37.49.760028', NULL, NULL, NULL, NULL,'',
     NULL,NULL, NULL, NULL, NULL, 'Activated','P');

    ---CUST_ACCT_RLTNP_DIM---
    INSERT INTO EDPEGAT.ACCT_DIM
    (ACCT_NUM, MDM_ACCT_NUM, ACCT_SUBSYS_ID, EFF_START_DT, EFF_END_DT, ACCT_TITLE, JOINT_ACCT_FLAG, LAST_UPDT_TS, PROD_CAT_HIER_ID, PROD_CAT_ID,
    TRUST_RELATN_FLAG, STMT_MAIL_SUBSYS_ID, STMT_MAIL_LOC_ID, MASTER_SUBSYS_ID, CREATE_TS, BUSINESSEFFECTIVEDATE, EDW_ACCT_STAT_CD, D2D_PRE_AUTH_CR_PAC_F, SCD_NUM, ACCT_ODT,
     RTL_PRD_CD, CR_CRD_NUM, CR_CRD_LAST_3_DGT_NUM, SCNRY_CUST_NM, CRNCY_CD, INSRT_PROCESS_TMSTMP, INVSTMNT_PAC_F, SRC_SYS_PRD_CD, SRC_SYS_PRD_DESC, SRC_SYS_SUB_PRD_CD,
     SRC_SYS_SUB_PRD_DESC, RTL_PRD_DESC, OV_DRAFT_LMT_AMT, CRNT_BAL_AMT, SERV_TRNST_NUM, MORT_FNDNG_DT, MORT_PRPS_CD, MORT_PRPS_CD_DESC, PAC_PAYRL_F, CR_CRD_LMT_AMT,
     CR_CRD_BILL_CYCL, CR_CRD_PRTCTN_F, SPL_LOAN_DT, BLOCK_CD, RECL_CD, CHRGF_CD, TOT_DLQNT_AMT, PBP_STAT_CD, CSHBK_AMT, SRC_ACCT_STAT_CD,
    MORT_NOT_FRCLSR_F, NSF_CNT, LMT_CHNG_RSN, LMT_AMT, STMT_CYCL_DT, PAC_PAD_F, AVG_BAL_MTH, REWARD_TP, LAST_BILL_PAYMENT, PIC_PAC_F,
    ABM_BR_DEP, APPLE_PAY_USAGE_F, MOB_WALLET_USAGE_F,  CLI_OFR_F, CLI_OFR_ST_DT, CLI_OFR_EXP_DT, CLI_APRVD_CR_LMT, CLI_OFR_CRNT_F, CC_SCNRY_CUST_ID, CC_STEP_LINK_F)
    VALUES
    ('00000000004536010000000', NULL, 'KS', NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'N', NULL, '2019-08-20',
    NULL, NULL, NULL, NULL, 'CAD', '2016-11-04-16.12.43.160534', NULL, 'VFF', NULL, 'TR',
     NULL, NULL, NULL, NULL, NULL, '2019-07-18', '17', NULL, NULL, NULL,
    NULL, 'N', NULL, 'X', 'H', '0', NULL, NULL, NULL, '5',
    NULL, NULL, NULL, NULL, NULL, '0', NULL, 'S', '2012-02-09', NULL,
    NULL, NULL, NULL, 'A', '2019-10-21', '2020-12-31','13500.00','Y', NULL,'N' );
    """

    Then validate offer minimum payment 2423 is returned
    """
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:PegaRULES:SOAP:NBAData:Services">
        <soapenv:Header/>
        <soapenv:Body>
            <urn:GetNBARequest>
                <ChannelCode>CSE</ChannelCode>
                <ContextType>TeamID</ContextType>
                <ContextValue>Sales</ContextValue>
                <ID> <CID> </ID>
                <IDType>CID</IDType>
                <LanguageCode>EN</LanguageCode>
                <LeadScope>ALL</LeadScope>
                <RequestID>001</RequestID>
            </urn:GetNBARequest>
        </soapenv:Body>
    </soapenv:Envelope>
    """

# Eligibility criteria, database quries and SOAP request is attached
  Scenario: Validate AS400 response for minimum payment 2423 of age 40yrs
    Given generate a CID and condition in CIM3 database as per eligibility criteria
    When insert data in to cust_dim, acct_dim and cust_acct_rltnp_dim tables
    Then validate offer minimum payment 2423 is returned


    # Eligibility criteria, database quries and SOAP request is attached
  Scenario Outline: Validate AS400 response for minimum payment
    Given generate a CID and condition in CIM3 database as per eligibility criteria
    When insert data in to cust_dim, acct_dim and cust_acct_rltnp_dim tables
    Then validate offer minimum payment 2423 is returned
    Examples:
      | Testcases                                                  |
      | Validate SOL response for 2423 - 40yrs_SOL                 |
      | Validate SOL response for 2423 - 69yrs_SOL                 |
      | Validate SOL response for 2423 - BLOCK and RECL - C_SOL    |
      | Validate SOL response for 2423 - BLOCK and RECL - NULL_SOL |