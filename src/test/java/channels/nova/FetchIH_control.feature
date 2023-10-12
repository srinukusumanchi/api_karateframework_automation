Feature: Fetch IH rows feature for IMT for NOVA
 @fetchIHRows
 Scenario: Fetch activity rows recorded in IH
 #    Fetch offer activity records from IH
  * json ihRecord = getIhRecords(cid)
  * print '**** IH Offer Records***'+karate.pretty(ihRecord)

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

 #    Verifying Group with Proposition and IH* def group_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'pyGroup')
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


  @IMTSpecificIHValidation
  Scenario Outline:: Validate IMT offer details with IH
  * string outcome = <outcome>
     # Verifying cell group in IH against NOVA sheet
  * call read('classpath:channels/nova/FetchIH_control@OfferValidationWithIH')

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

