@NOVANBA

Feature: Get NBA Response

  Background:

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @4479NovaContextual
  Scenario Outline: 4479_ NBA_10 Validate NBA response data elements and structure

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body

    * replace requestfile.$ContextType$ = karate.get('$data.ChannelCode')
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

  #    Printing request body in console
    * print '*********Request**********'+requestfile

     #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * method post
  #    Verify Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
      #    It clears Result fields
    * clearResultFields()

      #    Verifying NBA Category with JSON and Proposition sheet
    * def customerRelevance_JSON = $.[*].[0].CustomerRelevance
    * def customerRelevance_JSON = ReplaceSpecialCharacter(customerRelevance_JSON,'\\[ \\] "','')
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = $.[*].[0].NBAName
    * def nbaName_JSON = ReplaceSpecialCharacter(nbaName_JSON,'\\[ \\] "','')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = $.[*].[0].OfferCondition
    * def offerCondition_JSON = ReplaceSpecialCharacter(offerCondition_JSON,'\\[ \\] "','')
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

   #    Verifying Interaction Objective with JSON and Proposition sheet
    * def interactionObjective_JSON = $.[*].[0].InteractionObjective
    * def interactionObjective_JSON = ReplaceSpecialCharacter(interactionObjective_JSON,'\\[ \\] "','')
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(interactionObjective_JSON==offerType_Proposition?printPassedResult('Interaction Objective',interactionObjective_JSON):printFailedResult('Interaction Objective',interactionObjective_JSON,offerType_Proposition));

     #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = $.[*].[0].pyName
    * def pyName_JSON = ReplaceSpecialCharacter(pyName_JSON,'\\[ \\] "','')
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

    # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = $.[*].[0].OfferDescription
    * def offerDescription_JSON = ReplaceSpecialCharacter(offerDescription_JSON,'\\[ \\] "','')
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

   # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = $.[*].[0].CreativeID
    * def creativeId_JSON = ReplaceSpecialCharacter(creativeId_JSON,'\\[ \\] "','')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_JSON==creativeId_Proposition?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_Proposition));

    #    Verifying Offer Start date with JSON and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_JSON = $.[*].[0].OfferStartDateTxt
    * def offerStartDate_JSON = ReplaceSpecialCharacter(offerStartDate_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string offerStart_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(offerStartDate_JSON==offerStart_Database?printPassedResult('Offer Start Date',offerStartDate_JSON):printFailedResult('Offer Start date',offerStartDate_JSON,offerStart_Database));

    # Verifying Offer Expiry date with JSON and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_JSON = $.[*].[0].OfferExpireDateTxt
    * def offerExpiryDate_JSON = ReplaceSpecialCharacter(offerExpiryDate_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(offerExpiryDate_JSON==offerExpiry_Database?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiry_Database));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = $.[*].[0].NBANumber
    * def nbaNumber_JSON = ReplaceSpecialCharacter(nbaNumber_JSON,'\\[ \\] "','')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));

    # Verifying PAL Fulfill with JSON and Proposition sheet
    * def palfulfill_JSON = $.[*].[0].PALFulfill
    * def palfulfill_JSON = ReplaceSpecialCharacter(palfulfill_JSON,'\\[ \\] "','')
    * def palfulfill_HardCoded = "Y"
    * eval if(palfulfill_JSON==palfulfill_HardCoded?printPassedResult('PAL Ful Fill',palfulfill_JSON):printFailedResult('PAL Ful Fill',palfulfill_JSON,palfulfill_HardCoded));

    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = $.[*].[0].CampaignCode
    * def campaignCode_JSON = ReplaceSpecialCharacter(campaignCode_JSON,'\\[ \\] "','')
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = $.[*].[0].OfferName
    * def offerName_JSON = ReplaceSpecialCharacter(offerName_JSON,'\\[ \\] "','')
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferName')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

     # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = $.[*].[0].ZoneCode
    * def zoneCode_JSON = ReplaceSpecialCharacter(zoneCode_JSON,'\\[ \\] " ,','')
    * def zoneCode_HardCoded = "MMC"
    * eval if(zoneCode_JSON==zoneCode_HardCoded?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,zoneCode_HardCoded));

     #  Verifying Current Credit Limit with JSON and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
    * def currentCreditLimit_JSON = $.[*].[0].InteractionList.[3].Value
    * def currentCreditLimit_JSON = ReplaceSpecialCharacter(currentCreditLimit_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def currentCreditLimit_Database = trimString(readValue("SELECT CR_CRD_LMT_AMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(currentCreditLimit_JSON==currentCreditLimit_Database?printPassedResult('Current Credit Limit',currentCreditLimit_JSON):printFailedResult('Current Credit Limit',currentCreditLimit_JSON,currentCreditLimit_Database));

  #  validations for approved credit limit- not null, greater than current credit limit
    * def approvedCreditLimit_JSON = $.[*].[0].InteractionList.[0].Value
    * def approvedCreditLimit_JSON = decimalRange(ReplaceSpecialCharacter(approvedCreditLimit_JSON,'\\[ \\] "',''),2)
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def approvedCreditLimit_Database = trimString(approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'")))
    * match approvedCreditLimit_JSON == '#notnull'
    * def currentCreditLimit =  parseFloat(currentCreditLimit_JSON)
    * def approvedCreditLimit =  parseFloat(approvedCreditLimit_JSON)
    * assert approvedCreditLimit > currentCreditLimit
    * eval if(approvedCreditLimit_JSON==approvedCreditLimit_Database?printPassedResult('Approved Credit Limit',approvedCreditLimit_JSON):printFailedResult('Approved Credit Limit',approvedCreditLimit_JSON,approvedCreditLimit_Database));

    #  Verifying Current Account Name with JSON and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_JSON = $.[*].[0].InteractionList.[4].Value
    * def currentAccountName_JSON = ReplaceSpecialCharacter(currentAccountName_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_JSON==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with JSON and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = $.[*].[0].InteractionList.[5].Value
    * def currentAccountNumber_JSON = ReplaceSpecialCharacter(currentAccountNumber_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def currentAccountNumber_Database = sliceString(accountNumber_ACCT_NUMTable)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

 #    Verifying PrimaryProductServiceCode with JSON and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON = $.[*].[0].InteractionList.[21].Value
    * def primaryProductServiceCode_JSON = ReplaceSpecialCharacter(primaryProductServiceCode_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(primaryProductServiceCode_JSON==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_JSON,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceSubCode with JSON and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = $.[*].[0].InteractionList.[22].Value
    * def primaryProductServiceSubCode_JSON = ReplaceSpecialCharacter(primaryProductServiceSubCode_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_JSON,primaryProductServiceSubCode_Database));

#    Verifying Product Code with JSON and Database table EDPEGAT.ACCT_DIM
    * def productCode_JSON = $.[*].[0].InteractionList.[27].Value
    * def productCode_JSON = ReplaceSpecialCharacter(productCode_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string productCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(productCode_JSON==productCode_Database?printPassedResult('Product Code',productCode_JSON):printFailedResult('Product Code',productCode_JSON,productCode_Database));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def productSubCode_JSON = $.[*].[0].InteractionList.[28].Value
    * def productSubCode_JSON = ReplaceSpecialCharacter(productSubCode_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * string productSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * eval if(productSubCode_JSON==productSubCode_Database?printPassedResult('Product SubCode',productSubCode_JSON):printFailedResult('PrimaryProductServiceSubCode',productSubCode_JSON,productSubCode_Database));

 #    Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = $.[*].[0].PrimaryProductFeatures
    * def primaryProductFeature_JSON = ReplaceSpecialCharacter(primaryProductFeature_JSON,'\\[ \\] "','')
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                            |
      | "Validate NOVA Response for 4479" |


  @2423Nova
  Scenario Outline: 2423_NBA_09 Validate NBA response data elements and structure

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ContextType$ = karate.get('$data.ChannelCode')
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

  #    Printing request body in console
    * print '*********Request**********'+requestfile

 #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * method post
  #    Verify Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
      #    It clears Result fields
    * clearResultFields()

      #    Verifying Customer Relevance with JSON and Proposition sheet
    * def customerRelevance_JSON = $.[*].[0].CustomerRelevance
    * def customerRelevance_JSON = ReplaceSpecialCharacter(customerRelevance_JSON,'\\[ \\] "','')
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));

    #    Verifying NBA Name with JSON and Proposition sheet
    * def nbaName_JSON = $.[*].[0].NBAName
    * def nbaName_JSON = ReplaceSpecialCharacter(nbaName_JSON,'\\[ \\] "','')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));

    #    Verifying Offer Condition with JSON and Proposition sheet
    * def offerCondition_JSON = $.[*].[0].OfferCondition
    * def offerCondition_JSON = ReplaceSpecialCharacter(offerCondition_JSON,'\\[ \\] "','')
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));

    #    Verifying Campaign Name with JSON and Proposition sheet
    * def campaignname_JSON = $.[*].[0].CampaignName
    * def campaignname_JSON = ReplaceSpecialCharacter(campaignname_JSON,'\\[ \\] "','')
    * def campaignname_HardCoded = "Creditor Insurance NBA"
    * eval if(campaignname_JSON==campaignname_HardCoded?printPassedResult('Campaign Name',campaignname_JSON):printFailedResult('Campaign Name',campaignname_JSON,campaignname_HardCoded));

   #    Verifying Interaction Objective with JSON and Proposition sheet
    * def interactionObjective_JSON = $.[*].[0].InteractionObjective
    * def interactionObjective_JSON = ReplaceSpecialCharacter(interactionObjective_JSON,'\\[ \\] "','')
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(interactionObjective_JSON==offerType_Proposition?printPassedResult('Interaction Objective',interactionObjective_JSON):printFailedResult('Interaction Objective',interactionObjective_JSON,offerType_Proposition));

     #    Verifying PY Name with JSON and Proposition sheet
    * def pyName_JSON = $.[*].[0].pyName
    * def pyName_JSON = ReplaceSpecialCharacter(pyName_JSON,'\\[ \\] "','')
    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));

    # Verifying OfferDescription with JSON and Proposition sheet
    * def offerDescription_JSON = $.[*].[0].OfferDescription
    * def offerDescription_JSON = ReplaceSpecialCharacter(offerDescription_JSON,'\\[ \\] "','')
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));

   # Verifying Creative Id with JSON and Proposition sheet
    * def creativeId_JSON = $.[*].[0].CreativeID
    * def creativeId_JSON = ReplaceSpecialCharacter(creativeId_JSON,'\\[ \\] "','')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_JSON==creativeId_Proposition?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_Proposition));

    #    Verifying Offer Start date with JSON and Proposition sheet
    * def offerstartdate_JSON = $.[*].[0].OfferStartDateTxt
    * def offerstartdate_JSON = ReplaceSpecialCharacter(offerstartdate_JSON,'\\[ \\] "','')
    * string offerstartdate_Proposition = dateFormat(0)
    * eval if(offerstartdate_JSON==offerstartdate_Proposition?printPassedResult('Offer Start Date',offerstartdate_JSON):printFailedResult('Offer Start Date',offerstartdate_JSON,offerstartdate_Proposition));

    # Verifying Offer Expiry date with JSON and Proposition sheet
    * def offerexpirydate_JSON = $.[*].[0].OfferExpireDateTxt
    * def offerexpirydate_JSON = ReplaceSpecialCharacter(offerexpirydate_JSON,'\\[ \\] "','')
    #* def offerexpirydate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * def offerExpiryDate = '2021-06-30'
    * eval if(offerexpirydate_JSON==offerExpiryDate?printPassedResult('Offer Expiry Date',offerexpirydate_JSON):printFailedResult('Offer Expiry Date',offerexpirydate_JSON,offerExpiryDate));

     # Verifying Offer Instance ID with JSON and Proposition sheet
    * def ofrinstanceid_JSON = $.[*].[0].OFR_INSTANCE_ID
    * def ofrinstanceid_JSON = ReplaceSpecialCharacter(ofrinstanceid_JSON,'\\[ \\] "','')
    * def ofrinstanceid_HardCoded = "02423"
    * eval if(ofrinstanceid_JSON==ofrinstanceid_HardCoded?printPassedResult('Offer Instance ID',ofrinstanceid_JSON):printFailedResult('Offer Instance ID',ofrinstanceid_JSON,ofrinstanceid_HardCoded));

    # Verifying NBA Number with JSON and Proposition sheet
    * def nbaNumber_JSON = $.[*].[0].NBANumber
    * def nbaNumber_JSON = ReplaceSpecialCharacter(nbaNumber_JSON,'\\[ \\] "','')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));


    # Verifying Campaign Code with JSON and Proposition sheet
    * def campaignCode_JSON = $.[*].[0].CampaignCode
    * def campaignCode_JSON = ReplaceSpecialCharacter(campaignCode_JSON,'\\[ \\] "','')
    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));

    # Verifying Offer Name with JSON and Proposition sheet
    * def offerName_JSON = $.[*].[0].OfferName
    * def offerName_JSON = ReplaceSpecialCharacter(offerName_JSON,'\\[ \\] "','')
    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferName')
    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));

     # Verifying Zone Code with JSON and Proposition sheet
    * def zoneCode_JSON = $.[*].[0].ZoneCode
    * def zoneCode_JSON = ReplaceSpecialCharacter(zoneCode_JSON,'\\[ \\] " ,','')
    * def zoneCode_HardCoded = "MMC"
    * eval if(zoneCode_JSON==zoneCode_HardCoded?printPassedResult('Zone Code',zoneCode_JSON):printFailedResult('Zone Code',zoneCode_JSON,zoneCode_HardCoded));


    #  Verifying Current Account Name with JSON and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_JSON = $.[*].[0].InteractionList.[4].Value
    * def currentAccountName_JSON = ReplaceSpecialCharacter(currentAccountName_JSON,'\\[ \\] "','')
    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_JSON==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with JSON and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_JSON = $.[*].[0].InteractionList.[5].Value
    * def currentAccountNumber_JSON = ReplaceSpecialCharacter(currentAccountNumber_JSON,'\\[ \\] "','')

    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
    * def currentAccountNumber_Database = sliceString(accountNumber_ACCT_NUMTable)
    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));

 #    Verifying PrimaryProductServiceCode with JSON and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_JSON = $.[*].[0].InteractionList.[21].Value
    * def primaryProductServiceCode_JSON = ReplaceSpecialCharacter(primaryProductServiceCode_JSON,'\\[ \\] "','')
    * def primaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_JSON==primaryProductServiceCode_Proposition?printPassedResult('Primary Product Service Code',primaryProductServiceCode_JSON):printFailedResult('Primary Product Service Code',primaryProductServiceCode_JSON,primaryProductServiceCode_Proposition));

    #    Verifying PrimaryProductServiceSubCode with JSON and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_JSON = $.[*].[0].InteractionList.[22].Value
    * def primaryProductServiceSubCode_JSON = ReplaceSpecialCharacter(primaryProductServiceSubCode_JSON,'\\[ \\] "','')
    * def primaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_JSON==primaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_JSON):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_JSON,primaryProductServiceSubCode_Proposition));

 #    Verifying Primary Product Feature with JSON and Proposition sheet
    * def primaryProductFeature_JSON = $.[*].[0].PrimaryProductFeatures
    * def primaryProductFeature_JSON = ReplaceSpecialCharacter(primaryProductFeature_JSON,'\\[ \\] "','')
    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-NF_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-SV_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-NF_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-RG_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-SP_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VGD-ST_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-NF_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-RG_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-SS_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-ZZ_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-RG_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-ST_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VCL-DM_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - AXS-SC_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - AXS-SS_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - AXG-GC_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - AXG-GS_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - VLR-RC_SOM"                |
      | "Validate NOVA response for Min-Pay-2423 - VFF-TR_SOL"                |
      | "Validate NOVA response for Min-Pay-2423 - VFF-TS_MOB"                |
      | "Validate NOVA response for Min-Pay-2423 - 18yrs_SOM"                 |
      | "Validate NOVA response for Min-Pay-2423 - 40yrs_SOL"                 |
      | "Validate NOVA response for Min-Pay-2423 - 69yrs_MOB"                 |
      | "Validate NOVA response for Min-Pay-2423 - E_SOM"                     |
      | "Validate NOVA response for Min-Pay-2423 - EN_SOL"                    |
      | "Validate NOVA response for Min-Pay-2423 - F_MOB"                     |
      | "Validate NOVA response for Min-Pay-2423 - FR_SOM"                    |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL-Blank_SOL"  |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL - NULL_MOB" |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL - C_SOM"    |
      | "Validate NOVA response for Min-Pay-2423 - BLOCK and RECL -XH_SOL"    |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT_LessthanZero_MOB"      |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT_Zero_MOB"              |
      | "Validate NOVA response for 2423 - TOT_DLQ_AMT - NULL_MOB"            |
      | "Validate NOVA response for Min-Pay-2423 - reissu_cd - Blank_MOB"     |
      | "Validate NOVA response for Min-Pay-2423 - reissu_cd - NULL_SOM"      |


  @2423NovaNegativeScenario
  Scenario Outline: 2423_NBA_09 Validate NBA response data elements and structure - Negative Condition

    #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Building Request Body
    * replace requestfile.$ContextType$ = karate.get('$data.ChannelCode')
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

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * method post
  #    Verify Success with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)
      #    It clears Result fields
    * clearResultFields()
#    Validating error response

    * match responseString ==
    """
     { }
    """

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                        |
      | "N-Validate NOVA response for Min-Pay-2423 - Non_PSNL_SOL"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - DNS -Y_MOB"                      |
      | "N-Validate NOVA response for Min-Pay-2423 - Age 17yr_SOM"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - Age 70yr_SOL"                    |
      | "N-Validate NOVA response for Min-Pay-2423 - MRKTBLE_F- N_MOB"                |
      | "N-Validate NOVA response for Min-Pay-2423 - Deceased - Y_SOM"                |
      | "N-Validate NOVA response for Min-Pay-2423 - Language KA_SOL"                 |
      | "N-Validate NOVA response for Min-Pay-2423 - Indv_Brth_Dt -NULL_MOB"          |
      | "N-Validate NOVA response for Min-Pay-2423 - Prod_cd - VLR- SV_SOM"           |
      | "N-Validate NOVA response for Min-Pay-2423 - SUBSYS_ID - BB_SOL"              |
      | "N-Validate NOVA response for Min-Pay-2423 - BLOCK and RECL-AB_MOB"           |
      | "N-Validate NOVA response for Min-Pay-2423 - chrgf_cd - 1_SOM"                |
      | "N-Validate NOVA response for Min-Pay-2423 - chrgf_cd - NULL_SOL"             |
      | "N-Validate NOVA response for Min-Pay-2423 - SRC_ACCT_STAT_CD - 1_MOB"        |
      | "N-Validate NOVA response for Min-Pay-2423 - SRC_ACCT_STAT_CD - NULL_SOM"     |
      | "N-Validate NOVA response for Min-Pay-2423 - CR_CRD_PRTCTN_F - Y_SOL"         |
      | "N-Validate NOVA response for Min-Pay-2423 - CR_CRD_PRTCTN_F - NULL_MOB"      |
      | "N-Validate NOVA response for Min-Pay-2423 - Primary-Holder - N_SOM"          |
      | "N-Validate NOVA response for Min-Pay-2423 - reissu_cd - R_SOL"               |
      | "N-Validate NOVA response for Min-Pay-2423 - acct_rltnp - SUBSYS_ID - BB_MOB" |
      | "N-Validate NOVA response for Min-Pay-2423 - SOL_MOB_Login_Null"              |
      | "N-Validate NOVA response for 2423 - TOT_DLQ_AMT - greaterThanzero_MOB"       |

