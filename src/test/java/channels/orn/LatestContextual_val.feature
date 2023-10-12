Feature: Latest Contextual offer validation feature for NOVA
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
    * def listOfZoneCodes = 'ORN'
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
