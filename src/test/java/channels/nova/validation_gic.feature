Feature:  scenarios specific to NOVA Channel for GIC

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')



    * def gicOIILogic =
    """
    function(StringValue){
    var intValue = parseInt(StringValue);
    var oii = null;
    if(intValue>=1 && intValue<=7){
    oii = 'GDD'
    } else if(intValue>=8 && intValue<=14){
    oii = 'GEE'
    }else if(intValue>=15 && intValue<=22){
    oii = 'GFF'
    }else if(intValue>=23 && intValue<=31){
    oii = 'GGG'
    }
    return oii;
    }
    """



#################################----------------------NOVA---------------###################
#  @GICContextualOfferValidation_NOVA
#  Scenario: Validate GIC Contextual offer response fields inNOVA
#    #    Verifying CID with XML and Conditioned NOVA Sheet
#    * def id_JSON = karate.jsonPath(responseString,"$.cid")
#    * def id_Excel = cid
#    * eval if(id_JSON == id_Excel?printPassedResult('CID',id_JSON):printFailedResult('CID',id_JSON,id_Excel));
#
#    #  Verifying Customer First name with JSON and Database table- EDPEGAT.CUST_DIM
#    * def customerFirstName_JSON = karate.jsonPath(responseString,"$.cust_first_name")
#    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * eval if(customerFirstName_JSON==customerFirstName_Database?printPassedResult('Customer First Name',customerFirstName_JSON):printFailedResult('Customer First Name',customerFirstName_JSON,customerFirstName_Database));
#
#    #  Verifying Customer Last name with JSON and Database table- EDPEGAT.CUST_DIM
#    * def customerLastName_JSON = karate.jsonPath(responseString,"$.cust_last_name")
#    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * eval if(customerLastName_JSON==customerLastName_Database?printPassedResult('Customer Last Name',customerLastName_JSON):printFailedResult('Customer Last Name',customerLastName_JSON,customerLastName_Database));
#
#    #  Verifying Customer Full name with JSON and Database table- EDPEGAT.CUST_DIM
#    * def customerFullName_JSON = karate.jsonPath(responseString,"$.cust_full_name")
#    * def customerTitle_Database = trimString(readValue("SELECT INDV_TTL_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerFirstName_Database = trimString(readValue("SELECT INDV_FRST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerLastName_Database = trimString(readValue("SELECT INDV_LAST_NM FROM "+dbSchema+".CUST_DIM WHERE CIS_CUST_ID ='"+cid+"'"))
#    * def customerFullName_Database = customerTitle_Database + ' ' + customerFirstName_Database+ ' ' + customerLastName_Database
#    * eval if(customerFullName_JSON==customerFullName_Database?printPassedResult('Customer Full Name',customerFullName_JSON):printFailedResult('Customer Full Name',customerFullName_JSON,customerFullName_Database));
#
#    #    Verifying NBA Name with JSON and Proposition sheet
#    * def nbaName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_name")[0]
#    * def nbaName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBAName')
#    * eval if(nbaName_JSON==nbaName_Proposition?printPassedResult('NBA Name',nbaName_JSON):printFailedResult('NBA Name',nbaName_JSON,nbaName_Proposition));
#
#    #    Verifying Offer Condition with JSON and Proposition sheet
#    * def offerCondition_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_condition")[0]
#    * def offerCondition_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCondition')
#    * eval if(offerCondition_JSON==offerCondition_Proposition?printPassedResult('Offer Condition',offerCondition_JSON):printFailedResult('Offer Condition',offerCondition_JSON,offerCondition_Proposition));
#
#  #    Verifying Viewed Status with JSON and Hard Coded
#    * string viewedStatus_Json = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].is_offer_viewed")[0]
#    * def viewedStatus_Excel = karate.get('$data.ResponseCode') == 'VWD' ? 'true' : 'false'
#    * eval if(viewedStatus_Json==viewedStatus_Excel?printPassedResult('Viewed Status',viewedStatus_Json):printFailedResult('Viewed Status',viewedStatus_Json,viewedStatus_Excel));
#
##    Verifying Customer Relevance with JSON and Proposition sheet
#    * def customerRelevance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].cust_relevance")[0]
#    * def customerRelevance_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CUSTOMER_RELEVANCE')
#    * eval if(customerRelevance_JSON==customerRelevance_Proposition?printPassedResult('Customer Relevance',customerRelevance_JSON):printFailedResult('Customer Relevance',customerRelevance_JSON,customerRelevance_Proposition));
#
##  Verifying Offer Start Date  with JSON and Database table EDPEGAT.ACCT_DIM
#    * def offerStartDate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_start_date")[0]
#    * string offerStart_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * string offerStart_Database = dateMinus(offerStart_Database,'28')
#    * eval if(offerStartDate_JSON==offerStart_Database?printPassedResult('Offer Start Date',offerStartDate_JSON):printFailedResult('Offer Start date',offerStartDate_JSON,offerStart_Database));
#
#
#  #  Verifying Offer Expiry Date  with JSON and Database table EDPEGAT.ACCT_DIM
#    * def offerExpiryDate_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_exp_date")[0]
#    * string offerExpiryDate_Database = readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * eval if(offerExpiryDate_JSON==offerExpiryDate_Database?printPassedResult('Offer Expiry Date',offerExpiryDate_JSON):printFailedResult('Offer Expiry date',offerExpiryDate_JSON,offerExpiryDate_Database));
#
#  #  Verifying Current Account Number with JSON and Database table EDPEGAT.ACCT_DIM
#    * def currentAccountNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_number')].data_value")[0]
#    * def currentAccountNumber_Database = readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * eval if(currentAccountNumber_JSON==currentAccountNumber_Database?printPassedResult('Current Account Number',currentAccountNumber_JSON):printFailedResult('Current Account Number',currentAccountNumber_JSON,currentAccountNumber_Database));
#
#
#  #  Verifying Current Account Name with JSON and Database table EDPEGAT.ACCT_DIM
#    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_name')].data_value")[0]
#    * def currentAccountName_HardCoded = 'GIC Maturity'
#    * eval if(currentAccountName_JSON==currentAccountName_HardCoded?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_HardCoded));
#
#  #  Verifying Current Account Maturity Date with JSON and Database table EDPEGAT.ACCT_DIM
#    * def currentAccountName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_account_maturity_date')].data_value")[0]
#    * def currentAccountName_HardCoded = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * eval if(currentAccountName_JSON==currentAccountName_HardCoded?printPassedResult('Current Account Name',currentAccountName_JSON):printFailedResult('Current Account Name',currentAccountName_JSON,currentAccountName_HardCoded));
#
#  #  Verifying Current Balance with JSON and Database table EDPEGAT.ACCT_DIM
#    * def current_balance_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'current_balance')].data_value")[0]
#    * def current_balance_Database = readValue("SELECT MAT_VAL_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * def current_balance_Database = roundNumber(current_balance_Database)
#    * eval if(current_balance_JSON==current_balance_Database?printPassedResult('Current Balance',current_balance_JSON):printFailedResult('Current Balance',current_balance_JSON,current_balance_Database));
#
#  #  Verifying TERM with JSON and Database table EDPEGAT.ACCT_DIM
#    * def term_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'term')].data_value")[0]
#    * def term_Database = readValue("SELECT term_mth FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * eval if(term_JSON==term_Database?printPassedResult('Term',term_JSON):printFailedResult('TERM',term_JSON,term_Database));
#
#  #  Verifying Product Code with JSON and Database table EDPEGAT.ACCT_DIM
#    * def product_code_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'product_code')].data_value")[0]
#    * def product_code_Database = readValue("SELECT ip_prd_cd FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * eval if(product_code_JSON==product_code_Database?printPassedResult('Product Code',product_code_JSON):printFailedResult('Product Code',product_code_JSON,product_code_Database));
#
#  #  Verifying Plan Number with JSON and Database table EDPEGAT.ACCT_DIM
#    * def plan_num_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'plan_num')].data_value")[0]
#    * def plan_num_Database = subString(trimString(readValue("SELECT acct_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),8,23)
#    * eval if(plan_num_JSON==plan_num_Database?printPassedResult('Plan Num',plan_num_JSON):printFailedResult('Product Code',plan_num_JSON,plan_num_Database));
#
#   #  Verifying ownership with JSON and Database table EDPEGAT.ACCT_DIM
#    * def ownership_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_data.[?(@.data_name== 'ownership')].data_value")[0]
#    * def ownership_HardCoded = 'SO'
#    * eval if(ownership_JSON==ownership_HardCoded?printPassedResult('ownership',ownership_JSON):printFailedResult('ownership',ownership_JSON,ownership_HardCoded));
##    Verifying Offer Type with JSON and Proposition sheet
#    * def offerType_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_type")[0]
#    * def offerType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
#    * eval if(offerType_JSON==offerType_Proposition?printPassedResult('Offer Type',offerType_JSON):printFailedResult('Offer Type',offerType_JSON,offerType_Proposition));
#
##    Verifying PY Name with JSON and Proposition sheet
#    * def pyName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_code")[0]
#    * def offerCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferCode')
#    * eval if(pyName_JSON==offerCode_Proposition?printPassedResult('PY Name',pyName_JSON):printFailedResult('PY Name',pyName_JSON,offerCode_Proposition));
#
#     # Verifying OfferDescription with JSON and Proposition sheet
#    * def offerDescription_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_description")[0]
#    * def offerDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
#    * eval if(offerDescription_JSON==offerDescription_Proposition?printPassedResult('Offer Description',offerDescription_JSON):printFailedResult('Offer Description',offerDescription_JSON,offerDescription_Proposition));
#
#    # Verifying Creative Id with JSON and Proposition sheet
#    * def creativeId_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].creative_id")[0]
#    * def creativeId_NOVASheet = karate.get('data.CreativeId')
#    * eval if(creativeId_JSON==creativeId_NOVASheet?printPassedResult('Creative Id',creativeId_JSON):printFailedResult('Creative Id',creativeId_JSON,creativeId_NOVASheet));
#
#     # Verifying NBA Number with JSON and Proposition sheet
#    * def nbaNumber_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].nba_number")[0]
#    * def nbaNumber_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'NBANumber')
#    * eval if(nbaNumber_JSON==nbaNumber_Proposition?printPassedResult('NBA Number',nbaNumber_JSON):printFailedResult('NBA Number',nbaNumber_JSON,nbaNumber_Proposition));
#
#    # Verifying Campaign Code with JSON and Proposition sheet
#    * def campaignCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_code")[0]
#    * def campaignCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignCode')
#    * eval if(campaignCode_JSON==campaignCode_Proposition?printPassedResult('Campaign Code',campaignCode_JSON):printFailedResult('Campaign Code',campaignCode_JSON,campaignCode_Proposition));
#
#    # Verifying Offer Name with JSON and Proposition sheet
#    * def offerName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].offer_name")[0]
#    * def offerName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferShortDescriptionEN')
#    * eval if(offerName_JSON==offerName_Proposition?printPassedResult('Offer Name',offerName_JSON):printFailedResult('Offer Name',offerName_JSON,offerName_Proposition));
#
#     # Verifying Campaign Name with XML and Hard coded
#    * def campaignName_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].campaign_name")[0]
#    * def campaignName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CampaignName')
#    * eval if(campaignName_JSON==campaignName_Proposition?printPassedResult('Campaign Name',campaignName_JSON):printFailedResult('Campaign Name',campaignName_JSON,campaignName_Proposition));
#
#    #    Verifying Primary Product Feature with JSON and Proposition sheet
#    * def primaryProductFeature_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].primary_product_features")[0]
#    * def primaryProductFeature_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductFeaturesEN')
#    * eval if(primaryProductFeature_JSON==primaryProductFeature_Proposition?printPassedResult('Primary Product Feature',primaryProductFeature_JSON):printFailedResult('Primary Product Feature',primaryProductFeature_JSON,primaryProductFeature_Proposition));
#
##  Verifying Response Tracking Code  XML should not be null
#    * def responseTrackingCode_JSON = karate.jsonPath(responseString,"$.offers[?(@.offer_code == '"+offerCode+"')].response_tracking_code")[0]
#    * match responseTrackingCode_JSON == '#notnull'
#
#
##  @GICSpecificElements
#  Scenario Outline: Validate GIC IH response fields in NOVA
#    * string outcome = <outcome>
#    #    Verifying  Lead Start Date - AS400 - with Database and IH
#    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
#    * replace leadStartDate_Database.- = ''
#    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
#    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));
#
##    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
#    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * replace leadEndDate_Database.- = ''
#    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
#    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));
#
#      #  Verifying  Account Number with Database and IH
#    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
#    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
#    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));
#
#          # Verifyind OII with XML and Database
#    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].['OFR_INSTANCE_ID']")[0]
#    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
#    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
#    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
#    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
#    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
#    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
#    * def campaignCode = karate.get('dataCustDim.Campaign')
#    * def ddrRecords = getDDRRecords()
#    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
#    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
#    * match stringLength(offerInstanceId_IH) == 5
#    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));
#
#        #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH
#
#    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
#    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?(@.Outcome=='" + outcome + "' && @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
#    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));
#
#    Examples:
#      | outcome |
#      | "IPT"   |
#      | "PST"   |
#
#  @GICOfferValidationWithIH_NOVA
#  Scenario: Validate GIC offer details with IH
## Zone code is not validating for IPT and PST records - Approval is taken from onsite team
#    #Validates Common elements
#    * call read('classpath:channels/nova/ReusableScenarios.feature@OfferValidationWithIH')
#
#    #Validates elements specific to GIC
#    * call read('classpath:channels/nova/validation_gic.feature@GICIHValidation_NOVA')


#  @GICDispositionOfferValidationWithIH
#
#  Scenario: Validate GIC Disposition offer details with IH in NOVA
#
#    #    Validates Common elements
#    * call read('classpath:channels/nova/ReusableScenarios.feature@DispositionOfferValidationWithIH')
#
#    #  Validates elements specific to GIC
#     #    Verifying  Category with Hard coded (BAU)  and IH
#    * def category_HardCoded = 'Arbitration'
#    * def category_IH = karate.jsonPath(ihRecord, "$.[?(@.['Channel Outcome']=='" + dispositionCode + "')].pyCategory")[0]
#    * eval if(category_HardCoded==category_IH?printPassedResult('Category',category_HardCoded):printFailedResult('Category',category_IH,category_HardCoded));



  @GICCrossChannelDispositionOfferValidationWithIH

  Scenario: Validate GIC Cross Channel Disposition offer details with IH in NOVA

    * call read('classpath:channels/nova/ReusableScenarios.feature@CrossChannelDispositionOfferValidationWithIH')

    * call read('classpath:channels/nova/validation_gic.feature@GICIHValidation_NOVA')


