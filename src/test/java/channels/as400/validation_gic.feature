Feature:  scenarios specific to AS400 Channel for GIC

  Background:

  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')


    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")),5,7)
    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")),0,4)
    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
    * def campaignCode = karate.get('dataCustDim.Campaign')
    * def ddrRecords = getDDRRecords()


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

  @GICContextualOfferValidation_AS400
  Scenario: Validate GIC Contextual offer response fields in AS400
    * call read('classpath:channels/as400/ReusableScenarios.feature@ContextualOfferValidation')
#########-----------------AS400-----------------------#########################
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

##  Verifying Current Offer Expiry Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferExpiryDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferExpiryDate/text()")
    * def OfferExpiryDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * eval if(OfferExpiryDate_XML==OfferExpiryDate_Database?printPassedResult('OfferExpiryDate',OfferExpiryDate_XML):printFailedResult('OfferExpiryDate',OfferExpiryDate_XML,OfferExpiryDate_Database));

  #  Verifying CurrentAccountName  with XML and hardcoded value
    * def CurrentAccountName_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountName/text()")
    * def CurrentAccountName_HardCoded =  'GIC Maturity'
    * eval if(CurrentAccountName_XML==CurrentAccountName_HardCoded?printPassedResult('CurrentAccountName',CurrentAccountName_XML):printFailedResult('CurrentAccountName',CurrentAccountName_XML,CurrentAccountName_HardCoded));

##  Verifying Current Account Maturity Date  with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentAccountMaturityDate_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentAccountMaturityDate/text()")
    * def CurrentAccountMaturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * replace CurrentAccountMaturityDate_Database.- = '/'
    * eval if(CurrentAccountMaturityDate_XML==CurrentAccountMaturityDate_Database?printPassedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML):printFailedResult('CurrentAccountMaturityDate',CurrentAccountMaturityDate_XML,CurrentAccountMaturityDate_Database));


#  #  Verifying Current Balance with XML and Database table EDPEGAT.ACCT_DIM
    * def CurrentBalance_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::CurrentBalance/text()")
    * def CurrentBalance_Database = readValue("SELECT MAT_VAL_AMT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * def CurrentBalance_Database = roundNumber(CurrentBalance_Database)
    * eval if(CurrentBalance_XML==CurrentBalance_Database?printPassedResult('CurrentBalance',CurrentBalance_XML):printFailedResult('CurrentBalance',CurrentBalance_XML,CurrentBalance_Database));

#   #  Verifying plan_number with XML and Database table EDPEGAT.ACCT_DIM
    * def plan_number_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::plan_number/text()")
    * def plan_number_Database = subString(trimString(readValue("SELECT acct_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")),8,23)
    * eval if(plan_number_XML==plan_number_Database?printPassedResult('plan_number',plan_number_XML):printFailedResult('plan_number',plan_number_XML,plan_number_Database));

#   #  Verifying term_month with XML and Database table EDPEGAT.ACCT_DIM
    * def term_month_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::term_month/text()")
    * def term_month_Database = readValue("SELECT TERM_MTH FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * eval if(term_month_XML==term_month_Database?printPassedResult('term_month',term_month_XML):printFailedResult('term_month',term_month_XML,term_month_Database));




#  #   #  Verifying OII with XML and Database table EDPEGAT.ACCT_DIM
    * def OfferInstanceID_XML = karate.get("//Offers/NBACode[text()='"+offerCode+"']/following-sibling::OfferInstanceID/text()")
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"' AND ACCT_CRFC_NUM='"+crfcNumber+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
#    * def month = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),5,7)
#    * def year = subString(trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")),0,4)
#    * def dataCustDim = ReadValueFromTestData("TestID",testId,testDataLocation,testDataFileName,"CUST_DIM")
#    * def campaignCode = karate.get('dataCustDim.Campaign')
#    * def ddrRecords = getDDRRecords()
    * def campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def offerInstanceIdSegmentationDDR = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(OfferInstanceID_XML) == 5
    * eval if(OfferInstanceID_XML==offerInstanceIdSegmentationDDR?printPassedResult('Offer Instance Id',OfferInstanceID_XML):printFailedResult('Offer Instance Id',OfferInstanceID_XML,offerInstanceIdSegmentationDDR));


  @GICIHValidation_AS400
  Scenario: Validate GIC IH response fields in AS400
#    * string outcome = <outcome>
    #    Verifying  Lead Start Date - AS400 - with Database and IH
    * string leadStartDate_Database = trimString(readValue("SELECT mat_dt FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * string leadStartDate_Database = dateMinus(leadStartDate_Database,'28')
    * replace leadStartDate_Database.- = ''
    * def leadStartDate_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Lead Start Date']")[0]
    * eval if(leadStartDate_Database==leadStartDate_IH?printPassedResult('Lead Start Date',leadStartDate_Database):printFailedResult('Lead Start Date',leadStartDate_IH,leadStartDate_Database));

#    #    Verifying  Lead End Date + Persistance days - AS400 - with current date and IH
    * string leadEndDate_Database = trimString(readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * replace leadEndDate_Database.- = ''
    * def leadEndDate_IH = karate.jsonPath(ihRecord, "$.[?(@.['Proposition name']=='"+offerCode+"')].['Lead End Date']")[0]
    * eval if(leadEndDate_Database==leadEndDate_IH?printPassedResult('Lead End Date',leadEndDate_Database):printFailedResult('Lead End Date',leadEndDate_IH,leadEndDate_Database));


  #  Verifying  Account Number with Database and IH
    * string Acct_Num = trimString(readValue("SELECT acct_crfc_num FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * def accountNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].['Account Number']")[0]
    * eval if(Acct_Num==accountNumber_IH?printPassedResult('Account Number',accountNumber_IH):printFailedResult('Account Number',accountNumber_IH,Acct_Num));


          # Verifyind OII with XML and Database

    * def offerInstanceId_IH = karate.jsonPath(ihRecord, "$.[?(@.['Proposition name']=='"+offerCode+"')].['OFR_INSTANCE_ID']")[0]
    * def maturityDate_Database = readValue("SELECT MAT_DT FROM "+dbSchema+".ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'")
    * def maturityDate_Database = parseInt(subString(maturityDate_Database,8,10))
    * def OfferInstanceID_Database = gicOIILogic(maturityDate_Database)
    * string campaignWaveNumber = getCampaignWaveNumber(ddrRecords,month,year,campaignCode,'cc_file')
    * def OII_SEGMENTATION = OfferInstanceID_Database + campaignWaveNumber
    * match stringLength(offerInstanceId_IH) == 5
    * eval if(offerInstanceId_IH==OII_SEGMENTATION?printPassedResult('Offer Instance Id',offerInstanceId_IH):printFailedResult('Offer Instance Id',offerInstanceId_IH,OII_SEGMENTATION));

        #    Verifying  Reference Number with Hard coded(CLI) value concatenated with Approved Credit Limit and IH

    * string referenceNumber_DDR = getExpiryFromDDR(ddrRecords,month,year,campaignCode,'cc_file')
    * def referenceNumber_IH = karate.jsonPath(ihRecord, "$.[?( @.['Proposition name']=='"+offerCode+"')].REFERENCE_NUM")[0]
    * eval if(referenceNumber_DDR==referenceNumber_IH?printPassedResult('Reference Number',referenceNumber_IH):printFailedResult('Reference Number',referenceNumber_IH,referenceNumber_DDR));


  @GICOfferValidationWithIH
  Scenario: Validate GIC offer details with IH

   #  Validates elements specific to GIC  Renewal
    * call read('classpath:channels/as400/validation_gic.feature@GICSpecificElements')

   #  Validates Common elements
    * call read('classpath:channels/as400/ReusableScenarios.feature@OfferValidationWithIH')


