@ignore
Feature: Re-usable scenarios specific to Outbound Channels


  @CID_Insertion_CUST_DIM_Sheet
  Scenario: write customer CID details in excel CUST_DIM sheet
       # insert the created CID into the AS400 Testdata excel sheet
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

  @CARD_Num_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer Card number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def card_num = cardNumber
# insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",card_num,"CR_CRD_NUM")

  @CR_CRD_LAST_3_DGT_NUM_Insertion_CUST_ACCT_RLTNP_DIM_Sheet
  Scenario: write customer Card number details in excel CUST_ACCT_RLTNP_DIM sheet
    * def subString =
    """
    function(stringValue,startValue,length){
    return stringValue.substring(startValue,length);
    }
    """
    * def card_num_Last3 = subString(cardNumber,13,16)
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM",card_num_Last3,"CR_CRD_LAST_3_DGT_NUM")

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

  @CARD_Num_Insertion_ACCT_DIM_Sheet
  Scenario: write customer Card number details in excel ACCT_DIM sheet
    * def card_num = cardNumber
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",card_num,"CR_CRD_NUM")

      @CR_CRD_LAST_3_DGT_NUM_Insertion_ACCT_DIM_Sheet
  Scenario: write customer Card number details in excel ACCT_DIM sheet
     * def subString =
    """
    function(stringValue,startIndex,endIndex){
    return stringValue.toString().substring(startIndex,endIndex);
    }
    """
    * def card_num_Last3 = subString(cardNumber,13,16)
  # insert the created acct_num into the CUST_ACCT_RLTNP_DIM  excel sheet under ACCT_NUM column
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"ACCT_DIM",card_num_Last3,"CR_CRD_LAST_3_DGT_NUM")

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
  # insert the SOL last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",solLastLoginDate,"SOL_LAST_LOGIN_DT")

  @MOB_LAST_LOGIN_DT_CUST_DIM_Sheet
  Scenario: write customer MOB last login date details in excel ACCT_DIM sheet
 # insert the MOB last login date in to the  CUST_DIM Test data excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_DIM",mobLastLoginDate,"MOB_LAST_LOGIN_DT")

  @CID_Insertion_CUST_ACCT_PREF_Sheet
  Scenario: write customer CID details in excel CUST_ACCT_PREF sheet
#       # insert the created CID into the CUST_ACCT_PREF Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_PREF",karate.get(CID),"CIS_CUST_ID")

  @ACCT_Num_Insertion_CUST_ACCT_PREF_Sheet
  Scenario: write customer Account Number details in excel CUST_ACCT_PREF sheet
#       # insert the created CID into the CUST_ACCT_PREF Testdata excel sheet
    * WritetoExcelFile(testId,testDataLocation,testDataFileName,"CUST_ACCT_PREF",accountNumber,"CIS_CUST_ID")

  @CUST_DIM_Insertion_Database
  Scenario: Insert customer information details in CUST_DIM table
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * string cust_dim_querybuilder = QueryBuilder(dataCustDim,"CUST_DIM")
    * def cust_DimInsrt =  insertRows(cust_dim_querybuilder)
#    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(CID)+"'")
#    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)

  @CUST_ACCT_RLTNP_DIM_Insertion_Database
  Scenario: Insert customer and account details in CUST_ACCT_RLTNP_DIM table
    * def dataCustAcctRltnpDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_ACCT_RLTNP_DIM")
    * string cust_acct_rltnp_querybuilder = QueryBuilder(dataCustAcctRltnpDim,"CUST_ACCT_RLTNP_DIM")
    * def cust_acct_rltnpDimInsrt =  insertRows(cust_acct_rltnp_querybuilder)
#    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(CID)+"' AND ACCT_NUM = '"+acct_num+"'")
#    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)

  @ACCT_DIM_Insertion_Database
  Scenario: Insert customer account details in ACCT_DIM table
    * def acct_num = accountNumber
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * string acct_dim_querybuilder = QueryBuilder(dataAcctDim,"ACCT_DIM")
    * def acct_DimInsrt =  insertRows(acct_dim_querybuilder)
#    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
#    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)

  @reportDbRecords
  Scenario: Report DB records
    * def cust_DimInsrtTableData = readDbRow("Select * from "+dbSchema+".CUST_DIM where CIS_CUST_ID='"+karate.get(cid)+"'")
    * print '******CUST_DIM Database table data******'+karate.pretty(cust_DimInsrtTableData)
    * def acct_DimInsrtTableData = readDbRows("Select * from "+dbSchema+".ACCT_DIM where ACCT_NUM = '"+acct_num+"'")
    * print '******ACCT_DIM Database table data******'+karate.pretty(acct_DimInsrtTableData)
    * def cust_acct_rltnpTableData = readDbRows("Select * from "+dbSchema+".CUST_ACCT_RLTNP_DIM where CIS_CUST_ID='"+karate.get(cid)+"' AND ACCT_NUM = '"+acct_num+"'")
    * print '******CUST_ACCT_RLTNP_DIM Database table data******'+karate.pretty(cust_acct_rltnpTableData)


  @AS400_SOAP_CALL
  Scenario: Generate GET NBA SOAP call for AS400
    #    Building GET NBA Request Body
    * replace requestfile.$ChannelCode$ = karate.get('$data.ChannelCode')
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

    #    Verifying Offer Condition with XML and Proposition sheet
    * def OfferCondition_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferCondition/text()")
    * def OfferCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
    * eval if(OfferCondition_XML==OfferCondition_Proposition?printPassedResult('Offer Condition',OfferCondition_XML):printFailedResult('Offer Condition',OfferCondition_XML,OfferCondition_Proposition));

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

   #    Verifying Declined indicator when Decline disposition is done and compared with XML and hardcoded value
    * def declinedIndicator_XML =  karate.get('$data.ResponseCode') == 'Decline' ? karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::DeclinedIndicator/text()") : null
    * def declinedIndicator_HardCoded = karate.get('$data.ResponseCode') == 'Decline' ? 'true' : null
    * eval if(declinedIndicator_XML==declinedIndicator_HardCoded?printPassedResult('Declined indicator',declinedIndicator_XML):printFailedResult('Declined indicator',declinedIndicator_XML,declinedIndicator_HardCoded));

    #    Verifying Declined Date when Decline disposition is done and compared with XML and today's date
    * def declinedDate_XML =  karate.get('$data.ResponseCode') == 'Decline' ? karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::DeclinedDate/text()") : null
    * def declinedDate_TodaysDate = karate.get('$data.ResponseCode') == 'Decline' ? getDate('yyyy-MM-dd') : null
    * eval if(declinedDate_XML==declinedDate_TodaysDate?printPassedResult('Declined Date',declinedDate_XML):printFailedResult('Declined Date',declinedDate_XML,declinedDate_TodaysDate));

   #    Verifying CustomerRelevance with XML and Proposition sheet
    * def CustomerRelevance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CustomerRelevance/text()")
    * def CustomerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
    * eval if(CustomerRelevance_XML==CustomerRelevance_Proposition?printPassedResult('Customer Relevance',CustomerRelevance_XML):printFailedResult('Customer Relevance',CustomerRelevance_XML,CustomerRelevance_Proposition));

    #    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));


 #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceName/text()")
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    #    Verifying Primary Product Service Sub Code with XML and Proposition sheet
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * def PrimaryProductServiceSubCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceSubCode')
    * eval if(primaryProductServiceSubCode_XML==PrimaryProductServiceSubCode_Proposition?printPassedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML):printFailedResult('Primary Product Service Sub Code',primaryProductServiceSubCode_XML,PrimaryProductServiceSubCode_Proposition));


     #    Verifying PrimaryProductFeatures with XML and Proposition sheet
    * def PrimaryProductFeatures_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductFeatures/text()")
    * def PrimaryProductFeaturesEN_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
    * eval if(PrimaryProductFeatures_XML==PrimaryProductFeaturesEN_Proposition?printPassedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML):printFailedResult('PrimaryProductFeatures',PrimaryProductFeatures_XML,PrimaryProductFeaturesEN_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferDescription/text()")
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));

    #  Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignType/text()")
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    #  Verifying Secondary Holder Name with XML and Database
    * string secondaryCid_DB = readValue("SELECT CC_SCNRY_CUST_ID FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * string secondaryCid_DB = secondaryCid_DB == null ? 'null' : secondaryCid_DB
    * string firstName_DB = readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * string lastName_DB =  readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+secondaryCid_DB+"'")
    * def secondaryHolderName_DB = trimString(secondaryCid_DB == null ? 'null' : (firstName_DB == null ? '' : firstName_DB )+ ' ' +( lastName_DB == '' ? 'null' : lastName_DB))
    * def secondaryHolderName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::SecondaryHolderName/text()")
    * def secondaryHolderName_XML = secondaryHolderName_XML == null ?'null' : secondaryHolderName_XML
    * eval if(secondaryHolderName_XML==secondaryHolderName_DB?printPassedResult('Secondary Holder Name',secondaryHolderName_XML):printFailedResult('Secondary Holder Name',secondaryHolderName_XML,secondaryHolderName_DB));

    #    Need a specific field to verify campaign name against proposition sheet
#     #  Verifying Campaign Name with XML and Proposition sheet
#    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
#    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
#    * eval if(campaignName_XML==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_Proposition));

    #  Verifying Response Tracking Code  XML should not be null
    * def responseTrackingCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ResponseTrackingCode/text()")
    * print 'response tracking code'+responseTrackingCode_XML
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

#    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

#    #    Verifying  Operator with AS400 Excel sheet and IH
#    * def operator_As400Sheet = karate.get('$data.RequestID')
#    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].Operator")[0]
#    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

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

#    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = crossChannel == 'MOB' ? 'MMC,' : 'SMC,'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

#    #    Verifying  Operator with AS400 Excel sheet and IH
#    * def operator_As400Sheet = crossChannel == 'MOB' ? karate.get('$data.RequestID_'+crossChannel) : ""
#    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].Operator")[0]
#    * def operator_IH = crossChannel == 'MOB' ? operator_IH :  ""
#    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

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

#    Verifying  Account Number with Acct DIM sheet Excel (AS400 Input sheet) and IH
    * def dataAcctDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"ACCT_DIM")
    * def accountNumber_acctDimExcelTestData = sliceString(acct_num)
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(accountNumber_acctDimExcelTestData==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,accountNumber_acctDimExcelTestData));

    #    Verifying Zone code with Proposition sheet and IH
    * def zoneCodes_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].ZoneCode")[0]
    * def ZoneCodes_HardCoded = 'CSE'
    * eval if(zoneCodes_IH==ZoneCodes_HardCoded?printPassedResult('Zone Code',zoneCodes_IH):printFailedResult('Zone Code',zoneCodes_IH,ZoneCodes_HardCoded));

  #    Verifying  Treatment ( Creative ID) with AS400 Sheet
    * def creativeId_AS400Sheet = karate.get('data.CreativeId')
    * def creativeId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].pyTreatment")[0]
    * eval if(creativeId_AS400Sheet==creativeId_IH?printPassedResult('Creative ID',creativeId_IH):printFailedResult('Creative ID',creativeId_IH,creativeId_AS400Sheet));

    #    Verifying  Operator with AS400 Excel sheet and IH
#    * def operator_As400Sheet = karate.get('$data.RequestID')
#    * def operator_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].Operator")[0]
#    * eval if(operator_As400Sheet==operator_IH?printPassedResult('Operator',operator_IH):printFailedResult('Operator',operator_IH,operator_As400Sheet));

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
# Need to validate Offer Instance ID
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


  @CLISpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to CLI)
    * string outcome = <outcome>
    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

    #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace referenceNumber_Database.- = ''
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_Database==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_Database));
    Examples:
      | outcome |
      | "IPT"   |
      | "PST"   |


  @CreditorInsuranceSpecificElementsIH
  Scenario Outline: Validate offer details with IH (Specific to creditor insurance)
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

  # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceContextualOfferValidation
  Scenario: Validate Creditor Insurance Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')

    #    Verifying Offer start date with XML and Proposition Sheet
    * def offerStartDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferStartDate/text()")
    * def offerStartDate_Propsition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferStartDate'))
    * eval if(offerStartDate_XML==offerStartDate_Propsition?printPassedResult('Offer start date',offerStartDate_XML):printFailedResult('Offer start date',offerStartDate_XML,offerStartDate_Propsition));

 #    Verifying Offer expiry date with XML and Proposition sheet
    * def offerExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def offerExpiryDate_Proposition = datemonthyearformat(getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferExpireDate'))
    * eval if(offerExpiryDate_XML==offerExpiryDate_Proposition?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate_Proposition));

    # Verifying Campaign Name with XML and Hard coded
    * def campaignName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CampaignName/text()")
    * def campaignName_HardCoded = 'Creditor Insurance'
    * eval if(campaignName_XML==campaignName_HardCoded?printPassedResult('Campaign Name',campaignName_XML):printFailedResult('Campaign Name',campaignName_XML,campaignName_HardCoded));

    #  Verifying Offer Instance Id with XML and Proposition sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def offerCodeValue = ReplaceString(getRequiredDataValueFromCSV(dataCSV,offerCode,'pyName'),"CIE","")
    * def offerInstanceId_Proposition = '0'+offerCodeValue
    * eval if(offerInstanceId_XML==offerInstanceId_Proposition?printPassedResult('Offer Instance Id',offerInstanceId_XML):printFailedResult('Offer Instance Id',offerInstanceId_XML,offerInstanceId_Proposition));
# ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIContextualOfferValidation
  Scenario: Validate CLI Contextual offer response fields
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')

     #    Verifying Offer Start Date with XML and Database table EDPEGAT.ACCT_DIM
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
    * string CurrentCreditLimit_DB = readValue("SELECT CR_CRD_LMT_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * eval if(CurrentCreditLimit_DB==null?CurrentCreditLimit_Database=0:CurrentCreditLimit_Database = CurrentCreditLimit_DB);
    * eval if(CurrentCreditLimit_XML==CurrentCreditLimit_Database?printPassedResult('Current Credit Limit',CurrentCreditLimit_XML):printFailedResult('Current Credit Limit',CurrentCreditLimit_XML,CurrentCreditLimit_Database));

    #    Verifying ApprovedCreditLimit with XML and Database table EDPEGAT.ACCT_DIM
    * def ApprovedCreditLimit_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::ApprovedCreditLimit/text()")
    * string ApprovedCreditLimit_Database = approvedCreditLimitDecimal(readValue("SELECT CLI_APRVD_CR_LMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * match ApprovedCreditLimit_XML == '#notnull'
    * def currentCreditLimit =  parseFloat(CurrentCreditLimit_XML)
    * def approvedCreditLimit =  parseFloat(ApprovedCreditLimit_XML)
    * assert approvedCreditLimit > currentCreditLimit
    * eval if(ApprovedCreditLimit_XML==ApprovedCreditLimit_Database?printPassedResult('Approved Credit Limit',ApprovedCreditLimit_XML):printFailedResult('Approved Credit Limit',ApprovedCreditLimit_XML,ApprovedCreditLimit_Database));

#    Verifying PrimaryProductServiceCode with XML and Database table "+dbSchema+".ACCT_DIM
    * def primaryProductServiceCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceCode/text()")
    * string PrimaryProductServiceCode_Database = trimString(readValue("SELECT SRC_SYS_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Database?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Database));

    #    Verifying PrimaryProductServiceSubCode with XML and Database table EDPEGAT.ACCT_DIM
    * def primaryProductServiceSubCode_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::PrimaryProductServiceSubCode/text()")
    * string primaryProductServiceSubCode_Database = trimString(readValue("SELECT SRC_SYS_SUB_PRD_CD FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(primaryProductServiceSubCode_XML==primaryProductServiceSubCode_Database?printPassedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML):printFailedResult('PrimaryProductServiceSubCode',primaryProductServiceSubCode_XML,primaryProductServiceSubCode_Database));

     #    Verifying Offer instance id with XML and OII_Segmentation sheet
    * def offerInstanceId_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * print 'Offer instance id '+offerInstanceId_XML
    * def offerInstanceId_OIISegmentationPrefix = oiiSegmentationCLI(offerCode,cid,acct_num,testDataLocation,'OII_Segmentation.xlsx','OII')
    * def subString =
    """
    function(stringValue,length){
    return stringValue.substring(0,length);
    }
    """
    * def stringLength =
    """
    function(stringValue){
    return stringValue.length;
    }
    """
    * match stringLength(offerInstanceId_XML) == 5
    * def offerInstanceId_XML = subString(offerInstanceId_XML,3)
    * eval if(offerInstanceId_XML==offerInstanceId_OIISegmentationPrefix?printPassedResult('Offer Instance Id Prefix',offerInstanceId_XML):printFailedResult('Offer Instance Id Prefix',offerInstanceId_XML,offerInstanceId_OIISegmentationPrefix));

######################## End of SOAP Response validation specific to campaigns#######################


  ######################## IH validation specific to campaigns#######################

   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceOfferValidationWithIH
  Scenario: Validate creditor insurance offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@CreditorInsuranceSpecificElementsIH')


  # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIOfferValidationWithIH
  Scenario: Validate CLI offer details with IH
#    Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')
#    Validates elements specific to Creditor Insurance
    * call read('classpath:channels/as400/ReusableScenarios.feature@CLISpecificElementsIH')

    ######################## End of IH validation specific to campaigns#######################

    ######################## Disposition IH validation specific to campaigns#######################

   # ------------------Credit limit Increase - 4479, 4480, 4481 and 4482----------------------
  @CLIDispositionOfferValidationWithIH
  Scenario: Validate CLI disposition offer details with IH
    * call read('classpath:channels/as400/ReusableScenarios.feature@DispositionOfferValidationWithIH')

    #    Verifying  Lead Start Date - AS400 - with current date and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_IH):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_IH):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

 #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace referenceNumber_Database.- = ''
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_Database==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_Database));
   # -------------------------------------Creditor Insurance - 2423--------------------------------------------
  @CreditorInsuranceDispositionOfferValidationWithIH
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

    ######################## End of Disposition IH validation specific to campaigns#######################

######################## Cross channel Disposition IH validation specific to campaigns#######################

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


      #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT CLI_OFR_ST_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

       #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));

      #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
    * string referenceNumber_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace referenceNumber_Database.- = ''
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"' && @.Channel=='"+crossChannel+"')]..REFERENCE_NUM")[0]
    * eval if(referenceNumber_Database==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_Database));

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