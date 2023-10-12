@SOLNBA

Feature: Get NBA Response for SOL channel

  Background:

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/sol/ChannelSOL.txt')
    * def dispositionfile = read('classpath:channels/sol/SetDisposition')

  @MinimumPayment_PriorityCards_Validation @2423 @SOL @RS17103
  Scenario Outline: Minimum Payment_RS17103_2423_SOL Validate Priority-1 receives offer when customer having priority 1 & 3 cards with high credit limit to priority 3 card
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a SOL SOAP call
    * call read('classpath:channels/sol/ReusableScenarios.feature@SOL_SOAP_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on xml request (Post Action)
    * soap action soapAction
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/sol/ReusableScenarios.feature@D2DWelcomeContextualOfferValidation ')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                         |
      | "2423_Priority 1(VLR,RG) card" |

  # SOL Scenario
  @D2DWelcome
  Scenario Outline: D2DWelcome_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  #    Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')


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

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                  |
      | "Validating SOL Response for 4330_0101" |
      | "Validating SOL Response for 4330_0102" |
      | "Validating SOL Response for 4330_0103" |
      | "Validating SOL Response for 4330_0104" |
      | "Validating SOL Response for 4330_0201" |
      | "Validating SOL Response for 4330_0202" |
      | "Validating SOL Response for 4330_0203" |
      | "Validating SOL Response for 4331_1901" |
      | "Validating SOL Response for 4331_1902" |
      | "Validating SOL Response for 4331_1903" |
      | "Validating SOL Response for 4331_1904" |
      | "Validating SOL Response for 4331_1907" |
      | "Validating SOL Response for 4331_1908" |
      | "Validating SOL Response for 4332_1301" |
      | "Validating SOL Response for 4332_1303" |
      | "Validating SOL Response for 4332_1307" |
      | "Validating SOL Response for 4332_1308" |
      | "Validating SOL Response for 4333_1801" |
      | "Validating SOL Response for 4333_1803" |
      | "Validating SOL Response for 4333_1807" |
      | "Validating SOL Response for 4334_0711" |
      | "Validating SOL Response for 4334_0712" |
      | "Validating SOL Response for 4658_2301" |
      | "Validating SOL Response for 4658_2303" |


  @D2DDigital
  Scenario Outline: D2DDigital_NBA_28 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')

     # get the Creative Id from the test Id
    * def creativeId = creativeParse(testId,10)
    * print "CreativeId retreived from the testId is "+creativeId

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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

    * eval if(creativeId_XML==creativeId?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4235_4235121702" |
#      | "Validating SOL Response for 4235_4235121703" |
#      | "Validating SOL Response for 4235_4235121704" |


  @D2DFund
  Scenario Outline: D2DFund_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

     #    Reading testId from Excel SOL sheet
    * string testId = karate.get('$data.TestID')

     # get the Creative Id from the test Id
    * def creativeId = creativeParse(testId,10)
    * print "CreativeId retreived from the testId is "+creativeId

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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

    * eval if(creativeId_XML==creativeId?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4315_4315011801" |
      | "Validating SOL Response for 4315_4315011802" |


  @D2DBillPay
  Scenario Outline: D2DBillPay_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
    * replace offerTitle_XML.– = '-'
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')

    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('Campaign Type',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                          |
      | "Validating SOL Response for 4316_4316041801"   |
      | "Validating SOL Response for 4380_1_4378041801" |
      | "Validating SOL Response for 4380_2_4378041801" |

  @D2DRewards
  Scenario Outline: D2DRewards_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4363_4363041801" |
      | "Validating SOL Response for 4364_4364041801" |
      | "Validating SOL Response for 4366_4366041801" |

  @D2DInteracFlash
  Scenario Outline: D2DInteracFlash_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
    * replace offerTitle_XML.– = '-'
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')

    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4367_4367041801" |

  @D2DVisaDebit
  Scenario Outline: D2DVisaDebit_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
    * replace offerTitle_XML.– = '-'
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')

    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4368_4368041801" |

  @D2DDigitalPayments
  Scenario Outline: D2DDigitalPayments_NBA_37 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
    * replace offerTitle_XML.– = '-'
    * eval if(offerTitle_XML==offerShortDescription_Proposition?printPassedResult('Offer Title',offerTitle_XML):printFailedResult('Offer Title',offerTitle_XML,offerShortDescription_Proposition));


    #    Verifying Creative Id with XML and Proposition sheet
    * def creativeId_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CreativeID/text()')
    * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')

    * eval if(creativeId_XML==creativeId_Proposition?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId_Proposition));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                        |
      | "Validating SOL Response for 4399_4399071801" |
#      | "Validating SOL Response for 4400_4400071801" |
#      | "Validating SOL Response for 4401_4401071801" |

  @D2DXsell
  Scenario Outline: D2DXsell_NBA_2 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

    * string testId = karate.get('$data.TestID')
    * print "testId retreived from example is :" +testId
    * def creativeId = creativeParse(testId,10)

   # Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
   # * def creativeId_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'CreativeID')

    * eval if(creativeId_XML==creativeId?printPassedResult('Creative Id',creativeId_XML):printFailedResult('Creative Id',creativeId_XML,creativeId));

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * replace offerDescription_XML.– = '-'
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0

    Examples:
      | TestID                                                       |
      | "Validating SOL Response for 4891_2301_4891111901"           |
      | "Validating SOL Response for 4891_2301_4891111902"           |
      | "Validating SOL Response for 4891_2301_4891111903"           |
      | "Validating SOL Response for 4891_2301_4891111904"           |
      | "Validating SOL Response for 4891_2303_4891111901"           |
      | "Validating SOL Response for 4891_2303_4891111902"           |
      | "Validating SOL Response for 4891_2303_4891111903"           |
      | "Validating SOL Response for 4891_2303_4891111904"           |
      | "Validating SOL Response for 4891_2301_AXGGC_KS_4891111903"  |
      | "Validating SOL Response for 4891_2301_VFFTR_KS_4891111903"  |
      | "Validating SOL Response for 4891_2301_VCLDM_KS_4891111903"  |
      | "Validating SOL Response for 4891_2301_VLRRG_KS_4891111903"  |
      | "Validating SOL Response for 4891_2303_AXGGC_KS_4891111904"  |
      | "Validating SOL Response for 4891_2303_VFFTR_KS_4891111904"  |
      | "Validating SOL Response for 4891_2303_VCLDM_KS_4891111904"  |
      | "Validating SOL Response for 4891_2303_VLRRG_KS_4891111904"  |
      | "Validating SOL Response for 4892_1301_4892111901"           |
      | "Validating SOL Response for 4892_1301_4892111902"           |
      | "Validating SOL Response for 4892_1301_4892111903"           |
      | "Validating SOL Response for 4892_1301_4892111904"           |
      | "Validating SOL Response for 4892_1301_AXGGC_KS_4892111903"  |
      | "Validating SOL Response for 4892_1301_VFFTR_KS_4892111903"  |
      | "Validating SOL Response for 4892_1301_VCLDM_KS_4892111903"  |
      | "Validating SOL Response for 4892_1301_VLRRG_KS_4892111903"  |
      | "Validating SOL Response for 4892_1301_AXGGC_KS_4892111904"  |
      | "Validating SOL Response for 4892_1301_VFFTR_KS_4892111904"  |
      | "Validating SOL Response for 4892_1301_VCLDM_KS_4892111904"  |
      | "Validating SOL Response for 4892_1301_VLRRG_KS_4892111904"  |
      | "Validating SOL Response for 4893_0101_4893111901"           |
      | "Validating SOL Response for 4893_0101_4893111902"           |
      | "Validating SOL Response for 4893_0102_4893111901"           |
      | "Validating SOL Response for 4893_0102_4893111902"           |
      | "Validating SOL Response for 4893_0103_4893111901"           |
      | "Validating SOL Response for 4893_0103_4893111902"           |
      | "Validating SOL Response for 4893_0104_4893111901"           |
      | "Validating SOL Response for 4893_0104_4893111902"           |
      | "Validating SOL Response for 4893_0201_4893111901"           |
      | "Validating SOL Response for 4893_0201_4893111902"           |
      | "Validating SOL Response for 4893_0202_4893111901"           |
      | "Validating SOL Response for 4893_0202_4893111902"           |
      | "Validating SOL Response for 4893_0203_4893111901"           |
      | "Validating SOL Response for 4893_0203_4893111902"           |
      | "Validating SOL Response for 4893_0101_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0101_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0101_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0101_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4893_0102_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0102_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0102_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0102_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4893_0103_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0103_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0103_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0103_VLRRG_KS_4893111902"  |
      | " Validating SOL Response for 4893_0104_AXGGC_KS_4893111902" |
      | "Validating SOL Response for 4893_0104_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0104_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0104_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4893_0201_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0201_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0201_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0201_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4893_0202_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0202_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0202_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0202_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4893_0203_AXGGC_KS_4893111902"  |
      | "Validating SOL Response for 4893_0203_VFFTR_KS_4893111902"  |
      | "Validating SOL Response for 4893_0203_VCLDM_KS_4893111902"  |
      | "Validating SOL Response for 4893_0203_VLRRG_KS_4893111902"  |
      | "Validating SOL Response for 4894_0711_4894111901"           |
      | "Validating SOL Response for 4894_0712_4894111901"           |


  @MiniPmtInsurance
  Scenario Outline: MinimumPaymentCreditorInsurance_NBA_9 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  #    Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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

      #  Verifying Offer Expiry date with XML and Database table EDPEGAT.ACCT_DIM
    * def offerExpiryDate_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferExpiryDate/text()')
    * def offerExpiryDate = '2021-06-30'
    #* string offerExpiry_Database = trimString(readValue("SELECT CLI_OFR_EXP_DT FROM EDPEGAT.ACCT_DIM WHERE ACCT_NUM ='"+acct_num+"'"))
    * eval if(offerExpiryDate_XML==offerExpiryDate?printPassedResult('Offer Expiry date',offerExpiryDate_XML):printFailedResult('Offer Expiry date',offerExpiryDate_XML,offerExpiryDate));

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

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * print "OfferDescription_XML is " + offerDescription_XML
    * print "OfferDescription_Proposition is " + OfferDescription_Proposition
    * replace offerDescription_XML.’ = "'"
    * print "OfferDescription_Proposition after replacement is " + OfferDescription_Proposition
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));
    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                          |
      | "Validating SOL Response for 2423_VCLNF_SOL"                    |
      | "Validating SOL Response for 2423_VCLSV_MOB"                    |
      | "Validating SOL Response for 2423_VGDNF_SOL"                    |
      | "Validating SOL Response for 2423_VGDRG_MOB"                    |
      | "Validating SOL Response for 2423_VGDSP_SOL"                    |
      | "Validating SOL Response for 2423_VGDST_SOM"                    |
      | "Validating SOL Response for 2423_VLRNF_SOL"                    |
      | "Validating SOL Response for 2423_VLRRG_MOB"                    |
      | "Validating SOL Response for 2423_VCLSS_SOM"                    |
      | "Validating SOL Response for 2423_VCLZZ_SOL"                    |
      | "Validating SOL Response for 2423_VCLRG_MOB"                    |
      | "Validating SOL Response for 2423_VCLST_SOL"                    |
      | "Validating SOL Response for 2423_VCLDM_MOB"                    |
      | "Validating SOL Response for 2423_AXSSC_SOM"                    |
      | "Validating SOL Response for 2423_AXSSS_SOL"                    |
      | "Validating SOL Response for 2423_AXGGC_MOB"                    |
      | "Validating SOL Response for 2423_AXGGS_SOM"                    |
      | "Validating SOL Response for 2423_VLRRC_SOM"                    |
      | "Validating SOL Response for 2423_VFFTR_SOL"                    |
      | "Validating SOL Response for 2423_VFFTS_MOB"                    |
      | "Validate SOL response for 2423 - 18yrs_SOL"                    |
      | "Validate SOL response for 2423 - 40yrs_MOB"                    |
      | "Validate SOL response for 2423 - 69yrs_SOM"                    |
      | "Validate SOL response for 2423 - E_SOL"                        |
      | "Validate SOL response for 2423 - EN_MOB"                       |
      | "Validate SOL response for 2423 - F_SOM"                        |
      | "Validate SOL response for 2423 - FR_SOL"                       |
      | "Validate SOL response for 2423 - BLOCK and RECL-Blank_SOL"     |
      | "Validate SOL response for 2423 - BLOCK and RECL - NULL_MOB"    |
      | "Validate SOL response for 2423 - BLOCK and RECL - C_SOL"       |
      | "Validate SOL response for 2423 - BLOCK and RECL -XH_MOB"       |
      | "Validate SOL response for2423 - reissu_cd - Blank_SOL"         |
      | "Validate SOL response for 2423 - reissu_cd - NULL_MOB"         |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT_LessthanZero_MOB" |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT_Zero_MOB"         |
      | "Validate SOL response for 2423 - TOT_DLQ_AMT - NULL_MOB"       |




  # Negative Scenario's for Minimum Payment 2423
  @2423_NegativeScenario
  Scenario Outline: Minimumpayment_NBA_9 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid


 #    Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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
      | TestID                                                    |
#      | "N-Validate SOL response for 2423 - Non_PSNL_SOL"                      |
#      | "N-Validate SOL response for 2423 - DNS -Y_MOB"                        |
#      | "N-Validate SOL response for 2423 - Age 17yr_SOM"                      |
#      | "N-Validate SOL response for 2423 - Age 70yr_SOL"                      |
#      | "N-Validate SOL response for 2423 - MRKTBLE_F- N_SOM"                  |
#      | "N-Validate SOL response for 2423 - Deceased - Y_SOL"                  |
#      | "N-Validate SOL response for 2423 - Language KA_MOB"                   |
#      | "N-Validate SOL response for 2423 - Indv_Brth_Dt -NULL_SOL"            |
#      | "N-Validate SOL response for 2423 - Prod_cd - VLR- SV_MOB"             |
#      | "N-Validate SOL response for 2423 - SUBSYS_ID - BB_SOM"                |
#      | "N-Validate SOL response for 2423 - BLOCK and RECL-AB_MOB"             |
#      | "N-Validate SOL response for 2423 - chrgf_cd - 1_SOM"                  |
#      | "N-Validate SOL response for 2423 - chrgf_cd - NULL_SOL"               |
#      | "N-Validate SOL response for 2423 - SRC_ACCT_STAT_CD - 1_MOB"          |
#      | "N-Validate SOL response for 2423 - SRC_ACCT_STAT_CD - NULL_SOM"       |
#      | "N-Validate SOL response for 2423 - CR_CRD_PRTCTN_F - Y_SOL"           |
#      | "N-Validate SOL response for 2423 - CR_CRD_PRTCTN_F - NULL_MOB"        |
#      | "N-Validate SOL response for 2423 - Primary-Holder - N_SOM"            |
#      | "N-Validate SOL response for 2423 - reissu_cd - R_SOL"                 |
#      | "N-Validate SOL response for 2423 - acct_rltnp - SUBSYS_ID - BB_MOB"   |
      | "N-Validate SOL response for 2423 - SOL_MOB_Login - NULL" |
#      | "N-Validate SOL response for 2423 - TOT_DLQ_AMT - greaterThanzero_MOB" |

  @PAD
  Scenario Outline: PAD_NBA_39 Validate getNBA response data elements and structure
  #    Reading data from Excel sheet
    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('$data.NBACode')

  #    Building Request Body
    * replace requestfile.$ChannelCode = karate.get('$data.ChannelCode')
    * replace requestfile.$ContextType = karate.get('$data.ContextType')
    * replace requestfile.$ContextValue = karate.get('$data.ContextValue')
    * replace requestfile.$ID = karate.get('$data.ID')
    * replace requestfile.$IDType = karate.get('$data.IDType')
    * replace requestfile.$LanguageCode = karate.get('$data.LanguageCode')
    * replace requestfile.$LeadScope = karate.get('$data.LeadScope')
    * replace requestfile.$RequestID = karate.get('$data.RequestID')
    * replace requestfile.$Additional1 = karate.get('$data.Additional1')
    * replace requestfile.$Additional2 = karate.get('$data.Additional2')

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

    #    Verifying CampaignType with XML and Proposition sheet
    * def campaignType_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::CampaignType/text()')
    * def campaignType_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferType')
    * eval if(campaignType_XML==campaignType_Proposition?printPassedResult('CampaignType',campaignType_XML):printFailedResult('Campaign Type',campaignType_XML,campaignType_Proposition));

#    Verifying PrimaryProductServiceCode with XML and Proposition sheet
    * def primaryProductServiceCode_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceCode/text()')
    * def PrimaryProductServiceCode_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PS_CD')
    * eval if(primaryProductServiceCode_XML==PrimaryProductServiceCode_Proposition?printPassedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML):printFailedResult('PrimaryProductServiceCode',primaryProductServiceCode_XML,PrimaryProductServiceCode_Proposition));

  #    Verifying PrimaryProductServiceName with XML and Proposition sheet
    * def primaryProductServiceName_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::PrimaryProductServiceName/text()')
    * def PrimaryProductServiceName_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'PrimaryProductServiceNameEN')
    * eval if(primaryProductServiceName_XML==PrimaryProductServiceName_Proposition?printPassedResult('PrimaryProductServiceName',primaryProductServiceName_XML):printFailedResult('PrimaryProductServiceName',primaryProductServiceName_XML,PrimaryProductServiceName_Proposition));

    # Verifying OfferDescription with XML and Proposition sheet
    * def offerDescription_XML = karate.get('//Offers/NBACode[contains(text(),'+offerCode+') ]/following-sibling::OfferDescription/text()')
    * def OfferDescription_Proposition = getRequiredDataValueFromCSV(dataCSV,offerCode,'OfferLongDescriptionEN')
    * eval if(offerDescription_XML==OfferDescription_Proposition?printPassedResult('Offer Description',offerDescription_XML):printFailedResult('Offer Description',offerDescription_XML,OfferDescription_Proposition));


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                  |
      | "Validating SOL Response for 2496_0101" |
      | "Validating SOL Response for 2496_0102" |
      | "Validating SOL Response for 2496_0103" |
      | "Validating SOL Response for 2496_0104" |
      | "Validating SOL Response for 2496_0201" |
      | "Validating SOL Response for 2496_0202" |
      | "Validating SOL Response for 2496_0203" |
      | "Validating SOL Response for 2496_1901" |
      | "Validating SOL Response for 2496_1902" |
      | "Validating SOL Response for 2496_1903" |
      | "Validating SOL Response for 2496_1904" |
      | "Validating SOL Response for 2496_1907" |
      | "Validating SOL Response for 2496_1908" |
      | "Validating SOL Response for 2496_1301" |
      | "Validating SOL Response for 2496_1303" |
      | "Validating SOL Response for 2496_1307" |
      | "Validating SOL Response for 2496_1308" |
      | "Validating SOL Response for 2496_1801" |
      | "Validating SOL Response for 2496_1803" |
      | "Validating SOL Response for 2496_1807" |
      | "Validating SOL Response for 2496_0711" |
      | "Validating SOL Response for 2496_0712" |



