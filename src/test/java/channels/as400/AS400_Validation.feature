@AS400NBA

Feature: Get NBA Response

  Background:

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/as400/Channel AS400.txt')
  # AS400 Scenario
#  @4479
#  Scenario Outline: 4479_ NBA_10 Validate getNBA response data elements and structure
#  #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,<TestDataLocation>,<TestDataFileName>,<TestDataSheetName>)
#  #   Calling API with URL
#    * url getRequiredDataValueFromHashMap(data,'URL')
#  #    Building Request Body
#    * def requestfile = ReadFile(getRequiredDataValueFromHashMap(data,'RequestFileLocation'))
#    * def requestfile = ReplaceString(requestfile,"$ChannelCode",getRequiredDataValueFromHashMap(data,'ChannelCode'))
#    * def requestfile = ReplaceString(requestfile,"$ContextType",getRequiredDataValueFromHashMap(data,'ContextType'))
#    * def requestfile = ReplaceString(requestfile,"$ContextValue",getRequiredDataValueFromHashMap(data,'ContextValue'))
#    * def requestfile = ReplaceString(requestfile,"$ID",getRequiredDataValueFromHashMap(data,'ID'))
#    * def requestfile = ReplaceString(requestfile,"$IDType",getRequiredDataValueFromHashMap(data,'IDType'))
#    * def requestfile = ReplaceString(requestfile,"$LanguageCode",getRequiredDataValueFromHashMap(data,'LanguageCode'))
#    * def requestfile = ReplaceString(requestfile,"$LeadScope",getRequiredDataValueFromHashMap(data,'LeadScope'))
#    * def requestfile = ReplaceString(requestfile,"$RequestID",getRequiredDataValueFromHashMap(data,'RequestID'))
#    * def requestfile = ReplaceString(requestfile,"$ContextType_Additional",getRequiredDataValueFromHashMap(data,'ContextType_Additional'))
#    * def requestfile = ReplaceString(requestfile,"$ContextValue_Additional",getRequiredDataValueFromHashMap(data,'ContextValue_Additional'))
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#  #    Passing Headers for the API
#    * header Content-Type = 'text/xml'
#    * header Username = 'sprint1user'
#    * header Password = 'RULES'
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action "urn:PegaRULES:SOAP:NBAData:Services#GetNBA"
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = getRequiredDataValueFromHashMap(data,'NBACode')
#  # Get CID from Test data sheet
#    * def cid = getRequiredDataValueFromHashMap(data,'ID')
#
#  #   Reading Proposition File based on Campaign Number
#    * def dataProposition = ReadValueFromCSV(offerCode,<TestDataLocation>,<PropositionFileName>,<PropositionSheetName>)
#
#  #    It clears Result fields
#    * clearResultFields()
#
#  # It verifies pre-staged or contextual offer based on OfferInstanceID
#    * def prestagedOrContextual_XML = karate.get('//Offers/NBACode[text()='"+offerCode+"']]/following-sibling::OfferInstanceID/text()')
#
#  #    Verifying NBA Category with XML and Proposition sheet
#    * def nbaCategory_XML = karate.get('//Offers/NBACode[text()='"+offerCode+"']]/preceding-sibling::NBACategory/text()')
#    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBACategory')
#    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));
#
#  #    Verifying NBA Code with XML and Proposition sheet
#    * def nbaCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/text()')
#    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferCode')
#    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));
#
#  #    Verifying NBA Name with XML and Proposition sheet
#    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
#    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBAName')
#    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));
#
#  #    Verifying NBA Number with XML and Proposition sheet
#    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
#    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBANumber')
#    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));
#
#  #    Verifying NBA Type with XML and Proposition sheet
#    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
#    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBAType')
#    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));
#
#  #    Verifying Offer Title with XML and Proposition sheet
#    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
#    * def offerLongDescription_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferShortDescriptionEN')
#    * eval if(offerTitle_XML==offerLongDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerLongDescription_Proposition));
#
#  #    Verifying Creative Id with XML and Proposition sheet
#    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
#    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataProposition,'CreativeID')
#    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));
#
#    * def subString =
#    """
#    function(stringValue,length){
#    return stringValue.substr(0,length);
#    }
#    """
#  #  Verifying Offer Start date with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
#         #  ---Retrieving account number from customer relationshipt table.-----#
##    Pre-staged leads table(campaign specific text) and contextual accountdim
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));
#
#      #  Verifying Offer Expiry date with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    #    Pre-staged leads table(campaign specific text) and contextual accountdim
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));
#
#        #    Verifying Offer Condition with XML and Proposition sheet
#    * def offerCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
#    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferCondition')
#    * eval if(offerCondition_XML==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_XML):printFailedResult('Offer Condition',offerCondition_XML,offerCondition_Proposition));
#
#  #  Verifying Current Account Number with XML and Database table-  (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
#    * def sliceString =
#    """
#    function(stringValue){
#    return stringValue.slice(stringValue.length - 13);
#    }
#    """
##    Javascript function for prestaged parseing of campaign specific text
#    * def currentAccountNumber_Database = eval(prestagedOrContextual_XML == null ? sliceString(trimString(readValue("SELECT ACCT_NUM FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))):trimString(readValue("SELECT CMPGN_SPEC_TEXT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"'")))
#    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));
#
#  #  Verifying Current Credit Limit with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def currentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
##     Add validation for current credit limt contextural - account dim else leads table campaign specific text
#
#
#
##     validations for approved credit limit- not null, greater than current credit limit
#    * def approvedCreditLimitDecimal =
#    """
#    function(decimalValue){
#       return parseFloat(decimalValue).toFixed(2);
#    }
#    """
#
#    * def approvedCreditLimit_XML = approvedCreditLimitDecimal(karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()'))
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * def approvedCreditLimit_Database = trimString(approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'")))
#    * eval if(approvedCreditLimit_XML==approvedCreditLimit_Database?printPassedResult('Approved Credit Limit',approvedCreditLimit_XML):printFailedResult('Approved Credit Limit',approvedCreditLimit_XML,approvedCreditLimit_Database));
#  # PA Indictor valiation need to get added for prestaged campaign specific text Leads table for contextual need to get info -validation if prestaged it should not be null
#
#  #  Verifying Lead Id with XML and Database table- (EDPEGAT.LEADS)
##    it is not campaign specific text for lead id it is SAS_LEAD_ID
#    * def leadId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::LeadID/text()')
#    * def leadId_Database = eval(prestagedOrContextual_XML == null ? null : trimString(readValue("SELECT CMPGN_SPEC_TEXT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"'")))
#    * eval if(prestagedOrContextual_XML == null ? (leadId_Database == null ? printPassedResult('LeadId','--Not Going to validate for Contextual Offers--'): printFailedResult('LeadId','null',leadId_Database)):(leadId_XML == leadId_Database ?  printPassedResult('LeadId',leadId_XML): printFailedResult('LeadId',leadId_XML,leadId_Database)));
#
#  #    Verifying Customer Relevance with XML and Proposition sheet
#    * def customerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
#    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataProposition,'CUSTOMER_RELEVANCE')
#    * eval if(customerRelevance_XML==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_XML):printFailedResult('Customer Relevance',customerRelevance_XML,customerRelevance_Proposition));
#
#    #  Verifying Primary Product Service Code with XML and Database table (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
##    prestaged leads campaign specific text leads
#    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
#    #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(primaryProductServiceCode_XML==primaryProductServiceCode_Database?printPassedResult('Primary Product Service Code',primaryProductServiceCode_XML):printFailedResult('Primary Product Service Code',primaryProductServiceCode_XML,primaryProductServiceCode_Database));
#
#  #  Verifying Primary Product Service Subcode with XML and Database table (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    #    prestaged leads campaign specific text leads
#    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));
#
#  #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
#    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
#    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_XML+' - '+primaryProductServiceSubCode_XML,<TestDataLocation>,"CLI_ProductFamily_Name.xlsx","Accounts")
#    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
#    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));
#
#  #    Verifying Primary Product Feature with XML and Proposition sheet
#    * def primaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
#    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataProposition,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeatures_XML==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature',primaryProductFeatures_XML):printFailedResult('Primary Product Feature',primaryProductFeatures_XML,primaryProductFeatures_Proposition));
## validate primaryProductServiceName from proposition sheet with column name PrimaryProductServiceNameEN
#  #    Verifying Offer Description with XML and Proposition sheet
#    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
#    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferLongDescriptionEN')
#    * eval if(offerDescription_XML==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,offerDescription_Proposition));
#
#  #    Verifying campaign Type with XML and Proposition sheet
#    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
#    * def offerType_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferType')
#    * eval if(campaignType_XML==offerType_Proposition?printPassedResult('Campaign Type',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,offerType_Proposition));
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#    Examples:
#      | TestID                               | TestDataLocation          | TestDataFileName      | TestDataSheetName | PropositionFileName | PropositionSheetName |
#      | "Validating AS400 Response for 4479" | "/src/test/java/testdata" | "AS400_TestData.xlsx" | "AS400"           | "Proposition.csv"   | "Proposition"        |

#  @4480
#  Scenario Outline: 4480_ NBA_10 Validate getNBA response data elements and structure
#  #    Reading data from Excel sheet
#    * def data = ReadValueFromTestData("TestID",<TestID>,<TestDataLocation>,<TestDataFileName>,<TestDataSheetName>)
#  #   Calling API with URL
#    * url getRequiredDataValueFromHashMap(data,'URL')
#  #    Building Request Body
#    * def requestfile = ReadFile(getRequiredDataValueFromHashMap(data,'RequestFileLocation'))
#    * def requestfile = ReplaceString(requestfile,"$ChannelCode",getRequiredDataValueFromHashMap(data,'ChannelCode'))
#    * def requestfile = ReplaceString(requestfile,"$ContextType",getRequiredDataValueFromHashMap(data,'ContextType'))
#    * def requestfile = ReplaceString(requestfile,"$ContextValue",getRequiredDataValueFromHashMap(data,'ContextValue'))
#    * def requestfile = ReplaceString(requestfile,"$ID",getRequiredDataValueFromHashMap(data,'ID'))
#    * def requestfile = ReplaceString(requestfile,"$IDType",getRequiredDataValueFromHashMap(data,'IDType'))
#    * def requestfile = ReplaceString(requestfile,"$LanguageCode",getRequiredDataValueFromHashMap(data,'LanguageCode'))
#    * def requestfile = ReplaceString(requestfile,"$LeadScope",getRequiredDataValueFromHashMap(data,'LeadScope'))
#    * def requestfile = ReplaceString(requestfile,"$RequestID",getRequiredDataValueFromHashMap(data,'RequestID'))
#    * def requestfile = ReplaceString(requestfile,"$ContextType_Additional",getRequiredDataValueFromHashMap(data,'ContextType_Additional'))
#    * def requestfile = ReplaceString(requestfile,"$ContextValue_Additional",getRequiredDataValueFromHashMap(data,'ContextValue_Additional'))
#
#  #    Printing request body in console
#    * print '*********Request**********'+requestfile
#  #    Passing Headers for the API
#    * header Content-Type = 'text/xml'
#    * header Username = 'sprint1user'
#    * header Password = 'RULES'
#  #    request (Karate keyword) for sending request string
#    * request requestfile
#  #    Performing action on xml request (Post Action)
#    * soap action "urn:PegaRULES:SOAP:NBAData:Services#GetNBA"
#  #    Verifying Sucess with status code 200
#    * status 200
#    * def responseString = response
#  #    Printing response body in console
#    * print '***************Response*************'+karate.pretty(responseString)
#
#  #    Defining which NBA Code to test (Retriving from excel sheet)
#    * def offerCode = getRequiredDataValueFromHashMap(data,'NBACode')
#  # Get CID from Test data sheet
#    * def cid = getRequiredDataValueFromHashMap(data,'ID')
#
#  #   Reading Proposition File based on Campaign Number
#    * def dataProposition = ReadValueFromCSV(offerCode,<TestDataLocation>,<PropositionFileName>,<PropositionSheetName>)
#
#  #    It clears Result fields
#    * clearResultFields()
#
#  # It verifies pre-staged or contextual offer based on OfferInstanceID
#    * def prestagedOrContextual_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferInstanceID/text()')
#    * print 'Check whether prestaged or contextual'+prestagedOrContextual_XML
#
#  #    Verifying NBA Category with XML and Proposition sheet
#    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
#    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBACategory')
#    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));
#
#  #    Verifying NBA Code with XML and Proposition sheet
#    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
#    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferCode')
#    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));
#
#  #    Verifying NBA Name with XML and Proposition sheet
#    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
#    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBAName')
#    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));
#
#  #    Verifying NBA Number with XML and Proposition sheet
#    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
#    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBANumber')
#    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));
#
#  #    Verifying NBA Type with XML and Proposition sheet
#    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
#    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataProposition,'NBAType')
#    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));
#
#  #    Verifying Offer Title with XML and Proposition sheet
#    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
#    * def offerLongDescription_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferShortDescriptionEN')
#    * eval if(offerTitle_XML==offerLongDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerLongDescription_Proposition));
#
#  #    Verifying Creative Id with XML and Proposition sheet
#    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
#    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataProposition,'CreativeID')
#    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));
#
#    * def subString =
#    """
#    function(stringValue,length){
#    return stringValue.substr(0,length);
#    }
#    """
#  #  Verifying Offer Start date with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
#         #  ---Retrieving account number from customer relationshipt table.-----#
##    Pre-staged leads table(campaign specific text) and contextual accountdim
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));
#
#      #  Verifying Offer Expiry date with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    #    Pre-staged leads table(campaign specific text) and contextual accountdim
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));
#
#        #    Verifying Offer Condition with XML and Proposition sheet
#    * def offerCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
#    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferCondition')
#    * eval if(offerCondition_XML==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_XML):printFailedResult('Offer Condition',offerCondition_XML,offerCondition_Proposition));
#
#  #  Verifying Current Account Number with XML and Database table-  (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
#    * def sliceString =
#    """
#    function(stringValue){
#    return stringValue.slice(stringValue.length - 13);
#    }
#    """
##    Javascript function for prestaged parseing of campaign specific text
#    * def currentAccountNumber_Database = eval(prestagedOrContextual_XML == null ? sliceString(trimString(readValue("SELECT ACCT_NUM FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))):trimString(readValue("SELECT CMPGN_SPEC_TEXT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"'")))
#    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));
#
#  #  Verifying Current Credit Limit with XML and Database table- (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    * def currentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
##     Add validation for current credit limt contextural - account dim else leads table campaign specific text
#
#
#
##     validations for approved credit limit- not null, greater than current credit limit
#    * def approvedCreditLimitDecimal =
#    """
#    function(decimalValue){
#       return parseFloat(decimalValue).toFixed(2);
#    }
#    """
#
#    * def approvedCreditLimit_XML = approvedCreditLimitDecimal(karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()'))
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * def approvedCreditLimit_Database = trimString(approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'")))
#    * eval if(approvedCreditLimit_XML==approvedCreditLimit_Database?printPassedResult('Approved Credit Limit',approvedCreditLimit_XML):printFailedResult('Approved Credit Limit',approvedCreditLimit_XML,approvedCreditLimit_Database));
#  # PA Indictor valiation need to get added for prestaged campaign specific text Leads table for contextual need to get info -validation if prestaged it should not be null
#
#  #  Verifying Lead Id with XML and Database table- (EDPEGAT.LEADS)
##    it is not campaign specific text for lead id it is SAS_LEAD_ID
#    * def leadId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::LeadID/text()')
#    * def leadId_Database = eval(prestagedOrContextual_XML == null ? null : trimString(readValue("SELECT CMPGN_SPEC_TEXT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"'")))
#    * eval if(prestagedOrContextual_XML == null ? (leadId_Database == null ? printPassedResult('LeadId','--Not Going to validate for Contextual Offers--'): printFailedResult('LeadId','null',leadId_Database)):(leadId_XML == leadId_Database ?  printPassedResult('LeadId',leadId_XML): printFailedResult('LeadId',leadId_XML,leadId_Database)));
#
#  #    Verifying Customer Relevance with XML and Proposition sheet
#    * def customerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
#    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataProposition,'CUSTOMER_RELEVANCE')
#    * eval if(customerRelevance_XML==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_XML):printFailedResult('Customer Relevance',customerRelevance_XML,customerRelevance_Proposition));
#
#    #  Verifying Primary Product Service Code with XML and Database table (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
##    prestaged leads campaign specific text leads
#    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
#    #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(primaryProductServiceCode_XML==primaryProductServiceCode_Database?printPassedResult('Primary Product Service Code',primaryProductServiceCode_XML):printFailedResult('Primary Product Service Code',primaryProductServiceCode_XML,primaryProductServiceCode_Database));
#
#  #  Verifying Primary Product Service Subcode with XML and Database table (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
#    #    prestaged leads campaign specific text leads
#    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
#        #  ---Retrieving account number from customer relationshipt table.-----#
#    * string accountNumber_ACCT_NUMTable = readValue("SELECT ACCT_NUM FROM EDPEGAT.CUST_ACCT_RLTNP_DIM WHERE CIS_CUST_ID ='"+cid+"'")
#    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+accountNumber_ACCT_NUMTable+"'"))
#    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));
#
#  #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
#    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
#    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_XML+' - '+primaryProductServiceSubCode_XML,<TestDataLocation>,"CLI_ProductFamily_Name.xlsx","Accounts")
#    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
#    * print 'Printing currentAccountName from Excel'+currentAccountName_MappingSheet
#    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));
#
#  #    Verifying Primary Product Feature with XML and Proposition sheet
#    * def primaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
#    * def primaryProductFeatures_Proposition = getRequiredDataValueFromCSV(dataProposition,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeatures_XML==primaryProductFeatures_Proposition?printPassedResult('Primary Product Feature',primaryProductFeatures_XML):printFailedResult('Primary Product Feature',primaryProductFeatures_XML,primaryProductFeatures_Proposition));
## validate primaryProductServiceName from proposition sheet with column name PrimaryProductServiceNameEN
#  #    Verifying Offer Description with XML and Proposition sheet
#    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
#    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferLongDescriptionEN')
#    * eval if(offerDescription_XML==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,offerDescription_Proposition));
#
#  #    Verifying campaign Type with XML and Proposition sheet
#    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
#    * def offerType_Proposition = getRequiredDataValueFromCSV(dataProposition,'OfferType')
#    * eval if(campaignType_XML==offerType_Proposition?printPassedResult('Campaign Type',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,offerType_Proposition));
#
#    * print getPassedResults()
#    * def failedResults = getFailedResults()
#    * print failedResults
#    * assert getLength(failedResults) == 0
#
#    Examples:
#      | TestID                               | TestDataLocation          | TestDataFileName      | TestDataSheetName | PropositionFileName | PropositionSheetName |
#      | "Validating AS400 Response for 4480" | "/src/test/java/testdata" | "AS400_TestData.xlsx" | "AS400"           | "Proposition.csv"   | "Proposition"        |

  @4479OnlyContextual
  Scenario Outline: 4479_ NBA_10 Validate getNBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
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
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

    #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

    #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PAIndicator/text()')
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));


    #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
    * string CurrentCreditLimit_DB = readValue("SELECT CR_CRD_LMT_AMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * print "Current Credit Limit is " + CurrentCreditLimit_Database
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));


    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()')
    * string ApprovedCreditLimit_Database = approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * print "Current Credit Limit is " + ApprovedCreditLimit_Database
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));


    #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.’ = "'"
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));



    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4479" |


  @4480OnlyContextual
  Scenario Outline: 4480_ NBA_10 Validate getNBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
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
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

    #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

    #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PAIndicator/text()')
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));


    #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
    * string CurrentCreditLimit_DB = readValue("SELECT CR_CRD_LMT_AMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * print "Current Credit Limit is " + CurrentCreditLimit_Database
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));


    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()')
    * string ApprovedCreditLimit_Database = approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * print "Current Credit Limit is " + ApprovedCreditLimit_Database
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));


    #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.’ = "'"
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));



    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4480" |


  @4481OnlyContextual
  Scenario Outline: 4481_ NBA_10 Validate getNBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
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
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

    #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

    #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PAIndicator/text()')
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));


    #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
    * string CurrentCreditLimit_DB = readValue("SELECT CR_CRD_LMT_AMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * print "Current Credit Limit is " + CurrentCreditLimit_Database
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));


    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()')
    * string ApprovedCreditLimit_Database = approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * print "Current Credit Limit is " + ApprovedCreditLimit_Database
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));


    #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.’ = "'"
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    #    Verifying Secondary Holder Name with XML and Database table EDPEGAT.ACCT_DIM
    * def SecondaryHolderName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::SecondaryHolderName/text()')
    * string SecondaryHolderName_Database = trimString(readValue("SELECT CC_SCNRY_CUST_ID FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(SecondaryHolderName_XML==SecondaryHolderName_Database?printPassedResult('SecondaryHolderName',SecondaryHolderName_XML):printFailedResult('SecondaryHolderName',SecondaryHolderName_XML,SecondaryHolderName_Database));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4481" |


  @4482OnlyContextual
  Scenario Outline: 4482_ NBA_10 Validate getNBA response data elements and structure

  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
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
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));

    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
    * string offerStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

    #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

    #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

   #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

    #    Verifying PAIndicator with XML and hardcoded value
    * def PAIndicator_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PAIndicator/text()')
    * def PAIndicator_Proposition = 'PA'
    * eval if(PAIndicator_XML==PAIndicator_Proposition?printPassedResult('PA Indicator',PAIndicator_XML):printFailedResult('PA Indicator',PAIndicator_XML,PAIndicator_Proposition));


    #    Verifying CurrentCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
    * string CurrentCreditLimit_DB = readValue("SELECT CR_CRD_LMT_AMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * print "Current Credit Limit is " + CurrentCreditLimit_Database
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));


    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::ApprovedCreditLimit/text()')
    * string ApprovedCreditLimit_Database = approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * print "Current Credit Limit is " + ApprovedCreditLimit_Database
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));


    #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.’ = "'"
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    #    Verifying Secondary Holder Name with XML and Database table EDPEGAT.ACCT_DIM
    * def SecondaryHolderName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::SecondaryHolderName/text()')
    * string SecondaryHolderName_Database = trimString(readValue("SELECT CC_SCNRY_CUST_ID FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(SecondaryHolderName_XML==SecondaryHolderName_Database?printPassedResult('SecondaryHolderName',SecondaryHolderName_XML):printFailedResult('SecondaryHolderName',SecondaryHolderName_XML,SecondaryHolderName_Database));



    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                             |
      | "Validate AS400 Response for 4482" |


# AS400 Scenario-
#--------------------------------------- Pre-Staged-----------------------------------------------------------------
  @5016
  Scenario Outline: 5016_ NBA_20 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  # Get CID from Test data sheet
    * def cid = karate.get('$data.ID')

  #    Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
  #    Printing request body in console
    * print '*********Request**********'+requestfile

     #    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

  #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

  #    Verifying Pre-staged with XML and Proposition sheet
    * def prestaged_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::Prestaged/text()')
    * def prestaged_Proposition = karate.lowerCase(getRequiredDataValueFromCSV(dataCSV,offerCode,'Prestaged'))
    * eval if(prestaged_XML==prestaged_Proposition?printPassedResult('Pre-Staged',prestaged_XML):printFailedResult('Pre-Staged',prestaged_XML,prestaged_Proposition));

  #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerLongDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerLongDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerLongDescription_Proposition));

  #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    * def dateFormat =
    """
    function(stringValue){
    return stringValue.substring(0,4)+"-"+stringValue.substring(4,6)+"-"+stringValue.substring(6,8);
    }
    """

  #  Verifying Offer Start date with XML and Database table- as it is prestaged we have to check -EDPEGAT.LEADS table- WAVE_CMPGN_ST_DT column
    * def offerStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
         #  ---Prestaged Retrieving account number from customer leads table table.- WAVE_CMPGN_ST_DT column-----#
    * string offerStartDate_Database = dateFormat(trimString(readValue("SELECT WAVE_CMPGN_ST_DT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"' AND OFR_CD ='"+offerCode+"'")))
    * eval if(offerStartDate_XML==offerStartDate_Database?printPassedResult('Offer Start date',offerStartDate_XML):printFailedResult('Offer Start date',offerStartDate_XML,offerStartDate_Database));

      #  Verifying Offer Expiry date with XML and Database table- as it is prestaged we have to check -EDPEGAT.LEADS table- WAVE_CMPGN_END_DT column
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
        #  ---Prestaged Retrieving account number from customer leads table table.- WAVE_CMPGN_END_DT column-----#
    * string offerExpiry_Database = dateFormat(trimString(readValue("SELECT WAVE_CMPGN_END_DT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"' AND OFR_CD ='"+offerCode+"'")))
    * eval if(offerExpiryDate_XML==offerExpiry_Database?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiry_Database));

 #    Verifying Offer Condition with XML and Proposition sheet
    * def offerCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(offerCondition_XML==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_XML):printFailedResult('Offer Condition',offerCondition_XML,offerCondition_Proposition));

  #  Retriving campaign specific text column value from leads database
    * def campaignSpecifecText_Database = readValue("SELECT CMPGN_SPEC_TEXT FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"' AND OFR_CD ='"+offerCode+"'")

#  #  Verifying Current Account Name with XML Leads Table campaign Specific text
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def currentAccountName_Database = trimString(subString(campaignSpecifecText_Database, 0, 35))
    * eval if(currentAccountName_XML==currentAccountName_Database?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_Database));

#  Verifying Current Account Number with XML and Database table-  (EDPEGAT.LEADS if Prestaged offer and EDPEGAT.ACCT_DIM if contextual offer)
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
  #    Javascript function for prestaged parsing of campaign specific text
    * def currentAccountNumber_Database = trimString(subString(campaignSpecifecText_Database, 35, 51))
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));

#  Verifying Current Credit Limit with XML and Database table- (EDPEGAT.LEADS-Campaign specific text if Prestaged offer)
    * def currentCreditLimit_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentCreditLimit/text()')
#    Javascript function for prestaged parsing of campaign specific text
    * def currentCreditLimit_Database = trimString(subString(campaignSpecifecText_Database, 161, 176))
    * eval if(currentCreditLimit_XML==currentCreditLimit_Database?printPassedResult('Current Credit Limit',currentCreditLimit_XML):printFailedResult('Current Credit Limit',currentCreditLimit_XML,currentCreditLimit_Database));

 #  Verifying Current Balance with XML and Database table- (if Prestaged offer EDPEGAT.LEADS Campaign specific text )
    * def currentBalance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentBalance/text()')
#    Javascript function for prestaged parsing of campaign specific text
    * def currentBalance_Database = trimString(subString(campaignSpecifecText_Database, 176, 191))
    * eval if(currentBalance_XML==currentBalance_Database?printPassedResult('Current Balance',currentBalance_XML):printFailedResult('Current Balance',currentBalance_XML,currentBalance_Database));

#  Verifying BT Fee with XML and Database table- (EDPEGAT.LEADS-Campaign specific text if Prestaged offer)
    * def btFee_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::BTFee/text()')
#    Javascript function for prestaged parsing of campaign specific text
    * def btFee_Database = trimString(subString(campaignSpecifecText_Database, 131, 146))
    * eval if(btFee_XML==btFee_Database?printPassedResult('BT Fee',btFee_XML):printFailedResult('BT Fee',btFee_XML,btFee_Database));

  #  Verifying Promo code with XML and Database table- (EDPEGAT.LEADS-Campaign specific text if Prestaged offer)
    * def promoCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PromoCode/text()')
#    Javascript function for prestaged parsing of campaign specific text
    * def promoCode_Database = trimString(subString(campaignSpecifecText_Database, 146, 161))
    * eval if(promoCode_XML==promoCode_Database?printPassedResult('Promo Code',promoCode_XML):printFailedResult('Promo Code',promoCode_XML,promoCode_Database));

    #  Verifying ALP TLP Indicator with XML and Database table- (EDPEGAT.LEADS-Campaign specific text if Prestaged offer)
    * def alpTlpIndicator_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::AlpTlpIndicator/text()')
#    Javascript function for prestaged parsing of campaign specific text
    * def alpTlpIndicator_Database = trimString(subString(campaignSpecifecText_Database, 191, 192))
    * eval if(alpTlpIndicator_XML==alpTlpIndicator_Database?printPassedResult('ALP TLP Indicator',alpTlpIndicator_XML):printFailedResult('ALP TLP Indicator',alpTlpIndicator_XML,alpTlpIndicator_Database));

  #    Verifying Customer Relevance with XML and Proposition sheet
    * def customerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(customerRelevance_XML==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_XML):printFailedResult('Customer Relevance',customerRelevance_XML,customerRelevance_Proposition));

#    Verifying Primary Product Service Sub code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * def primaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Proposition));

  #    Verifying Primary Product Service Name with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def primaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==primaryProductServiceName_Proposition?printPassedResult('Primary Product Service Name',primaryProductServiceName_XML):printFailedResult('Primary Product Service Name',primaryProductServiceName_XML,primaryProductServiceName_Proposition));

    #    Verifying Primary Product Service Code with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def primaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==primaryProductServiceCode_Proposition?printPassedResult('Primary Product Service Code',primaryProductServiceCode_XML):printFailedResult('Primary Product Service Code',primaryProductServiceCode_XML,primaryProductServiceCode_Proposition));

# validate offer Description with XML to proposition sheet
  #    Verifying Offer Description with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,offerDescription_Proposition));

  #    Verifying campaign Type with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==offerType_Proposition?printPassedResult('Campaign Type',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,offerType_Proposition));

  #  Verifying Campaign Name with XML and Database table- (EDPEGAT.LEADS- CMPGN_NM)
    * def campaignName_XML = trimString(karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignName/text()'))
    * def campaignName_Database = trimString(readValue("SELECT CMPGN_NM FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"' AND OFR_CD ='"+offerCode+"'"))
    * eval if(campaignName_XML == campaignName_Database?printPassedResult('Campaign Name',campaignName_XML): printFailedResult('Campaign Name',campaignName_XML,campaignName_Database));

  #  Verifying Offer Instance ID with XML and Database table- (EDPEGAT.LEADS- OFFER_INSTANCE_ID)
    * def offerInstance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferInstanceID/text()')
    * def offerInstance_Database = trimString(readValue("SELECT OFFER_INSTANCE_ID FROM EDPEGAT.LEADS WHERE CIS_CUST_ID ='"+cid+"' AND OFR_CD ='"+offerCode+"'"))
    * eval if(offerInstance_XML == offerInstance_Database?printPassedResult('Offer Instance',offerInstance_XML): printFailedResult('Offer Instance',offerInstance_XML,offerInstance_Database));

  #  Verifying Secondary Holder Name with XML Leads Table campaign Specific text
    * def secondaryHolderName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::SecondaryHolderName/text()')
    * def secondaryHolderName_Database = trimString(subString(campaignSpecifecText_Database, 51, 131))
    * eval if(secondaryHolderName_XML==null?secondaryHolderName_Database==""+printPassedResult('Secondary Holder Name','null'):secondaryHolderName_XML==secondaryHolderName_Database?printPassedResult('Secondary Holder Name',secondaryHolderName_XML):printFailedResult('Secondary Holder Name',secondaryHolderName_XML,secondaryHolderName_Database));

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                               |
      | "Validating AS400 Response for 5016" |


    # AS400 scenario for contextual campaign 2423
  @2423AS400
  Scenario Outline: Minimumpayment_NBA_9 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
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
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()



  #    Verifying NBA Category with XML and Proposition sheet
    * def nbaCategory_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/preceding-sibling::NBACategory/text()')
    * def nbaCategory_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBACategory')
    * eval if(nbaCategory_XML==nbaCategory_Proposition?printPassedResult('NBA Category',nbaCategory_XML):printFailedResult('NBA Category',nbaCategory_XML,nbaCategory_Proposition));

  #    Verifying NBA Code with XML and Proposition sheet
    * def nbaCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/text()')
    * def nbaCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
    * eval if(nbaCode_XML==nbaCode_Proposition?printPassedResult('NBA Code',nbaCode_XML):printFailedResult('NBA Code',nbaCode_XML,nbaCode_Proposition));

  #    Verifying NBA Name with XML and Proposition sheet
    * def nbaName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAName/text()')
    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
    * eval if(nbaName_XML==nbaName_Proposition?printPassedResult('NBA Name',nbaName_XML):printFailedResult('NBA Name',nbaName_XML,nbaName_Proposition));

  #    Verifying NBA Number with XML and Proposition sheet
    * def nbaNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBANumber/text()')
    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
    * eval if(nbaNumber_XML==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_XML):printFailedResult('NBA Number',nbaNumber_XML,nbaNumber_Proposition));

    #    Verifying NBA Type with XML and Proposition sheet
    * def nbaType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::NBAType/text()')
    * def nbaType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAType')
    * eval if(nbaType_XML==nbaType_Proposition?printPassedResult('NBA Type',nbaType_XML):printFailedResult('NBA Type',nbaType_XML,nbaType_Proposition));

    #    Verifying Offer Title with XML and Proposition sheet
    * def offerTitle_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferTitle/text()')
    * def offerShortDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')
    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

     #    Verifying Offer Start Date with XML and Proposition sheet
    * def OfferStartDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferStartDate/text()')
    * def OfferStartDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferStartDate'))
    * eval if(OfferStartDate_XML==OfferStartDate_Proposition?printPassedResult('Offer Start Date',OfferStartDate_XML):printFailedResult('Offer Start Date',OfferStartDate_XML,OfferStartDate_Proposition));

      #    Verifying Offer Expiry Date with XML and Proposition sheet
    * def OfferExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * def OfferExpireDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(OfferExpiryDate_XML==OfferExpireDate_Proposition?printPassedResult('Offer Expiry Date',OfferExpiryDate_XML):printFailedResult('Offer Expiry Date',OfferExpiryDate_XML,OfferExpireDate_Proposition));

     #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferCondition/text()')
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));


    #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CustomerRelevance/text()')
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

    #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying PrimaryProductServiceSubCode with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceSubCode/text()')
    * def primaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Proposition?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Proposition));

    #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductFeatures/text()')
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.’ = "'"
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

    #    Verifying CampaignName with XML and Proposition sheet
    * def CampaignName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignName/text()')
    * def CampaignName_Proposition = 'Creditor Insurance NBA'
    * eval if(CampaignName_XML==CampaignName_Proposition?printPassedResult('Campaign Name',CampaignName_XML):printFailedResult('Campaign Name',CampaignName_XML,CampaignName_Proposition));

    #    Verifying Offer Instance ID with XML and hardcoded value
    * def OfferInstanceID_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferInstanceID/text()')
    * def OfferInstanceID_Proposition = '02423'
    * eval if(OfferInstanceID_XML==OfferInstanceID_Proposition?printPassedResult('Offer Instance ID',OfferInstanceID_XML):printFailedResult('Offer Instance ID',OfferInstanceID_XML,OfferInstanceID_Proposition));


    #  Verifying Current Account Number with XML and Database table EDPEGAT.ACCT_DIM
    * def currentAccountNumber_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountNumber/text()')
    * def currentAccountNumber_Database = sliceString(acct_num)
    * eval if(currentAccountNumber_XML==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_XML):printFailedResult('Current Account',currentAccountNumber_XML,currentAccountNumber_Database));


#    #  Verifying Current Account Name with XML and Mapping excel(CLI Product Family.xlsx) base on Primary Primary Product Service Code and Sub code
    * def currentAccountName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CurrentAccountName/text()')
    * def primaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def cliProductFamily = ReadValueFromTestData("ProductCodeSubProductCode",primaryProductServiceCode_Database+' - '+primaryProductServiceSubCode_Database,testDataLocation,"CLI_ProductFamily_Name.xlsx","Accounts")
    * def currentAccountName_MappingSheet = getRequiredDataValueFromHashMap(cliProductFamily,'ProductFamily')+' '+getRequiredDataValueFromHashMap(cliProductFamily,'ProductName')
    * eval if(currentAccountName_XML==currentAccountName_MappingSheet?printPassedResult('Current Account Name',currentAccountName_XML):printFailedResult('Current Account Name',currentAccountName_XML,currentAccountName_MappingSheet));

    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0



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
  @2423_AS400NegativeScenario
  Scenario Outline: Minimumpayment_NBA_9 Validate getNBA response data elements and structure - Negative Scenario
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')
    * print  "Offer code to verify is "+offerCode

  #    Building Request Body

    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType$ = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue$ = karate.get('$data.ContextValue')
    * replace requestfile.$ID$ = karate.get('$data.ID')
    * replace requestfile.$IDType$ = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode$ = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope$ = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID$ = karate.get('$data.RequestID')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.pretty(responseString)

      #    It clears Result fields
    * clearResultFields()

#    Validating error response

    * match responseString ==
    """
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
  <ns1:GetNBAResponse xmlns:ns1="urn:PegaRULES:SOAP:NBAData:Services">
  <Errors></Errors>
  </ns1:GetNBAResponse>
  </soap:Body>
  </soap:Envelope>
"""


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                     |
      | "N-Validate AS400 response for Min-Pay-2423 - MRKTBLE_F- N"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Deceased - Y"                |
      | "N-Validate AS400 response for Min-Pay-2423 - Non_PSNL"                    |
      | "N-Validate AS400 response for Min-Pay-2423 - DNS -Y"                      |
      | "N-Validate AS400 response for Min-Pay-2423 - Age 17yr"                    |
      | "N-Validate AS400 response for Min-Pay-2423 - Age 70yr"                    |
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

  Scenario: Validate AS400 response for minimum payment 2423 of age 40yrs_Type-1
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
  Scenario: Validate AS400 response for minimum payment 2423 of age 40yrs_Type-2
    Given generate a CID and condition in CIM3 database as per eligibility criteria
    When insert data in to cust_dim, acct_dim and cust_acct_rltnp_dim tables
    Then validate offer minimum payment 2423 is returned


    # Eligibility criteria, database quries and SOAP request is attached
  Scenario Outline: Validate AS400 response for minimum payment__Type-3
    Given generate a CID and condition in CIM3 database as per eligibility criteria
    When insert data in to cust_dim, acct_dim and cust_acct_rltnp_dim tables
    Then validate offer minimum payment 2423 is returned
    Examples:
      | Testcases                                                  |
      | Validate SOL response for 2423 - 40yrs_SOL                 |
      | Validate SOL response for 2423 - 69yrs_SOL                 |
      | Validate SOL response for 2423 - BLOCK and RECL - C_SOL    |
      | Validate SOL response for 2423 - BLOCK and RECL - NULL_SOL |
