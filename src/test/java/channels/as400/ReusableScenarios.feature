@ignore
Feature: Re-usable scenarios specific to AS400 Channel

  @CID_Insertion_AS400_Sheet
  Scenario: write customer CID details in excel as400 sheet
  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  @CID_Insertion_AS400_Sheet_2Customers
  Scenario: write customer CID details in excel AS400 sheet
  # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID1),"ID")

  @CID_Insertion_CUST_DIM_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",CID,"CIS_CUST_ID")

  @CID_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUSTINSIGHTS sheet
       # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",CID,"CIS_CUST_ID")

  @CURR_VAL_UPDT_TIMESTAMP_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(curr_val_tp),"CURR_VAL_UPDT_TMSTMP")

  @ACCT_NUM_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created Acct_num into the CUST_INSIGHTS_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",accountNumber,"ACCT_NUM")

  @CID_Insertion_PA_CCUL_CUSTOMER_Sheet
  Scenario: write customer CID details in excel PA_CCUL_CUSTOMER sheet
       # insert the created CID into the AS400 Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER",CID,"CIS_CUST_ID")

  @CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer CID details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",CID,"CIS_CUST_ID")

  @MLS_ADDED_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer MLS_ADDED_DT details in excel CUST_DIM sheet
    # Generate MLS_ADDED_DT to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the event date to YYYY-MM-DD format
    * string mls_added_dt = MLS_DT == 'NULL' ? 'NULL' : dateFormatExcludeDays(MLS_DT)
    * print "MLS Added Date is", mls_added_dt
  # insert the created MLS_ADDED_DT into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mls_added_dt,"MLS_ADDED_AT_DT")

  @CUST_OPND_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer DOB details in excel CUST_DIM sheet
    * string cust_opnd_dt = CUST_OPND_DT == 'NULL'? 'NULL': dateFormatExcludeDays(CUST_OPND_DT)
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",cust_opnd_dt,"CUST_OPND_DT")


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

  @ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer account number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def acct_num = accountNumber
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")

  @SCD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write Scotia Card number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def scd_num = ScotiaCardNumber
# insert the created scd_num into the CUST_ACCT_RLTNP_DIM  excel sheet under SCD_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",scd_num,"SCD_NUM")

  @SCD_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write Scotia Card number in excel ACCT_DIM sheet
    * def scd_num = ScotiaCardNumber
        # insert the created scd_num into the ACCT_DIM  excel sheunder SCD_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",scd_num,"SCD_NUM")

  @ACCT_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write customer account number in excel ACCT_DIM sheet
    * def acct_num = accountNumber
      # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")

  @ACCT_Num_Insertion_SCD_NUM_Sheet
  Scenario: write customer scd number in excel ACCT_DIM sheet
    * def scd_num = SCDNUM
      # insert the created SCD_NUM into the ACCT_DIM  excel sheet under SCD_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",scd_num,"SCD_NUM")

  @CLI_OFR_EXP_DT_Insertion_ACCT_DIM_Sheet
  Scenario: write customer offer expiry date details in excel ACCT_DIM sheet
  # insert offer start date into the ACCT_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",offerExpiryDate,"CLI_OFR_EXP_DT")

  @CLI_OFR_ST_DT_Insertion_ACCT_DIM_Sheet
  Scenario: write customer offer start date details in excel ACCT_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",offerStartDate,"CLI_OFR_ST_DT")

  @CLI_CC_SCNRY_CUST_ID_Insertion_ACCT_DIM_Sheet
  Scenario: write secondary customer id details in excel ACCT_DIM sheet
  # insert secondary cid into the ACCT_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",secondaryCid,"CC_SCNRY_CUST_ID")

  @SOL_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer SOL last login date details in excel ACCT_DIM sheet
    * string solLastLoginDate = SOL_LAST_LOGIN_DT == 'NULL'? 'NULL': dateFormatExcludeDays(SOL_LAST_LOGIN_DT)
    * print "SOl last Login date is:",solLastLoginDate
  # insert the SOL last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",solLastLoginDate,"SOL_LAST_LOGIN_DT")

  @MOB_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer MOB last login date details in excel ACCT_DIM sheet
    * string mobLastLoginDate = MOB_LAST_LOGIN_DT == 'NULL'? 'NULL': dateFormatExcludeDays(MOB_LAST_LOGIN_DT)
    * print "MOB last Login date is:",mobLastLoginDate
 # insert the MOB last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mobLastLoginDate,"MOB_LAST_LOGIN_DT")

  @CID_Insertion_CUST_ACCT_PREF_Sheet
  Scenario: write customer CID details in excel CUST_ACCT_PREF sheet
#       # insert the created CID into the CUST_ACCT_PREF Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_PREF",karate.get(CID),"CIS_CUST_ID")

  @ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet
  Scenario: write customer Account Number details in excel CUST_ACCT_PREF sheet
#       # insert the created CID into the CUST_ACCT_PREF Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_PREF",accountNumber,"ACCT_NUM")

  @MAT_DT_Insertion_ACCT_DIM_Sheet

  Scenario: write MAT_DT details in excel ACCT_DIM sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",maturityDate,"MAT_DT")

  @Mort_Find_DATE_Insertion_ACCT_DIM_Sheet
  Scenario: write Mortgage Find date details in excel ACCT_DIM sheet
        # Generate Mortgage Find dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert the Mortgage Find dt to YYYY-MM-DD format
    * string Mort_Find_Dt = MORT_FNDNG_DT == 'NULL'? 'NULL': dateFormatExcludeDays(MORT_FNDNG_DT)
    * print "Mortgage Finding Date is", Mort_Find_Dt
  # insert the created MORTGAGE FIND dATE into the ACCT_DIM  excel sheet under MORT_FNDNG_DT column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",Mort_Find_Dt,"MORT_FNDNG_DT")

  @ACCT_CRFC_NUM_Insertion_ACCT_DIM_Sheet
  Scenario: write ACCT_CRFC_NUM  details in excel ACCT_DIM sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",CERT,"ACCT_CRFC_NUM")

  @CUST_DIM_Insertion_Database
  Scenario: Insert customer information details in CUST_DIM table
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * print dataCustDim
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"CUST_DIM")
    * def cust_DimInsrt =  insertRows(cust_dim_querybuilder)
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(CID)+"'")
   * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)

  @CUST_ACCT_RLTNP_DIM_Insertion_Database
  Scenario: Insert customer and account details in CUST_ACCT_RLTNP_DIM table
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  insertRows(cust_acct_rltnp_querybuilder)
#    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(CID)+"' AND ACCT_NUM = '"+acct_num+"'")
#    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)

  @ACCT_DIM_Insertion_Database
  Scenario: Insert customer account details in ACCT_DIM table
#   * def acct_num = accountNumber
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"ACCT_DIM")
    * def acct_DimInsrt =  insertRows(acct_dim_querybuilder)
#   * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
#   * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)

  @CUST_ACCT_PREF_Insertion_Database
  Scenario: Insert customer account details in ACCT_DIM table
    * def custAcctPref = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_PREF")
    * string custAcctPref_querybuilder = queryBuilderCustAcctPref(custAcctPref,"CUST_ACCT_PREF")
    * def custAcctPref_Insrt =  insertRows(custAcctPref_querybuilder)

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


  @reportDbRecords
  Scenario: Report DB records
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)
    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)
    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)

  @EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write EVENT_DATE  in excel CUST_INSIGHTS sheet
    * def eventDate = event_date
      # insert the created eventDate into the CUST_INSIGHTS excel sheet under EVENT_DATE column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",eventDate,"EVENT_DATE")

  @CID_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(CID),"CIS_CUST_ID")

  @CURR_VAL_UPDT_TIMESTAMP_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(curr_val_tp),"CURR_VAL_UPDT_TMSTMP")

  @CUST_INSIGHTS_Insertion_Database
  Scenario: Insert customer information details in CUST_INSIGHTS table
    * def dataCustInsights = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_INSIGHTS")
    * string cust_insights_querybuilder = QueryBuilderForCustInsights(dataCustInsights,"CUST_INSIGHTS")
    * def cust_InsightsInsrt =  insertRows(cust_insights_querybuilder)

  @CardRenewalDate_Insertion_ACCT_DIM_Sheet
  Scenario: Insert Card Renewal Date in ACCT_DIM sheet
     # Convert the Card renewal date to YYYY-MM-DD format
    * string card_renewal_Dt = CRD_RENEWAL_DT == 'NULL'? 'NULL': futureDateInDays(CRD_RENEWAL_DT)
    * print "card renewal Date is", card_renewal_Dt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",card_renewal_Dt,"CRD_RENEWAL_DT")

  @ACCT_ODT_ACCT_DIM_Sheet
  Scenario: Insert Account ODT in ACCT_DIM sheet
    # Generate Account Open dt to insert in data sheet.
    #Insert default of plus 30 days from current date if nothing specified in example.Else add days specified in example
    # Convert theaccount open date to YYYY-MM-DD format
    * string acct_odt = ACCT_ODT == 'NULL'? 'NULL': dateFormatExcludeDays(ACCT_ODT)
    * print "Account Open Date is", acct_odt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")

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
    * print "Valid Start Date is", validstartdate
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



  @reportDbRecordsForPAULOC
  Scenario: Report DB records For PA ULOC Campaign
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)
    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)
    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)
    * def pa_ccul_customer_TableData = readDbRow("Select * from "+dbSchema+".PA_CCUL_CUSTOMER where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******PA_CCUL_CUSTOMER Database table data******'+karate.pretty(pa_ccul_customer_TableData)

  @AS400_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for AS400
    #    Building GET NBA Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * print 'Channel code is:' + karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope$ = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID$ = karate.get('$data.RequestID')
    * print 'Request XML'+requestfile

  @AS400_SOAP_CALL_AfterDisposition
  Scenario: Generate GET NBA SOAP call after disposition for AS400
    #    Building GET NBA Request Body after disposition
    * def afterDispositionRequestfile = read('classpath:channels/as400/Channel AS400.txt')
    * replace afterDispositionRequestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace afterDispositionRequestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace afterDispositionRequestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace afterDispositionRequestfile.$ID$ = karate.get('$data.ID')
    * replace afterDispositionRequestfile.$IDType$ = karate.get('$data.IDType')
    * replace afterDispositionRequestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace afterDispositionRequestfile.$LeadScope$ = karate.get('$data.LeadScopeDisposition')
    * replace afterDispositionRequestfile.$RequestID$ = karate.get('$data.RequestID')
    * print 'Request XML after disposition'+afterDispositionRequestfile

  @AS400_Disposition_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for AS400
 #    Building Disposition Request Body
    * replace dispositionfile.$AgentID$ = karate.get('$data.AgentID')
    * replace dispositionfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace dispositionfile.$ID$ = karate.get('$data.ID')
    * replace dispositionfile.$ZoneCode$ = karate.get('$data.ZoneCode')
    * replace dispositionfile.$ResponseCode$ = karate.get('$data.ResponseCode')
    * replace dispositionfile.$ResponseTrackingCode$ = karate.get('responseTrackingCode_XML')
    * replace dispositionfile.$TreatmentTrackingCode$ = karate.get('treatmentTrackingCode_XML')

  @NOVA_CrossChannel_REST_CALL
  Scenario: Generate GET NBA SOAP call for NOVA
    Given url 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers'
    * def headersData = { ContentType: 'application/json', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData
    #    Building GET Interaction Request Body
    * replace crossChannelRequestfileMOB.$ContextType$ = karate.get('$data.ContextType_MOB')
    * replace crossChannelRequestfileMOB.$ContextValue$ = karate.get('$data.ContextValue_MOB')
    * replace crossChannelRequestfileMOB.$ContextType1$ = karate.get('$data.ContextType1_MOB')
    * replace crossChannelRequestfileMOB.$ContextValue1$ = karate.get('$data.ContextValue1_MOB')
    * replace crossChannelRequestfileMOB.$ChannelCode$ = karate.get('$data.ChannelCode_MOB')
    * replace crossChannelRequestfileMOB.$ID$ = karate.get('$data.ID')
    * replace crossChannelRequestfileMOB.$IDType$ = karate.get('$data.IDType')
    * replace crossChannelRequestfileMOB.$InteractionType$ = karate.get('$data.InteractionType_MOB')
    * replace crossChannelRequestfileMOB.$LanguageCode$ = karate.get('$data.LanguageCode_MOB')
    * replace crossChannelRequestfileMOB.$LeadScope$ = karate.get('$data.LeadScope_MOB')
    * replace crossChannelRequestfileMOB.$RequestID$ = karate.get('$data.RequestID_MOB')
    * print 'Request JSON'+crossChannelRequestfileMOB
  # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request crossChannelRequestfileMOB
   #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    Then status 200
    * def crossChannelResponseString = response

  @ORN_CrossChannel_REST_CALL
  Scenario: Generate GET NBA SOAP call for ORN
    Given url 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers'
    * def headersData = { ContentType: 'application/json', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData
    #    Building GET Interaction Request Body
    * replace crossChannelRequestfileORN.$ContextType$ = karate.get('$data.ContextType_ORN')
    * replace crossChannelRequestfileORN.$ContextValue$ = karate.get('$data.ContextValue_ORN')
    * replace crossChannelRequestfileORN.$ContextType1$ = karate.get('$data.ContextType1_ORN')
    * replace crossChannelRequestfileORN.$ContextValue1$ = karate.get('$data.ContextValue1_ORN')
    * replace crossChannelRequestfileORN.$ChannelCode$ = karate.get('$data.ChannelCode_ORN')
    * replace crossChannelRequestfileORN.$ID$ = karate.get('$data.ID')
    * replace crossChannelRequestfileORN.$IDType$ = karate.get('$data.IDType')
    * replace crossChannelRequestfileORN.$InteractionType$ = karate.get('$data.InteractionType_ORN')
    * replace crossChannelRequestfileORN.$LanguageCode$ = karate.get('$data.LanguageCode_ORN')
    * replace crossChannelRequestfileORN.$LeadScope$ = karate.get('$data.LeadScope_ORN')
    * replace crossChannelRequestfileORN.$RequestID$ = karate.get('$data.RequestID_ORN')
    * print 'Request JSON'+crossChannelRequestfileORN
  # request (Karate keyword) for sending request string (Re-sending request to verify after disposition)
    When request crossChannelRequestfileORN
   #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Success with status code 200
    Then status 200
    * def crossChannelResponseString = response

  @SOL_CrossChannel_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for NOVA
    Given url 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL'
    * def headersData = { ContentType: 'text/xml', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData

#    #    Building GET NBA Request Body after disposition
#    * def crossChannelRequestfile = read('classpath:channels/as400/Channel AS400.txt')
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

    #    Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

     #    Verifying IncentiveAmount with XML and Hard coded
    * def incentiveAmount_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::IncentiveAmount/text()")
    * def incentiveAmount_HardCoded = '0'
    * eval if(incentiveAmount_XML==incentiveAmount_HardCoded?printPassedResult('Incentive Amount',incentiveAmount_XML):printFailedResult('Incentive Amount',incentiveAmount_XML,incentiveAmount_HardCoded));

     #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

  #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

  #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    #    Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * eval if(creativeId_XML==creativeId_AS400Sheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));

     #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

   #    Verifying Declined indicator when Decline disposition is done and compared with XML and hardcoded value
    * def declinedIndicator_XML =  karate.get('$data.ResponseCode') == 'Decline' ? karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::DeclinedIndicator/text()") : null
    * def declinedIndicator_HardCoded = karate.get('$data.ResponseCode') == 'Decline' ? 'true' : null
    * eval if(declinedIndicator_XML==declinedIndicator_HardCoded?printPassedResult('Declined indicator',declinedIndicator_XML):printFailedResult('Declined indicator',declinedIndicator_XML,declinedIndicator_HardCoded));

    #    #  Verifying Secondary Account number with XML and Database
    * string secondaryCid_DB = readValue("SELECT CC_SCNRY_CUST_ID FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * string secondaryCid_DB = secondaryCid_DB == null ? 'null' : secondaryCid_DB
    * def secondaryCID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::SecondaryCustCisID/text()")
    * def secondaryCID_XML = secondaryCID_XML == null ?'null' : secondaryCID_XML
    * eval if(secondaryCID_XML==secondaryCid_DB?printPassedResult('Secondary Holder CID',secondaryCID_XML):printFailedResult('Secondary Holder CID',secondaryCID_XML,secondaryCid_DB));

    #    Verifying Declined Date when Decline disposition is done and compared with XML and today's date
    * def declinedDate_XML =  karate.get('$data.ResponseCode') == 'Decline' ? karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::DeclinedDate/text()") : null
    * def declinedDate_TodaysDate = karate.get('$data.ResponseCode') == 'Decline' ? getDate('yyyy-MM-dd') : null
    * eval if(declinedDate_XML==declinedDate_TodaysDate?printPassedResult('Declined Date',declinedDate_XML):printFailedResult('Declined Date',declinedDate_XML,declinedDate_TodaysDate));

   #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * print "web response customer relevance"+CustomerRelevance_XML

    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * print "Proposition customer relevance"+CustomerRelevance_Proposition
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * def PrimaryProductServiceCode_Proposition = PrimaryProductServiceCode_Proposition == '' ? null : PrimaryProductServiceCode_Proposition
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


 #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * def PrimaryProductServiceName_Proposition = PrimaryProductServiceName_Proposition == '' ? null : PrimaryProductServiceName_Proposition
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * def PrimaryProductFeaturesEN_Proposition = PrimaryProductFeaturesEN_Proposition == '' ? null : PrimaryProductFeaturesEN_Proposition
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

#    #  Verifying Secondary Holder Name with XML and Database
    * string secondaryCid_DB = readValue("SELECT CC_SCNRY_CUST_ID FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * string secondaryCid_DB = secondaryCid_DB == null ? 'null' : secondaryCid_DB
    * string title_DB =  readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * string firstName_DB = readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * string lastName_DB =  readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * def secondaryHolderName_DB = trimString(secondaryCid_DB == null ? 'null' : (title_DB == null ? '' : title_DB )+' ' +(firstName_DB == null ? '' : firstName_DB )+ ' ' +( lastName_DB == '' ? 'null' : lastName_DB))
    * def secondaryHolderName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::SecondaryHolderName/text()")
    * def secondaryHolderName_XML = secondaryHolderName_XML == null ?'null' : secondaryHolderName_XML
    * eval if(secondaryHolderName_XML==secondaryHolderName_DB?printPassedResult('Secondary Holder Name',secondaryHolderName_XML):printFailedResult('Secondary Holder Name',secondaryHolderName_XML,secondaryHolderName_DB));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'
 #    Added by Avanthi for MissingInvalidEmail
  @MissingInvalidEmailOfferValidation
  Scenario: Validate MissingInvalidEmail offer against DB and Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')
    * string id_Excel = cid
    * print " The cid for validation is :" +id_Excel
#      #    Verifying Offer Start date with today
#    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
#    * def offerStartDate_todayDate = getDate('yyyy-MM-dd')
##    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(offerStartDate_XML==offerStartDate_todayDate?printPassedResult('Offer Start Date',offerStartDate_todayDate):printFailedResult('Offer Start Date',offerStartDate_XML,offerStartDate_todayDate));
#  Verifying Lead ID  XML should not be null
    * def LeadID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadID_XML == '#notnull'

#    Verifying Offer expiry date with XML and proposition
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML): printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

#  Verifying Offer Condition with XML and Proposition sheet

    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_Proposition):printFailedResult('Offer Condition',OfferCondition_XML,ofrCond_cust));


#    Added by Pavani for Proactive dormancy
  @ProactiveDormancyOfferValidation
   Scenario: Validate Proactive dormancy offer against DB and Proposition
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')
    * string id_Excel = cid
     * print " The cid for validation is :" +id_Excel
    #    Verifying Offer Condition with XML and Proposition sheet
    * string insight_acct_num_db = readValue("SELECT ACCT_NUM FROM "+dbSchema+".CUST_INSIGHTS WHERE CIS_CUST_ID ='"+id_Excel+"'")
     * print "Insight account number is :" +insight_acct_num_db
    * string event_dt_insight = readValue("SELECT EVENT_DATE FROM "+dbSchema+".CUST_INSIGHTS WHERE CIS_CUST_ID ='"+id_Excel+"'")
     * print " event date from db is :" + event_dt_insight
     * replace event_dt_insight.- = ''
     * string insight_dt = event_dt_insight
     * print "Insight date in YYYYMMDD format is" + insight_dt
    * string insight_acctnbr = subString(insight_acct_num_db,23,19)
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
#    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * def ofrCond_cust = "Account Number ending in"+" "+insight_acctnbr+" "+"will become dormant by"+" "+insight_dt+"." + " Deposit accounts become dormant after 24 consecutive months without a customer initiated activity."
#    * def Ofr_cond_Compare =  ofrCond_cust + OfferCondition_Proposition
    * eval if(OfferCondition_XML==ofrCond_cust?printPassedResult('Offer Condition',ofrCond_cust):printFailedResult('Offer Condition',OfferCondition_XML,ofrCond_cust));

   #    Verifying Offer Start date with today
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
      #    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(offerStartDate_XML==leadStartDate_IH? printPassedResult('Lead Start Date',offerStartDate_XML): printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_XML));
    * def leadStartDate_todayDate = getDate('yyyy-MM-dd')
#    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(offerStartDate_XML==leadStartDate_todayDate?printPassedResult('Offer Start Date',leadStartDate_todayDate):printFailedResult('Offer Start Date',offerStartDate_XML,leadStartDate_todayDate));

#    Verifying Offer expiry date with XML and proposition
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition? printPassedResult('Offer Expiry date',offerExpiryDate_XML): printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));
    # Added by Pavani for D2D Xsell validation

  @D2DXSellOfferValidation
  Scenario: Validate offer details for contextual offer
   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

    #    Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

     #    Verifying IncentiveAmount with XML and Hard coded
    * def incentiveAmount_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::IncentiveAmount/text()")
    * def incentiveAmount_HardCoded = '0'
    * eval if(incentiveAmount_XML==incentiveAmount_HardCoded?printPassedResult('Incentive Amount',incentiveAmount_XML):printFailedResult('Incentive Amount',incentiveAmount_XML,incentiveAmount_HardCoded));

     #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

  #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

  #    Verifying Offer Title with XML and Proposition sheet
    * def OfferTitle_DS = karate.get('data.OfferTitle')
    * print 'OfferTitle is:' + OfferTitle_DS
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(OfferTitle_DS.length==0?(offerTitle_XML==offerShortDescription_Proposition? printPassedResult('Offer Title',offerTitle_XML): printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition)):(offerTitle_XML==OfferTitle_DS? printPassedResult('Offer Title',offerTitle_XML): printFailedResult('Offer Title',offerTitle_XML,OfferTitle_DS)));

    #    Verifying Offer Condition with XML and Proposition sheet

    * def OfferCond_DS = karate.get('data.OfferCondition')
    *  print 'OfferCondition is:' + OfferCond_DS
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCond_DS.length==0?(OfferCondition_XML==OfferCondition_Proposition? printPassedResult('Offer Condition',OfferCondition_XML): printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition)):(OfferCondition_XML==OfferCond_DS? printPassedResult('Offer Condition',OfferCondition_XML): printFailedResult('Offer Condition',OfferCondition_XML,OfferCond_DS)));

    #    Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
        * eval if((creativeId_XML==creativeId_AS400Sheet)? printPassedResult('Creative Id',creativeId_XML): printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));

   #    Verifying Offer Start date with today
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
      #    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(offerStartDate_XML==leadStartDate_IH? printPassedResult('Lead Start Date',offerStartDate_XML): printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_XML));
    * def leadStartDate_todayDate = getDate('yyyy-MM-dd')
#    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(offerStartDate_XML==leadStartDate_todayDate?printPassedResult('Lead Start Date',leadStartDate_todayDate):printFailedResult('Lead Start Date',offerStartDate_XML,leadStartDate_todayDate));


#    Verifying Offer expiry date with XML and proposition
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition? printPassedResult('Offer Expiry date',offerExpiryDate_XML): printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded? printPassedResult('Zone Code',zoneCodes_XML): printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));


     #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition? printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML): printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


 #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition? printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML): printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def OfferDesc_DS = karate.get('data.OfferDescription')
    * print "Offer Description from sheet is :" + OfferDesc_DS
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
#    * eval if(offerDescription_XML==OfferDescription_Proposition? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));
    * eval if(OfferDesc_DS.length==0?(offerDescription_XML==OfferDescription_Proposition? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition)):(offerDescription_XML==OfferDesc_DS? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDesc_DS)));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition? printPassedResult('CampaignType',campaignType_XML): printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition? printPassedResult('Campaign Name',campaignName_XML): printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'

  @DispositionOfferValidationWithIH
  Scenario: Validate disposition offer details with IH
   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

    * print '**** Validation of IH Disposition'+dispositionCode+' Record***'

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

#    Verifying  Channel name with Excel (AS400 Input sheet) value and IH
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

#    Verifying  Channel Outcome(only for Disposition test case) with Excel (AS400 Input sheet) and IH
    * def channelOutcome_ExcelTestData = karate.get('$data.ResponseCode')
    * def channelOutcome_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Channel Outcome']")[0]
    * eval if(channelOutcome_ExcelTestData==channelOutcome_IH?printPassedResult('Channel Outcome',channelOutcome_IH):printFailedResult('Channel Outcome',channelOutcome_IH,channelOutcome_ExcelTestData));

    #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

#    #    Verifying  Operator with AS400 Excel sheet and IH
    * def operator_As400Sheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Operator")[0]
    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

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

#    Verifying  Channel name with Excel (AS400 Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode_'+crossChannel)
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


  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

#    #    Verifying  Operator with AS400 Excel sheet and IH
    * def operator_As400Sheet = crossChannel == 'MOB' ? karate.get('$data.RequestID_'+crossChannel) : karate.get('$data.RequestID_'+crossChannel)
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Operator")[0]
    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

    #    Verifying  Lead Scope with AS400 Soap Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.LeadScope_'+crossChannel)
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with AS400 Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = (crossChannel == 'MOB' ? upperCase(karate.get('$data.ContextType1_'+crossChannel)) : upperCase(karate.get('$data.ContextType_'+crossChannel)))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with AS400 Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = (crossChannel == 'MOB' ? upperCase(karate.get('$data.ContextValue1_'+crossChannel)) : upperCase(karate.get('$data.ContextValue_'+crossChannel)))
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
    * print "cid is:" + pySubjectID_ExcelTestData
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

#    Verifying  Channel name with Excel (AS400 Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

    #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_TodaysDate,offeredOn_IH));

    #    Verifying  Out come with Hard coded value and IH
    * def outCome_HardCoded = outcome
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Outcome")[0]
    * eval if(outCome_HardCoded==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_HardCoded));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * print "creativeId_AS400Sheet is " + creativeId_AS400Sheet
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  Operator with AS400 Excel sheet and IH
    * def operator_As400Sheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Operator")[0]
    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

    #    Verifying  Lead Scope with AS400 Soap Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.LeadScope')
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with AS400 Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = upperCase(karate.get('$data.ContextType'))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with AS400 Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = upperCase(karate.get('$data.ContextValue'))
    * def primatyContextValue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Value']")[0]
    * eval if(primatyContextValue_RequestBody==primatyContextValue_IH?printPassedResult('Primary context Value',primatyContextValue_RequestBody):printFailedResult('Primary context value',primatyContextValue_IH,primatyContextValue_RequestBody));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

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

  @ProactiveDormancySpecificIHValidation
  Scenario Outline:: Validate ProactivrDormancy offer details with IH
    * string outcome = <outcome>
     # Verifying IH record
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
      #    Verifying Offer Start date with today
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * replace offerStartDate_XML.- = ''
     * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(offerStartDate_XML==leadStartDate_IH? printPassedResult('Lead Start Date',offerStartDate_XML): printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_XML));
#    Verifying Offer expiry date with XML and proposition
    * def offerExpiryDate = futureDateInDays(180)
    * replace offerExpiryDate.- = ''
    * def offerExpiryDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(offerExpiryDate==offerExpiryDate_IH? printPassedResult('Offer Expiry date',offerExpiryDate): printFailedResult('Lead End Date',offerExpiryDate,offerExpiryDate_IH));

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @D2DXsellSpecificIHValidation
  Scenario Outline:: Validate D2DXsell offer details with IH
    * string outcome = <outcome>
     # Verifying cell group in IH against NOVA sheet
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
    * def cellGroup_As400Sheet = karate.get('$data.CellGroup')
    * print "CellGroup AS400 sheet length is :" + stringLength(cellGroup_As400Sheet)
    * eval if((stringLength(cellGroup_As400Sheet)> 3)?(cellGroup_As400Sheet = sortString(cellGroup_As400Sheet,'|')):cellGroup_As400Sheet);
    #* def cellGroup_NOVASheet = sortString(cellGroup_NOVASheet,'|')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if((stringLength(cellGroup_IH)> 3)?(cellGroup_IH = sortString(cellGroup_IH,'|')):cellGroup_IH);
    #* def cellGroup_IH = sortString(cellGroup_IH,'|')
#    * def cellGroup_IH = ValidateCellGroup(cellGroup_NOVASheet,cellGroup_IH,'|')
    * eval if(cellGroup_As400Sheet==cellGroup_IH?printPassedResult('CellGroup',cellGroup_IH):printFailedResult('CellGroup',cellGroup_IH,cellGroup_As400Sheet));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @PACCULOCSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to PACC and PAULOC)
    * string outcome = <outcome>
      #    Verifying  Treatment ( Creative ID) with PA CC table   and IH
    * def creativeId_As400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_As400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_As400Sheet));

    #    Verifying  Lead Start Date - AS400 - with PA CC table and IH
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
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

     #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def zoneCodes_Proposition = 'CSE'
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

  @CLISpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CLI)
    * string outcome = <outcome>

     #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
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

  @CreditorInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to creditor insurance)
    * string outcome = <outcome>

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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

  @ULOCInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to ULOC Insurance)
    * string outcome = <outcome>

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

#    #    Verifying  Treatment ( Creative ID) with AS400 Sheet
#    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
#    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyTreatment")[0]
#    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  cell Group with AS400 Sheet
    * def cellGroup_AS400Sheet = karate.get('data.CellGroup')
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_AS400Sheet==CellGroup_IH?printPassedResult('Cell Group',cellGroup_AS400Sheet):printFailedResult('Cell Group',CellGroup_IH,cellGroup_AS400Sheet));


    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

     # -------------------------------------ODP Offer Validation - 5787--------------------------------------------
  @ODPOfferValidationWithIH
  Scenario Outline: Validate offer details with IH (ODP)

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

#    Verifying  Channel name with Excel (AS400 Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

    #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_TodaysDate,offeredOn_IH));

    #    Verifying  Out come with Hard coded value and IH
    * def outCome_HardCoded = outcome
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Outcome")[0]
    * eval if(outCome_HardCoded==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_HardCoded));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

#  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
#    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
#    * print "creativeId_AS400Sheet is " + creativeId_AS400Sheet
#    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
#    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  Operator with AS400 Excel sheet and IH
    * def operator_As400Sheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Operator")[0]
    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

    #    Verifying  Lead Scope with AS400 Soap Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.LeadScope')
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with AS400 Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = upperCase(karate.get('$data.ContextType'))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with AS400 Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = upperCase(karate.get('$data.ContextValue'))
    * def primatyContextValue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Value']")[0]
    * eval if(primatyContextValue_RequestBody==primatyContextValue_IH?printPassedResult('Primary context Value',primatyContextValue_RequestBody):printFailedResult('Primary context value',primatyContextValue_IH,primatyContextValue_RequestBody));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

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

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString12Digits(acct_num)
    * print "12 digit account number is :" + accountNumber_acctDimExcelTestData
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

#    #    Verifying  Lead Start Date - SOL - with current date and IH
#    * def leadStartDate_todayDate = getDate('yyyyMMdd')
#    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_todayDate,leadStartDate_IH));
#
#       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
#    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
#    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
#    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
#    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
#    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * print offerInstanceId_IH
    * def campaignWaveNumber = subString(offerInstanceId_IH,5,3)
    * print campaignWaveNumber
#    * def ddrRecords = getDDRRecords()
#    * string campaignWaveNumber =   getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    #hard coded as the script was failing due to browser. Pick the wave number and replace in future releases in the statement below
#    * string campaignWaveNumber =   '63'
    * def OII_SEGMENTATION = karate.get('data.OII')+campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));


    #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.AS400CreativeID')
    * print "Creative id from Datasheet is " + creativeId_AS400Sheet
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  cell Group with AS400 Sheet
    * def cellGroup_AS400Sheet = karate.get('data.CellGroup')
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(cellGroup_AS400Sheet==CellGroup_IH?printPassedResult('Cell Group',cellGroup_AS400Sheet):printFailedResult('Cell Group',CellGroup_IH,cellGroup_AS400Sheet));


    Examples:
      | outcome |
      | "PST"   |

  @MortgageRenewalSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to mortgage renewal)
    * string outcome = <outcome>

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - AS400 - From Soap Response and IH
    * def ddrRecords = getDDRRecords()
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def offerStartDate_DDR = getStartDateFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * replace offerStartDate_DDR.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(offerStartDate_DDR==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',offerStartDate_DDR,leadStartDate_IH));

       #    Verifying  Lead End Date from DB Maturity date and IH
    * def leadEndDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

    #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationMortgage(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceIdSegmentationDDR==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceIdSegmentationDDR):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |

  @GICSpecificElements
  Scenario Outline: Validate GIC IH response fields in NOVA
    * string outcome = <outcome>
    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

#    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

      #  Verifying  Account Number with Database and IH
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

  @ReturnMailSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to return mail)
    * string outcome = <outcome>

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

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


######################## SOAP Response validation specific to campaigns#######################
 # -------------------------------------Mortgage Renewal - 1430--------------------------------------------

  @MortgageContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')

#     Verifying Offer start date with XML and DDR table
    * def ddrRecords = getDDRRecords()
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def offerStartDate_DDR = getStartDateFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * eval if(offerStartDate_XML==offerStartDate_DDR?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_DDR));

 ##  Verifying Current Offer Expiry Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def OfferExpiryDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * eval if(OfferExpiryDate_XML==OfferExpiryDate_Database?printPassedResult('OfferExpiryDate',OfferExpiryDate_XML):printFailedResult('OfferExpiryDate',OfferExpiryDate_XML,OfferExpiryDate_Database));

#  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def sliceString = function(stringValue){return stringValue.slice(stringValue.length - 7)}
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

     #    Verifying Offer Condition with XML and Proposition sheet
    * def sliceString = function(stringValue){return stringValue.slice(stringValue.length - 7)}
    * def currentAccountNumber_Database = sliceString(acct_num)
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * replace maturityDate_Database.- = '/'
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * def OfferCondition_Proposition = ReplaceString(OfferCondition_Proposition,"<Acc Num>",currentAccountNumber_Database)
    * def OfferCondition_Proposition = ReplaceString(OfferCondition_Proposition,"<Mat_Dt>",maturityDate_Database)
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    ##  Verifying Current Account Maturity Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentAccountMaturityDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountMaturityDate/text()")
    * def CurrentAccountMaturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * replace CurrentAccountMaturityDate_Database.- = '/'
    * eval if(CurrentAccountMaturityDate_XML==CurrentAccountMaturityDate_Database?printPassedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML):printFailedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML,CurrentAccountMaturityDate_Database));

#  #  Verifying Current Balance with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentBalance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentBalance/text()")
    * def CurrentBalance_Database = readValue("SELECT CRNT_BAL_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * def CurrentBalance_Database = roundNumber(CurrentBalance_Database)
    * eval if(CurrentBalance_XML==CurrentBalance_Database?printPassedResult('CurrentBalance',CurrentBalance_XML):printFailedResult('CurrentBalance',CurrentBalance_XML,CurrentBalance_Database));

#  #  Verifying Interest rate with XML and Database table EDPEGAT.ACCT_DIM
    * def InterestRate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::InterestRate/text()")
    * def InterestRate_Database = readValue("SELECT INTEREST_RATE FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * eval if(InterestRate_XML==InterestRate_Database?printPassedResult('Interest Rate',InterestRate_XML):printFailedResult('Interest Rate',InterestRate_XML,InterestRate_Database));

 #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationMortgage(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * match stringLength(offerInstanceId_XML) == 5
    * eval if(offerInstanceId_XML==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceIdSegmentationDDR));


  # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')


     #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

 #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataPath,"CLI_ProductFamily_Name.xlsx","Accounts")
#    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')CurrentAccountName
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'CurrentAccountName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
#    * def offerStartDate_Propsition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferStartDate'))
    * def offerStartDate_Propsition = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_Propsition?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_Propsition));

 #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

    # -------------------------------------ULOC Insurance - 5671--------------------------------------------
  @ULOCInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')


     #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

# #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def currentAccountName_DB = readValue("SELECT SRC_SYS_SUB_PRD_DESC FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * print "currentAccountName_DB" + currentAccountName_DB
#    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * def primaryProductServiceSubCode_Database = readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataPath,"CLI_ProductFamily_Name.xlsx","Accounts")
#    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_DB?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_DB));

    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
#    * def offerStartDate_Propsition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferStartDate'))
    * def offerStartDate_Propsition = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_Propsition?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_Propsition));

 #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

# ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIContextualOfferValidation
  Scenario: Validate CLI Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')

     #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

     #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataPath,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

#     #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

  #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

 #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PAIndicator/text()")
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));

    #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentCreditLimit/text()")
    * string CurrentCreditLimit_DB = decimalRange(readValue("SELECT CR_CRD_LMT_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2)
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));

    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ApprovedCreditLimit/text()")
    * string ApprovedCreditLimit_Database = decimalRange(readValue("SELECT CLI_APRVD_CR_LMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2)
    * match ApprovedCreditLimit_XML == '#notnull'
    * def currentCreditLimit =  parseFloat(CurrentCreditLimit_XML)
    * def approvedCreditLimit =  parseFloat(ApprovedCreditLimit_XML)
    * assert approvedCreditLimit > currentCreditLimit
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));

#     #    Verifying Offer instance id with XML and OII_Segmentation sheet
#    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
#    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataPath,'OII_Segmentation.xlsx','OII')
#    * def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
#    * def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
#    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
#    * def campaignCode = karate.get('dataCustDim.Campaign')
#    * def ddrRecords = getDDRRecords()
#    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
#    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
#    * match stringLength(offerInstanceId_XML) == 5
#    * eval if(offerInstanceId_XML==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceIdSegmentationDDR));

  #    Verifying Offer instance id with XML and OII_Segmentation sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataPath,'OII_Segmentation.xlsx','OII')
#* def month = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
#* def year = subString(trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
#* def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
#* def campaignCode = karate.get('dataCustDim.Campaign')
#* def ddrRecords = getDDRRecords()
#* def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def campaignWaveNumber = '01'
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * match stringLength(offerInstanceId_XML) == 5
    * eval if(offerInstanceId_XML==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceIdSegmentationDDR));


      # -------------------------------------PA ULOC -AS400 - 5766--------------------------------------------
  @PAULOC_AS400_Validation
  Scenario: Validate PA ULOC AS400 Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecordsForPAULOC')

    # Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

    # Verifying IncentiveAmount with XML and Hard coded
    * def incentiveAmount_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::IncentiveAmount/text()")
    * def incentiveAmount_HardCoded = '0'
    * eval if(incentiveAmount_XML==incentiveAmount_HardCoded?printPassedResult('Incentive Amount',incentiveAmount_XML):printFailedResult('Incentive Amount',incentiveAmount_XML,incentiveAmount_HardCoded));

    # Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

    # Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

    # Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

    # Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    # Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    # Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    # Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * eval if(creativeId_XML==creativeId_AS400Sheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));

    # Verifying OfferStartDate with XML and AS400 Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerStartDate_pacculSheet = karate.get('pacculCustomerSheet.PRIMARY_PREAPPROVED_START_DATE')
    * eval if(offerStartDate_XML==offerStartDate_pacculSheet?printPassedResult('Offer Start Date ',offerStartDate_XML):printFailedResult('Offer Start Date ',offerStartDate_XML,offerStartDate_pacculSheet));

    # Verifying OfferExpiryDate with XML and AS400 Sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_pacculSheet = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def offerExpiryDate_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.PRIMARY_PREAPPROVED_END_DATE')
    * eval if(offerExpiryDate_XML==offerExpiryDate_pacculSheet?printPassedResult('Offer Expiry Date ',offerExpiryDate_XML):printFailedResult('Offer Expiry Date ',offerExpiryDate_XML,offerExpiryDate_pacculSheet));

    # Verifying OfferCondition with XML and Proposition sheet
    * def offerCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_XML==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_XML):printFailedResult('Offer Condition ',offerCondition_XML,offerCondition_Proposition));

    # Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));

    #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

    # Verifying PA Indicator with XML and Proposition sheet
    * def paIndicator_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PAIndicator/text()")
    * def paIndicator_HardCoded = 'PA'
    * eval if(paIndicator_XML==paIndicator_HardCoded?printPassedResult('PA Indicator ',paIndicator_XML):printFailedResult('PA Indicator ',paIndicator_XML,paIndicator_HardCoded));

    # Verifying Approved Credit Limit with XML and Proposition sheet
    * def apprCredLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ApprovedCreditLimit/text()")
#    * def apprrCredLimit_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
#    * def apprCredLimit_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.PA_ULOC_LIMIT')
    * string paUlocLimit_Database = trimString(readValue("SELECT PA_ULOC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(apprCredLimit_XML==paUlocLimit_Database?printPassedResult('Approved Credit Limit ',apprCredLimit_XML):printFailedResult('Approved Credit Limit ',apprCredLimit_XML,paUlocLimit_Database));

    # Verifying PrimarySourceCode with XML and Proposition sheet
    * def primarySourceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimarySourceCode/text()")
    * def primarySourceCode_HardCoded = '106'
    * eval if(primarySourceCode_XML==primarySourceCode_HardCoded?printPassedResult('Primary Source Code ',primarySourceCode_XML):printFailedResult('Primary Source Code ',primarySourceCode_XML,primarySourceCode_HardCoded));


    # Verifying InterestRate with XML and Proposition sheet
    * def interestRate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::InterestRate/text()")
#    * def uspoRate_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
#    * def uspoRate_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.USPO_RATE')
    * string uspoRate_Database = trimString(readValue("SELECT USPO_RATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(interestRate_XML==uspoRate_Database?printPassedResult('interest Rate ',interestRate_XML):printFailedResult('Interest Rate ',interestRate_XML,uspoRate_Database));

    # Verifying BillCode with XML and Proposition sheet
    * def billCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::BillCode/text()")
#    * def billCode_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
#    * def billCode_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.BILL_CODE')
    * string billCode_Database = trimString(readValue("SELECT BILL_CODE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(billCode_XML==billCode_Database?printPassedResult('Bill Code ',billCode_XML):printFailedResult('Bill Code ',billCode_XML,billCode_Database));

	# Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    # Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


    # Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * def PrimaryProductFeaturesEN_Proposition = PrimaryProductFeaturesEN_Proposition == '' ? null : PrimaryProductFeaturesEN_Proposition
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    # Verifying OfferInstanceID with XML and Data Sheet
    * def offerInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerInstanceID_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerInstanceID_pacculSheet = karate.get('offerInstanceID_pacculCustomerSheet.PRIMARY_CAMPAIGN_NUM')
    * eval if(offerInstanceID_XML==offerInstanceID_pacculSheet?printPassedResult('OfferInstance ID ',offerInstanceID_XML):printFailedResult('Offer Instance ID ',offerInstanceID_XML,offerInstanceID_pacculSheet));

    # Verifying USPO_KEY with XML and Data Sheet
    * def uspoKey_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::USPO_KEY/text()")
    * def uspoKey_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def uspoKey_pacculSheet = karate.get('offerInstanceID_pacculCustomerSheet.USPO_KEY')
    * eval if(uspoKey_XML==uspoKey_pacculSheet?printPassedResult('USPO Key ',uspoKey_XML):printFailedResult('USPO Key ',uspoKey_XML,uspoKey_pacculSheet));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

	#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'


      # -------------------------------------PA CC -AS400 - --------------------------------------------
  @PACCContextualOfferValidation
  Scenario: Validate PA CC AS400 Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecordsForPAULOC')

    # Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

    # Verifying IncentiveAmount with XML and Hard coded
    * def incentiveAmount_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::IncentiveAmount/text()")
    * def incentiveAmount_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'IncentiveAmount')
    * eval if(incentiveAmount_XML==incentiveAmount_proposition?printPassedResult('Incentive Amount',incentiveAmount_XML):printFailedResult('Incentive Amount',incentiveAmount_XML,incentiveAmount_proposition));

    # Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

    # Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

    # Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

    # Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    # Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    # Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

#     Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * eval if(creativeId_XML==creativeId_AS400Sheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));

    # Verifying OfferStartDate with XML and AS400 Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerStartDate_pacculSheet = trimString(readValue("SELECT PRIMARY_PREAPPROVED_START_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerStartDate_XML==offerStartDate_pacculSheet?printPassedResult('Offer Start Date ',offerStartDate_XML):printFailedResult('Offer Start Date ',offerStartDate_XML,offerStartDate_pacculSheet));

    # Verifying OfferExpiryDate with XML and AS400 Sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def expiryDt_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerExpiryDate_pacculSheet = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(offerExpiryDate_XML==offerExpiryDate_pacculSheet?printPassedResult('Offer Expiry Date ',offerExpiryDate_XML):printFailedResult('Offer Expiry Date ',offerExpiryDate_XML,offerExpiryDate_pacculSheet));

    # Verifying OfferCondition with XML and Proposition sheet
    * def offerCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_XML==offerCondition_Proposition?printPassedResult('Offer Condition ',offerCondition_XML):printFailedResult('Offer Condition ',offerCondition_XML,offerCondition_Proposition));

    # Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));

    #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

    # Verifying PA Indicator with XML and Proposition sheet
    * def paIndicator_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PAIndicator/text()")
    * def paIndicator_HardCoded = 'PA'
    * eval if(paIndicator_XML==paIndicator_HardCoded?printPassedResult('PA Indicator ',paIndicator_XML):printFailedResult('PA Indicator ',paIndicator_XML,paIndicator_HardCoded));

    # Verifying Approved Credit Limit with XML and Proposition sheet
    * def apprCredLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ApprovedCreditLimit/text()")
    * def apprrCredLimit_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
#    * def apprrCredLimit_pacculCustomerSheet = trimString(readValue("SELECT PA_CC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * def apprCredLimit_pacculSheet = karate.get('apprrCredLimit_pacculCustomerSheet.PA_CC_LIMIT')
    * eval if(apprCredLimit_XML==apprCredLimit_pacculSheet?printPassedResult('Approved Credit Limit ',apprCredLimit_XML):printFailedResult('Approved Credit Limit ',apprCredLimit_XML,apprCredLimit_pacculSheet));

    # Verifying PrimarySourceCode with XML and Proposition sheet
    * def primarySourceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimarySourceCode/text()")
    * def primarySourceCode_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimarySourceCode')
    * eval if(primarySourceCode_XML==primarySourceCode_proposition?printPassedResult('Primary Source Code ',primarySourceCode_XML):printFailedResult('Primary Source Code ',primarySourceCode_XML,primarySourceCode_proposition));

    # Verifying AltSourceCodes with XML and Proposition sheet
    * def AltSourceCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltSourceCodes/text()")
    * def AltSourceCodes_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1SourceCode')
    * eval if(AltSourceCodes_XML==AltSourceCodes_proposition?printPassedResult('Alt Source Codes ',AltSourceCodes_XML):printFailedResult('Alt Source Codes ',AltSourceCodes_XML,AltSourceCodes_proposition));

	# Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    # Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


    # Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * def PrimaryProductFeaturesEN_Proposition = PrimaryProductFeaturesEN_Proposition == '' ? null : PrimaryProductFeaturesEN_Proposition
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    # Verifying OfferInstanceID with XML and Data Sheet
    * def offerInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerInstanceID_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerInstanceID_pacculSheet = trimString(readValue("SELECT PRIMARY_CAMPAIGN_NUM FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def offerInstanceID_pacculSheet = karate.get('offerInstanceID_pacculCustomerSheet.PRIMARY_CAMPAIGN_NUM')
    * eval if(offerInstanceID_XML==offerInstanceID_pacculSheet?printPassedResult('OfferInstance ID ',offerInstanceID_XML):printFailedResult('Offer Instance ID ',offerInstanceID_XML,offerInstanceID_pacculSheet));

    # Verifying AltProductSubCodes with XML and Proposition sheet
    * def AltProductSubCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltProductSubCodes/text()")
    * def AltProductSubCodes_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductSubCode')
    * eval if(AltProductSubCodes_XML==AltProductSubCodes_proposition?printPassedResult('Alt Product Sub Codes ',AltProductSubCodes_XML):printFailedResult('Alt Product Sub Code',AltProductSubCodes_XML,AltProductSubCodes_proposition));

    # Verifying AltProductCode with XML and Proposition sheet
    * def AltProductCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltProductCodes/text()")
    * def AltProductCode_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductCode')
    * eval if(AltProductCode_XML==AltProductCode_proposition?printPassedResult('Alt Product Codes ',AltProductCode_XML):printFailedResult('Alt Product Code',AltProductCode_XML,AltProductCode_proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

	#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'

#    ------------------------ODP - 5787----------------------

  @ODPContextualOfferValidation
  Scenario: Validate offer details for contextual offer
   # Report database records in cucumber report
#    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecords')

     #    Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

     #    Verifying IncentiveAmount with XML and Hard coded
    * def incentiveAmount_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::IncentiveAmount/text()")
    * def incentiveAmount_HardCoded = '0'
    * eval if(incentiveAmount_XML==incentiveAmount_HardCoded?printPassedResult('Incentive Amount',incentiveAmount_XML):printFailedResult('Incentive Amount',incentiveAmount_XML,incentiveAmount_HardCoded));

     #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

  #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

  #    Verifying Offer Title with XML and Proposition sheet
    * def OfferTitle_DS = karate.get('data.OfferTitle')
    * print 'OfferTitle is:' + OfferTitle_DS
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(OfferTitle_DS.length==0?(offerTitle_XML==offerShortDescription_Proposition? printPassedResult('Offer Title',offerTitle_XML): printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition)):(offerTitle_XML==OfferTitle_DS? printPassedResult('Offer Title',offerTitle_XML): printFailedResult('Offer Title',offerTitle_XML,OfferTitle_DS)));

    #    Verifying Offer Condition with XML and Proposition sheet

    * def OfferCond_DS = karate.get('data.OfferCondition')
    *  print 'OfferCondition is:' + OfferCond_DS
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCond_DS.length==0?(OfferCondition_XML==OfferCondition_Proposition? printPassedResult('Offer Condition',OfferCondition_XML): printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition)):(OfferCondition_XML==OfferCond_DS? printPassedResult('Offer Condition',OfferCondition_XML): printFailedResult('Offer Condition',OfferCondition_XML,OfferCond_DS)));

    #    Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * eval if((creativeId_XML==creativeId_AS400Sheet)? printPassedResult('Creative Id',creativeId_XML): printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));


	#    Verifying CurrentAccountNumber with XML and DB
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def ACCT_NUM = karate.get('dataAcctDim.ACCT_NUM')
    * def CurrentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
#    * string Acct_Num_DB = trimString(readValue("SELECT acct_num FROM "+dbSchema+".ACCT_DIM WHERE acct_num ='"+ACCT_NUM+"'"))
    * string Acct_Num = sliceString12Digits(ACCT_NUM)
    * eval if((CurrentAccountNumber_XML==Acct_Num)? printPassedResult('CurrentAccountNumber',CurrentAccountNumber_XML): printFailedResult('CurrentAccountNumber',CurrentAccountNumber_XML,Acct_Num));


	#    Verifying CurrentAccountName with XML and AS400 Sheet
    * def CurrentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def CurrentAccountName_AS400Sheet = karate.get('data.CurrentAccountName')
    * eval if((CurrentAccountName_XML==CurrentAccountName_AS400Sheet)? printPassedResult('CurrentAccountName',CurrentAccountName_XML): printFailedResult('CurrentAccountName',CurrentAccountName_XML,CurrentAccountName_AS400Sheet));


#    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));



#   #    Verifying Offer Start date with today
#    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
#      #    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
##    * eval if(offerStartDate_XML==leadStartDate_IH? printPassedResult('Lead Start Date',offerStartDate_XML): printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_XML));
#    * def leadStartDate_todayDate = getDate('yyyy-MM-dd')
##    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(offerStartDate_XML==leadStartDate_todayDate?printPassedResult('Lead Start Date',leadStartDate_todayDate):printFailedResult('Lead Start Date',offerStartDate_XML,leadStartDate_todayDate));


##    Verifying Offer expiry date with XML and proposition
#    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
#    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
#    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition? printPassedResult('Offer Expiry date',offerExpiryDate_XML): printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded? printPassedResult('Zone Code',zoneCodes_XML): printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));

#  Verifying Lead ID  XML should not be null
    * def LeadID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadID_XML == '#notnull'

	#  Verifying OfferInstance ID  XML
    * def OfferInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def OfferInstanceID_DS = karate.get('data.OII')+'63'
    * eval if(OfferInstanceID_XML==OfferInstanceID_DS? printPassedResult('OfferInstanceID',OfferInstanceID_XML): printFailedResult('OfferInstanceID',OfferInstanceID_XML,OfferInstanceID_DS));

     #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition? printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML): printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


 #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition? printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML): printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

	 #    Verifying PrimaryProductServiceSubCodeCode with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition? printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML): printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));



    # Verifying OfferDescription with XML and Proposition sheet
    * def OfferDesc_DS = karate.get('data.OfferDescription')
    * print "Offer Description from sheet is :" + OfferDesc_DS
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
#    * eval if(offerDescription_XML==OfferDescription_Proposition? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));
    * eval if(OfferDesc_DS.length==0?(offerDescription_XML==OfferDescription_Proposition? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition)):(offerDescription_XML==OfferDesc_DS? printPassedResult('Offer Description',offerDescription_XML): printFailedResult('Offer Description',offerDescription_XML,OfferDesc_DS)));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition? printPassedResult('CampaignType',campaignType_XML): printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition? printPassedResult('Campaign Name',campaignName_XML): printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'

     # -------------------------------------Return Mail - 4186--------------------------------------------
  @ReturnMailContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')
    * def getCurrentName =
    """
    function(givenName,titlename,firstName,secondName){
    var currentName = null;
    if(givenName!=null){
    currentName = givenName;
    }else if(givenName==null){
    if(titlename!=null && firstName!= null && secondName!= null){
    currentName = titlename+' '+firstName+' '+secondName;
    }else if(firstName==null && secondName!= null){
    currentName = secondName;
    }else if(firstName!=null && secondName== null){
    currentName = firstName;
    }
    }
    return currentName;
    }
    """
     #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def titleName_Database = readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def firstName_Database = readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def lastName_Database = readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def givenName_Database = readValue("SELECT GIVEN_NAME FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def currentAccountName_Database = getCurrentName(givenName_Database,titleName_Database,firstName_Database,lastName_Database)
    * eval if(currentAccountName_XML==currentAccountName_Database?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_Database));

     #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));


    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def scotiaCardNumber = readValue("SELECT SCD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'") == 'null' ? null : '453'+readValue("SELECT SCD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def creditCardNumber = readValue("SELECT CR_CRD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'") == 'null' ? null : readValue("SELECT CR_CRD_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def currentAccountNumber_Database = karate.get('dataAcctDim.ACCT_SUBSYS_ID')=='AC' ? scotiaCardNumber : creditCardNumber
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_Propsition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferStartDate'))
    * eval if(offerStartDate_XML==offerStartDate_Propsition?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_Propsition));

 #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

     # -------------------------------------GIC  Renewal-1210,4587--------------------------------------------
  @GICContextualOfferValidation_AS400
  Scenario: Validate GIC Contextual offer response fields in AS400
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')

    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = readValue("SELECT ACCT_CRFC_NUM FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account Number',currentAccountNumber_XML,currentAccountNumber_Database));


    #  Verifying Current Offer Start Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def currentDate = getDate('yyyy-MM-dd')
    * def daysDifference = findDateDifference(OfferStartDate_XML,currentDate)
    * assert daysDifference >=0
    * def OfferStartDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * def OfferStartDate_Database = dateMinus(OfferStartDate_Database,'28')
    * eval if(OfferStartDate_XML==OfferStartDate_Database?printPassedResult('OfferStartDate',OfferStartDate_XML):printFailedResult('OfferStartDate',OfferStartDate_XML,OfferStartDate_Database));

    #  Verifying Current Offer Expiry Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def OfferExpiryDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * eval if(OfferExpiryDate_XML==OfferExpiryDate_Database?printPassedResult('OfferExpiryDate',OfferExpiryDate_XML):printFailedResult('OfferExpiryDate',OfferExpiryDate_XML,OfferExpiryDate_Database));

    #  Verifying CurrentAccountName  with XML and hardcoded value
    * def CurrentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def CurrentAccountName_HardCoded =  'GIC Maturity'
    * eval if(CurrentAccountName_XML==CurrentAccountName_HardCoded?printPassedResult('CurrentAccountName',CurrentAccountName_XML):printFailedResult('CurrentAccountName',CurrentAccountName_XML,CurrentAccountName_HardCoded));

    #  Verifying Current Account Maturity Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentAccountMaturityDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountMaturityDate/text()")
    * def CurrentAccountMaturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * replace CurrentAccountMaturityDate_Database.- = '/'
    * eval if(CurrentAccountMaturityDate_XML==CurrentAccountMaturityDate_Database?printPassedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML):printFailedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML,CurrentAccountMaturityDate_Database));


    #  Verifying Current Balance with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentBalance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentBalance/text()")
    * def CurrentBalance_Database = readValue("SELECT MAT_VAL_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * def CurrentBalance_Database = roundNumber(CurrentBalance_Database)
    * eval if(CurrentBalance_XML==CurrentBalance_Database?printPassedResult('CurrentBalance',CurrentBalance_XML):printFailedResult('CurrentBalance',CurrentBalance_XML,CurrentBalance_Database));

    #  Verifying plan_number with XML and Database table EDPEGAT.ACCT_DIM
    * def plan_number_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::plan_number/text()")
    * def plan_number_Database = subString(trimString(readValue("SELECT acct_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")),8,23)
    * eval if(plan_number_XML==plan_number_Database?printPassedResult('plan_number',plan_number_XML):printFailedResult('plan_number',plan_number_XML,plan_number_Database));

    #  Verifying term_month with XML and Database table EDPEGAT.ACCT_DIM
    * def term_month_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::term_month/text()")
    * def term_month_Database = readValue("SELECT TERM_MTH FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * eval if(term_month_XML==term_month_Database?printPassedResult('term_month',term_month_XML):printFailedResult('term_month',term_month_XML,term_month_Database));


    #  Verifying OII with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = OfferInstanceID_Database + campaignWaveNumber
    * eval if(OfferInstanceID_XML==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',OfferInstanceID_XML):printFailedResult('Offer Instance Id',OfferInstanceID_XML,offerInstanceIdSegmentationDDR));

  ######################## End of SOAP Response validation specific to campaigns#######################

  ######################## IH validation specific to campaigns#######################
  # ------------------PA CC and PA ULOC Campaigns----------------------
  @PACCULOCOfferValidationWithIH
  Scenario: Validate CLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@PACCULOCSpecificElementsIH')
   # -------------------------------------Mortgage Renewals - 1430--------------------------------------------
  @MortgageOfferValidationWithIH
  Scenario: Validate Mortgage Renewals offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@MortgageRenewalSpecificElementsIH')

   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceOfferValidationWithIH
  Scenario: Validate creditor insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@CreditorInsuranceSpecificElementsIH')

     # -------------------------------------ULOC Insurance - 5761--------------------------------------------
  @ULOCInsuranceOfferValidationWithIH
  Scenario: Validate ULOC insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCInsuranceSpecificElementsIH')


    # -------------------------------------Return Mail- 4186--------------------------------------------
  @ReturnMailOfferValidationWithIH
  Scenario: Validate return mail offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@ReturnMailSpecificElementsIH')

  # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIOfferValidationWithIH
  Scenario: Validate CLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLISpecificElementsIH')

  # -------------------------------------GIC  Renewal-1210,4587--------------------------------------------
  @GICOfferValidationWithIH
  Scenario: Validate GIC offer details with IH

   #  Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')

   #  Validates elements specific to GIC  Renewal
    * call read('classpath:channels/as400/ReusableScenarios.feature@GICSpecificElements')

    ######################## End of IH validation specific to campaigns#######################

    ######################## Disposition IH validation specific to campaigns#######################

  # ------------------Mortgage Renewals - 1430 - T6----------------------
  @MortgageDispositionOfferValidationWithIH
  Scenario: Validate Mortgage disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')

     #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

 #    Verifying  Lead Start Date - SOL - From DDR Table and IH
    * def ddrRecords = getDDRRecords()
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def offerStartDate_DDR = getStartDateFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * replace offerStartDate_DDR.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(offerStartDate_DDR==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_DDR));

      #    Verifying  Lead End Date from DB Maturity date and IH
    * def leadEndDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_IH):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

      #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));


     #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

   # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIDispositionOfferValidationWithIH
  Scenario: Validate CLI disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
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
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')

     #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].OFR_INSTANCE_ID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_IH==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

  @ReturnMailDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')

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

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].OFR_INSTANCE_ID")[0]
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_IH==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

    # -------------------------------------GIC  Renewal-1210,4587--------------------------------------------
  @GICRenewalDispositionOfferValidationWithIH
  Scenario: Validate GIC Renewal disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')
    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'" )),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()

     #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?( @.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

#    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));


  #  Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));


          # Verifyind OII with XML and Database

    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

        #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH

    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Channel Outcome']=='" + dispositionCode + "')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

    ##    ######################## End of Disposition IH validation specific to campaigns#######################

    ######################## Cross channel Disposition IH validation specific to campaigns#######################

   # ------------------Mortgage Renewal - 1430 - T6----------------------
  @MortgageCrossChannelDispositionOfferValidationWithIH
  Scenario: Validate Mortgage Renewals cross channel disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def listOfZoneCodes = crossChannel == 'MOB' ? ['MIC', 'MMC'] : ['SMC']
    * print List of Zone Codes+'listOfZoneCodes'
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


       #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = acct_num
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * def ddrRecords = getDDRRecords()
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def offerStartDate_DDR = getStartDateFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * replace offerStartDate_DDR.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(offerStartDate_DDR==leadStartDate_IH?printPassedResult('Lead Start Date',offerStartDate_DDR):printFailedResult('Lead Start Date',leadStartDate_IH,offerStartDate_DDR));

        #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * def leadEndDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_SUBSYS_ID='UO'")
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

         #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

      #    Verifying  Offer Instance ID with OII Segmentation logic(Pre-fix value) + IH(Suffix Number)
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,'OfferInstanceId',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def month = subString(getDate('yyyy-MM-dd'),5,7)
    * def year = subString(getDate('yyyy-MM-dd'),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = offerInstanceId_OIISegmentationPrefix + campaignWaveNumber
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceIdSegmentationDDR));

   # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLICrossChannelDispositionOfferValidationWithIH
  Scenario: Validate CLI cross channel disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')
#    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def listOfZoneCodes = crossChannel == 'MOB' ? ['MIC', 'MMC'] : ['SMC']
    * print List of Zone Codes+'listOfZoneCodes'
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

     #    Verifying  Cell group(CLI) value concatenated with with OII Segmentation logic
    * def cellGroup_OIISegmentation = oiiSegmentationCLI(offerCode,cid,'CellGroup',testDataLocation,'OII_Segmentation.xlsx','OII')
    * def cellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Cell Group']")[0]
    * eval if(cellGroup_OIISegmentation==cellGroup_IH?printPassedResult('Cell Group',cellGroup_IH):printFailedResult('Cell Group',cellGroup_IH,cellGroup_OIISegmentation));

   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceCrossChannelDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance cross channel disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')
    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def listOfZoneCodes = crossChannel == 'MOB' ? ['MIC', 'MMC'] : ['SMC']
    * print List of Zone Codes+'listOfZoneCodes'
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def listOfZoneCodes = crossChannel == 'MOB' ? ['MIC', 'MMC'] : ['SMC']
    * print List of Zone Codes+'listOfZoneCodes'
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
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

   # -------------------------------------GIC Renewal-1210,4587--------------------------------------------
  @GICRenewalCrossChannelDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance cross channel disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' ")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' ")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()

     #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

#    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));


  #  Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));


          # Verifyind OII with XML and Database

    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

        #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH

    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));

  # -------------------------------------D2DNearPrimacyXsellSneakPeak-6185,6186,6187,6188--------------------------------------------
  @D2DXsellSneakPeakOfferValidation_AS400
  Scenario: Validate D2DXsellSneakPeak AS400 Channel offer response fields
   # Report database records in cucumber report
    * call read('classpath:channels/as400/ReusableScenarios.feature@reportDbRecordsForPAULOC')

       # Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

       # Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

       # Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    # Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

     #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::NBACategory/text()")
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

     #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAType/text()")
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()")
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

      #  Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_Proposition):printFailedResult('Offer Condition',OfferCondition_XML,ofrCond_cust));

    # Verifying OfferStartDate with XML and AS400 Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
    * def offerStartDate_pacculSheet = karate.get('pacculCustomerSheet.PRIMARY_PREAPPROVED_START_DATE')
    * eval if(offerStartDate_XML==offerStartDate_pacculSheet?printPassedResult('Offer Start Date ',offerStartDate_XML):printFailedResult('Offer Start Date ',offerStartDate_XML,offerStartDate_pacculSheet));

     # Verifying OfferExpiryDate with XML and AS400 Sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_pacculSheet = trimString(readValue("SELECT PRIMARY_PREAPPROVED_END_DATE FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def offerExpiryDate_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.PRIMARY_PREAPPROVED_END_DATE')
    * eval if(offerExpiryDate_XML==offerExpiryDate_pacculSheet?printPassedResult('Offer Expiry Date ',offerExpiryDate_XML):printFailedResult('Offer Expiry Date ',offerExpiryDate_XML,offerExpiryDate_pacculSheet));

     # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

     #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    #  Verifying OfferInstance ID  XML
    * def OfferInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def OfferInstanceID_DS = karate.get('data.OII')
    * eval if(OfferInstanceID_XML==OfferInstanceID_DS? printPassedResult('OfferInstanceID',OfferInstanceID_XML): printFailedResult('OfferInstanceID',OfferInstanceID_XML,OfferInstanceID_DS));

      #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferTitle/text()")
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    # Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * def PrimaryProductFeaturesEN_Proposition = PrimaryProductFeaturesEN_Proposition == '' ? null : PrimaryProductFeaturesEN_Proposition
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

     # Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

      # Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

   # Verifying Approved Credit Limit with XML and Proposition sheet
    * def apprCredLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ApprovedCreditLimit/text()")
#    * def apprrCredLimit_pacculCustomerSheet = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PA_CCUL_Customer");
#    * def apprCredLimit_pacculSheet = karate.get('expiryDt_pacculCustomerSheet.PA_ULOC_LIMIT')
    * string paUlocLimit_Database = trimString(readValue("SELECT PA_CC_LIMIT FROM "+dbSchema+".PA_CCUL_CUSTOMER WHERE CIS_CUST_ID ='"+cid+"'"))
    * eval if(apprCredLimit_XML==paUlocLimit_Database?printPassedResult('Approved Credit Limit ',apprCredLimit_XML):printFailedResult('Approved Credit Limit ',apprCredLimit_XML,paUlocLimit_Database));

    # Verifying PA Indicator with XML and Proposition sheet
    * def paIndicator_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PAIndicator/text()")
    * def paIndicator_HardCoded = 'PA'
    * eval if(paIndicator_XML==paIndicator_HardCoded?printPassedResult('PA Indicator ',paIndicator_XML):printFailedResult('PA Indicator ',paIndicator_XML,paIndicator_HardCoded));

    # Verifying AltSourceCodes with XML and Proposition sheet
    * def AltSourceCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltSourceCodes/text()")
    * def AltSourceCodes_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1SourceCode')
    * eval if(AltSourceCodes_XML==AltSourceCodes_proposition?printPassedResult('Alt Source Codes ',AltSourceCodes_XML):printFailedResult('Alt Source Codes ',AltSourceCodes_XML,AltSourceCodes_proposition));

# Verifying AltProductSubCodes with XML and Proposition sheet
    * def AltProductSubCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltProductSubCodes/text()")
    * def AltProductSubCodes_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductSubCode')
    * eval if(AltProductSubCodes_XML==AltProductSubCodes_proposition?printPassedResult('Alt Product Sub Codes ',AltProductSubCodes_XML):printFailedResult('Alt Product Sub Code',AltProductSubCodes_XML,AltProductSubCodes_proposition));

    # Verifying AltProductCode with XML and Proposition sheet
    * def AltProductCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::AltProductCodes/text()")
    * def AltProductCode_proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'Alt1ProductCode')
    * eval if(AltProductCode_XML==AltProductCode_proposition?printPassedResult('Alt Product Codes ',AltProductCode_XML):printFailedResult('Alt Product Code',AltProductCode_XML,AltProductCode_proposition));

    # Verifying PrimarySourceCode with XML and Proposition sheet
    * def primarySourceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimarySourceCode/text()")
    * def primarySourceCode_HardCoded = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimarySourceCode')
    * eval if(primarySourceCode_XML==primarySourceCode_HardCoded?printPassedResult('Primary Source Code ',primarySourceCode_XML):printFailedResult('Primary Source Code ',primarySourceCode_XML,primarySourceCode_HardCoded));

     #  Verifying Secondary Holder Name with XML and Database
    * string secondaryCid_DB = readValue("SELECT CC_SCNRY_CUST_ID FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * string secondaryCid_DB = secondaryCid_DB == null ? 'null' : secondaryCid_DB
    * string title_DB =  readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * string firstName_DB = readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * string lastName_DB =  readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * def secondaryHolderName_DB = trimString(secondaryCid_DB == null ? 'null' : (title_DB == null ? '' : title_DB )+' ' +(firstName_DB == null ? '' : firstName_DB )+ ' ' +( lastName_DB == '' ? 'null' : lastName_DB))
    * def secondaryHolderName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::SecondaryHolderName/text()")
    * def secondaryHolderName_XML = secondaryHolderName_XML == null ?'null' : secondaryHolderName_XML
    * eval if(secondaryHolderName_XML==secondaryHolderName_DB?printPassedResult('Secondary Holder Name',secondaryHolderName_XML):printFailedResult('Secondary Holder Name',secondaryHolderName_XML,secondaryHolderName_DB));


   # ------------------ULOCCLI - 6001,6002,6090,6218,6219,6220----------------------
  @ULOCCLIContextualOfferValidation
  Scenario: Validate CLI Contextual offer response fields

#    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

    #    Verifying Creative Id with XML and AS400 Sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * eval if(creativeId_XML==creativeId_AS400Sheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_AS400Sheet));

    #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

  #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentCreditLimit/text()")
    * string CurrentCreditLimit_DB = decimalRange(readValue("SELECT CR_CRD_LMT_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"),2)
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));

     #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * def PrimaryProductServiceCode_Proposition = PrimaryProductServiceCode_Proposition == '' ? null : PrimaryProductServiceCode_Proposition
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

   #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def sliceString = function(stringValue){return stringValue.slice(stringValue.length - 13)}
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

   #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PAIndicator/text()")
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));

    # Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * def PrimaryProductFeaturesEN_Proposition = PrimaryProductFeaturesEN_Proposition == '' ? null : PrimaryProductFeaturesEN_Proposition
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

#  Verifying OfferInstance ID  XML
    * def OfferInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def OfferInstanceID_DS = karate.get('data.OII')+'01'
    * eval if(OfferInstanceID_XML==OfferInstanceID_DS? printPassedResult('OfferInstanceID',OfferInstanceID_XML): printFailedResult('OfferInstanceID',OfferInstanceID_XML,OfferInstanceID_DS));

  #  Verifying Lead ID  XML should not be null
    * def LeadID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadID_XML == '#notnull'

 #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

 # Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

 # Verifying CID with XML and Conditioned AS400 Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

    # Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBANumber/text()")
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

   # Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::NBAName/text()")
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

	  #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def zoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_XML==zoneCodes_HardCoded? printPassedResult('Zone Code',zoneCodes_XML): printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_HardCoded));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition? printPassedResult('Campaign Name',campaignName_XML): printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

	  #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

	#  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

	 # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

#    #  Verifying Secondary Holder Name with XML and Database
#    * string secondaryCid_DB = readValue("SELECT CC_SCNRY_CUST_ID FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * string secondaryCid_DB = secondaryCid_DB == null ? 'null' : secondaryCid_DB
#    * string title_DB =  readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
#    * string firstName_DB = readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
#    * string lastName_DB =  readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
#    * def secondaryHolderName_DB = trimString(secondaryCid_DB == null ? 'null' : (title_DB == null ? '' : title_DB )+' ' +(firstName_DB == null ? '' : firstName_DB )+ ' ' +( lastName_DB == '' ? 'null' : lastName_DB))
#    * def secondaryHolderName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::SecondaryHolderName/text()")
#    * def secondaryHolderName_XML = secondaryHolderName_XML == null ?'null' : secondaryHolderName_XML
#    * eval if(secondaryHolderName_XML==secondaryHolderName_DB?printPassedResult('Secondary Holder Name',secondaryHolderName_XML):printFailedResult('Secondary Holder Name',secondaryHolderName_XML,secondaryHolderName_DB));

     # ------------------ULOCCLI - 6001,6002,6090,6218,6219,6220----------------------

  @ULOCCLISpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CLI)
    * string outcome = <outcome>
      #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

 #  Verifying Offer Instance Id with Proposition and IH
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * print offerInstanceId_IH
    * def campaignWaveNumber = subString(offerInstanceId_IH,5,3)
    * print campaignWaveNumber
#    * def ddrRecords = getDDRRecords()
#    * string campaignWaveNumber =   getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    #hard coded as the script was failing due to browser. Pick the wave number and replace in future releases in the statement below
#    * string campaignWaveNumber =   '63'
    * def OII_SEGMENTATION = karate.get('data.OII')+campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

    #    Verifying Campaign code with Proposition and IH
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * def campaignCode_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Campaign Code']")[0]
    * eval if(campaignCode_Proposition==campaignCode_IH?printPassedResult('Campaign code',campaignCode_IH):printFailedResult('Campaign code',campaignCode_IH,campaignCode_Proposition));


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

  @ULOCCLIOfferValidationWithIH
  Scenario: Validate ULOCCLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
  #    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@ULOCCLISpecificElementsIH')

      ########################End of Cross channel Disposition IH validation specific to campaigns#######################


