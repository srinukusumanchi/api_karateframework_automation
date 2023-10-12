@ignore
Feature: Re-usable scenarios specific to SOL Channel


  @CID_Insertion_SOL_Sheet
  Scenario: write customer CID details in excel sol sheet
    # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,testDataSheetName,karate.get(CID),"ID")

  @CID_Insertion_PURL_CUST_PROFILE_Sheet
  Scenario: write customer CID details in excel sol sheet
    # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",karate.get(CID),"CIS_CUST_ID")

  @CID_Insertion_CUST_DIM_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the SOL Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",karate.get(CID),"CIS_CUST_ID")

  @CID_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer CID details in excel CUST_ACCT_RLTNP_DIM sheet
  # insert the created CID into the CUST_ACCT_RLTNP_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",karate.get(CID),"CIS_CUST_ID")


  @ACCT_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer account number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def acct_num = accountNumber
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",acct_num,"ACCT_NUM")

  @ACCT_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write customer CID details in excel ACCT_DIM sheet
    * def acct_num = accountNumber
      # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_num,"ACCT_NUM")

  @CID_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",karate.get(CID),"CIS_CUST_ID")

  @CURR_VAL_UPDT_TMSTMP_CUST_INSIGHTS_Sheet
  Scenario: Write CURR Value Update Timestamp Value in excel CUST_INSIGHTS Sheet
    * def curr_val_upd_tmpst =   writeDateWithTimeStamp()
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",curr_val_upd_tmpst,"CURR_VAL_UPDT_TMSTMP")

  @EVENT_DATE_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer CID details in excel CUST_INSIGHTS sheet
  # insert the created CID into the CUST_INSIGHTS_DIM  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",event_date,"EVENT_DATE")

  @ACCT_Num_Insertion_CUST_INSIGHTS_Sheet
  Scenario: write customer account number details in excel CUST_INSIGHTS sheet
    * def acct_num_CustInsights = accountNumber
  # insert the created acct_num into the CUST_INSIGHTS excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_INSIGHTS",acct_num_CustInsights,"ACCT_NUM")

    #Pavani:Added Study End date insertion for SPSP Loan Repay campaign
  @StudyEndDate_Insertion_ACCT_DIM_Sheet
  Scenario: Insert Study End Date in ACCT_DIM table
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",studyEndDate,"STUDY_END_DT")


  @CUST_INSIGHTS_Insertion_Database
  Scenario: Insert customer information details in CUST_INSIGHTS table
    * def dataCustInsights = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_INSIGHTS")
    * string cust_insights_querybuilder = QueryBuilderForCustInsights(dataCustInsights,"CUST_INSIGHTS")
    * def cust_InsightsInsrt =  insertRows(cust_insights_querybuilder)

  @BBDWSC_SC_EXPIRY_DATE_Insertion_ACCT_DIM_Sheet
  Scenario: write BBDWSC_SC_EXPIRY_DATE_Insertion details in excel ACCT_DIM sheet
    * def bbdwsc_sc_expiry_date = scExpiryDate
    # insert the created BBDWSC_SC_EXPIRY_DATE into the ACCT_DIM  excel sheet under BBDWSC_SC_EXPIRY_DATE column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",bbdwsc_sc_expiry_date,"BBDWSC_SC_EXPIRY_DATE")

  @ACCT_Num_Insertion_PURL_CUST_PROFILE_Sheet
  Scenario: write customer CID details in excel PURL_CUST_PROFILE sheet
    * def acct_num = accountNumber
      # insert the created acct_num into the ACCT_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",acct_num,"ACCT_NUM")

  @DOB_Insertion_CUST_DIM_Sheet
  Scenario: write customer DOB details in excel CUST_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",date,"CUST_AGE")

  @CUST_OPND_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer customer open date details in excel CUST_DIM sheet
  # insert the created DOB into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",cust_opnd_dt,"CUST_OPND_DT")

  @Arrival_DT_Insertion_CUST_DIM_Sheet
  Scenario: write customer Arrival date details in excel CUST_DIM sheet
  # insert the created Arrival date into the CUST_DIM Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",Arrival_dt,"ARRV_DT")

  @SOL_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer SOL last login date details in excel ACCT_DIM sheet
  # insert the SOL last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",solLastLoginDate,"SOL_LAST_LOGIN_DT")

  @MOB_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer MOB last login date details in excel ACCT_DIM sheet
 # insert the MOB last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mobLastLoginDate,"MOB_LAST_LOGIN_DT")

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

  @PURL_CUST_PROFILE_Insertion_Database
  Scenario: Insert customer and account details in CUST_ACCT_RLTNP_DIM table
    * def dataPurlCustProfileDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE")
    * string purl_cust_profile_querybuilder = QueryBuilderForPurlCust(dataPurlCustProfileDim,"PURL_CUST_PROFILE")
    * def purl_cust_profileDimInsrt =  insertRows(purl_cust_profile_querybuilder)

  @ACCT_ODT_ACCT_DIM_Sheet
  Scenario: Insert Account ODT in ACCT_DIM table
    * string acct_odt = ACCT_ODT == 'NULL'? 'NULL': dateFormatExcludeDays(ACCT_ODT)
    * print "Account Open Date is", acct_odt
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",acct_odt,"ACCT_ODT")

  @ACCT_ODT_PURL_CUST_PROFILE_Sheet
  Scenario: Insert Account ODT in PURL_CUST_PROFILE table
    * replace acct_odt.- = ''
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",acct_odt,"ACCT_ODT")

  @PURL_Insertion_PURL_CUST_PROFILE_Sheet
  Scenario: Insert PURL in PURL_CUST_PROFILE table
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",purl,"PURL")

  @HASHKEY_Insertion_PURL_CUST_PROFILE_Sheet
  Scenario: Insert HASHKEY in PURL_CUST_PROFILE table
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",hashKeyVal,"HASH_KEY")

  @LAST_SEQ_USED_Insertion_PURL_CUST_PROFILE_Sheet
  Scenario: Insert LAST_SEQ_USED in PURL_CUST_PROFILE table
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PURL_CUST_PROFILE",lastSeqUsed,"LAST_SEQ_USED")

  @ACCT_DIM_Insertion_Database
  Scenario: Insert customer account details in ACCT_DIM table
    * def acct_num = accountNumber
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"ACCT_DIM")
    * def acct_DimInsrt =  insertRows(acct_dim_querybuilder)

  @CID_Insertion_EXTERNAL_INPUT_FILE_LAYOUT_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the SOL Testdata excel sheet
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

  @CID_Insertion_PA_CCUL_CUSTOMER_Sheet
  Scenario: write customer CID details in excel PA_CCUL_CUSTOMER sheet
       # insert the created CID into the PA_CCUL_CUSTOMER  excel sheet under CIS_CUST_ID column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"PA_CCUL_CUSTOMER",karate.get(CID),"CIS_CUST_ID")

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


  @SOL_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for SOL
    #    Building GET NBA Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope$ = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID$ = karate.get('$data.RequestID')
    * replace requestfile.$Additional1$ = karate.get('$data.Additional1')
    * replace requestfile.$Additional2$ = karate.get('$data.Additional2')


  @SOL_Disposition_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for SOL
 #    Building Disposition Request Body
    * replace dispositionfile.$AgentID$ = karate.get('$data.AgentID')
    * replace dispositionfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace dispositionfile.$ID$ = karate.get('$data.ID')
    * replace dispositionfile.$ZoneCode$ = karate.get('$data.ZoneCode')
    * replace dispositionfile.$ResponseCode$ = karate.get('$data.ResponseCode')
    * replace dispositionfile.$ResponseTrackingCode$ = karate.get('responseTrackingCode_XML')
    * replace dispositionfile.$TreatmentTrackingCode$ = karate.get('treatmentTrackingCode_XML')

  @SOL_SOAP_CALL_AfterDisposition
  Scenario: Generate GET NBA SOAP call after disposition for AS400
    #    Building GET NBA Request Body after disposition
    * def afterDispositionRequestfile = read('classpath:channels/sol/ChannelSOL.txt')
    * replace afterDispositionRequestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace afterDispositionRequestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace afterDispositionRequestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace afterDispositionRequestfile.$ID$ = karate.get('$data.ID')
    * replace afterDispositionRequestfile.$IDType$ = karate.get('$data.IDType')
    * replace afterDispositionRequestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace afterDispositionRequestfile.$LeadScope$ = karate.get('$data.LeadScopeDisposition')
    * replace afterDispositionRequestfile.$RequestID$ = karate.get('$data.RequestID')
    * replace afterDispositionRequestfile.$Additional1$ = karate.get('$data.Additional1')
    * replace afterDispositionRequestfile.$Additional2$ = karate.get('$data.Additional2')
    * print 'Request XML after disposition'+afterDispositionRequestfile

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

  @AS400_CrossChannel_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for NOVA
    Given url 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL'
    * def headersData = { ContentType: 'text/xml', Username: 'sprint1user', Password: 'RULES' }
    * headers headersData

    #    Building GET NBA Request Body after disposition
    * def crossChannelRequestfile = read('classpath:channels/sol/Channel AS400.txt')
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

  @ContextualOfferValidation
  Scenario: Validate offer details for contextual offer
   # Report database records in cucumber report
#    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    #    Verifying CID with XML and Conditioned SOL Sheet
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
    * replace offerTitle_XML.– = '-'
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


      #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * def OfferCondition_Proposition = OfferCondition_Proposition == '' ? null : OfferCondition_Proposition
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #    Verifying Offer start date with XML and today's date
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_TodaysDate));

    #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
#    * def listOfZoneCodes = ['SMC', 'SSC', 'SIC', 'SSP']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * def zoneCodes_Proposition = 'SMC,'
    * eval if(zoneCodes_XML==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_Proposition));

     #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * print  "XML PrimaryServiceCode is :",primaryProductServiceCode_XML
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * print  "PrimaryProductServiceCode_Proposition1 is :",PrimaryProductServiceCode_Proposition
    * def PrimaryProductServiceCode_Proposition = PrimaryProductServiceCode_Proposition == '' ? null : PrimaryProductServiceCode_Proposition
    * print  "PrimaryProductServiceCode_Proposition2 is :",PrimaryProductServiceCode_Proposition
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

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * replace campaignName_XML.– = '-'
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

#  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'
    * print 'treatment tracking code '+treatmentTrackingCode_XML


  @CrossChannelDispositionOfferValidationWithIH
  Scenario: Validate cross channel disposition offer details with IH
   # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * print '**** Validation of IH Disposition is '+dispositionCode+' Record***'
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
    * def crossChannelValue = crossChannel == 'CSE' ? 'AS400' : crossChannel
    * def channel_ExcelTestData = karate.get('$data.ChannelCode_'+crossChannelValue)
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

#    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * def accountNumber_acctDimExcelTestData = trimString(subString(accountNumber_acctDimExcelTestData, 10, 23))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = crossChannel == 'MOB' ? 'MMC,' : crossChannel == 'SOL' ? 'SMC,' : 'CSE'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_SOLSheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].pyTreatment")[0]
    * eval if(creativeId_SOLSheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_SOLSheet));

    #    Verifying  Operator with SOL Excel sheet and IH
    * def operator_SOLSheet = crossChannel == 'MOB' ? karate.get('$data.RequestID_'+crossChannel) : ""
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Operator")[0]
    * def operator_IH = crossChannel == 'MOB' ? operator_IH :  ""
    * eval if(operator_SOLSheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_SOLSheet));

    #    Verifying  Lead Scope with SOL Soap Request parameter LeadScope  and IH
    * def crossChannelValue = crossChannel == 'CSE' ? 'AS400' : crossChannel
    * def leadScope_RequestBody = karate.get('$data.LeadScope_'+crossChannelValue)
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with AS400 Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def crossChannelValue = crossChannel == 'CSE' ? 'AS400' : crossChannel
    * def primatyContextType_RequestBody = (crossChannel == 'MOB' ? upperCase(karate.get('$data.ContextType1_'+crossChannelValue)) : upperCase(karate.get('$data.ContextType_'+crossChannelValue)))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with AS400 Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def crossChannelValue = crossChannel == 'CSE' ? 'AS400' : crossChannel
    * def primatyContextValue_RequestBody = (crossChannel == 'MOB' ? upperCase(karate.get('$data.ContextValue1_'+crossChannelValue)) : upperCase(karate.get('$data.ContextValue_'+crossChannelValue)))
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


  @DispositionOfferValidationWithIH
  Scenario: Validate disposition offer details with IH
   # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

    * print '**** Validation of IH Disposition for '+dispositionCode+' Record***'

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
#    Verifying  Channel name with Excel (SOL Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * print 'the value from testdata is:', channel_ExcelTestData
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Channel")[0]
    * print 'the value from IH is:', channel_IH
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

     #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_IH,offeredOn_TodaysDate));

 #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_todayDate));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));


    #    Verifying  Out come with Hard coded value and IH
    * def outCome_ExcelTestData = karate.get('$data.ChannelOutcome')
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Outcome")[0]
    * eval if(outCome_ExcelTestData==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_ExcelTestData));

#    Verifying  Channel Outcome(only for Disposition test case) with Excel (SOL Input sheet) and IH
    * def channelOutcome_ExcelTestData = karate.get('$data.ResponseCode')
    * def channelOutcome_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Channel Outcome']")[0]
    * eval if(channelOutcome_ExcelTestData==channelOutcome_IH?printPassedResult('Channel Outcome',channelOutcome_IH):printFailedResult('Channel Outcome',channelOutcome_IH,channelOutcome_ExcelTestData));

    #    Verifying  Treatment ( Creative ID) with SOL Sheet  and IH
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyTreatment")[0]
    * eval if(creativeId_SOLSheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_SOLSheet));

#         #    Verifying  Category with Hard coded (BAU)  and IH
#    * def category_HardCoded = 'BAU'
#    * def category_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyCategory")[0]
#    * eval if(category_HardCoded==category_IH?printPassedResult('Category',category_HardCoded):printFailedResult('Category',category_IH,category_HardCoded));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

    #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

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

  @OfferValidationWithIH
  Scenario Outline: Validate disposition offer details with IH

    * string outcome = <outcome>
    * print '***************Validating '+outcome+' Record*************'

    #    Verifying pySubjectID with Excel and IH
    * def pySubjectID_ExcelTestData = cid
    * print 'Offer code is'+offerCode
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

#    Verifying  Channel name with Excel (SOL Input sheet) value and IH
    * def channel_ExcelTestData = karate.get('$data.ChannelCode')
    * def channel_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Channel")[0]
    * eval if(channel_ExcelTestData==channel_IH?printPassedResult('Channel',channel_IH):printFailedResult('Channel',channel_IH,channel_ExcelTestData));

    #    Verifying  Offered on with today's date and IH
    * def offeredOn_TodaysDate = getDate('M/d/yy')
    * def splitDate = function(offeredOnValue){return offeredOnValue.split(' ')[0]}
    * def offeredOn_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Offered on']")[0]
    * def offeredOn_IH = splitDate(offeredOn_IH)
    * eval if(offeredOn_TodaysDate==offeredOn_IH?printPassedResult('Offered On',offeredOn_IH):printFailedResult('Offered On',offeredOn_TodaysDate,offeredOn_IH));

 #    Verifying  Lead Start Date - SOL - with current date and IH
    * def leadStartDate_todayDate = getDate('yyyyMMdd')
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_todayDate==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_todayDate));

       #    Verifying  Lead End Date + Persistance days - SOL - with current date and IH
    * def persistenceDays_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Persistence Days']")[0]
    * def leadEndDate_todayDatePlusPersistanceDays = futureDateForLeadEndDate(persistenceDays_IH)
    * replace leadEndDate_todayDatePlusPersistanceDays.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_todayDatePlusPersistanceDays==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_todayDatePlusPersistanceDays):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_todayDatePlusPersistanceDays));

    #    Verifying  Out come with Hard coded value and IH
    * def outCome_HardCoded = outcome
    * def outCome_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Outcome")[0]
    * eval if(outCome_HardCoded==outCome_IH?printPassedResult('Outcome',outCome_IH):printFailedResult('Outcome',outCome_IH,outCome_HardCoded));

    # Commenting zone code validation as there is no field present in PEGA 8.4 (Defect raised:-CIMCAMP-582 )
    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
#    * def listOfZoneCodes = ['SMC', 'SSC', 'SIC', 'SSP']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
   * def zoneCodes_Proposition = 'SMC,'
#    * def zoneCodes_Proposition = zoneCodes_Proposition == '' ? null : zoneCodes_Proposition
    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));



     #    Verifying  Operator with SOL Excel sheet and IH
    * def operator_SOLSheet = karate.get('$data.RequestID')
    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Operator")[0]
    * eval if(operator_SOLSheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_SOLSheet));

     #    Verifying  Category with Hard coded (BAU)  and IH
#    * def category_HardCoded = 'BAU'
#    * def category_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyCategory")[0]
#    * eval if(category_HardCoded==category_IH?printPassedResult('Category',category_HardCoded):printFailedResult('Category',category_IH,category_HardCoded));

    #    Verifying  Lead Scope with SOL Soap Request parameter LeadScope  and IH
    * def leadScope_RequestBody = karate.get('$data.LeadScope')
    * def leadScope_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].LeadScope")[0]
    * eval if(leadScope_RequestBody==leadScope_IH?printPassedResult('Lead Scope',leadScope_RequestBody):printFailedResult('Lead Scope',leadScope_IH,leadScope_RequestBody));

     #    Verifying  Primary context type with SOL Soap Request parameter ContextType  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextType_RequestBody = upperCase(karate.get('$data.ContextType'))
    * def primatyContextType_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Type']")[0]
    * eval if(primatyContextType_RequestBody==primatyContextType_IH?printPassedResult('Primary context type',primatyContextType_RequestBody):printFailedResult('Primary context type',primatyContextType_IH,primatyContextType_RequestBody));

 #    Verifying  Primary context Value with SOL Soap Request parameter ContextValue  and IH
    * def upperCase = function(stringValue){return stringValue.toUpperCase()}
    * def primatyContextValue_RequestBody = upperCase(karate.get('$data.ContextValue'))
    * def primatyContextValue_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Primary Context Value']")[0]
    * eval if(primatyContextValue_RequestBody==primatyContextValue_IH?printPassedResult('Primary context Value',primatyContextValue_RequestBody):printFailedResult('Primary context value',primatyContextValue_IH,primatyContextValue_RequestBody));

     #    Verifying  Control group with Hardcoded  and IH
    * def controlGroup_HardCoded = 'N'
    * def controlGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Control")[0]
    * eval if(controlGroup_HardCoded==controlGroup_IH?printPassedResult('Control Group',controlGroup_HardCoded):printFailedResult('Control Group',controlGroup_IH,controlGroup_HardCoded));

 #  Verifying Offer Instance Id with Proposition and IH
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].OFR_INSTANCE_ID")[0]
    * eval if(offerInstanceId_Proposition==offerInstanceId_IH?printPassedResult('Offer Instance Id',offerInstanceId_Proposition):printFailedResult('Offer Instance Id',offerInstanceId_IH,offerInstanceId_Proposition));

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

#  @ItradeXsellAlwaysOnSpecificIHValidation
#  Scenario Outline: Validate ItradeXsellAlwaysOn offer details with IH
#    * string outcome = <outcome>
#    * print '***************Validating '+outcome+' Record*************'
#
#
#
#
#    Examples:
#      | outcome |
#      | "IPT"   |
#      | "PST"   |

######################## SOAP Response validation specific to campaigns#######################

      # -------------------------------------NTC Mortgage Acquisition - SOL - 5152--------------------------------------------
  @NTCMortgageAcquisitionSOLOfferValidation
  Scenario: Validate NTC Mortgage Acquisition SOL 5152 offer response fields

    # Report database records in cucumber report
    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')


    # Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(((creativeId_XML==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));

    #    Verifying CID with XML and Conditioned SOL Sheet
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
    * replace offerTitle_XML.– = '-'
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


      #    Verifying Offer Condition with XML and Proposition sheet
    #* def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    #* def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    #* def OfferCondition_Proposition = OfferCondition_Proposition == '' ? null : OfferCondition_Proposition
    #* eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #    Verifying Offer start date with XML and today's date
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_TodaysDate));

    #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
    * def listOfZoneCodes = ['SMC', 'SSC', 'SIC', 'SSP']
    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * eval if(zoneCodes_XML==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_Proposition));

     #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = 'MTG'
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    #* def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    #* def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    #* def PrimaryProductServiceName_Proposition = PrimaryProductServiceName_Proposition == '' ? null : PrimaryProductServiceName_Proposition
    #* eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

     #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = 'RM'
    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * replace campaignName_XML.– = '-'
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

#  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code'+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'


    # -------------------------------------Creditor Insurance Retargeting- 5648--------------------------------------------
  @CreditorInsuranceRetargetingSOLOfferValidation
  Scenario: Validate Creditor Insurance Retargeting 5648 offer response fields
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * string currentAccountName_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_DESC FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_XML==currentAccountName_Database?printPassedResult('Current Account Name ',currentAccountName_XML):printFailedResult('Current Account Name ',currentAccountName_XML,currentAccountName_Database));


    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    # Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    # Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * def creativeId_SOL_Sheet = '2423112102'
    * def concatcreative = karate.get(creativeId_SOLSheet) + ' or ' + karate.get(creativeId_SOL_Sheet)
    * eval if(((creativeId_XML==creativeId_SOLSheet)||(creativeId_XML==creativeId_SOL_Sheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,concatcreative));

    # Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));


    # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

 #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

     #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * def creativeId_SOL_Sheet = '2423112102'
    * def concatcreative = karate.get(creativeId_SOLSheet) + ' or ' + karate.get(creativeId_SOL_Sheet)
    * eval if(((creativeId_XML==creativeId_SOLSheet)||(creativeId_XML==creativeId_SOL_Sheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,concatcreative));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));
     # -------------------------------------D2D Welcome--------------------------------------------
  @D2DWelcomeContextualOfferValidation @NTCWelcomeContextualOfferValidation
  Scenario: Validate D2D Welcome Contextual offer response fields
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')
    #    Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(creativeId_XML==creativeId_SOLSheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));
   # -------------------------------------NTB Advice Plus--------------------------------------------
  @NTBAdvicePlusContextualOfferValidation
  Scenario: Validate NTB AdvicePlus Contextual offer response fields
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')
    #    Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(creativeId_XML==creativeId_SOLSheet?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));
    #    Verifying CurrentAccountNumber with XML and acct_dim sheet
    * def currentAccountNumber_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * print "Account number from XML is ",currentAccountNumber_XML
    * def CurrentAccountNumber_SOLSheet = acct_num
    * print "Account number from acct_dim sheet is ",CurrentAccountNumber_SOLSheet
    * eval if(currentAccountNumber_XML==CurrentAccountNumber_SOLSheet?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account Number',currentAccountNumber_XML,CurrentAccountNumber_SOLSheet));


    ##-----------------------------D2D Engagement - Offer Reminder Fulfillment_______________________________
  @D2DEngagementOfferReminderFulfillmentSOL
  Scenario: Validate D2DEngagementOffer ReminderFulfillment SOL offer response fields
    * call read('classpath:channels/sol/ReusableScenarios.feature@ContextualOfferValidation')
    # Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(((creativeId_XML==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));
    # Verifying LeadId XML should not be null
    * def LeadId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadId_XML == '#notnull'
    * print 'Lead id is '+LeadId_XML



#    * def LeadId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_lead_id")[0]
#    * match LeadId_JSON == '#notnull'

     ######################## IH validation specific to campaigns#######################

   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
    # ------------------------------------D2D Campaigns ----------------------
  @D2DOfferValidationWithIH @NTCOfferValidationWithIH @NTBAdvicePlusOfferValidationWithIH
  Scenario: Validate D2D offer details with IH
#    Validates Common elements
    * call read('classpath:channels/sol/ReusableScenarios.feature@OfferValidationWithIH')

    #    Verifying  Treatment ( Creative ID) with SOL Sheet  and IH
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]

    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(creativeId_SOLSheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_SOLSheet));

    #    Verifying  Account Number with Acct DIM sheet Excel (SOL Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * print 'Account DIM data'+dataAcctDim
    * def accountNumber_acctDimExcelTestData = acct_num
    * print 'Account Number'+accountNumber_acctDimExcelTestData
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  @CreditorInsuranceOfferValidationWithIH
  Scenario: Validate Creditor Insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/sol/ReusableScenarios.feature@OfferValidationWithIH')
    # Verifying  Treatment ( Creative ID) with SOL Sheet  and IH
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * def creativeId_SOL_Sheet = '2423112102'
    * def concatcreative = karate.get(creativeId_SOLSheet) + ' or ' + karate.get(creativeId_SOL_Sheet)
    * eval if(((creativeId_IH==creativeId_SOLSheet)||(creativeId_IH==creativeId_SOL_Sheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,concatcreative));

    #  Verifying Cell Group with Proposition and IH
    * def CellGroup_Proposition = karate.get('data.CellGroup')
#    * def CellGroup_Proposition = trimString(readValue("SELECT INSURANCE_PROPENSITY_DECILE FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def CellGroup_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Cell Group']")[0]
    * eval if(CellGroup_Proposition==CellGroup_IH?printPassedResult('Cell Group',CellGroup_Proposition):printFailedResult('Cell Group',CellGroup_IH,CellGroup_Proposition));

    #    Verifying  Account Number with Acct DIM sheet Excel (SOL Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * print 'Account Number'+accountNumber_acctDimExcelTestData
    * def accountNumber_acctDimExcelTestData = trimString(subString(accountNumber_acctDimExcelTestData, 10, 23))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  @SSIFundSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to SSI Fund)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_SOLSheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(((creativeId_IH==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_SOLSheet));

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
# To uncomment in OCt 26th 2023 release

#     #    Verifying Zone code with Proposition sheet and IH
#    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
#    * def zoneCodes_Proposition = 'SMC,'
##    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
#    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


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

  @SSIFundOfferValidationWithIH
  Scenario: Validate SSI fund offer details with IH
#    Validates Common elements
    * call read('classpath:channels/sol/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to suppcards
    * call read('classpath:channels/sol/ReusableScenarios.feature@SSIFundSpecificElementsIH')


  @SSIFundContextualOfferValidation
  Scenario: Validate SSI Fund Contextual offer response fields

    #    Verifying CID with XML and Conditioned SOL Sheet
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
    * replace offerTitle_XML.– = '-'
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

   # Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(((creativeId_XML==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));

#      #    Verifying Offer Condition with XML and Proposition sheet
#    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
#    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
#    * def OfferCondition_Proposition = OfferCondition_Proposition == '' ? null : OfferCondition_Proposition
#    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #    Verifying Offer start date with XML and today's date
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_TodaysDate));

    #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
#    * def listOfZoneCodes = ['SMC', 'SSC', 'SIC', 'SSP']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * def zoneCodes_Proposition = 'SMC,'
    * eval if(zoneCodes_XML==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_Proposition));

     #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

#    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
#    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
#    * print  "XML PrimaryServiceCode is :",primaryProductServiceCode_XML
#    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
#    * print  "PrimaryProductServiceCode_Proposition1 is :",PrimaryProductServiceCode_Proposition
#    * def PrimaryProductServiceCode_Proposition = PrimaryProductServiceCode_Proposition == '' ? null : PrimaryProductServiceCode_Proposition
#    * print  "PrimaryProductServiceCode_Proposition2 is :",PrimaryProductServiceCode_Proposition
#    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));
#
#  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
#    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
#    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
#    * def PrimaryProductServiceName_Proposition = PrimaryProductServiceName_Proposition == '' ? null : PrimaryProductServiceName_Proposition
#    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));
#
#     #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
#    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
#    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
#    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
#    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * replace campaignName_XML.– = '-'
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

#  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'
    * print 'treatment tracking code '+treatmentTrackingCode_XML


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
    * def currentAccountNumber_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = retreiveSubstring(acct_num,19,22)
    * print 'Curren Account number last 4 digits is:'+ currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

#      #    Verifying Primary Product Feature with JSON and Proposition sheet
#    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadId_JSON == '#notnull'

#  Verifying Current Account Name with soap and Plan code master from acct_dim
    * def currentAccountName_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def currentAccountName_datasheet = trimString(readValue("SELECT PLN_ACCT_CD_MASTER FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_datasheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_datasheet));

#    SSI PAC offer Validation


  @SSIPACSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to SSI PAC)
    * string outcome = <outcome>
  #    Verifying  Treatment ( Creative ID) with Proposition  and IH
    * def creativeId_SOLSheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(((creativeId_IH==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_IH):printFailedResult('Creative Id',creativeId_IH,creativeId_SOLSheet));

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
# To uncomment in OCt 26th 2023 release

#     #    Verifying Zone code with Proposition sheet and IH
#    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
#    * def zoneCodes_Proposition = 'SMC,'
##    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
#    * eval if(zoneCodes_IH==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,zoneCodes_Proposition));


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

  @SSIPACOfferValidationWithIH
  Scenario: Validate SSI fund offer details with IH
#    Validates Common elements
    * call read('classpath:channels/sol/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to SSI PAC
    * call read('classpath:channels/sol/ReusableScenarios.feature@SSIPACSpecificElementsIH')


  @SSIPACContextualOfferValidation
  Scenario: Validate SSI Fund Contextual offer response fields

    #    Verifying CID with XML and Conditioned SOL Sheet
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
    * replace offerTitle_XML.– = '-'
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

   # Verifying Creative Id with XML and SOL sheet
    * def creativeId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CreativeID/text()")
    * def creativeId_SOLSheet = karate.get('$data.CreativeId')
    * eval if(((creativeId_XML==creativeId_SOLSheet))?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_SOLSheet));

#      #    Verifying Offer Condition with XML and Proposition sheet
#    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
#    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
#    * def OfferCondition_Proposition = OfferCondition_Proposition == '' ? null : OfferCondition_Proposition
#    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #    Verifying Offer start date with XML and today's date
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
    * eval if(offerStartDate_XML==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_TodaysDate));

    #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    #    Verifying Zone code with XML and Proposition sheet
    * def zoneCodes_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ZoneCodes/text()")
#    * def listOfZoneCodes = ['SMC', 'SSC', 'SIC', 'SSP']
#    * karate.forEach(listOfZoneCodes, zoneCodesFunction)
#    * def zoneCodes_Proposition = ReplaceSpecialCharacter(zoneCodes_Proposition,'\\[\" \"] ","','')
    * def zoneCodes_Proposition = 'SMC,'
    * eval if(zoneCodes_XML==zoneCodes_Proposition?printPassedResult('Zone Code',zoneCodes_XML):printFailedResult('Zone Code',zoneCodes_XML,zoneCodes_Proposition));

     #  Verifying Viewed Status with XML and HardCoded ViewedStatus
    * def viewedStatus_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ViewedStatus/text()")
    * def listOfDispositions = ['ATC', 'DEC', 'VWD', 'ATP', 'NTY']
    * def viewedStatus_Function = function(dispositionValue){return listOfDispositions.indexOf(dispositionValue) > -1}
    * def viewedStatus_HardCoded = viewedStatus_Function(karate.get('$data.ResponseCode'))?'true':'false'
    * eval if(viewedStatus_XML==viewedStatus_HardCoded?printPassedResult('Viewed Status',viewedStatus_XML):printFailedResult('Viewed Status',viewedStatus_XML,viewedStatus_HardCoded));

#    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
#    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
#    * print  "XML PrimaryServiceCode is :",primaryProductServiceCode_XML
#    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
#    * print  "PrimaryProductServiceCode_Proposition1 is :",PrimaryProductServiceCode_Proposition
#    * def PrimaryProductServiceCode_Proposition = PrimaryProductServiceCode_Proposition == '' ? null : PrimaryProductServiceCode_Proposition
#    * print  "PrimaryProductServiceCode_Proposition2 is :",PrimaryProductServiceCode_Proposition
#    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));
#
#  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
#    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
#    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
#    * def PrimaryProductServiceName_Proposition = PrimaryProductServiceName_Proposition == '' ? null : PrimaryProductServiceName_Proposition
#    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));
#
#     #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
#    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
#    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
#    * def PrimaryProductServiceSubCode_Proposition = PrimaryProductServiceSubCode_Proposition == '' ? null : PrimaryProductServiceSubCode_Proposition
#    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

     # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * replace campaignName_XML.– = '-'
    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));

#  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code '+responseTrackingCode_XML
    * match responseTrackingCode_XML == '#notnull'

#  Verifying Treatment Tracking Code  XML should not be null
    * def treatmentTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::TreatmentTrackingCode/text()")
    * match treatmentTrackingCode_XML == '#notnull'
    * print 'treatment tracking code '+treatmentTrackingCode_XML


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
    * def currentAccountNumber_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountNumber/text()")
    * def currentAccountNumber_Database = retreiveSubstring(acct_num,19,22)
    * print 'Curren Account number last 4 digits is:'+ currentAccountNumber_Database
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

#      #    Verifying Primary Product Feature with JSON and Proposition sheet
#    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    #  Verifying LeadId  XML should not be null
    * def LeadId_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::LeadID/text()")
    * match LeadId_JSON == '#notnull'

#  Verifying Current Account Name with soap and Plan code master from acct_dim
    * def currentAccountName_JSON = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def currentAccountName_datasheet = trimString(readValue("SELECT PLN_ACCT_CD_MASTER FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(currentAccountName_JSON==currentAccountName_datasheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_datasheet));


  #------------------------------------Itrade Xsell AlwaysON Campaign ----------------------
  @ItradeXsellAlwaysOnOfferValidation
  Scenario: Validate ItradeXsellAlwaysOn offer details
# # Report database records in cucumber report
#    * call read('classpath:channels/sol/ReusableScenarios.feature@reportDbRecords')

        #    Verifying CID with XML and Conditioned SOL Sheet
    * def id_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/preceding-sibling::ID/text()")
    * def id_Excel = cid
    * eval if(id_XML==id_Excel?printPassedResult('CID',id_XML):printFailedResult('CID',id_XML,id_Excel));

#    #    Verifying CID with JSON and Conditioned SOL Sheet
#    * def id_JSON = karate.jsonPath(responseString,"$.cid")
#    * def id_Excel = cid
#    * print "id_JSON is", id_JSON
#    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));

#    # Verifying NBA Number with JSON and Proposition sheet
#    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
#    * print "nbaNumber_JSON is", nbaNumber_JSON
#    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
#    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

#    # Verifying NBA Name with JSON and Proposition sheet
#    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
#    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
#    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

#    #    Verifying Offer start date with XML and Proposition Sheet
#    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
#    * def offerStartDate_TodaysDate = getDate('yyyy-MM-dd')
#    * eval if(offerStartDate_JSON==offerStartDate_TodaysDate?printPassedResult('Offer start date',offerStartDate_JSON):printFailedResult('Offer start date',offerStartDate_JSON,offerStartDate_TodaysDate));
#    # Verifying Zone Code with JSON and Proposition sheet
#    * def zoneCode_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].zone_code")[0]
#    * def listOfZoneCodes = 'MMC,'
#    * eval if(zoneCode_JSON==listOfZoneCodes?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,listOfZoneCodes));

#      # Verifying Campaign Name with XML and Hard coded
#    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
#    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
#    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));

#    # Verifying Offer expiry date with XML and Proposition sheet
#    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers.[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
#    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
#    * eval if(offerExpiryDate_JSON==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Proposition));

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

    # Verifying Creative Id with JSON and SOL sheet
    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
    * def creativeId_SOLSheet = karate.get('data.CreativeId')
    * def randSplit = 0
    * eval if (creativeId_SOLSheet.length > 10?randSplit = chooseCreative(creativeId_JSON,creativeId_SOLSheet,'|'):randSplit = creativeId_SOLSheet);
    * eval if(creativeId_JSON==randSplit?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_SOLSheet));

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


    ######################## End of IH validation specific to campaigns#######################

   ######################## Disposition IH validation specific to campaigns#######################
   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
   # ------------------------------------D2D Campaigns ----------------------
  @D2DDispositionOfferValidationWithIH  @NTCDispositionOfferValidationWithIH
  Scenario: Validate D2D disposition offer details with IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@DispositionOfferValidationWithIH')

#    Verifying  Account Number with Acct DIM sheet Excel (SOL Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));
  @D2DEarlyEngagementOfferReminderSOLIHvalidation
  Scenario: Validate D2DEarlyEngagementOfferReminder offer details with IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@OfferValidationWithIH')
#    Verifying  Account Number with Acct DIM sheet Excel (SOL Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

  @CreditorInsuranceDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance disposition offer details with IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@DispositionOfferValidationWithIH')

#    Verifying  Account Number with Acct DIM sheet Excel (SOL Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = karate.get('dataAcctDim.ACCT_NUM')
    * def accountNumber_acctDimExcelTestData = trimString(subString(accountNumber_acctDimExcelTestData, 10, 23))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    ######################## End of Disposition IH validation specific to campaigns#######################

  ######################## Cross channel Disposition IH validation specific to campaigns#######################

  # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceCrossChannelDispositionOfferValidationWithIH
  Scenario: Validate Creditor Insurance cross channel disposition offer details with IH
    * call read('classpath:channels/sol/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')
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

    ########################End of Cross channel Disposition IH validation specific to campaigns#######################