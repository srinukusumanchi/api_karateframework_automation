@ignore
Feature: Re-usable scenarios specific to NOVA Channel

  @CID_Insertion_NOVA_Sheet
  Scenario: write customer CID details in excel nova sheet
#       # insert the created CID into the NOVA Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  @CID_Insertion_NOVA_Sheet_2Customers
  Scenario: write customer CID details in excel nova sheet
#       # insert the created CID into the NOVA Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID1),"ID")

  @CUST_OPND_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer DOB details in excel CUST_DIM sheet
    * string cust_opnd_dt = CUST_OPND_DT == 'NULL'? 'NULL': dateFormatExcludeDays(CUST_OPND_DT)
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",cust_opnd_dt,"CUST_OPND_DT")

  @ARRIVALDT_Insertion_CUST_DIM_Sheet
  Scenario: write customer ARRIVAL_DT details in excel CUST_DIM sheet
    * string Arrival_dt = ARRV_DT == 'NULL'? 'NULL': dateFormatExcludeDays(ARRV_DT)
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",Arrival_dt,"ARRV_DT")

  @MLS_ADDED_DT_Insertion_CUST_DIM_Sheet

  Scenario: write customer MLS_ADDED_DT details in excel CUST_DIM sheet
    # Generate MLS_ADDED_DT to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string mls_added_dt = MLS_DT == 'NULL' ? 'NULL' : dateFormatExcludeDays(MLS_DT)
    * print "MLS Added Date is", mls_added_dt
  # insert the created MLS_ADDED_DT into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mls_added_dt,"MLS_ADDED_AT_DT")

  @MARRIAGE_EVENT_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer MARRIAGE_EVENT_DT details in excel CUST_DIM sheet
    # Generate MARRIAGE_EVENT_DT to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string marriage_dt = MARRIAGE_DT == 'NULL'? 'NULL': dateFormatExcludeDays(MARRIAGE_DT)
    * print "Marriage Date is", marriage_dt
  # insert the created MARRIAGE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",marriage_dt,"MARRIAGE_LIFE_EVENT_DT")

  @GRADUATION_EVENT_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer GRADUATION_EVENT_DT details in excel CUST_DIM sheet
    # Generate GRADUATION_EVENT_DT to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string graduation_dt = GRADUATION_DT == 'NULL'? 'NULL': dateFormatExcludeDays(GRADUATION_DT)
    * print "Graduation Date is", graduation_dt
  # insert the created MARRIAGE_EVENT_DT into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",graduation_dt,"GRADUATION_LIFE_EVENT_DT")

  @TAX_DATE_Insertion_CUST_DIM_Sheet
  Scenario: write customer tax date details in excel CUST_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",tax_dt,"CHILD_TAX_BENEFIT_START_DATE")

  @CID_Insertion_CUST_DIM_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the NOVA Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")

  @ACCT_ODT_ACCT_DIM_Sheet
  Scenario: Insert Account ODT in ACCT_DIM sheet
    # Generate Account Open dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert theaccount open date to YYYY-MM-DD format
    * string acct_odt = ACCT_ODT == 'NULL'? 'NULL': dateFormatExcludeDays(ACCT_ODT)
#    * string ACCT_ODT = acct_odt
   * print "Account Open Date is", acct_odt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")

#Pavani:Added Study End date insertion for SPSP Loan Repay campaign
  @StudyEndDate_Insertion_ACCT_DIM_Sheet
  Scenario: Insert Study End Date in ACCT_DIM sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",studyEndDate,"STUDY_END_DT")

  @CardRenewalDate_Insertion_ACCT_DIM_Sheet
  Scenario: Insert Card Renewal Date in ACCT_DIM sheet
     # Convert the Card renewal date to YYYY-MM-DD format
    * string card_renewal_Dt = CRD_RENEWAL_DT == 'NULL'? 'NULL': futureDateInDays(CRD_RENEWAL_DT)
    * print "card renewal Date is", card_renewal_Dt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",card_renewal_Dt,"CRD_RENEWAL_DT")

  @CID_Insertion_Count2_CUST_DIM_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
     # insert the created CID into the NOVA Testdata excel sheet
    * def CID = cid
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",CID,"CIS_CUST_ID")


  @DOB_Insertion_CUST_DIM_Sheet
  Scenario: write customer DOB details in excel CUST_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",date,"CUST_AGE")

  @CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer CID details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")


#Pavani: Added for VisaDebitandInterac campaign

#Insert Last_Flash_Txn_Dt into cust_acct_rltnp_dim sheet
  @Last_Flash_Txn_DT_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer Last Flash Txn dt details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the Last Flash Txn dt into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",LastFlashtxn,"LAST_FLASH_TXN_DT")

  #Insert Last_chip_Txn_tmstmp into cust_acct_rltnp_dim sheet
  @Last_chip_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer last chip txn tmstmp details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the last chip txn tmstmp into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",lastchiptxntmstmp,"LAST_CHIP_TXN_TMSTMP")

  #Insert Last_VPOS_Txn_tmstmp into cust_acct_rltnp_dim sheet
  @Last_VPOS_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer last VPOS txn tmstmp details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the last VPOS txn tmstmp into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",LastVPOSTxntmstp,"LAST_VD_VPOS_TXN_TMSTMP")


  #Insert Last_OPOS_Txn_tmstmp into cust_acct_rltnp_dim sheet
  @Last_OPOS_Txn_TMSTMP_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer last OPOS txn tmstmp details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the last OPOS txn tmstmp into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",LastOPOSTxntmstp,"LAST_VD_OPOS_TXN_TMSTMP")

  @cash_BR_withdraw_tmstmp_Insertion_ACCT_DIM_Sheet
  Scenario: write customer cash branch withdrawal tmstmp in excel ACCT_DIM sheet
  # insert the cash branch withdrawal tmstmp into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",cashwithdrawaltmstmp,"LAST_CASH_BR_WITHDRAWAL_TMSTMP")

  @cash_ABM_withdraw_tmstmp_Insertion_ACCT_DIM_Sheet
  Scenario: write customer cash ABM withdrawal tmstmp in excel ACCT_DIM sheet
   # insert the cash ABM withdrawal tmstmp into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",cashabmwithdrawaltmstmp,"LAST_CASH_ABM_WITHDRAWAL_TMSTMP")


  @CID_Insertion_PA_CCUL_CUSTOMER_Sheet
  Scenario: write customer CID details in excel PA_CCUL_CUSTOMER sheet
  # insert the created CID into the PA_CCUL_CUSTOMER  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER",karate.get(CID),"CIS_CUST_ID")

  @CID_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(CID),"CIS_CUST_ID")

  @ACCT_NUM_Insertion_CUSTINSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",acct_num,"ACCT_NUM")

  @CURR_VAL_UPDT_TIMESTAMP_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(curr_val_tp),"CURR_VAL_UPDT_TMSTMP")

  @ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer account number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def acct_num = accountNumber
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")

  @InsureDate_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer account number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def INSUR_DT = INSUR_STAT_LAST_CHNG_DT
  # insert the created INSUR_DT into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",INSUR_DT,"INSUR_STAT_LAST_CHNG_DT")

  @ACCT_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write customer account number in excel ACCT_DIM sheet
    * def acct_num = accountNumber
      # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")

  @EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write EVENT_DATE  in excel CUST_INSIGHTS sheet
    * def eventDate = event_date
      # insert the created eventDate into the CUST_INSIGHTS excel sheet under EVENT_DATE column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",eventDate,"EVENT_DATE")

  @CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet
  Scenario: Write CURR Value Update Timestamp Value in excel CUST_INSIGHTS Sheet
    * def curr_val_upd_tmpst =   writeDateWithTimeStamp()
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",curr_val_upd_tmpst,"CURR_VAL_UPDT_TMSTMP")


  @ACCT_Num_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer account number details in excel CUST_INSIGHTS sheet
    * def acct_num_CustInsights = accountNumber
  # insert the created acct_num into the CUST_INSIGHTS excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",acct_num_CustInsights,"ACCT_NUM")


  @CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet
  Scenario: write customer offer expiry date details in excel ACCT_DIM sheet
  # insert offer start date into the ACCT_DIM Testdata excel sheet
#    * def OFFR_EXP_DT  = offerExpiryDate
#    * print "Offer expirydate is ", OFFR_EXP_DT
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",offerExpiryDate,"CLI_OFR_EXP_DT")

  @CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet
  Scenario: write customer offer start date details in excel ACCT_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
#    * def OFFR_ST_DT  = offerStartDate
#    * print "Offer start date is ", OFFR_ST_DT
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",offerStartDate,"CLI_OFR_ST_DT")

  @CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet
  Scenario: write secondary customer id details in excel ACCT_DIM sheet
  # insert secondary cid into the ACCT_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",secondaryCid,"CC_SCNRY_CUST_ID")

  @SOL_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer SOL last login date details in excel ACCT_DIM sheet
      * string solLastLoginDate = SOL_LAST_LOGIN_DT == 'NULL'? 'NULL': dateFormatExcludeDays(SOL_LAST_LOGIN_DT)
    * print "SOl last Login date is:",solLastLoginDate
    # insert the SOL last login date inF to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",solLastLoginDate,"SOL_LAST_LOGIN_DT")

  @MOB_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer MOB last login date details in excel ACCT_DIM sheet

    * string mobLastLoginDate = MOB_LAST_LOGIN_DT == 'NULL'? 'NULL': dateFormatExcludeDays(MOB_LAST_LOGIN_DT)
    * print "MOB last Login date is:",mobLastLoginDate
    # insert the MOB last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mobLastLoginDate,"MOB_LAST_LOGIN_DT")

  @SCD_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write Scotia Card number in excel ACCT_DIM sheet
    * def scd_num = ScotiaCardNumber
        # insert the created scd_num into the ACCT_DIM  excel sheunder SCD_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",scd_num,"SCD_NUM")

  @CR_CRD_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write Credit Card number in excel ACCT_DIM sheet
    * def credit_num = CreditCardNumber
        # insert the created credit card_num into the ACCT_DIM  excel sheunder CR_CRD_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",credit_num,"CR_CRD_NUM")

  @MAT_DT_Insertion_ACCT_DIM_Sheet
  Scenario: write MAT_DT details in excel ACCT_DIM sheet
     # Generate Mortgage Renewal dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the mortgage maturity date to YYYY-MM-DD format
   * string maturityDate = MAT_DT == 'NULL'? 'NULL': futureDateInDays(MAT_DT)
   * print "Mortgage renewal Date is", maturityDate
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",maturityDate,"MAT_DT")

  @ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet
  Scenario: write ACCT_CRFC_NUM  details in excel ACCT_DIM sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",CERT,"ACCT_CRFC_NUM")

  @Mort_Find_DATE_Insertion_ACCT_DIM_Sheet
  Scenario: write Mortgage Find date details in excel ACCT_DIM sheet
        # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format
#    * string  = MORT_FNDNG_DT
    * string Mort_Find_Dt = MORT_FNDNG_DT == 'NULL'? 'NULL': dateFormatExcludeDays(MORT_FNDNG_DT)
    * print "Mortgage Finding Date is", Mort_Find_Dt
  # insert the created MORTGAGE FIND dATE into the ACCT_DIM  excel sheet under MORT_FNDNG_DT column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",Mort_Find_Dt,"MORT_FNDNG_DT")

  @CUST_DIM_Insertion_Database
  Scenario: Insert customer information details in CUST_DIM table
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"CUST_DIM")
    * def cust_DimInsrt =  insertRows(cust_dim_querybuilder)


  @CUST_ACCT_RLTNP_DIM_Insertion_Database
  Scenario: Insert customer and account details in CUST_ACCT_RLTNP_DIM table
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  insertRows(cust_acct_rltnp_querybuilder)

  @ACCT_DIM_Insertion_Database
  Scenario: Insert customer account details in ACCT_DIM table
#    * def acct_num = accountNumber
#    * print "Account number is " +acct_num
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * print "data record is" + dataAcctDim
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"ACCT_DIM")
    * def acct_DimInsrt =  insertRows(acct_dim_querybuilder)

  @CUST_INSIGHTS_Insertion_Database
  Scenario: Insert customer information details in CUST_INSIGHTS table
    * def dataCustInsights = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_INSIGHTS")
    * string cust_insights_querybuilder = QueryBuilderForCustInsights(dataCustInsights,"CUST_INSIGHTS")
    * def cust_InsightsInsrt =  insertRows(cust_insights_querybuilder)

  @PA_CCUL_CUSTOMER_Insertion_Database
  Scenario: Insert customer information details in PA_CCUL_CUSTOMER table
    * def dataPACCULCustomer = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER")
    * string pa_ccul_customer_querybuilder = QueryBuilderForCustInsights(dataPACCULCustomer,"PA_CCUL_CUSTOMER")
    * def pa_ccul_customerInsrt =  insertRows(pa_ccul_customer_querybuilder)

  @PreApprovedStartDt_Insertion_PA_CCUL_CUSTOMER_Sheet
  Scenario: write preapproved Start Date details in excel PA_CCUL_CUSTOMER sheet
  # insert the created CID into the PA_CCUL_CUSTOMER  excel sheet under CIS_CUST_ID column
    * string Preapp_st_dt = PREAPPROVE_ST_DT == 'NULL'? 'NULL': dateFormatExcludeDays(PREAPPROVE_ST_DT)
    * print "Preapproved Start date is", Preapp_st_dt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER",Preapp_st_dt,"PRIMARY_PREAPPROVED_START_DATE")

  @PreApprovedEndDt_Insertion_PA_CCUL_CUSTOMER_Sheet
  Scenario: write Preapproved End date details in excel PA_CCUL_CUSTOMER sheet
  # insert the created CID into the PA_CCUL_CUSTOMER  excel sheet under CIS_CUST_ID column
    * string Preapp_end_dt = PREAPPROVE_END_DT == 'NULL'? 'NULL': futureDateInDays(PREAPPROVE_END_DT)
    * print "Preapproved End date is", Preapp_end_dt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER",Preapp_end_dt,"PRIMARY_PREAPPROVED_END_DATE")


    ## Added to input columns to External Input table -March 2023 release

  @CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the NOVA Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"EXTERNAL_INPUT_FILE_LAYOUT",karate.get(CID),"CIS_CUST_ID")


  @VALID_START_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet
  Scenario: write VALID Start Date details in excel EXTERNAL_INPUT_FILE_LAYOUT sheet
     # Generate Valid Start dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Valid Start date to YYYY-MM-DD format
    * string validstartdate = VALID_START_DATE == 'NULL'? 'NULL': dateFormatExcludeDays(VALID_START_DATE)
    * print "Valid Start Date is", validstartDate
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"EXTERNAL_INPUT_FILE_LAYOUT",validstartdate,"VALID_START_DATE")

  @VALID_END_DATE_EXTERNAL_INPUT_FILE_LAYOUT_Sheet
  Scenario: write Valid End date details in excel EXTERNAL_INPUT_FILE_LAYOUT sheet
     # Generate Valid End dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Valid End date to YYYY-MM-DD format
    * string validenddate = VALID_START_DATE == 'NULL'? 'NULL': dateFormatExcludeDays(VALID_END_DATE)
    * print "Valid End Date is", validenddate
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"EXTERNAL_INPUT_FILE_LAYOUT",validenddate,"VALID_END_DATE")

  @EXTERNAL_INPUT_FILE_LAYOUT_Insertion_Database
  Scenario: Insert customer information details in EXTERNAL_INPUT_FILE_LAYOUT table
    * def dataExternalInput = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"EXTERNAL_INPUT_FILE_LAYOUT")
    * string ExternalInput_querybuilder = QueryBuilderForExternalInput(dataExternalInput,"EXTERNAL_INPUT_FILE_LAYOUT")
    * def ExternalInput_Insrt =  insertRows(ExternalInput_querybuilder)


  @reportDbRecords
  Scenario: Report DB records
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)
    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)
    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)


  @reportDbRecordsForCI
  Scenario: Report DB records For with cust_insights
    * def cust_insightsTableData = readDbRows("Select * from "+dbSchema+".CUST_INSIGHTS where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST INSIGHTS Database table data******'+karate.pretty(cust_insightsTableData)

  @reportDbRecordsForPAULOC
  Scenario: Report DB records For PA ULOC Campaign
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)
    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)
    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)
    * def cust_insightsTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST INSIGHTS Database table data******'+karate.pretty(cust_insightsTableData)

#    * def pa_ccul_customer_TableData = readDbRow("Select * from "+dbSchema+".PA_CCUL_CUSTOMER where CIS_CUST_ID='"+karate.get(cid)+"'")
#    * print '******PA_CCUL_CUSTOMER Database table data******'+karate.pretty(pa_ccul_customer_TableData)


  @NOVA_REST_CALL
  Scenario: Generate GET Interaction REST call for NOVA
    #    Building GET Interaction Request Body
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ContextType1$ = karate.get('$data.ContextType1')
    * replace requestfile.$ContextValue1$ = karate.get('$data.ContextValue1')
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
    * replace requestfile.$InteractionType$ = karate.get('$data.InteractionType')
    * replace requestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope$ = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID$ = karate.get('$data.RequestID')
    * print 'Request JSON'+requestfile

  @NOVA_REST_CALL_AfterDisposition
  Scenario: Generate GET NBA REST call for NOVA after disposition
     #    Building GET NBA Request Body after disposition
    * def afterDispositionRequestfile = read('classpath:channels/nova/ChannelNOVA.txt')
    #    Building GET Interaction Request Body
    * replace afterDispositionRequestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace afterDispositionRequestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace afterDispositionRequestfile.$ContextType1$ = karate.get('$data.ContextType1')
    * replace afterDispositionRequestfile.$ContextValue1$ = karate.get('$data.ContextValue1')
    * replace afterDispositionRequestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace afterDispositionRequestfile.$ID$ = karate.get('$data.ID')
    * replace afterDispositionRequestfile.$IDType$ = karate.get('$data.IDType')
    * replace afterDispositionRequestfile.$InteractionType$ = karate.get('$data.InteractionType')
    * replace afterDispositionRequestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace afterDispositionRequestfile.$LeadScope$ = karate.get('$data.LeadScopeDisposition')
    * replace afterDispositionRequestfile.$RequestID$ = karate.get('$data.RequestID')
    * print 'Request JSON'+afterDispositionRequestfile


  @NOVA_Disposition_REST_CALL
  Scenario: Generate GET NBA SOAP call for NOVA
    Given url 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/disposition'
    * def headersData = { ContentType: 'text/xml', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData
     #    Building Disposition Request Body
    * replace dispositionfile.$channel_code$ = karate.get('$data.ChannelCode')
    * replace dispositionfile.$id_type$ = karate.get('$data.IDType')
    * replace dispositionfile.$id_value$ = karate.get('$data.ID')
    * replace dispositionfile.$request_id$ = karate.get('$data.RequestID')
    * replace dispositionfile.$response_code$ = karate.get('$data.ResponseCode')
    * replace dispositionfile.$zone_code$ = karate.get('$data.ContextValue')
    * replace dispositionfile.$response_tracking_code$ = karate.get('responseTrackingCode_JSON')
#    request (Karate keyword) for sending request string
    When request dispositionfile
    * print '***************Disposition Request*************'+karate.pretty(dispositionfile)
  #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseDispositionString = response
  #    Printing Disposition response body in console
    * print '***************Disposition Response*************'+karate.pretty(responseDispositionString)

  @AS400_CrossChannel_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for AS400
    Given url 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL'
    * def headersData = { ContentType: 'text/xml', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData

    #    Building GET NBA Request Body after disposition
    * def crossChannelRequestfile = read('classpath:channels/as400/Channel AS400.txt')
    * replace crossChannelRequestfile.$ChannelCode$ = karate.get('$data.ChannelCode_AS400')
    * replace crossChannelRequestfile.$ContextType$ = karate.get('$data.ContextType_AS400')
    * replace crossChannelRequestfile.$ContextValue$ = karate.get('$data.ContextValue_AS400')
    * replace crossChannelRequestfile.$ID$ = karate.get('$data.ID')
    * replace crossChannelRequestfile.$IDType$ = karate.get('$data.IDType')
    * replace crossChannelRequestfile.$LanguageCode$ = karate.get('$data.LanguageCode_AS400')
    * replace crossChannelRequestfile.$LeadScope$ = karate.get('$data.LeadScope_AS400')
    * replace crossChannelRequestfile.$RequestID$ = karate.get('$data.RequestID_AS400')
    * print 'Request XML after disposition'+crossChannelRequestfile
    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request crossChannelRequestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def crossChannelResponseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(crossChannelResponseString)

  @SOL_CrossChannel_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for NOVA
    Given url 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL'
    * def headersData = { ContentType: 'text/xml', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData
#    #    Building GET NBA Request Body after disposition
    * def crossChannelRequestfileSOL = read('classpath:channels/nova/ChannelSOL.txt')
    * replace crossChannelRequestfileSOL.$ChannelCode$ = karate.get('$data.ChannelCode_SOL')
    * replace crossChannelRequestfileSOL.$ContextType$ = karate.get('$data.ContextType_SOL')
    * replace crossChannelRequestfileSOL.$ContextValue$ = karate.get('$data.ContextValue_SOL')
    * replace crossChannelRequestfileSOL.$ID$ = karate.get('$data.ID')
    * replace crossChannelRequestfileSOL.$IDType$ = karate.get('$data.IDType')
    * replace crossChannelRequestfileSOL.$LanguageCode$ = karate.get('$data.LanguageCode_SOL')
    * replace crossChannelRequestfileSOL.$LeadScope$ = karate.get('$data.LeadScope_SOL')
    * replace crossChannelRequestfileSOL.$RequestID$ = karate.get('$data.RequestID_SOL')
    * replace crossChannelRequestfileSOL.$Additional1$ = karate.get('$data.Additional1_SOL')
    * replace crossChannelRequestfileSOL.$Additional2$ = karate.get('$data.Additional2_SOL')
    * print 'Request XML after disposition'+crossChannelRequestfileSOL
    # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request crossChannelRequestfileSOL
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def crossChannelResponseStringSOL = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(crossChannelResponseStringSOL)

  @ContextualOfferValidation
  Scenario: Validate offer details for contextual offer
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    #    Verifying Customer Relevance with JSON and Proposition sheet
    * def customerRelevance_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

     #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

  #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

  #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

#    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));


     # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCode_JSON==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,zoneCodes_Proposition));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

#  Verifying Current Account Name with JSON and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataPath,"CLI_ProductFamily_Name.xlsx","Accounts")
#    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'CurrentAccountName')
    * eval if(currentAccountName_JSON==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_MappingSheet));

#  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

    #    Verifying PrimaryProductServiceCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

    #    Verifying PrimaryProductServiceSubCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==PrimaryProductServiceSubCode_Proposition?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON,PrimaryProductServiceSubCode_Proposition));

#    Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

#  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'


#  @LatestContextualOfferValidation
#  Scenario: Validate offer details for contextual offer
#    # Report database records in cucumber report
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#
#    #    Verifying CID with XML and Conditioned NOVA Sheet
#    * def id_JSON = karate.jsonPath(responseString,"$.cid")
#    * def id_Excel = cid
#    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
#
#    # Verifying NBA Number with JSON and Proposition sheet
#    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
#    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
#    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));
#
#    # Verifying NBA Name with JSON and Proposition sheet
#    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
#    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
#    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));
#
#    #    Verifying Offer start date with XML and Proposition Sheet
#    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
#    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
#    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));
#
#
#	#    Verifying Viewed Status with JSON and Hard Coded
#    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
#    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
#    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));
#
#    # Verifying Creative Id with JSON and NOVA sheet
#    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
#    * def creativeId_NOVASheet = karate.get('data.CreativeId')
#    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));
#
#    # Verifying Zone Code with JSON and Proposition sheet
#    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
#    * def listOfZoneCodes = 'MMC,'
#    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));
#
#      # Verifying Campaign Name with XML and Hard coded
#    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
#    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
#    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));
#
#    # Verifying Offer expiry date with XML and Proposition sheet
#    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
#    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
#    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));
#
#	# Verifying Response Tracking Code  XML should not be null
#    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
#    * match responseTrackingCode_JSON == '#notnull'
#
#	# Verifying Offer Type with JSON and Proposition sheet
#    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
#    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
#    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));
#
#
#	# Verifying PY Name with JSON and Proposition sheet
#    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
#    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
#    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));
#
#	# Verifying Offer Name with JSON and Proposition sheet
#    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
#    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
#    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));
#
#	# Verifying OfferDescription with JSON and Proposition sheet
#    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
#    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
#    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));
#
#    # Verifying Campaign Code with JSON and Proposition sheet
#    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
#    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
#    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));
#
#
#    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
#    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
#    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));
#
#    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
#    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
#    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));
#
#    # Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
#    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
#    * def customerTitle_Database = trimString(readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
#    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

  @SSMSpecificOfferValidation
  Scenario: Validate offer details for SSM contextual offer

   # Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_JSON?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_JSON,offerInstanceId_Proposition));

    #  Verifying Cust_Relevance with JSON and Proposition sheet
    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));

    #    Verifying primary_product_features with JSON and Proposition sheet
    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

    # Verifying offer_condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_JSON):printFailedResult('Offer Condition ',offerCondition_JSON,offerCondition_Proposition));

  @D2DXSellOfferValidation
  Scenario: Validate offer details for D2D Cross sell contextual offer
    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    #    Verifying CID with JSON and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * print "id_JSON is", id_JSON
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * print "nbaNumber_JSON is", nbaNumber_JSON
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


	#    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

	# Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

	# Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));


	# Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


	# Verifying Offer Name with JSON and Proposition sheet
    * def OfferTitle_DS = karate.get('data.OfferTitle')
    * print 'OfferTitle is:' + OfferTitle_DS
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(OfferTitle_DS.length==0?(offerName_JSON==offerName_Proposition? printPassedResult('Offer Title',offerName_JSON): printFailedResult('Offer Title',offerName_JSON,offerName_Proposition)):(offerName_JSON==OfferTitle_DS? printPassedResult('Offer Title',offerName_JSON): printFailedResult('Offer Title',offerName_JSON,OfferTitle_DS)));


	# Verifying OfferDescription with JSON and Proposition sheet
    * def OfferDesc_DS = karate.get('data.OfferDescription')
    * print "Offer Description from sheet is :" + OfferDesc_DS
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * print 'offerDescription_Proposition is' +offerDescription_Proposition
    * eval if(OfferDesc_DS.length==0?(offerDescription_JSON==offerDescription_Proposition? printPassedResult('Offer Description',offerDescription_JSON): printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition)):(offerDescription_JSON==OfferDesc_DS? printPassedResult('Offer Description',offerDescription_JSON): printFailedResult('Offer Description',offerDescription_JSON,OfferDesc_DS)));



# Verifying Bonus Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def bonusinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bonus_interest_rate')].data_value")[0]
    * def bonusinterestrate_proposition = karate.get('data.DSS_bonusinterest')
    * eval if(bonusinterestrate_JSON==bonusinterestrate_proposition?printPassedResult('Bonus Interest Rate Value ',bonusinterestrate_JSON):printFailedResult('Bonus interest Rate Data Value ',bonusinterestrate_JSON,bonusinterestrate_proposition));

    #  Verifying Ultimate Upto Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def uptointerestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'ultimate_upto_rate')].data_value")[0]
    * def uptointerestrate_proposition = karate.get('data.DSS_uptointerest')
    * eval if(uptointerestrate_JSON==uptointerestrate_proposition?printPassedResult('Upto Interest Rate Value ',uptointerestrate_JSON):printFailedResult('Upto interest Rate Data Value ',uptointerestrate_JSON,uptointerestrate_proposition));

#   Verifying Preferred Upto Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def Preferreduptointerestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'preferred_upto_rate')].data_value")[0]
    * def Preferreduptointerestrate_proposition = karate.get('data.DSS_Preferred_uptorate')
    * eval if(Preferreduptointerestrate_JSON==Preferreduptointerestrate_proposition?printPassedResult('Preferred Interest Rate Value ',Preferreduptointerestrate_JSON):printFailedResult('Preferred interest Rate Data Value ',Preferreduptointerestrate_JSON,Preferreduptointerestrate_proposition));


    #  Verifying Offer Months with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_months_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_months')].data_value")[0]
    * def offer_duration_months_proposition = karate.get('data.DSS_offermonths')
    * eval if(offer_duration_months_JSON==offer_duration_months_proposition?printPassedResult('Offer Duration Months Value ',offer_duration_months_JSON):printFailedResult('Offer Duration Months Data Value ',offer_duration_months_JSON,offer_duration_months_proposition));


    #  Verifying regular Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_regularinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'regular_interest_rate')].data_value")[0]
    * def offer_regularinterestrate_proposition = karate.get('data.DSS_regularinterestrate')
    * eval if(offer_regularinterestrate_JSON==offer_regularinterestrate_proposition?printPassedResult('Offer regular interest rate Value ',offer_regularinterestrate_JSON):printFailedResult('Offer regular interest rate Data Value ',offer_regularinterestrate_JSON,offer_regularinterestrate_proposition));

    #  Verifying premium period interest rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_premiuminterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'premium_period_interest_rate')].data_value")[0]
    * def offer_premiuminterestrate_proposition = karate.get('data.DSS_premiumperiodinterestrate')
    * eval if(offer_premiuminterestrate_JSON==offer_premiuminterestrate_proposition?printPassedResult('Offer premium interest rate Value ',offer_premiuminterestrate_JSON):printFailedResult('Offer premium interest rate Data Value ',offer_premiuminterestrate_JSON,offer_premiuminterestrate_proposition));

    #  Verifying Offer Days with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_days_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_days')].data_value")[0]
    * def offer_duration_days_proposition = karate.get('data.DSS_offerdays')
    * eval if(offer_duration_days_JSON==offer_duration_days_proposition?printPassedResult('Offer Duration days Value ',offer_duration_days_JSON):printFailedResult('Offer Duration days Data Value ',offer_duration_days_JSON,offer_duration_days_proposition));

#  Verifying Mass Start Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_start_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_start_date')].data_value")[0]
    * def offer_mass_offer_start_date_proposition = karate.get('data.DSS_massofferstartdate')
    * eval if(offer_mass_offer_start_date_JSON==offer_mass_offer_start_date_proposition?printPassedResult('Offer mass_offer_start_date Value ',offer_mass_offer_start_date_JSON):printFailedResult('Offer mass_offer_start_date Data Value ',offer_mass_offer_start_date_JSON,offer_mass_offer_start_date_proposition));


    #  Verifying Mass End Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_end_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_end_date')].data_value")[0]
    * def offer_mass_offer_end_date_proposition = karate.get('data.DSS_massofferenddate')
    * eval if(offer_mass_offer_end_date_JSON==offer_mass_offer_end_date_proposition?printPassedResult('Offer mass_offer_end_date Value ',offer_mass_offer_end_date_JSON):printFailedResult('Offer mass_offer_end_date Data Value ',offer_mass_offer_end_date_JSON,offer_mass_offer_end_date_proposition));


    # Verifying Creative Id with JSON and NOVA sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def randSplit = 0
    * eval if (creativeId_NOVASheet.length > 10?randSplit = chooseCreative(creativeId_JSON,creativeId_NOVASheet,'|'):randSplit = creativeId_NOVASheet);
    * eval if(creativeId_JSON==randSplit?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));


# Verifying Offer primary_product_service_code data value
    * def primProductServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string expectedPrimaryProdSerCode = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primProductServiceCode_JSON==expectedPrimaryProdSerCode?printPassedResult('Primary product Service Code Value ',primProductServiceCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primProductServiceCode_JSON,expectedPrimaryProdSerCode));

	# Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));


    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));


    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

  @ItradeXsellAlwaysOnOfferValidation
  Scenario: Validate offer details for ItradeXsell AlwaysOn offer
    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    #    Verifying CID with JSON and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * print "id_JSON is", id_JSON
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * print "nbaNumber_JSON is", nbaNumber_JSON
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

#    #    Verifying Offer start date with XML and Proposition Sheet
#    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
#    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
#    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));
#    # Verifying Zone Code with JSON and Proposition sheet
#    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
#    * def listOfZoneCodes = 'MMC,'
#    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

	# Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

	# Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

	# Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

#	# Verifying Offer Name with JSON and Proposition sheet
#    * def OfferTitle_DS = karate.get('data.OfferTitle')
#    * print 'OfferTitle is:' + OfferTitle_DS
#    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
#    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
#    * eval if(OfferTitle_DS.length==0?(offerName_JSON==offerName_Proposition? printPassedResult('Offer Title',offerName_JSON): printFailedResult('Offer Title',offerName_JSON,offerName_Proposition)):(offerName_JSON==OfferTitle_DS? printPassedResult('Offer Title',offerName_JSON): printFailedResult('Offer Title',offerName_JSON,OfferTitle_DS)));

#	# Verifying OfferDescription with JSON and Proposition sheet
#    * def OfferDesc_DS = karate.get('data.OfferDescription')
#    * print "Offer Description from sheet is :" + OfferDesc_DS
#    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
#    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
#    * print 'offerDescription_Proposition is' +offerDescription_Proposition
#    * eval if(OfferDesc_DS.length==0?(offerDescription_JSON==offerDescription_Proposition? printPassedResult('Offer Description',offerDescription_JSON): printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition)):(offerDescription_JSON==OfferDesc_DS? printPassedResult('Offer Description',offerDescription_JSON): printFailedResult('Offer Description',offerDescription_JSON,OfferDesc_DS)));

    # Verifying Creative Id with JSON and NOVA sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def randSplit = 0
    * eval if (creativeId_NOVASheet.length > 10?randSplit = chooseCreative(creativeId_JSON,creativeId_NOVASheet,'|'):randSplit = creativeId_NOVASheet);
    * eval if(creativeId_JSON==randSplit?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));


    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));


  @LatestContextualOfferValidation
  Scenario: Validate offer details for contextual offer
#    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
#    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForCI')

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


	#    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Creative Id with JSON and NOVA sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


	# Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

	# Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));


	# Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

	# Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

	# Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));


    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * string customerFullName_Database = ''
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
    * print "Customer Full Name concatenated is:"+customerFullName_Database
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB=='' || cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

  @DispositionOfferValidationWithIH
  Scenario: Validate disposition offer details with IH
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * print '**** Validation of IH Disposition '+dispositionCode+' Record***'

    #    Verifying pySubjectID with Excel and IH
    * def pySubjectID_ExcelTestData = cid
    * def pySubjectID_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pySubjectID")[0]
    * eval if(pySubjectID_ExcelTestData==pySubjectID_IH?printPassedResult('pySubjectID',pySubjectID_IH):printFailedResult('pySubjectID',pySubjectID_IH,pySubjectID_ExcelTestData));

#    Verifying Issue with Proposition and IH
    * def issue_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyIssue')
    * def issue_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Issue")[0]
    * eval if(issue_Proposition==issue_IH?printPassedResult('Issue',issue_IH):printFailedResult('Issue',issue_IH,issue_Proposition));

    #    Verifying Group with Proposition and IH
    * def group_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyGroup')
    * def group_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Group")[0]
    * eval if(group_Proposition==group_IH?printPassedResult('Group',group_IH):printFailedResult('Group',group_IH,group_Proposition));

 #    Verifying  Proposition name with Proposition and IH
    * def propositionName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName')
    * def propositionName_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Proposition name']")[0]
    * eval if(propositionName_Proposition==propositionName_IH?printPassedResult('Proposition Name',propositionName_IH):printFailedResult('Proposition Name',propositionName_IH,propositionName_Proposition));

#    Verifying  Direction name with Hard coded value and IH
    * def direction_Hardcoded = 'Inbound'
    * def direction_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Direction")[0]
    * eval if(direction_Hardcoded==direction_IH?printPassedResult('Direction',direction_IH):printFailedResult('Direction',direction_IH,direction_Hardcoded));

#    Verifying  Channel name with Excel (NOVA Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

     #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_IH,offeredOn_TodaysDate));


    #    Verifying  Out come with Hard coded value and IH
    * def outCome_ExcelTestData = karate.get('$data.ChannelOutcome')
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Outcome")[0]
    * eval if(outCome_ExcelTestData==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_ExcelTestData));

#    Verifying  Channel Outcome(only for Disposition test case) with Excel (NOVA Input sheet) and IH
    * def channelOutcome_ExcelTestData = karate.get('$data.ResponseCode')
    * def channelOutcome_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Channel Outcome']")[0]
    * eval if(channelOutcome_ExcelTestData==channelOutcome_IH?printPassedResult('Channel Outcome',channelOutcome_IH):printFailedResult('Channel Outcome',channelOutcome_IH,channelOutcome_ExcelTestData));


    #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_NOVASheet,creativeId_IH));

     #    Verifying  Operator with NOVA Excel sheet and IH
    * def operator_NOVASheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Operator")[0]
    * eval if(operator_NOVASheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_NOVASheet));

#         #    Verifying  Category with Hard coded (BAU)  and IH
#    * def category_HardCoded = 'BAU'
#    * def category_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyCategory")[0]
#    * eval if(category_HardCoded==category_IH?printPassedResult('Category',category_HardCoded):printFailedResult('Category',category_IH,category_HardCoded));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

#    Verifying  Persistence Days with Proposition and IH
    * def persistenceDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PersistenceDays')
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Persistence Days']")[0]
    * eval if(persistenceDays_Proposition==persistenceDays_IH?printPassedResult('Persistence Days',persistenceDays_IH):printFailedResult('Persistence Days',persistenceDays_IH,persistenceDays_Proposition));

#    Verifying Rest Period Days with Proposition and IH
    * def restPeriodDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'RestPeriodDays')
    * def restPeriodDays_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Rest Period Days']")[0]
    * eval if(restPeriodDays_Proposition==restPeriodDays_IH?printPassedResult('Rest Period Days',restPeriodDays_IH):printFailedResult('Rest Period Days',restPeriodDays_IH,restPeriodDays_Proposition));

#    Verifying Campaign code with Proposition and IH
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * def campaignCode_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Campaign Code']")[0]
    * eval if(campaignCode_Proposition==campaignCode_IH?printPassedResult('Campaign code',campaignCode_IH):printFailedResult('Campaign code',campaignCode_IH,campaignCode_Proposition));

  @fetchIHRows
  Scenario: Fetch activity rows recorded in IH
#    Fetch offer activity records from IH
    * json ihRecord = getIhRecords(cid)
    * print '**** IH Offer Records***'+karate.pretty(ihRecord)

  @MPSAWelcomeBonusSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to MPSA Welcome Bonus)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(((creativeId_IH==creativeId_NOVASheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_NOVASheet));

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

  #    Verifying  Reference Number with DB value casl consent and iH
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def casl_consent = karate.get('dataCustDim.CASL_CONSENT_F')
    * def referenceNumber_DB = ''
    * eval if(casl_consent=="Y"?(referenceNumber_DB="CASL_CONSENT_Y"):(referenceNumber_DB="CASL_CONSENT_N"));
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DB==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DB));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @SSMInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to SSM Always On)
    * string outcome = <outcome>
        #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

   #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @ULOCInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to ULOC insurance)
    * string outcome = <outcome>

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  cell Group with NOVA Sheet
    * def cellGroup_NOVASheet = karate.get('data.CellGroup')
    * print "Nova sheet Cell Group" + cellGroup_NOVASheet
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_NOVASheet==CellGroup_IH?printPassedResult('Cell Group',cellGroup_NOVASheet):printFailedResult('Cell Group',CellGroup_IH,cellGroup_NOVASheet));

   #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

@NTBAdvicePlusSpecificElementsIH
Scenario Outline: Validate offer details with IH (Specific to NTB Advice Plus)
  * string outcome = <outcome>

   #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

  #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
  * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
  * def accountNumber_acctDimExcelTestData = acct_num
  * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
  * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
   #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
  * string CASL_CONSENT_F_Database = trimString(readValue("SELECT CASL_CONSENT_F FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
  * string referenceNumber_DB = "CASL_CONSENT_"+CASL_CONSENT_F_Database
  * print "Casl consent to compare against is :" +referenceNumber_DB
  * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
  * eval if(referenceNumber_DB==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DB));


  Examples:
    | outcome |
    | "IPT"   |
    | "PST"   |

  @InsuranceReminderSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to insurance Reminder)
    * string outcome = <outcome>

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

#    #  Verifying Offer Instance Id with Proposition and IH
#    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
#    * def offerInstanceId_Proposition = '0'+offerCodeValue
#    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
#    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  cell Group with NOVA Sheet
    * def cellGroup_NOVASheet = karate.get('data.CellGroup')
    * print "Nova sheet Cell Group" + cellGroup_NOVASheet
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_NOVASheet==CellGroup_IH?printPassedResult('Cell Group',cellGroup_NOVASheet):printFailedResult('Cell Group',CellGroup_IH,cellGroup_NOVASheet));

   #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @CrossChannelDispositionOfferValidationWithIH
  Scenario: Validate cross channel disposition offer details with IH
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    * print '**** Validation of IH Disposition'+dispositionCode+' Record***'
    * string outcome = 'PST'
    #    Verifying pySubjectID with Excel and IH
    * def pySubjectID_ExcelTestData = cid
    * def pySubjectID_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].pySubjectID")[0]
    * eval if(pySubjectID_ExcelTestData==pySubjectID_IH?printPassedResult('pySubjectID',pySubjectID_IH):printFailedResult('pySubjectID',pySubjectID_IH,pySubjectID_ExcelTestData));

#    Verifying Issue with Proposition and IH
    * def issue_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyIssue')
    * def issue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Issue")[0]
    * eval if(issue_Proposition==issue_IH?printPassedResult('Issue',issue_IH):printFailedResult('Issue',issue_IH,issue_Proposition));

    #    Verifying Group with Proposition and IH
    * def group_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyGroup')
    * def group_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Group")[0]
    * eval if(group_Proposition==group_IH?printPassedResult('Group',group_IH):printFailedResult('Group',group_IH,group_Proposition));

 #    Verifying  Proposition name with Proposition and IH
    * def propositionName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName')
    * def propositionName_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Proposition name']")[0]
    * eval if(propositionName_Proposition==propositionName_IH?printPassedResult('Proposition Name',propositionName_IH):printFailedResult('Proposition Name',propositionName_IH,propositionName_Proposition));

#    Verifying  Direction name with Hard coded value and IH
    * def direction_Hardcoded = 'Inbound'
    * def direction_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Direction")[0]
    * eval if(direction_Hardcoded==direction_IH?printPassedResult('Direction',direction_IH):printFailedResult('Direction',direction_IH,direction_Hardcoded));

#    Verifying  Channel name with Excel (NOVA Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode_AS400') == 'CSE' ? karate.get('$data.ChannelCode_AS400') : karate.get('$data.ChannelCode_SOL')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

    #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_TodaysDate,offeredOn_IH));

    #    Verifying  Out come with Hard coded value and IH
    * def outCome_HardCoded = outcome
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Outcome")[0]
    * eval if(outCome_HardCoded==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_HardCoded));


    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = karate.get('$data.ChannelCode_AS400') == 'CSE' ? 'CSE' : 'SMC,'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Operator with NOVA Excel sheet and IH
    * def operator_As400Sheet = karate.get('$data.ChannelCode_AS400') == 'CSE' ? karate.get('$data.RequestID_AS400') : karate.get('$data.RequestID_SOL')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Operator")[0]
    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

    #    Verifying  Lead Scope with NOVA REST Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.ChannelCode_AS400') == 'CSE' ? karate.get('$data.LeadScope_AS400') : karate.get('$data.LeadScope_SOL')
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with NOVA REST Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = karate.get('$data.ChannelCode_AS400') == 'CSE' ? upperCase(karate.get('$data.ContextType_AS400')) : upperCase(karate.get('$data.ContextType_SOL'))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with NOVA REST Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = karate.get('$data.ChannelCode_AS400') == 'CSE' ? upperCase(karate.get('$data.ContextValue_AS400')) : upperCase(karate.get('$data.ContextValue_SOL'))
    * def primatyContextValue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Primary Context Value']")[0]
    * eval if(primatyContextValue_RequestBody==primatyContextValue_IH?printPassedResult('Primary context Value',primatyContextValue_RequestBody):printFailedResult('Primary context value',primatyContextValue_IH,primatyContextValue_RequestBody));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

#    Verifying  Persistence Days with Proposition and IH
    * def persistenceDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PersistenceDays')
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Persistence Days']")[0]
    * eval if(persistenceDays_Proposition==persistenceDays_IH?printPassedResult('Persistence Days',persistenceDays_IH):printFailedResult('Persistence Days',persistenceDays_IH,persistenceDays_Proposition));

#    Verifying Rest Period Days with Proposition and IH
    * def restPeriodDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'RestPeriodDays')
    * def restPeriodDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Rest Period Days']")[0]
    * eval if(restPeriodDays_Proposition==restPeriodDays_IH?printPassedResult('Rest Period Days',restPeriodDays_IH):printFailedResult('Rest Period Days',restPeriodDays_IH,restPeriodDays_Proposition));

#    Verifying Campaign code with Proposition and IH
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * def campaignCode_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Campaign Code']")[0]
    * eval if(campaignCode_Proposition==campaignCode_IH?printPassedResult('Campaign code',campaignCode_IH):printFailedResult('Campaign code',campaignCode_IH,campaignCode_Proposition));

  @OfferValidationWithIH
  Scenario Outline: Validate offer details with IH

    * string outcome = <outcome>
    * print '***************Validating '+outcome+' Record*************'

    #    Verifying pySubjectID with Excel and IH
    * def pySubjectID_ExcelTestData = cid
    * def pySubjectID_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pySubjectID")[0]
    * eval if(pySubjectID_ExcelTestData==pySubjectID_IH?printPassedResult('pySubjectID',pySubjectID_IH):printFailedResult('pySubjectID',pySubjectID_IH,pySubjectID_ExcelTestData));

#    Verifying Issue with Proposition and IH
    * def issue_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyIssue')
    * def issue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Issue")[0]
    * eval if(issue_Proposition==issue_IH?printPassedResult('Issue',issue_IH):printFailedResult('Issue',issue_IH,issue_Proposition));

    #    Verifying Group with Proposition and IH
    * def group_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyGroup')
    * def group_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Group")[0]
    * eval if(group_Proposition==group_IH?printPassedResult('Group',group_IH):printFailedResult('Group',group_IH,group_Proposition));

 #    Verifying  Proposition name with Proposition and IH
    * def propositionName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName')
    * def propositionName_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Proposition name']")[0]
    * eval if(propositionName_Proposition==propositionName_IH?printPassedResult('Proposition Name',propositionName_IH):printFailedResult('Proposition Name',propositionName_IH,propositionName_Proposition));

#    Verifying  Direction name with Hard coded value and IH
    * def direction_Hardcoded = 'Inbound'
    * def direction_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Direction")[0]
    * eval if(direction_Hardcoded==direction_IH?printPassedResult('Direction',direction_IH):printFailedResult('Direction',direction_IH,direction_Hardcoded));

#    Verifying  Channel name with Excel (NOVA Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

    #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_IH,offeredOn_TodaysDate));

    #    Verifying  Out come with Hard coded value and IH
    * def outCome_HardCoded = outcome
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Outcome")[0]
    * eval if(outCome_HardCoded==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_HardCoded));

    #    Verifying  Operator with NOVA Excel sheet and IH
    * def operator_NOVASheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Operator")[0]
    * eval if(operator_NOVASheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_NOVASheet));

    #    Verifying  Lead Scope with NOVA Soap Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.LeadScope')
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with NOVA Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = upperCase(karate.get('$data.ContextType1'))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with NOVA Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = upperCase(karate.get('$data.ContextValue1'))
    * def primatyContextValue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Value']")[0]
    * eval if(primatyContextValue_RequestBody==primatyContextValue_IH?printPassedResult('Primary context Value',primatyContextValue_RequestBody):printFailedResult('Primary context value',primatyContextValue_IH,primatyContextValue_RequestBody));

#     #    Verifying  Control group with Hardcoded  and IH
#    * def controlGroup_HardCoded = 'N'
#    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Control")[0]
#    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

#    Verifying  Persistence Days with Proposition and IH
    * def persistenceDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PersistenceDays')
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * eval if(persistenceDays_Proposition==persistenceDays_IH?printPassedResult('Persistence Days',persistenceDays_IH):printFailedResult('Persistence Days',persistenceDays_IH,persistenceDays_Proposition));

#    Verifying Rest Period Days with Proposition and IH
    * def restPeriodDays_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'RestPeriodDays')
    * def restPeriodDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Rest Period Days']")[0]
    * eval if(restPeriodDays_Proposition==restPeriodDays_IH?printPassedResult('Rest Period Days',restPeriodDays_IH):printFailedResult('Rest Period Days',restPeriodDays_IH,restPeriodDays_Proposition));

#    Verifying Campaign code with Proposition and IH
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * def campaignCode_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Campaign Code']")[0]
    * eval if(campaignCode_Proposition==campaignCode_IH?printPassedResult('Campaign code',campaignCode_IH):printFailedResult('Campaign code',campaignCode_IH,campaignCode_Proposition));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |
       # -------------------------------------SSM Always on - 5796--------------------------------------------

  @SSMOfferValidationWithIH
  Scenario: Validate ULOC insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSMInsuranceSpecificElementsIH')
##-----------------------  @D2DEarlyEngagementOfferReminder-----------------------

  @D2DEarlyEngagementOfferReminderIHvalidation
  Scenario: Validate D2DEarlyEngagementOfferReminder offer details with IH
    #    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
  #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

  # -------------------------------------Insurance Reminder - 5784--------------------------------------------

       # -------------------------------------ULOC Insurance - 5761--------------------------------------------
  @ULOCInsuranceOfferValidationWithIH
  Scenario: Validate ULOC insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCInsuranceSpecificElementsIH')

  # -------------------------------------Insurance Reminder - 5784--------------------------------------------
  @InsuranceReminderOfferValidationWithIH
  Scenario: Validate Insurance Reminder offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Insurance Reminder
    * call read('classpath:channels/nova/ReusableScenarios.feature@InsuranceReminderSpecificElementsIH')

  @D2DXsellSpecificIHValidation
  Scenario Outline:: Validate D2DXsell offer details with IH
    * string outcome = <outcome>
     # Verifying cell group in IH against NOVA sheet
    * call read('classpath:channels/NOVA/ReusableScenarios.feature@OfferValidationWithIH')
    * def cellGroup_NOVASheet = karate.get('$data.CellGroup')
    * print "CellGroup NOVA sheet length is :" + stringLength(cellGroup_NOVASheet)
    * eval if((stringLength(cellGroup_NOVASheet)> 3)?(cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')):cellGroup_NOVASheet);
    #* def cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if((stringLength(cellGroup_IH)> 3)?(cellGroup_IH = sortString(cellGroup_IH,'|')):cellGroup_IH);
    #* def cellGroup_IH = sortString(cellGroup_IH,'|')
#    * def cellGroup_IH = ValidateCellGroup(cellGroup_NOVASheet,cellGroup_IH,'|')
    * eval if(cellGroup_NOVASheet==cellGroup_IH?printPassedResult('CellGroup',cellGroup_IH):printFailedResult('CellGroup',cellGroup_IH,cellGroup_NOVASheet));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @CLISpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CLI)
    * string outcome = <outcome>
      #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - NOVA - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

     #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

 #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
   #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

     #    Verifying  Cell group(CLI) value concatenated with with OII Segmentation logic
    * def cellGroup_OIISegmentation = oiiSegmentationCLI(offerCode,cid,'CellGroup',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_OIISegmentation==cellGroup_IH?printPassedResult('Cell Group',cellGroup_IH):printFailedResult('Cell Group',cellGroup_IH,cellGroup_OIISegmentation));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @ULOCCLISpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CLI)
    * string outcome = <outcome>
      #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - NOVA - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - NOVA - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

     #  Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_NOVAsheet = karate.get('data.OII')
    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = '01'
    * def offerInstanceId_NOVAsheet_f = offerInstanceId_NOVAsheet + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceId_NOVAsheet_f?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_NOVAsheet_f));

   #  Verifying  Reference Number with wave expiry Date in DDR
    * def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def ddrRecords = getDDRRecords()
    * print "The ddr record is:",ddrRecords
    * def campaignCode = 'RS23043'
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @CreditorInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to creditor insurance)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
#    * def creativeId_NOVA_Sheet = '2423112102'
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
#    * def concatcreative = karate.get(creativeId_NOVASheet) + ' or ' + karate.get(creativeId_NOVA_Sheet)
    * eval if(((creativeId_IH==creativeId_NOVASheet)||(creativeId_IH==creativeId_NOVA_Sheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_NOVASheet));

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Cell Group with Proposition and IH
    * def CellGroup_Proposition = karate.get('data.CellGroup')
#    * def CellGroup_Proposition = trimString(readValue("SELECT INSURANCE_PROPENSITY_DECILE FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(CellGroup_Proposition==CellGroup_IH?printPassedResult('Cell Group',CellGroup_Proposition):printFailedResult('Cell Group',CellGroup_IH,CellGroup_Proposition));



    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @GICSpecificElements
  Scenario Outline: Validate GIC IH response fields in NOVA
    * string outcome = <outcome>

    #Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    # Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));

    # Verifyind OII with XML and Database
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

    #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @PACCULOCSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to PACC and PAULOC)
    * string outcome = <outcome>
      #    Verifying  Treatment ( Creative ID) with PA CC table   and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Lead Start Date - NOVA - with PA CC table and IH
    * string leadStartDate_Database = trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date with PA CC table and IH
    * string leadEndDate_Database = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * replace leadEndDate_Database.- = ''
    * def ddrRecords = getDDRRecords()
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def month = subString(trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'")),5,7)
    * print "Month from PACC table is :"month
    * def year = subString(trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'")),0,4)
    * print "Year from PACC table is :"year
    * string leadEndDate_Database = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * print "End date from scheduler is  :"leadEndDate_Database
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC,'
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

     #    Verifying  Offer Instance ID with PA CC table
    * def offerInstanceIdSegmentationDDR = karate.get('data.OII')
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

 #    Verifying  Reference Number with Wave expiry Date and IH
#    * def ddrRecords = getDDRRecords()
#    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
#    * def campaignCode = karate.get('dataCustDim.Campaign')
#    * def month = subString(trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'")),5,7)
#    * def year = subString(trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'")),0,4)
    * string referenceNumber_DDR = readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'")
    * replace referenceNumber_DDR.- = ''
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

     #    Verifying  Cell group value with PA CC table
    * def cellGroup_OIISegmentation = "PA CC||"
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_OIISegmentation==cellGroup_IH?printPassedResult('Cell Group',cellGroup_IH):printFailedResult('Cell Group',cellGroup_IH,cellGroup_OIISegmentation));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @CrossSellContributionSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CrossSell and Contribution campaigns)
    * string outcome = <outcome>
    #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC,'
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Cell Group with Proposition and IH
    * def cellGroup_NOVASheet = karate.get('$data.CellGroup')
    * print "CellGroup NOVA sheet length is :" + stringLength(cellGroup_NOVASheet)
    * eval if((stringLength(cellGroup_NOVASheet)> 3)?(cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')):cellGroup_NOVASheet);
    #* def cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if((stringLength(cellGroup_IH)> 3)?(cellGroup_IH = sortString(cellGroup_IH,'|')):cellGroup_IH);
    #* def cellGroup_IH = sortString(cellGroup_IH,'|')
#    * def cellGroup_IH = ValidateCellGroup(cellGroup_NOVASheet,cellGroup_IH,'|')
    * eval if(cellGroup_NOVASheet==cellGroup_IH?printPassedResult('CellGroup',cellGroup_IH):printFailedResult('CellGroup',cellGroup_IH,cellGroup_NOVASheet));

#    * def CellGroup_Proposition = karate.get('data.CellGroup')
#    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
#    * eval if(CellGroup_Proposition==CellGroup_IH?printPassedResult('Cell Group',CellGroup_Proposition):printFailedResult('Cell Group',CellGroup_IH,CellGroup_Proposition));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

    @CrossSellContributionReminderOfferValidationWithIH
  Scenario Outline: Validate offer details with IH (Specific to CrossSell and Contribution campaigns)
    * string outcome = <outcome>
    #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC,'
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Cell Group with Proposition and IH
    * def CellGroup_Proposition = karate.get('data.CellGroup')
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(CellGroup_Proposition==CellGroup_IH?printPassedResult('Cell Group',CellGroup_Proposition):printFailedResult('Cell Group',CellGroup_IH,CellGroup_Proposition));

       # Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
      * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
      * def accountNumber_acctDimExcelTestData = acct_num
      * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
      * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @SupplementaryCrossSellSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to Supplementary campaign)
    * string outcome = <outcome>
    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @D2DLatestOfferSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Bill Payment Txn Migration , Visa Debit Acq Usage)
    * string outcome = <outcome>
    #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC,'
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Cell Group with Proposition and IH
    * def CellGroup_Proposition = karate.get('data.CellGroup')
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(CellGroup_Proposition==CellGroup_IH?printPassedResult('Cell Group',CellGroup_Proposition):printFailedResult('Cell Group',CellGroup_IH,CellGroup_Proposition));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @ODPRightSizingSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to ODP Right Sizing)
    * string outcome = <outcome>
    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def accountNumber_Database = trimString(readValue("SELECT ACCT_NUM FROM "+dbSchema+".CUST_INSIGHTS WHERE CIS_CUST_ID ='"+cid+"'"))
    * def accountNumber_acctDimExcelTestData = sliceString(accountNumber_Database)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @NTCCreditHistorySpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to NTC Credit History campaign)
    * string outcome = <outcome>
    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def accountNumber_acctDimExcelTestData = trimString(readValue("SELECT ACCT_NUM FROM "+dbSchema+".CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |
          ######################## SOAP Response validation specific to campaigns#######################

      # -------------------------------------NTC Mortgage Acquisition -NOVA - 5152--------------------------------------------
  @NTCMortgageAcquisitionValidation_NOVA
  Scenario: Validate NTC Mortgage Acquisition Nova Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * replace campaignName_JSON.– = '-'
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    # Verifying Offer primary_product_service_code data value
    * def primProductServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string expectedPrimaryProdSerCode = 'MTG'
    * eval if(primProductServiceCode_JSON==expectedPrimaryProdSerCode?printPassedResult('Primary product Service Code Value ',primProductServiceCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primProductServiceCode_JSON,expectedPrimaryProdSerCode));

    # Verifying Offer primary_product_service_sub_code data value
    * def primProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string expectedPrimaryProdSerSubCode = 'RM'
    * eval if(primProductServiceSubCode_JSON==expectedPrimaryProdSerSubCode?printPassedResult('Primary product Service Code Value ',primProductServiceSubCode_JSON):printFailedResult('Primary product Service Code Value ',primProductServiceSubCode_JSON,expectedPrimaryProdSerSubCode));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

     #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));


  # -------------------------------------Supplementary Card CrossSell-NOVA - 5468--------------------------------------------
  @SuppCardCrossSellOfferValidation_NOVA
  Scenario: Validate Supplementary Card Cross Sell Nova Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    # Verifying Offer product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code Value ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,productCode_Database));

    # Verifying Offer Sub product_code data value
    * def subProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string subProductCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(subProductCode_JSON==subProductCode_Database?printPassedResult('Sub Product Code Value ',subProductCode_JSON):printFailedResult('Sub Product Code Data Value ',subProductCode_JSON,subProductCode_Database));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

     #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

 # -------------------------------------Cross Sell-NOVA - 4891,4892,4893,4894--------------------------------------------
  @CrossSellContextualOfferValidation_NOVA
  Scenario: Validate CrossSell Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DContextualOfferValidation_NOVA')

    # Verifying Offer Primary Product Service Code data value
    * def primaryProductServCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primaryProductServCode_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServCode_JSON==primaryProductServCode_proposition?printPassedResult('Primary Product Service Code Value ',primaryProductServCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primaryProductServCode_JSON,primaryProductServCode_proposition));

        # Verifying Offer Primary Product Service Sub Code data value
    * def primaryProductServSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * def primaryProductServSubCode_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServSubCode_JSON==primaryProductServSubCode_proposition?printPassedResult('Primary Product Service Sub Code Value ',primaryProductServSubCode_JSON):printFailedResult('Primary Product Service Sub Code Data Value ',primaryProductServSubCode_proposition,primaryProductServSubCode_proposition));
    # Verifying Bonus Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def bonusinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bonus_interest_rate')].data_value")[0]
    * def bonusinterestrate_proposition = karate.get('data.DSS_bonusinterest')
    * eval if(bonusinterestrate_JSON==bonusinterestrate_proposition?printPassedResult('Bonus Interest Rate Value ',bonusinterestrate_JSON):printFailedResult('Bonus interest Rate Data Value ',bonusinterestrate_JSON,bonusinterestrate_proposition));

    #  Verifying Upto Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def uptointerestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'upto_interest_rate')].data_value")[0]
    * def uptointerestrate_proposition = karate.get('data.DSS_uptointerest')
    * eval if(uptointerestrate_JSON==uptointerestrate_proposition?printPassedResult('Upto Interest Rate Value ',uptointerestrate_JSON):printFailedResult('Upto interest Rate Data Value ',uptointerestrate_JSON,uptointerestrate_proposition));

    #  Verifying Offer Months with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_months_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_months')].data_value")[0]
    * def offer_duration_months_proposition = karate.get('data.DSS_offermonths')
    * eval if(offer_duration_months_JSON==offer_duration_months_proposition?printPassedResult('Offer Duration Months Value ',offer_duration_months_JSON):printFailedResult('Offer Duration Months Data Value ',offer_duration_months_JSON,offer_duration_months_proposition));


    #  Verifying regular Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_regularinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'regular_interest_rate')].data_value")[0]
    * def offer_regularinterestrate_proposition = karate.get('data.DSS_regularinterestrate')
    * eval if(offer_regularinterestrate_JSON==offer_regularinterestrate_proposition?printPassedResult('Offer regular interest rate Value ',offer_regularinterestrate_JSON):printFailedResult('Offer regular interest rate Data Value ',offer_regularinterestrate_JSON,offer_regularinterestrate_proposition));

    #  Verifying premium period interest rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_premiuminterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'premium_period_interest_rate')].data_value")[0]
    * def offer_premiuminterestrate_proposition = karate.get('data.DSS_premiumperiodinterestrate')
    * eval if(offer_premiuminterestrate_JSON==offer_premiuminterestrate_proposition?printPassedResult('Offer premium interest rate Value ',offer_premiuminterestrate_JSON):printFailedResult('Offer premium interest rate Data Value ',offer_premiuminterestrate_JSON,offer_premiuminterestrate_proposition));

    #  Verifying Offer Days with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_days_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_days')].data_value")[0]
    * def offer_duration_days_proposition = karate.get('data.DSS_offerdays')
    * eval if(offer_duration_days_JSON==offer_duration_days_proposition?printPassedResult('Offer Duration days Value ',offer_duration_days_JSON):printFailedResult('Offer Duration days Data Value ',offer_duration_days_JSON,offer_duration_days_proposition));

#  Verifying Mass Start Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_start_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_start_date')].data_value")[0]
    * def offer_mass_offer_start_date_proposition = karate.get('data.DSS_massofferstartdate')
    * eval if(offer_mass_offer_start_date_JSON==offer_mass_offer_start_date_proposition?printPassedResult('Offer mass_offer_start_date Value ',offer_mass_offer_start_date_JSON):printFailedResult('Offer mass_offer_start_date Data Value ',offer_mass_offer_start_date_JSON,offer_mass_offer_start_date_proposition));


    #  Verifying Mass End Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_end_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_end_date')].data_value")[0]
    * def offer_mass_offer_end_date_proposition = karate.get('data.DSS_massofferenddate')
    * eval if(offer_mass_offer_end_date_JSON==offer_mass_offer_end_date_proposition?printPassedResult('Offer mass_offer_end_date Value ',offer_mass_offer_end_date_JSON):printFailedResult('Offer mass_offer_end_date Data Value ',offer_mass_offer_end_date_JSON,offer_mass_offer_end_date_proposition));


  # -------------------------------------Cross Sell-NOVA - 4891,4892,4893,4894--------------------------------------------


  # -------------------------------------MPSA CrossSell-NOVA - 5467--------------------------------------------
  @MPSACrossSellOfferValidation_NOVA
  Scenario: Validate MPSA Cross Sell Nova Channel Contextual offer response fields

    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

    #  Verifying Bonus Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def bonusinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bonus_interest_rate')].data_value")[0]
    * def bonusinterestrate_proposition = karate.get('data.DSS_bonusinterest')
    * eval if(bonusinterestrate_JSON==bonusinterestrate_proposition?printPassedResult('Bonus Interest Rate Value ',bonusinterestrate_JSON):printFailedResult('Bonus interest Rate Data Value ',bonusinterestrate_JSON,bonusinterestrate_proposition));

    #  Verifying Upto Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def uptointerestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'upto_interest_rate')].data_value")[0]
    * def uptointerestrate_proposition = karate.get('data.DSS_uptointerest')
    * eval if(uptointerestrate_JSON==uptointerestrate_proposition?printPassedResult('Upto Interest Rate Value ',uptointerestrate_JSON):printFailedResult('Upto interest Rate Data Value ',uptointerestrate_JSON,uptointerestrate_proposition));

    #  Verifying Offer Months with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_months_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_months')].data_value")[0]
    * def offer_duration_months_proposition = karate.get('data.DSS_offermonths')
    * eval if(offer_duration_months_JSON==offer_duration_months_proposition?printPassedResult('Offer Duration Months Value ',offer_duration_months_JSON):printFailedResult('Offer Duration Months Data Value ',offer_duration_months_JSON,offer_duration_months_proposition));

    #  Verifying regular Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_regularinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'regular_interest_rate')].data_value")[0]
    * def offer_regularinterestrate_proposition = karate.get('data.DSS_regularinterestrate')
    * eval if(offer_regularinterestrate_JSON==offer_regularinterestrate_proposition?printPassedResult('Offer regular interest rate Value ',offer_regularinterestrate_JSON):printFailedResult('Offer regular interest rate Data Value ',offer_regularinterestrate_JSON,offer_regularinterestrate_proposition));

    #  Verifying premium period interest rate with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_premiuminterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'premium_period_interest_rate')].data_value")[0]
    * def offer_premiuminterestrate_proposition = karate.get('data.DSS_premiumperiodinterestrate')
    * eval if(offer_premiuminterestrate_JSON==offer_premiuminterestrate_proposition?printPassedResult('Offer premium interest rate Value ',offer_premiuminterestrate_JSON):printFailedResult('Offer premium interest rate Data Value ',offer_premiuminterestrate_JSON,offer_premiuminterestrate_proposition));

    #  Verifying Offer Days with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_duration_days_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'offer_duration_days')].data_value")[0]
    * def offer_duration_days_proposition = karate.get('data.DSS_offerdays')
    * eval if(offer_duration_days_JSON==offer_duration_days_proposition?printPassedResult('Offer Duration days Value ',offer_duration_days_JSON):printFailedResult('Offer Duration days Data Value ',offer_duration_days_JSON,offer_duration_days_proposition));

#  Verifying Mass Start Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_start_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_start_date')].data_value")[0]
    * def offer_mass_offer_start_date_proposition = karate.get('data.DSS_massofferstartdate')
    * eval if(offer_mass_offer_start_date_JSON==offer_mass_offer_start_date_proposition?printPassedResult('Offer mass_offer_start_date Value ',offer_mass_offer_start_date_JSON):printFailedResult('Offer mass_offer_start_date Data Value ',offer_mass_offer_start_date_JSON,offer_mass_offer_start_date_proposition));


    #  Verifying Mass End Date  with XML and NOVA(Coming from Pega DSS) sheet
    * def offer_mass_offer_end_date_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'mass_offer_end_date')].data_value")[0]
    * def offer_mass_offer_end_date_proposition = karate.get('data.DSS_massofferenddate')
    * eval if(offer_mass_offer_end_date_JSON==offer_mass_offer_end_date_proposition?printPassedResult('Offer mass_offer_end_date Value ',offer_mass_offer_end_date_JSON):printFailedResult('Offer mass_offer_end_date Data Value ',offer_mass_offer_end_date_JSON,offer_mass_offer_end_date_proposition));




  # -------------------------------------MPSA CrossSell-NOVA - 5504--------------------------------------------
  @MPSAContributionOfferValidation_NOVA
  Scenario: Validate MPSA Contribution Specific Nova Channel Contextual offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellOfferValidation_NOVA')
    * def creative = karate.get('data.CreativeId')
    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * def eventDate_DataBase = readValue("Select EVENT_DATE from "+dbSchema+".CUST_INSIGHTS where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print eventDate_DataBase
    * eval if(creative==5504102201?(offerExpiryDate_Proposition=offerExpiryDate):(offerExpiryDate_Proposition=eventDate_DataBase));
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

    #  Verifying Acct Num with XML and Database
    * def acct_num_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def acct_num_Database = acct_num
    * eval if(acct_num_JSON==acct_num_Database?printPassedResult('Acct Number Value ',acct_num_Database):printFailedResult('Acct Number Data Value ',acct_num_JSON,acct_num_Database));
#
#    #  Verifying Bonus Interest Rate with XML and DB data from cust_insights
    * def bonusinterestrate_JSON = ''
    * eval if(creative!=5504102201?(bonusinterestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bonus_interest_rate')].data_value")[0]):(bonusinterestrate_JSON == ''));
    * def bonus_interest_rate = readValue("Select CURR_VAL from "+dbSchema+".CUST_INSIGHTS where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * def bonus_interest_rate_Database = decimalRange(bonus_interest_rate , 2)
    * eval if(creative==5504102201?(bonusinterestrate_proposition=''):(bonusinterestrate_proposition=bonus_interest_rate_Database));
    * eval if(bonusinterestrate_JSON==bonusinterestrate_proposition?printPassedResult('Bonus Interest Rate Value ',bonusinterestrate_JSON):printFailedResult('Bonus interest Rate Data Value ',bonusinterestrate_JSON,bonusinterestrate_proposition));

    #  Verifying Upto Interest Rate with XML and NOVA(Coming from Pega DSS) sheet
    * def uptointerestrate_JSON = ''
    * eval if(creative!=5504102201?(uptointerestrate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'upto_interest_rate')].data_value")[0]):(uptointerestrate_JSON == ''));
    * def uptointerestrate_novasheet = karate.get('data.Upto_Int_Rate')
    * eval if(creative==5504102201?(uptointerestrate_proposition=''):(uptointerestrate_proposition=uptointerestrate_novasheet));
    * eval if(uptointerestrate_JSON==uptointerestrate_proposition?printPassedResult('Upto Interest Rate ',uptointerestrate_JSON):printFailedResult('Upto Interest Rate Value ',uptointerestrate_JSON,uptointerestrate_proposition));

    #  Verifying Acct ODT with XML and Database
    * def acct_odt_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'account_open_date')].data_value")[0]
    * def acct_odt_Database = readValue("Select ACCT_ODT from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * eval if(acct_odt_JSON==acct_odt_Database?printPassedResult('Acct ODT Value ',acct_odt_JSON):printFailedResult('Acct ODT Data Value ',acct_odt_JSON,acct_odt_Database));

  # -------------------------------------TFSA CrossSell-NOVA - 5464--------------------------------------------
  @CrossSellOfferValidation_NOVA
  Scenario: Validate TFSA Cross Sell Nova Channel Contextual offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));

    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * print "Campaign Name from response is :",campaignName_JSON
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

    #  Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

  @TFSACrossSellOfferValidation_NOVA
  Scenario: Validate TFSA Cross Sell Nova Channel Contextual offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellOfferValidation_NOVA')

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

#------------------TFSA Contribution - 5927------------------------------------------------------------

  @TFSAContributionValidation_Nova
  Scenario: Validate TFSA Cross Sell Nova Channel Contextual offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellOfferValidation_NOVA')

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    * def data_ACCT_DIM = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM");
    * def acct_num = karate.get('$data_ACCT_DIM.ACCT_NUM')
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

  #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

	 #  Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


#-------------------NTB AdvicePlus - 5822--------------------------------------------------------------
  @NTBAdvicePlusContextualOfferValidation_NOVA
  Scenario: Validate NTB Advice Plus Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    * def id_JSON = karate.jsonPath(responseString,"$.cid")

 #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

     #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = '00000000'+id_JSON
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));
    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

  # -------------------------------------D2D Welcome-NOVA--------------------------------------------
  @D2DWelcomeContextualOfferValidation_NOVA
  Scenario: Validate D2D Welcome Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DContextualOfferValidation_NOVA')

    # Verifying Offer Primary Product Service Code data value
    * def primaryProductServCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primaryProductServCode_HardCoded = 'WEL'
    * eval if(primaryProductServCode_JSON==primaryProductServCode_HardCoded?printPassedResult('Primary Product Service Code Value ',primaryProductServCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primaryProductServCode_JSON,primaryProductServCode_HardCoded));

      # -------------------------------------PA ULOC -NOVA - 5766--------------------------------------------
  @PAULOCOfferValidation_NOVA
  Scenario: Validate PA ULOC Nova Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForPAULOC')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Prime_Rate_As_Of_Date with JSON and NOVA sheet
    * def PrimeRateAsofDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'prime_as_of_date')].data_value")[0]
    * print 'Prime rate from web response is :' +PrimeRateAsofDate_JSON
    * def PrimeRateAsofDate_NOVASheet = karate.get('data.Prime_Rate_As_of_Date')
    * eval if(PrimeRateAsofDate_JSON==PrimeRateAsofDate_NOVASheet?printPassedResult('PrimeRateAsofDate',PrimeRateAsofDate_JSON):printFailedResult('PrimeRateAsofDate',PrimeRateAsofDate_JSON,PrimeRateAsofDate_NOVASheet));


    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #    Verifying Cust_Relevance with JSON and Proposition sheet
    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));

    #    Verifying primary_product_features with JSON and Proposition sheet
    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

    # Verifying OfferInstance ID with JSON and Test Data sheet
    * def offerInstanceID_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def primaryCampaignNumber_pacculCustomerDimExcelTestData = trimString(readValue("SELECT PRIMARY_CAMPAIGN_NUM FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerInstanceID_JSON==primaryCampaignNumber_pacculCustomerDimExcelTestData?printPassedResult('Offer Instance ID ',offerInstanceID_JSON):printFailedResult('Offer Instance ID is ',offerInstanceID_JSON,primaryCampaignNumber_pacculCustomerDimExcelTestData));

    # Verifying approved_credit_limit data value
    * def apprCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'approved_credit_limit')].data_value")[0]
    * string paUlocLimit_Database = trimString(readValue("SELECT PA_ULOC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(apprCreditLimit_JSON==paUlocLimit_Database?printPassedResult('Approved Credit Limit ',apprCreditLimit_JSON):printFailedResult('Approved Credit Limit Data Value ',apprCreditLimit_JSON,paUlocLimit_Database));

    # Verifying pa_indicator data value
    * def paIndicator_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pa_indicator')].data_value")[0]
    * string paIndicator_Database = 'PA'
    * eval if(paIndicator_JSON==paIndicator_Database?printPassedResult('PA Indicator ',paIndicator_JSON):printFailedResult('PA Indicator Data Value ',paIndicator_JSON,paIndicator_Database));

    # Verifying primary_source_code data value
    * def primarySouceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_source_code')].data_value")[0]
    * string primarySourceCode_Database = '106'
    * eval if(primarySouceCode_JSON==primarySourceCode_Database?printPassedResult('Primary Source Code ',primarySouceCode_JSON):printFailedResult('Primary Source Code Data Value ',primarySouceCode_JSON,primarySourceCode_Database));

    # Verifying interest_rate data value
    * def interestRate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'interest_rate')].data_value")[0]
    * string uspoRate_Database = trimString(readValue("SELECT USPO_RATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(interestRate_JSON==uspoRate_Database?printPassedResult('Interest Rate ',interestRate_JSON):printFailedResult('Interest Rate Data Value ',interestRate_JSON,uspoRate_Database));

    # Verifying bill_code data value
    * def billCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bill_code')].data_value")[0]
    * string billCode_Database = trimString(readValue("SELECT BILL_CODE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(billCode_JSON==billCode_Database?printPassedResult('Bill Code ',billCode_JSON):printFailedResult('Bill Code Data Value ',billCode_JSON,billCode_Database));

    # Verifying primary_product_service_code data value
    * def primaryprodServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string primaryProductServiceCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryprodServiceCode_JSON==primaryProductServiceCode_Database?printPassedResult('Product Product Service Code ',primaryprodServiceCode_JSON):printFailedResult('Product Product Service Code Data Value ',primaryprodServiceCode_JSON,primaryProductServiceCode_Database));

    # Verifying primary_product_service_sub_code data value
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string primaryProductServiceSubProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubProductCode_Database?printPassedResult('Primary Product Sub Product Code ',primaryProductServiceSubCode_JSON):printFailedResult('Primary Product Sub Product Code Data Value ',primaryProductServiceSubCode_JSON,primaryProductServiceSubProductCode_Database));

    # Verifying product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string primaryProductCode_Database = 'VIC'
    * eval if(productCode_JSON==primaryProductCode_Database?printPassedResult('Product Code ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,primaryProductCode_Database));

    # Verifying product_sub_code data value
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string primarySubProductCode_Database = 'RG'
    * eval if(productSubCode_JSON==primarySubProductCode_Database?printPassedResult('Product Sub Code ',productSubCode_JSON):printFailedResult('Product Sub Code Data Value ',productSubCode_JSON,primarySubProductCode_Database));

    # Verifying uspo_key data value
    * def uspoKey_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'uspo_key')].data_value")[0]
    * string uspoKey_Database = trimString(readValue("SELECT USPO_KEY FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(uspoKey_JSON==uspoKey_Database?printPassedResult('USPO Key ',uspoKey_JSON):printFailedResult('USPO Key Data Value ',uspoKey_JSON,uspoKey_Database));

    # Verifying rate_key data value
    * def rateKey_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'rate_key')].data_value")[0]
    * string rateKey_Database = trimString(readValue("SELECT RATE_KEY FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(rateKey_JSON==rateKey_Database?printPassedResult('Rate Key ',rateKey_JSON):printFailedResult('Rate Key Data Value ',rateKey_JSON,rateKey_Database));

    # Verifying prime_rate data value
    * def primeRate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'prime_rate')].data_value")[0]
    * string primeRate_Database = '6.40'
    * eval if(primeRate_JSON==primeRate_Database?printPassedResult('Prime Rate ',primeRate_JSON):printFailedResult('Prime Rate Data Value ',primeRate_JSON,primeRate_Database));

    # Verifying net_rate data value
    * def netRate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'net_rate')].data_value")[0]
    * string uspoRate_Database = trimString(readValue("SELECT USPO_RATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * string netRate_Database = (6.40 + karate.get(uspoRate_Database))
    * def netRate_Database = decimalRange(netRate_Database,2)
    * eval if(netRate_JSON==netRate_Database?printPassedResult('Net Rate ',netRate_JSON):printFailedResult('Net Rate Data Value ',netRate_JSON,netRate_Database));

    # Verifying interest_amount data value
    * def interestAmount_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'interest_amount')].data_value")[0]
    * def interestAmount_Database = (karate.get(netRate_Database) * 100)
    * eval if(interestAmount_JSON==interestAmount_Database?printPassedResult('Interest Amount ',interestAmount_JSON):printFailedResult('Interest Amount Data Value ',interestAmount_JSON,interestAmount_Database));

    # Verifying savings data value
    * def savings_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'savings')].data_value")[0]
    * def savings_Database = (1999 - karate.get(interestAmount_Database))
    * eval if(savings_JSON==savings_Database?printPassedResult('Savings ',savings_JSON):printFailedResult('Savings Data Value ',savings_JSON,savings_Database));


    # Verifying offer_condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_JSON):printFailedResult('Offer Condition ',offerCondition_JSON,offerCondition_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
  # -------------------------------------PA CC -NOVA - --------------------------------------------
  @PACCOfferValidation_NOVA
  Scenario: Validate PA CC Nova Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForPAULOC')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #    Verifying Cust_Relevance with JSON and Proposition sheet
    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));

#    #    Verifying primary_product_features with JSON and Proposition sheet
#    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

    # Verifying OfferInstance ID with JSON and Test Data sheet
    * def offerInstanceID_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def primaryCampaignNumber_pacculCustomerDimExcelTestData = trimString(readValue("SELECT PRIMARY_CAMPAIGN_NUM FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerInstanceID_JSON==primaryCampaignNumber_pacculCustomerDimExcelTestData?printPassedResult('Offer Instance ID ',offerInstanceID_JSON):printFailedResult('Offer Instance ID is ',offerInstanceID_JSON,primaryCampaignNumber_pacculCustomerDimExcelTestData));

    # Verifying approved_credit_limit data value
    * def apprCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'approved_credit_limit')].data_value")[0]
    * string paUlocLimit_Database = trimString(readValue("SELECT PA_CC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(apprCreditLimit_JSON==paUlocLimit_Database?printPassedResult('Approved Credit Limit ',apprCreditLimit_JSON):printFailedResult('Approved Credit Limit Data Value ',apprCreditLimit_JSON,paUlocLimit_Database));

    # Verifying pa_indicator data value
    * def paIndicator_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pa_indicator')].data_value")[0]
    * string paIndicator_Database = 'PA'
    * eval if(paIndicator_JSON==paIndicator_Database?printPassedResult('PA Indicator ',paIndicator_JSON):printFailedResult('PA Indicator Data Value ',paIndicator_JSON,paIndicator_Database));

    # Verifying primary_source_code data value
    * def primarySouceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_source_code')].data_value")[0]
    * string primarySourceCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimarySourceCode')
    * eval if(primarySouceCode_JSON==primarySourceCode_Database?printPassedResult('Primary Source Code ',primarySouceCode_JSON):printFailedResult('Primary Source Code Data Value ',primarySouceCode_JSON,primarySourceCode_Database));


    # Verifying primary_product_service_code data value
    * def primaryprodServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string primaryProductServiceCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryprodServiceCode_JSON==primaryProductServiceCode_Database?printPassedResult('Product Product Service Code ',primaryprodServiceCode_JSON):printFailedResult('Product Product Service Code Data Value ',primaryprodServiceCode_JSON,primaryProductServiceCode_Database));

    # Verifying primary_product_service_sub_code data value
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string primaryProductServiceSubProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubProductCode_Database?printPassedResult('Primary Product Sub Product Code ',primaryProductServiceSubCode_JSON):printFailedResult('Primary Product Sub Product Code Data Value ',primaryProductServiceSubCode_JSON,primaryProductServiceSubProductCode_Database));

    # Verifying product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string primaryProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductCode')
    * eval if(productCode_JSON==primaryProductCode_Database?printPassedResult('Product Code ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,primaryProductCode_Database));

    # Verifying product_sub_code data value
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string primarySubProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductSubCode')
    * eval if(productSubCode_JSON==primarySubProductCode_Database?printPassedResult('Product Sub Code ',productSubCode_JSON):printFailedResult('Product Sub Code Data Value ',productSubCode_JSON,primarySubProductCode_Database));
    # Verifying ALT 1 product_code data value
    * def Alt1ProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_product_code')].data_value")[0]
    * string Alt1ProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductCode')
    * eval if(Alt1ProductCode_JSON==Alt1ProductCode_Database?printPassedResult('Alt1 Product Code',Alt1ProductCode_JSON):printFailedResult('Alt1ProductCode Data Value ',Alt1ProductCode_JSON,Alt1ProductCode_Database));

    # Verifying alt1_product_sub_code data value
    * def alt1_product_sub_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_product_sub_code')].data_value")[0]
    * string alt1_product_sub_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductSubCode')
    * eval if(alt1_product_sub_code_JSON==alt1_product_sub_code_Database?printPassedResult('alt1_product_sub_code ',alt1_product_sub_code_JSON):printFailedResult('alt1_product_sub_code Value ',alt1_product_sub_code_JSON,alt1_product_sub_code_Database));

    # Verifying alt1_source_code data value
    * def alt1_source_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_source_code')].data_value")[0]
    * string alt1_source_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1SourceCode')
    * eval if(alt1_source_code_JSON==alt1_source_code_Database?printPassedResult('alt1_source_code',alt1_source_code_JSON):printFailedResult('alt1_source_code ',alt1_source_code_JSON,alt1_source_code_Database));

    # Verifying alt2_product_code  product_code data value
    * def alt2ProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_product_code')].data_value")[0]
    * string alt2ProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2ProductCode')
    * eval if(alt2ProductCode_JSON==alt2ProductCode_Database?printPassedResult('alt2 Product Code',alt2ProductCode_JSON):printFailedResult('alt2ProductCode Data Value ',alt2ProductCode_JSON,alt2ProductCode_Database));

    # Verifying alt2_product_sub_code data value
    * def alt2_product_sub_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_product_sub_code')].data_value")[0]
    * string alt2_product_sub_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2ProductSubCode')
    * eval if(alt2_product_sub_code_JSON==alt2_product_sub_code_Database?printPassedResult('alt2_product_sub_code ',alt2_product_sub_code_JSON):printFailedResult('alt2_product_sub_code Value ',alt2_product_sub_code_JSON,alt2_product_sub_code_Database));

    # Verifying alt2_source_code data value
    * def alt2_source_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_source_code')].data_value")[0]
    * string alt2_source_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2SourceCode')
    * eval if(alt2_source_code_JSON==alt2_source_code_Database?printPassedResult('alt2_source_code',alt2_source_code_JSON):printFailedResult('alt2_source_code ',alt2_source_code_JSON,alt2_source_code_Database));

    # Verifying offer_condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_JSON):printFailedResult('Offer Condition ',offerCondition_JSON,offerCondition_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
  # -------------------------------------D2D Welcome-NOVA--------------------------------------------
  @D2DWelcomeContextualOfferValidation_NOVA
  Scenario: Validate D2D Welcome Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DContextualOfferValidation_NOVA')

    # Verifying Offer Primary Product Service Code data value
    * def primaryProductServCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primaryProductServCode_HardCoded = 'WEL'
    * eval if(primaryProductServCode_JSON==primaryProductServCode_HardCoded?printPassedResult('Primary Product Service Code Value ',primaryProductServCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primaryProductServCode_JSON,primaryProductServCode_HardCoded));
  # -------------------------------------D2D Welcome-NOVA--------------------------------------------
  # -------------------------------------BillPayment-NOVA - 4380--------------------------------------------
  @BillPaymentContextualOfferValidation_NOVA
  Scenario: Validate BillPayment Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DContextualOfferValidation_NOVA')

    # Verifying Offer Primary Product Service Code data value
    * def primaryProductServCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primaryProductServCode_HardCoded = 'BPAY'
    * eval if(primaryProductServCode_JSON==primaryProductServCode_HardCoded?printPassedResult('Primary Product Service Code Value ',primaryProductServCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primaryProductServCode_JSON,primaryProductServCode_HardCoded));
  # -------------------------------------BillPayment-NOVA - 4380--------------------------------------------
  # -------------------------------------Funds Account - 4315--------------------------------------------
  @FundsAccountContextualOfferValidation_NOVA
  Scenario: Validate Funds Account Contextual offer response fields inNOVA
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DContextualOfferValidation_NOVA')

    # Verifying Offer Primary Product Service Code data value
    * def primaryProductServCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primaryProductServCode_HardCoded = 'FUND'
    * eval if(primaryProductServCode_JSON==primaryProductServCode_HardCoded?printPassedResult('Primary Product Service Code Value ',primaryProductServCode_JSON):printFailedResult('Primary Product Service Code Data Value ',primaryProductServCode_JSON,primaryProductServCode_HardCoded));
   # -------------------------------------Funds Account - 4315--------------------------------------------

  @D2DContextualOfferValidation_NOVA
  Scenario: Validate Contextual offer response fields in NOVA
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

  #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

     #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));

    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

  # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

      # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

#    # Verifying Campaign Name with XML and Proposition sheet
#    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
#    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
#    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'


    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));


     #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
#--------------------VisaDebitandInteracFlash Contextual offer validation----------------
  #-------------------VisaDebitandInteracFlash - 5970--------------------------------------------------------------
  @VisaDebitandInteracOfferValidation_NOVA
  Scenario: Validate NTB Advice Plus Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    * def id_JSON = karate.jsonPath(responseString,"$.cid")

 #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

     #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    # Verifying PrimaryProductServiceCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

    # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));


    # -------------------------------------GIC Renewal - 1210,4587--------------------------------------------

  @GICContextualOfferValidation_NOVA


  Scenario: Validate GIC Contextual offer response fields inNOVA
    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

  #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

#    Verifying Customer Relevance with JSON and Proposition sheet
    * def customerRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));

#  Verifying Offer Start Date  with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * string offerStart_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * string offerStart_Database = dateMinus(offerStart_Database,'28')
    * eval if(offerStartDate_JSON==offerStart_Database?printPassedResult('Offer Start Date',offerStartDate_JSON):printFailedResult('Offer Start date',offerStartDate_JSON,offerStart_Database));


  #  Verifying Offer Expiry Date  with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * string offerExpiryDate_Database = readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Database?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Database));

  #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));


  #  Verifying Current Account Name with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * def currentAccountName_HardCoded = 'GIC Maturity'
    * eval if(currentAccountName_JSON==currentAccountName_HardCoded?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_HardCoded));

  #  Verifying Current Account Maturity Date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_maturity_date')].data_value")[0]
    * def currentAccountName_HardCoded = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(currentAccountName_JSON==currentAccountName_HardCoded?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_HardCoded));

  #  Verifying Current Balance with JSON and Database table EDPPEGAT.ACCT_DIM
    * def current_balance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_balance')].data_value")[0]
    * def current_balance_Database = readValue("SELECT MAT_VAL_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def current_balance_Database = roundNumber(current_balance_Database)
    * eval if(current_balance_JSON==current_balance_Database?printPassedResult('Current Balance',current_balance_JSON):printFailedResult('Current Balance',current_balance_JSON,current_balance_Database));

  #  Verifying TERM with JSON and Database table EDPPEGAT.ACCT_DIM
    * def term_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'term')].data_value")[0]
    * def term_Database = readValue("SELECT term_mth FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(term_JSON==term_Database?printPassedResult('Term',term_JSON):printFailedResult('TERM',term_JSON,term_Database));

  #  Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def product_code_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * def product_code_Database = readValue("SELECT ip_prd_cd FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(product_code_JSON==product_code_Database?printPassedResult('Product Code',product_code_JSON):printFailedResult('Product Code',product_code_JSON,product_code_Database));

  #  Verifying Plan Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def plan_num_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'plan_num')].data_value")[0]
    * def plan_num_Database = subString(trimString(readValue("SELECT acct_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),8,23)
    * eval if(plan_num_JSON==plan_num_Database?printPassedResult('Plan Num',plan_num_JSON):printFailedResult('Product Code',plan_num_JSON,plan_num_Database));

   #  Verifying ownership with JSON and Database table EDPPEGAT.ACCT_DIM
    * def ownership_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'ownership')].data_value")[0]
    * def ownership_HardCoded = 'SO'
    * eval if(ownership_JSON==ownership_HardCoded?printPassedResult('ownership',ownership_JSON):printFailedResult('ownership',ownership_JSON,ownership_HardCoded));

     #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #  Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

     # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

    #    Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

  # -------------------------------------Creditor Insurance - Retargeting 5648--------------------------------------------
  @CreditorInsuranceRetargetingNovaOfferValidation
  Scenario: Validate Creditor Insurance Retargeting offer response fields

       # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_NOVA_Sheet = '2423112102'
    * def concatcreative = karate.get(creativeId_NOVASheet) + ' or ' + karate.get(creativeId_NOVA_Sheet)
    * eval if(((creativeId_JSON==creativeId_NOVASheet)||(creativeId_JSON==creativeId_NOVA_Sheet))?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,concatcreative));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));

#     Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #    Verifying Customer Relevance with JSON and Proposition sheet
    * def customerRelevance_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

     #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

  #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));


    # Verifying Current Account Name with Data Sheet
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * string currentAccountName_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_DESC FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_Database?printPassedResult('Current Account Name ',currentAccountName_JSON):printFailedResult('Current Account Name ',currentAccountName_JSON,currentAccountName_Database));

    # Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

    #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));


    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCode_JSON==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,zoneCodes_Proposition));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

    # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

    # Verifying Offer product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code Value ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,productCode_Database));

    # Verifying Offer Sub product_code data value
    * def subProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string subProductCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(subProductCode_JSON==subProductCode_Database?printPassedResult('Sub Product Code Value ',subProductCode_JSON):printFailedResult('Sub Product Code Data Value ',subProductCode_JSON,subProductCode_Database));


    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

    # Verifying PrimaryProductServiceCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

    # Verifying PrimaryProductServiceSubCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==PrimaryProductServiceSubCode_Proposition?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON,PrimaryProductServiceSubCode_Proposition));

    # Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    # Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

  # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
#  https://confluence.agile.bns/display/CIMCAMP/Customer+Interaction+Ecosystem+-+Workstream+3+Integration+with+Digital?preview=/289906610/310861709/CDH%20APi%20Req_res_SCCP.docx
    * call read('classpath:channels/nova/ReusableScenarios.feature@ContextualOfferValidation')

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
#    * def creativeId_NOVA_Sheet = '2423112102'
#    * def concatcreative = karate.get(creativeId_NOVASheet) + ' or ' + karate.get(creativeId_NOVA_Sheet)
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));

#     Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIContextualOfferValidation
  Scenario: Validate CLI Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@ContextualOfferValidation')
#    Verifying Offer Start date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * string offerStart_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_JSON==offerStart_Database?printPassedResult('Offer Start Date',offerStartDate_JSON):printFailedResult('Offer Start date',offerStartDate_JSON,offerStart_Database));
    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));


    # Verifying Offer Expiry date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiry_Database?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiry_Database));

     # Verifying PAL Fulfill with JSON and Proposition sheet
    * def palfulfill_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pal_fulfill_flag')].data_value")[0]
    * def palfulfill_HardCoded = 'Y'
    * eval if(palfulfill_JSON==palfulfill_HardCoded?printPassedResult('PAL Ful Fill',palfulfill_JSON):printFailedResult('PAL Ful Fill',palfulfill_JSON,palfulfill_HardCoded));

 #  Verifying Current Credit Limit with JSON and Database table- (EDPPEGAT.LEADS if Prestaged offer and EDPPEGAT.ACCT_DIM if contextual offer)
    * def currentCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_credit_limit')].data_value")[0]
    * def currentCreditLimit_Database = trimString(decimalRange(readValue("SELECT CR_CRD_LMT_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2))
    * eval if(currentCreditLimit_JSON==currentCreditLimit_Database?printPassedResult('Current Credit Limit',currentCreditLimit_JSON):printFailedResult('Current Credit Limit',currentCreditLimit_JSON,currentCreditLimit_Database));

     #  validations for approved credit limit- not null, greater than current credit limit
    * def approvedCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'approved_credit_limit')].data_value")[0]
    * def approvedCreditLimit_Database = trimString(decimalRange(readValue("SELECT CLI_APRVD_CR_LMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2))
    * match approvedCreditLimit_JSON == '#notnull'
    * def currentCreditLimit =  parseFloat(currentCreditLimit_JSON)
    * def approvedCreditLimit =  parseFloat(approvedCreditLimit_JSON)
    * assert approvedCreditLimit > currentCreditLimit
    * eval if(approvedCreditLimit_JSON==approvedCreditLimit_Database?printPassedResult('Approved Credit Limit',approvedCreditLimit_JSON):printFailedResult('Approved Credit Limit',approvedCreditLimit_JSON,approvedCreditLimit_Database));

#    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

    #    Verifying Product Sub Code with XML and Database table EDPPEGAT.ACCT_DIM
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product SubCode',productSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',productSubCode_JSON,productSubCode_Database));

    #    Verifying Credit Card Number with XML and Database table EDPPEGAT.ACCT_DIM
    * def creditcard_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'credit_card_number')].data_value")[0]
    * string creditcard_Database = trimString(readValue("SELECT CR_CRD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(creditcard_JSON==creditcard_Database?printPassedResult('Credit Card Number',creditcard_JSON):printFailedResult('Credit Card Number',creditcard_JSON,creditcard_Database));

  @ULOCInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
#    * string Acct_num = Acct_Num
#    * print "Account number is", Acct_num

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

     #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

# Verifying PrimaryProductServiceCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

    # Verifying PrimaryProductServiceSubCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==PrimaryProductServiceSubCode_Proposition?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON,PrimaryProductServiceSubCode_Proposition));

	#    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));


    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * print "DB account number is:" + currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));


    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));



#    Verifying Cust_Relevance with JSON and Proposition sheet
    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));


 #    Verifying primary_product_features with JSON and Proposition sheet
    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

  @InsuranceReminderSpecificOfferValidation
  Scenario: Validate Insurance Reminder specific Contextual offer response fields
#    * string Acct_num = Acct_Num
#    * print "Account number is", Acct_num

    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));


#     #    Verifying Offer Condition with JSON and Proposition sheet
#    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
#    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
#    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

# Verifying PrimaryProductServiceCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

    # Verifying PrimaryProductServiceSubCode with JSON and Proposition EDPPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==PrimaryProductServiceSubCode_Proposition?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON,PrimaryProductServiceSubCode_Proposition));

	#    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

#    Verifying Product sub Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product sub Code',productSubCode_JSON):printFailedResult('Product sub Code',productSubCode_JSON,productSubCode_Database));


    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * print "DB account number is:" + currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

    # Verifying Current Account Name with Data Sheet
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * string currentAccountName_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_DESC FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_Database?printPassedResult('Current Account Name ',currentAccountName_JSON):printFailedResult('Current Account Name ',currentAccountName_JSON,currentAccountName_Database));


    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));



#    Verifying Cust_Relevance with JSON and Proposition sheet
    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));


 #    Verifying primary_product_features with JSON and Proposition sheet
    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

 #    Verifying Credit Card Number with XML and Database table EDPPEGAT.ACCT_DIM
    * def creditcard_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'credit_card_number')].data_value")[0]
    * string creditcard_Database = trimString(readValue("SELECT CR_CRD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def jsoncardpart2 = subString(creditcard_JSON,8,12)
    * print "Jason card part2" +jsoncardpart2
    * def Dbcardpart2 =  subString(creditcard_Database,8,12)
    * print "DB card part2" +Dbcardpart2
    * print "Length of credit card jason" + stringLength(creditcard_JSON)
    * print "Length of credit card DB" + stringLength(creditcard_Database)
    * eval if(stringLength(creditcard_JSON)==stringLength(creditcard_Database) && subString(creditcard_JSON,0,4) == subString(creditcard_Database,0,4) && subString(creditcard_JSON,8,12) == subString(creditcard_Database,8,12)?printPassedResult('Credit Card Number',creditcard_JSON):printFailedResult('Credit Card Number',creditcard_JSON,creditcard_Database));

  @MPSAWelcomeBonusOfferValidation_NOVA
  Scenario: Validate MPSA Welcome Bonus Nova Channel Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Database = readValue("Select EVENT_DATE from "+dbSchema+".CUST_INSIGHTS where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Database?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Database));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));
    #  Verifying Primary Product Service Name with XML and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceName_Proposition?printPassedResult('Primary Product Service Name',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name',PrimaryProductServiceName_JSON,PrimaryProductServiceName_Proposition));
    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'
    #  Verifying Primary product service code with JSON and Proposition sheet
    * def primary_product_service_code_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * def primary_product_service_code_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primary_product_service_code_JSON==primary_product_service_code_proposition?printPassedResult('Primary Product Service Code',primary_product_service_code_JSON):printFailedResult('Primary Product Service code',primary_product_service_code_JSON,primary_product_service_code_proposition));
    #  Verifying Bonus Interest Rate with JSON and Proposition sheet
    * def bonus_interest_rate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'bonus_interest_rate')].data_value")[0]
    * def bonus_interest_rate = trimString(readValue("Select CURR_VAL from "+dbSchema+".CUST_INSIGHTS where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'"))
    * def bonus_interest_rate_Database = decimalRange(bonus_interest_rate , 2)
    * eval if(bonus_interest_rate_JSON==bonus_interest_rate_Database?printPassedResult('Bonus Interest Rate',bonus_interest_rate_JSON):printFailedResult('Bonus Interest Rate',bonus_interest_rate_JSON,bonus_interest_rate_Database));
    #  Verifying Upto Interest Rate with JSON and Proposition sheet
    * def upto_interest_rate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'upto_interest_rate')].data_value")[0]
    * def upto_interest_rate_proposition = '4.25'
    * eval if(upto_interest_rate_JSON==upto_interest_rate_proposition?printPassedResult('Upto Interest Rate',upto_interest_rate_JSON):printFailedResult('Upto Interest Rate',upto_interest_rate_JSON,upto_interest_rate_proposition));
    #  Verifying Account Open Date with JSON and Database
    * def account_open_date_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'account_open_date')].data_value")[0]
    * def account_open_date_Database = readValue("SELECT ACCT_ODT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(account_open_date_JSON==account_open_date_Database?printPassedResult('Account Open Date',account_open_date_JSON):printFailedResult('Account Open Date',account_open_date_JSON,account_open_date_Database));
      ######################## End of SOAP Response validation specific to campaigns#######################
     ######################## IH validation specific to campaigns#######################
  # ------------------MPSA Welcome Bonus - 5839----------------------
  @MPSAWelcomeBonusOfferValidationWithIH
  Scenario: Validate MPSAWelcomeBonusOffer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to MPSAWelcomeBonusOffer
    * call read('classpath:channels/nova/ReusableScenarios.feature@MPSAWelcomeBonusSpecificElementsIH')

  # ------------------D2D latest campaigns - 5615,5616(BillPaymentTxn,VisaDebitAcqUsage----------------------
  @LatestOfferValidationWithIH
  Scenario: Validate CrossSell and Contribution offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@D2DLatestOfferSpecificElementsIH')
  # ------------------ODP Right Sizing - 5614----------------------
  @ODPRightSizingOfferValidationWithIH
  Scenario: Validate ODP Right Sizing offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@ODPRightSizingSpecificElementsIH')
  # ------------------NTC Credit History - 5619----------------------
  @NTCCreditHistoryOfferValidationWithIH
  Scenario: Validate ODP Right Sizing offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestOfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@NTCCreditHistorySpecificElementsIH')

  # ------------------CrossSell and Contribution campaigns----------------------
  @CrossSellContributionOfferValidationWithIH
  Scenario: Validate CrossSell and Contribution offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Corsssell and contribution campaigns
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionSpecificElementsIH')
  # ------------------Supplementary CrossSell campaign----------------------
  @SupplementaryCrossSellOfferValidationWithIH
  Scenario: Validate Supplementary CrossSell offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossSellContributionOfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@SupplementaryCrossSellSpecificElementsIH')

   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceOfferValidationWithIH
  Scenario: Validate creditor insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@CreditorInsuranceSpecificElementsIH')

     # -------------------------------------NTB Advice Plus - 5822--------------------------------------------
  @NTBAdvicePlusOfferValidationWithIH
  Scenario: Validate NTB Advice Plus  offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to NTB Advice Plus
    * call read('classpath:channels/nova/ReusableScenarios.feature@NTBAdvicePlusSpecificElementsIH')



  # ------------------Bill Payment NOVA_4380----------------------
  @BillPaymentNovaOfferValidationWithIH
  Scenario: Validate BillPayment offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));


  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

     # ------------------Bill Payment NOVA_4380----------------------
  @D2DWelcomeNovaOfferValidationWithIH
  Scenario: Validate BillPayment offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));


  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

  # ------------------CrossSell NOVA_4891----------------------
  @CrossSellNovaOfferValidationWithIH
  Scenario: Validate Cross sell offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));
    # Verifying Acct Number with JSON and Proposition sheet
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * print 'Account DIM data'+dataAcctDim
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * print 'Account Number'+accountNumber_acctDimExcelTestData
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------

  @CLIOfferValidationWithIH
  Scenario: Validate CLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@CLISpecificElementsIH')


     # ------------------ULOCCLI - 6001,6002----------------------

  @ULOCCLIOfferValidationWithIH
  Scenario: Validate ULOCCLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/nova/ReusableScenarios.feature@ULOCCLISpecificElementsIH')

  # ------------------GIC Renewal - 1210,4587----------------------

  @GICOfferValidationWithIH_NOVA
  Scenario: Validate GIC offer details with IH
# Zone code is not validating for IPT and PST records - Approval is taken from onsite team
    #Validates Common elements

    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    #Validates elements specific to GIC
    * call read('classpath:channels/nova/ReusableScenarios.feature@GICSpecificElements')
  # ------------------PA CC and PA ULOC----------------------
  @PACCULOCOfferValidationWithIH
  Scenario: Validate PACCULOC offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to PACC ULOC
    * call read('classpath:channels/nova/ReusableScenarios.feature@PACCULOCSpecificElementsIH')

    ######################## End of IH validation specific to campaigns#######################

    ######################## Disposition IH validation specific to campaigns#######################

   # ------------------GIC Renewal - 1210,4587-----------------------------------------------
  @GICDispositionOfferValidationWithIH


  Scenario: Validate GIC Disposition offer details with IH in NOVA

    #    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@DispositionOfferValidationWithIH')

    #Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    # Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));

    # Verifyind OII with IH and Database
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

    #    Verifying  Reference Number with DDR value  and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

   # ------------------CrossSell - 4891 , 4892 , 4893 , 4894---------------------
  @CrossSellDispositionOfferValidationWithIH
  Scenario: Validate CLI disposition offer details with IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@DispositionOfferValidationWithIH')

      # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].ZoneCode")[0]
    * def listOfZoneCodes = 'MMC'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

      # Verifying Acct Number with JSON and Proposition sheet
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * print 'Account DIM data'+dataAcctDim
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * print 'Account Number'+accountNumber_acctDimExcelTestData
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

   # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIDispositionOfferValidationWithIH
  Scenario: Validate CLI disposition offer details with IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@DispositionOfferValidationWithIH')

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC'

#    * def listOfZoneCodes = ['MIC', 'MMC']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
#    * replace zoneCodes_Proposition., = ''
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));



    #    Verifying  Lead Start Date - AS400 - with current date and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * replace leadEndDate_Database.- = ''
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_IH):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

 #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
   #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

     #    Verifying  Cell group(CLI) value concatenated with with OII Segmentation logic
    * def cellGroup_OIISegmentation = oiiSegmentationCLI(offerCode,cid,'CellGroup',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Cell Group']")[0]
    * eval if(cellGroup_OIISegmentation==cellGroup_IH?printPassedResult('Cell Group',cellGroup_IH):printFailedResult('Cell Group',cellGroup_IH,cellGroup_OIISegmentation));
   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance disposition offer details with IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@DispositionOfferValidationWithIH')

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'MMC'

#    * def listOfZoneCodes = ['MIC', 'MMC']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
#    * replace zoneCodes_Proposition., = ''
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));


    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date - AS400 - with respect to proposition offer expiry date  and IH Lead end date
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_IH):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    ######################## End of Disposition IH validation specific to campaigns#######################

  ######################## Cross channel Disposition IH validation specific to campaigns#######################

  # ------------------GIC Renewal - 1210,4587-----------------------------------------------
  @GICCrossChannelDispositionOfferValidationWithIH

  Scenario: Validate GIC Cross Channel Disposition offer details with IH in NOVA

    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    #Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    # Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));

    # Verifyind OII with IH and Database
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

    #    Verifying  Reference Number with DDR value  and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

  # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLICrossChannelDispositionOfferValidationWithIH
  Scenario: Validate CLI cross channel disposition offer details with IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

      #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')]..REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

 #    Verifying  Cell group(CLI) value concatenated with with OII Segmentation logic
    * def cellGroup_OIISegmentation = oiiSegmentationCLI(offerCode,cid,'CellGroup',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Cell Group']")[0]
    * eval if(cellGroup_OIISegmentation==cellGroup_IH?printPassedResult('Cell Group',cellGroup_IH):printFailedResult('Cell Group',cellGroup_IH,cellGroup_OIISegmentation));

  # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceCrossChannelDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance cross channel disposition offer details with IH
    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  #    Verifying  Lead Start Date - AS400 - with Database and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_todayDate):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_todayDate));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

  #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].OFR_INSTANCE_ID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_IH==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    ########################End of Cross channel Disposition IH validation specific to campaigns#######################

  @GICIHValidation_OII_NOVA
  Scenario: Validate GIC offer OII details for segmentation with IH
    # Zone code is not validating for IPT and PST records - Approval is taken from onsite team
    #Validates Common elements

    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

      #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));


    #Verifying  Lead Start Date with Wave Start Date and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    # Verifying  Lead End Date with Wave Expiry Date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));

    # Verifyind OII with IH and Database
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

    #    Verifying  Reference Number with wave expiry Date in DDR
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

  @TravelInsuranceSpecificIHValidation
  Scenario Outline:: Validate Travel insurance offer details with IH
    * string outcome = <outcome>
     # Verifying cell group in IH against NOVA sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
    * def cellGroup_NOVASheet = karate.get('$data.CellGroup')
    * print "CellGroup Nova sheet length is :" + stringLength(cellGroup_NOVASheet)
    * eval if((stringLength(cellGroup_NOVASheet)> 3)?(cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')):cellGroup_NOVASheet);
    #* def cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if((stringLength(cellGroup_IH)> 3)?(cellGroup_IH = sortString(cellGroup_IH,'|')):cellGroup_IH);
    #* def cellGroup_IH = sortString(cellGroup_IH,'|')
#    * def cellGroup_IH = ValidateCellGroup(cellGroup_NOVASheet,cellGroup_IH,'|')
    * eval if(cellGroup_NOVASheet==cellGroup_IH?printPassedResult('CellGroup',cellGroup_IH):printFailedResult('CellGroup',cellGroup_IH,cellGroup_NOVASheet));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @IMTSpecificIHValidation
  Scenario Outline:: Validate IMT offer details with IH
    * string outcome = <outcome>
     # Verifying cell group in IH against NOVA sheet
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')

    #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date - LEad start date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

     Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @ItradeXsellAlwaysOnSpecificIHValidation
  Scenario Outline:: Validate ItradeXsellAlwaysOn offer details with IH
    * string outcome = <outcome>
    #    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
  #    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @VisaDebitandInteracSpecificIHValidation
  Scenario Outline: Validate offer details with IH (Specific to VisaDebit and Interac Acq campaign)
    * string outcome = <outcome>
        #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date - LEad start date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

    # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT ACCT_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @TravelInsuranceOfferValidationWithIH
  Scenario: Validate Travel insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@TravelInsuranceSpecificIHValidation')

  @VisaDebitandInteracOfferValidationWithIH
  Scenario: Validate Travel insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
    * call read('classpath:channels/nova/ReusableScenarios.feature@VisaDebitandInteracSpecificIHValidation')


  @TravelInsuranceSpecificOfferValidation
    Scenario: Validate the Travel Insurance specific data elements

      * def id_JSON = karate.jsonPath(responseString,"$.cid")
      * def id_Excel = cid
      * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

      #    Verifying PrimaryProductServiceCode with JSON and Proposition
      * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
      * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
      * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

  @SPSPLoanRepaySpecificOfferValidation
  Scenario: Validate the Travel Insurance specific data elements

    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

      #    Verifying PrimaryProductServiceCode with JSON and Proposition
    * def primaryProductServiceCode_JSON =  karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Proposition));

  @SuppcardsSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to Suppcards)
    * string outcome = <outcome>
        #    Verifying  Lead Start Date - NOVA - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date - LEad start date + Persistance days - NOVA - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

     #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_NOVASheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_NOVASheet));

   # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCode_JSON==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,zoneCodes_Proposition));

    # Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT ACCT_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));


    #    Verifying  Cell group(CLI) value concatenated with with OII Segmentation logic
    * def cellGroup_NOVASheet = karate.get('data.CellGroup')
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_NOVASheet==CellGroup_IH?printPassedResult('Cell Group',CellGroup_IH):printFailedResult('Cell Group',CellGroup_IH,cellGroup_NOVASheet));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @SSIFundSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to SSI Fund)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(((creativeId_IH==creativeId_NOVASheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_NOVASheet));

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Reference Number with Proposition and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def ReferenceNum_acctDimExcelTestData = sliceString(acct_num)
    * def ReferenceNum_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['REFERENCE_NUM']")[0]
    * eval if(ReferenceNum_acctDimExcelTestData==ReferenceNum_IH?printPassedResult('Reference Number',ReferenceNum_acctDimExcelTestData):printFailedResult('Reference Number',ReferenceNum_IH,ReferenceNum_acctDimExcelTestData));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @SSIPACSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to SSI Fund)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(((creativeId_IH==creativeId_NOVASheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_NOVASheet));

    ##    Verifying  Account Number with Acct DIM sheet Excel (NOVA Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def listOfZoneCodes = ['MIC','MMC']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


     #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    #  Verifying Reference Number with Proposition and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def ReferenceNum_acctDimExcelTestData = sliceString(acct_num)
    * def ReferenceNum_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['REFERENCE_NUM']")[0]
    * eval if(ReferenceNum_acctDimExcelTestData==ReferenceNum_IH?printPassedResult('Reference Number',ReferenceNum_acctDimExcelTestData):printFailedResult('Reference Number',ReferenceNum_IH,ReferenceNum_acctDimExcelTestData));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @SuppCardsOfferValidationWithIH
  Scenario: Validate Supplementary cards offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to suppcards
    * call read('classpath:channels/nova/ReusableScenarios.feature@SuppcardsSpecificElementsIH')


  @SSIFundOfferValidationWithIH
  Scenario: Validate SSI FUND offer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to SSI Fund
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIFundSpecificElementsIH')

#SSI Fund - 6233 Contextual Offer Validation----

  @SSIFundContextualOfferValidation
  Scenario: Validate SSI Fund Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Verifying Offer Expiry date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * string offerExpiry_proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiry_proposition?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiry_proposition));


##    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
#    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
#    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

#    #    Verifying Product Sub Code with XML and Database table EDPPEGAT.ACCT_DIM
#    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
#    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product SubCode',productSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',productSubCode_JSON,productSubCode_Database));
#

    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = retreiveSubstring(acct_num,19,22)
    * print 'Curren Account number last 4 digits is:'+ currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

#      #    Verifying Primary Product Feature with JSON and Proposition sheet
#    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

#    Verifying OfferInstanceID with JSON and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('OfferInstanceID',OfferInstanceID_JSON):printFailedResult('OfferInstanceID',OfferInstanceID_JSON,offerInstanceId_Proposition));

    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

#  Verifying Current Account Name with JSON and plan code master from acct_dim
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * def currentAccountName_datasheet = trimString(readValue("SELECT PLN_ACCT_CD_MASTER FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_datasheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_datasheet));


  @SSIPACOfferValidationWithIH
  Scenario: Validate SSI PACoffer details with IH
#    Validates Common elements
    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to SSI PAC
    * call read('classpath:channels/nova/ReusableScenarios.feature@SSIPACSpecificElementsIH')

#SSI PAC - 6234 Contextual Offer Validation----

  @SSIPACContextualOfferValidation
  Scenario: Validate SSI PAC Contextual offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

    # Verifying Offer Expiry date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * string offerExpiry_proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiry_proposition?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiry_proposition));


##    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
#    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
#    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

#    #    Verifying Product Sub Code with XML and Database table EDPPEGAT.ACCT_DIM
#    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
#    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product SubCode',productSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',productSubCode_JSON,productSubCode_Database));
#

    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = retreiveSubstring(acct_num,19,22)
    * print 'Curren Account number last 4 digits is:'+ currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

#      #    Verifying Primary Product Feature with JSON and Proposition sheet
#    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

#    Verifying OfferInstanceID with JSON and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('OfferInstanceID',OfferInstanceID_JSON):printFailedResult('OfferInstanceID',OfferInstanceID_JSON,offerInstanceId_Proposition));

    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

#  Verifying Current Account Name with JSON and plan code master from acct_dim
    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
    * def currentAccountName_datasheet = trimString(readValue("SELECT PLN_ACCT_CD_MASTER FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_datasheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_datasheet));

    # ------------------ULOCCLI - 6001,6002,6090----------------------
  @ULOCCLIContextualOfferValidation
  Scenario: Validate CLI Contextual offer response fields
#    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
#    Verifying Offer Start date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * string offerStart_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_JSON==offerStart_Database?printPassedResult('Offer Start Date',offerStartDate_JSON):printFailedResult('Offer Start date',offerStartDate_JSON,offerStart_Database));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));


    # Verifying Offer Expiry date with JSON and Database table EDPPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiry_Database?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiry_Database));

     # Verifying PAL Fulfill with JSON and Proposition sheet
    * def palfulfill_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pal_fulfill_flag')].data_value")[0]
    * def palfulfill_HardCoded = 'Y'
    * eval if(palfulfill_JSON==palfulfill_HardCoded?printPassedResult('PAL Ful Fill',palfulfill_JSON):printFailedResult('PAL Ful Fill',palfulfill_JSON,palfulfill_HardCoded));

 #  Verifying Current Credit Limit with JSON and Database table- (EDPPEGAT.LEADS if Prestaged offer and EDPPEGAT.ACCT_DIM if contextual offer)
    * def currentCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_credit_limit')].data_value")[0]
    * def currentCreditLimit_Database = trimString(decimalRange(readValue("SELECT CR_CRD_LMT_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2))
    * eval if(currentCreditLimit_JSON==currentCreditLimit_Database?printPassedResult('Current Credit Limit',currentCreditLimit_JSON):printFailedResult('Current Credit Limit',currentCreditLimit_JSON,currentCreditLimit_Database));

     #  validations for approved credit limit- not null, greater than current credit limit
    * def approvedCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'approved_credit_limit')].data_value")[0]
    * def approvedCreditLimit_Database = trimString(decimalRange(readValue("SELECT CLI_APRVD_CR_LMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2))
    * match approvedCreditLimit_JSON == '#notnull'
    * def currentCreditLimit =  parseFloat(currentCreditLimit_JSON)
    * def approvedCreditLimit =  parseFloat(approvedCreditLimit_JSON)
    * assert approvedCreditLimit > currentCreditLimit
    * eval if(approvedCreditLimit_JSON==approvedCreditLimit_Database?printPassedResult('Approved Credit Limit',approvedCreditLimit_JSON):printFailedResult('Approved Credit Limit',approvedCreditLimit_JSON,approvedCreditLimit_Database));

#    Verifying Product Code with JSON and Database table EDPPEGAT.ACCT_DIM
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

    #    Verifying Product Sub Code with XML and Database table EDPPEGAT.ACCT_DIM
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product SubCode',productSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',productSubCode_JSON,productSubCode_Database));


    #  Verifying Current Account Number with JSON and Database table EDPPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

     # Verifying pa_indicator data value
    * def paIndicator_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pa_indicator')].data_value")[0]
    * string paIndicator_Database = 'PA'
    * eval if(paIndicator_JSON==paIndicator_Database?printPassedResult('PA Indicator ',paIndicator_JSON):printFailedResult('PA Indicator Data Value ',paIndicator_JSON,paIndicator_Database));

    #    Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

#    Verifying OfferInstanceID with JSON and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def OfferInstanceID_Proposition = karate.get('data.OII')+'02'
    * eval if(OfferInstanceID_JSON==OfferInstanceID_Proposition?printPassedResult('OfferInstanceID',OfferInstanceID_JSON):printFailedResult('OfferInstanceID',OfferInstanceID_JSON,OfferInstanceID_Proposition));
    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

    # Verifying primary_product_service_code data value
    * def primaryprodServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string primaryprodServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryprodServiceCode_JSON==primaryprodServiceCode_Database?printPassedResult('Product Product Service Code ',primaryprodServiceCode_JSON):printFailedResult('Product Product Service Code Data Value ',primaryprodServiceCode_JSON,primaryprodServiceCode_Database));

    # Verifying primary_product_service_sub_code data value
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubCode_Database?printPassedResult('Primary Product Sub Product Code ',primaryProductServiceSubCode_JSON):printFailedResult('Primary Product Sub Product Code Data Value ',primaryProductServiceSubCode_JSON,primaryProductServiceSubCode_Database));

 # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

#    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


	#    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Creative Id with JSON and NOVA sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
    * def listOfZoneCodes = 'MMC,'
    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

      # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


	# Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
    * match responseTrackingCode_JSON == '#notnull'

	# Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));


	# Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

	# Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

	# Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));


    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    # ------------------ - 6050 ----------------------
  @D2DOfferFulfilmentReminderOfferValidation
  Scenario: Validate D2D Offer FulfilmentReminder offer response fields
    * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')

        # Verifying Offer product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code Value ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,productCode_Database));

    # Verifying Offer Sub product_code data value
    * def subProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string subProductCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(subProductCode_JSON==subProductCode_Database?printPassedResult('Sub Product Code Value ',subProductCode_JSON):printFailedResult('Sub Product Code Data Value ',subProductCode_JSON,subProductCode_Database));


     #  Verifying Offer Instance Id with XML and Proposition sheet
    * def OfferInstanceID_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(OfferInstanceID_JSON==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',OfferInstanceID_JSON):printFailedResult('Offer Instance Id',OfferInstanceID_JSON,offerInstanceId_Proposition));

     #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
    * match LeadId_JSON == '#notnull'

      # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

  @D2DXsellSneakPeakOfferValidation_NOVA
  Scenario: Validate D2DXsellSneakPeak Nova Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecordsForPAULOC')

   # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));


    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
    * def offerStartDate_TodaysDate = trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));


    # Verifying Offer Code
    * def pyName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));


    #    Verifying Viewed Status with JSON and Hard Coded
    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

    # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_NOVASheet = karate.get('data.CreativeId')
    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));


     # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

    # Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
    * def offerExpiryDate_Proposition = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

    #    Verifying Offer Type with JSON and Proposition sheet
    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));

#    #    Verifying Cust_Relevance with JSON and Proposition sheet
#    * def custRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
#    * def custRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
#    * eval if(custRelevance_JSON==custRelevance_Proposition?printPassedResult('Cust Relevance',custRelevance_JSON):printFailedResult('Cust Relevance',custRelevance_JSON,custRelevance_Proposition));

#    #    Verifying primary_product_features with JSON and Proposition sheet
#    * def primaryProductFeatures_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeatures_JSON==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature ',primaryProductFeatures_JSON):printFailedResult('Primary Product Feature',primaryProductFeatures_JSON,primaryProductFeatures_Proposition));

    # Verifying OfferInstance ID with JSON and Test Data sheet
    * def offerInstanceID_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].OfferInstanceID")[0]
    * def primaryCampaignNumber_pacculCustomerDimExcelTestData = karate.get('$data.OII')
    * eval if(offerInstanceID_JSON==primaryCampaignNumber_pacculCustomerDimExcelTestData?printPassedResult('Offer Instance ID ',offerInstanceID_JSON):printFailedResult('Offer Instance ID is ',offerInstanceID_JSON,primaryCampaignNumber_pacculCustomerDimExcelTestData));

    # Verifying approved_credit_limit data value
    * def apprCreditLimit_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'approved_credit_limit')].data_value")[0]
    * string paUlocLimit_Database = trimString(readValue("SELECT PA_CC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(apprCreditLimit_JSON==paUlocLimit_Database?printPassedResult('Approved Credit Limit ',apprCreditLimit_JSON):printFailedResult('Approved Credit Limit Data Value ',apprCreditLimit_JSON,paUlocLimit_Database));

    # Verifying pa_indicator data value
    * def paIndicator_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'pa_indicator')].data_value")[0]
    * string paIndicator_Database = 'PA'
    * eval if(paIndicator_JSON==paIndicator_Database?printPassedResult('PA Indicator ',paIndicator_JSON):printFailedResult('PA Indicator Data Value ',paIndicator_JSON,paIndicator_Database));

    # Verifying primary_source_code data value
    * def primarySouceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_source_code')].data_value")[0]
    * string primarySourceCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimarySourceCode')
    * eval if(primarySouceCode_JSON==primarySourceCode_Database?printPassedResult('Primary Source Code ',primarySouceCode_JSON):printFailedResult('Primary Source Code Data Value ',primarySouceCode_JSON,primarySourceCode_Database));


    # Verifying primary_product_service_code data value
    * def primaryprodServiceCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_code')].data_value")[0]
    * string primaryProductServiceCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryprodServiceCode_JSON==primaryProductServiceCode_Database?printPassedResult('Product Product Service Code ',primaryprodServiceCode_JSON):printFailedResult('Product Product Service Code Data Value ',primaryprodServiceCode_JSON,primaryProductServiceCode_Database));

    # Verifying primary_product_service_sub_code data value
    * def primaryProductServiceSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'primary_product_service_sub_code')].data_value")[0]
    * string primaryProductServiceSubProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubProductCode_Database?printPassedResult('Primary Product Service Sub Code ',primaryProductServiceSubCode_JSON):printFailedResult('Primary Product service Sub Code Data Value ',primaryProductServiceSubCode_JSON,primaryProductServiceSubProductCode_Database));

    # Verifying product_code data value
    * def productCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
    * string primaryProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(productCode_JSON==primaryProductCode_Database?printPassedResult('Product Code ',productCode_JSON):printFailedResult('Product Code Data Value ',productCode_JSON,primaryProductCode_Database));

    # Verifying product_sub_code data value
    * def productSubCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_sub_code')].data_value")[0]
    * string primarySubProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(productSubCode_JSON==primarySubProductCode_Database?printPassedResult('Product Sub Code ',productSubCode_JSON):printFailedResult('Product Sub Code Data Value ',productSubCode_JSON,primarySubProductCode_Database));

      # Verifying ALT 1 product_code data value
    * def Alt1ProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_product_code')].data_value")[0]
    * string Alt1ProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductCode')
    * eval if(Alt1ProductCode_JSON==Alt1ProductCode_Database?printPassedResult('Alt1 Product Code',Alt1ProductCode_JSON):printFailedResult('Alt1ProductCode Data Value ',Alt1ProductCode_JSON,Alt1ProductCode_Database));

    # Verifying alt1_product_sub_code data value
    * def alt1_product_sub_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_product_sub_code')].data_value")[0]
    * string alt1_product_sub_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductSubCode')
    * eval if(alt1_product_sub_code_JSON==alt1_product_sub_code_Database?printPassedResult('alt1_product_sub_code ',alt1_product_sub_code_JSON):printFailedResult('alt1_product_sub_code Value ',alt1_product_sub_code_JSON,alt1_product_sub_code_Database));

    # Verifying alt1_source_code data value
    * def alt1_source_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt1_source_code')].data_value")[0]
    * string alt1_source_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1SourceCode')
    * eval if(alt1_source_code_JSON==alt1_source_code_Database?printPassedResult('alt1_source_code',alt1_source_code_JSON):printFailedResult('alt1_source_code ',alt1_source_code_JSON,alt1_source_code_Database));

    # Verifying alt2_product_code  product_code data value
    * def alt2ProductCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_product_code')].data_value")[0]
    * string alt2ProductCode_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2ProductCode')
    * eval if(alt2ProductCode_JSON==alt2ProductCode_Database?printPassedResult('alt2 Product Code',alt2ProductCode_JSON):printFailedResult('alt2ProductCode Data Value ',alt2ProductCode_JSON,alt2ProductCode_Database));

    # Verifying alt2_product_sub_code data value
    * def alt2_product_sub_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_product_sub_code')].data_value")[0]
    * string alt2_product_sub_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2ProductSubCode')
    * eval if(alt2_product_sub_code_JSON==alt2_product_sub_code_Database?printPassedResult('alt2_product_sub_code ',alt2_product_sub_code_JSON):printFailedResult('alt2_product_sub_code Value ',alt2_product_sub_code_JSON,alt2_product_sub_code_Database));

    # Verifying alt2_source_code data value
    * def alt2_source_code_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'alt2_source_code')].data_value")[0]
    * string alt2_source_code_Database = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt2SourceCode')
    * eval if(alt2_source_code_JSON==alt2_source_code_Database?printPassedResult('alt2_source_code',alt2_source_code_JSON):printFailedResult('alt2_source_code ',alt2_source_code_JSON,alt2_source_code_Database));
#
#    # Verifying offer_condition with JSON and Proposition sheet
#    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
#    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
#    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_JSON):printFailedResult('Offer Condition ',offerCondition_JSON,offerCondition_Proposition));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying PrimaryProductServiceName with JSON and Proposition sheet
    * def PrimaryProductServiceName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].PrimaryProductServiceName")[0]
    * def PrimaryProductServiceNameEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(PrimaryProductServiceName_JSON==PrimaryProductServiceNameEN_Proposition?printPassedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON):printFailedResult('Primary Product Service Name ',PrimaryProductServiceName_JSON,PrimaryProductServiceNameEN_Proposition));

    #  Verifying Customer Full name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
    * def cust_full_name_DB = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def customerTitle_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * eval if(customerTitle_Database==null?customerTitle_Database='':customerTitle_Database);
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerTitle_Database==''?customerFullName_Database = customerFirstName_Database+ ' ' + customerLastName_Database:customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database);
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
    * eval if(cust_full_name_DB==null?customerFullName_Database=customerFullName_Database:customerFullName_Database=cust_full_name_DB);
    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));

    #  Verifying Customer First name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));

    #  Verifying Customer Last name with JSON and Database table- EDPPEGAT.CUST_DIM
    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));

    #    Verifying CID with XML and Conditioned NOVA Sheet
    * def id_JSON = karate.jsonPath(responseString,"$.cid")
    * def id_Excel = cid
    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
