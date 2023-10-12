@ignore
@report=false
Feature: Inline JS Utils

  Scenario:
    * def ReadValueFromTestData =
      """
      function(uniqueColumnName,testID, testDataLocation, testDataFileName, testDataSheetName){

        var read = Java.type('feature.utilities.ReadFromExcel');
        var readDataFromTestData = new read();
        return read.readFromExcel(uniqueColumnName,testID, testDataLocation, testDataFileName, testDataSheetName);
      }
      """
    * def WritetoExcelFile =
    """
    function(testID,testDatalocation,testDataFileName,testDataSheetname,cid,colname)
    {
        var write = Java.type('feature.utilities.StringUtilities');
        var writeDatatoTestData = new write();
        return writeDatatoTestData.writeToExcel(testID,testDatalocation,testDataFileName,testDataSheetname,cid,colname);
    }
    """
    * def ReadValueFromCSV =
      """
      function(testID, testDataLocation, testDataFileName, testDataSheetName){

        var read = Java.type('feature.utilities.ReadFromExcel');
        var readDataFromTestData = new read();
        return readDataFromTestData.readCSVFile(testID, testDataLocation, testDataFileName, testDataSheetName);
      }
      """

    * def readValue =
    """
    function(databaseQuery){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.readValue(databaseQuery);
    }

    """

    * def readDbRow =
    """
    function(databaseQuery){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.readRow(databaseQuery);
    }

    """

    * def readDbRows =
    """
    function(databaseQuery){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.readRows(databaseQuery);
    }

    """

    * def QueryBuilder =
    """
    function(databaseSheetRow_HashMap,sheetName){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.queryBuilder(databaseSheetRow_HashMap,sheetName);
    }
    """

    * def QueryBuilderForPurlCust =
    """
  function(databaseSheetRow_HashMap,sheetName){
  var dataBase = Java.type('feature.utilities.DataBaseData');
  var dataBaseData = new dataBase();
  return dataBaseData.queryBuilderPurlCust(databaseSheetRow_HashMap,sheetName);
  }
    """

    * def QueryBuilderForCustInsights =
    """
  function(databaseSheetRow_HashMap,sheetName){
  var dataBase = Java.type('feature.utilities.DataBaseData');
  var dataBaseData = new dataBase();
  return dataBaseData.queryBuilderPurlCust(databaseSheetRow_HashMap,sheetName);
  }
    """

    * def QueryBuilderForExternalInput =
    """
  function(databaseSheetRow_HashMap,sheetName){
  var dataBase = Java.type('feature.utilities.DataBaseData');
  var dataBaseData = new dataBase();
  return dataBaseData.queryBuilderPurlCust(databaseSheetRow_HashMap,sheetName);
  }
    """

    * def QueryBuilderUpdate =
    """
    function(databaseSheetRow_HashMap,sheetName){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.queryBuilderUpdate(databaseSheetRow_HashMap,sheetName);
    }

    """

    * def insertRows =
    """
    function(databaseQuery){
    var dataBase = Java.type('feature.utilities.DataBaseData');
    var dataBaseData = new dataBase();
    return dataBaseData.insertRows(databaseQuery);
    }

    """

    * def ReplaceString =
		"""
		function(sOriginal,sReplaceFrom,sReplaceTo) {
		karate.log("Before replacement",sOriginal);
		karate.log("After replacement",sOriginal.replace(sReplaceFrom, sReplaceTo));
		return sOriginal.replace(sReplaceFrom, sReplaceTo);
		}
		"""
    * def ReplaceSpecialCharacter =
		"""
		function(sOriginal,sReplaceFrom,sReplaceTo) {

		var stringObject = Java.type('feature.utilities.StringUtilities');
        var stringReplace = new stringObject();
        return stringReplace.removeSpecialCharacters(sOriginal,sReplaceFrom,sReplaceTo);
		}
		"""

    * def PurlAlphaNumeric =
		"""
		function(number) {
		var alphaNumberic = Java.type('feature.utilities.StringUtilities');
        var alphaNumericdigits = new alphaNumberic();
        return alphaNumericdigits.getAlphaNumericString(number);
		}
		"""
    * def generateHashKey =
		"""
		function() {

		var genHashKey = Java.type('feature.utilities.StringUtilities');
        var hashKeyObj = new genHashKey();
        return hashKeyObj.generateHashKey();
		}
		"""

    * def genLastSeqUsed =
		"""
		function() {
		var generateLastSeqUsed = Java.type('feature.utilities.DataBaseData');
        var lastSeqUse = new generateLastSeqUsed();
        return lastSeqUse.lastSeqUsed();
		}
		"""

    * def genLastSeqUsedAcc2 =
		"""
		function() {
		var generateLastSeqUsedAcc2 = Java.type('feature.utilities.DataBaseData');
        var lastSeqUseAcc2 = new generateLastSeqUsedAcc2();
        return lastSeqUseAcc2.genLastSeqUsedAcc2();
		}
		"""

    * def genLastSeqUsedAcc3 =
		"""
		function() {
		var generateLastSeqUsedAcc3 = Java.type('feature.utilities.DataBaseData');
        var lastSeqUseAcc3 = new generateLastSeqUsedAcc3();
        return lastSeqUseAcc3.genLastSeqUsedAcc3();
		}
		"""

    * def genLastSeqUsedAcc4 =
		"""
		function() {
		var generateLastSeqUsedAcc4 = Java.type('feature.utilities.DataBaseData');
        var lastSeqUseAcc4 = new generateLastSeqUsedAcc4();
        return lastSeqUseAcc4.genLastSeqUsedAcc4();
		}
		"""

    * def ReadFile =
      """
      function(fileName) {
        karate.log(fileName);
        var readFile = Java.type('feature.utilities.ReadFile');
        var reader = new readFile();
        return reader.readFileAsString(fileName);
      }
      """

    * def getRequiredDataValueFromHashMap =
      """
      function(data, requiredValue){
        var read = Java.type('feature.utilities.ReadFromExcel');
        var readDatValueFromHashMap = new read();
        return readDatValueFromHashMap.readRequiredValueFromHashMap(data, requiredValue);
      }
      """

    * def getRequiredDataValueFromCSV =
      """
      function(dataCSV, offerCode, requiredValue){
      return karate.get('$dataCSV.['+indexOf(karate.get('$dataCSV.[*].pyName'),offerCode)+'].'+requiredValue);
      }
      """
    * def getRequiredDataValueFromJSON =
       """
      function(jsonResponse, offerCode, requiredValue){
      return karate.get(jsonResponse+'.[*].['+indexOf(karate.get('$jsonResponse.[*].pyName'),offerCode)+'].'+requiredValue);
      }
      """
    * def subtract =
       """
      function(number1,number2){
      var a = number1;
      var b = number2;
      var c = number1-number2;
      return c;
      }
      """

    * def printPassedResult =
      """
      function(field,value) {
      var pojo = Java.type('feature.utilities.PrintResult');
      var pojoHandler = new pojo();
      return pojoHandler.printResult(field,value);
      }
      """

    * def printFailedResult =
      """
      function(field,value,data) {
      var pojo = Java.type('feature.utilities.PrintResult');
      var pojoHandler = new pojo();
      return pojoHandler.printFailedResult(field,value,data);
      }
      """

    * def writeDateWithTimeStamp =
    """
    function() {
    var updTimeStamp = Java.type('feature.utilities.StringUtilities')
    var curUpdTimeStamp = new updTimeStamp();
    return  curUpdTimeStamp.currValUpdateTimestamp();
    }
    """

    * def printFailMessage =
    """
      function(message) {
      var pojo = Java.type('feature.utilities.PrintResult');
      var pojoHandler = new pojo();
      return pojoHandler.printFailMessage(message);
      }
    """

    * def printPassMessage =
    """
      function(message) {
      var pojo = Java.type('feature.utilities.PrintResult');
      var pojoHandler = new pojo();
      return pojoHandler.printPassMessage(message);
      }
    """

    * def getPassedResults =
    """
    function() {
    var PassedResults = Java.type('feature.utilities.PrintResult');
    var results = new PassedResults();
    return results.getPassedFields();
    }
    """

    * def getFailedResults =
    """
    function() {
    var FailedResults = Java.type('feature.utilities.PrintResult');
    var results = new FailedResults();
    return results.getFailedResults();
    }
    """

    * def clearResultFields =
    """
    function(){
      var Clear = Java.type('feature.utilities.PrintResult');
      var clear = new Clear();
      return clear.clearFields();
    }
    """

    * def getLength =
    """
      function(failedFields){
        var Length = Java.type('feature.utilities.PrintResult');
        var length = new Length();
        return length.getLength(failedFields);
      }
    """

    * def trimString =
    """
    function(stringValue){
    return stringValue.trim();
    }
    """

    * def indexOf =
    """
    function(arrayValue, searchFor){
    var i;
    for(i = 0; i<arrayValue.length; i++){
    if(arrayValue[i]==searchFor){
    break;
    }
    }
    return i;
    }
    """
    * def randGen =
    """
    function(digits){
    var digitsCount = parseInt(digits)
    var cid = parseInt(Math.floor(Math.pow(10, digitsCount-1) + Math.random() * (Math.pow(10, digitsCount) - Math.pow(10, digitsCount-1) - 1)));;
    return cid;
    }
    """
    * def parseFloat =
    """
    function(StringValue){
    var parseValue = parseFloat(StringValue);
    return parseValue;
    }
    """

    * def parseInt =
    """
    function(StringValue){
    var intValue = parseInt(StringValue);
    return intValue;
    }
    """

    * def dateFormat =
    """
    function(x){
    if(x!=""){
    var date = new Date();
    var daysToRemove = parseInt(x)-1;
    karate.log("Days to add to current date is:"+ x);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() - daysToRemove);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = (date.getDate()).toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
    }
    """

    * def dateFormatExcludeDays =
    """
    function(x){
    if(x!=""){
    var date = new Date();
    var daysToRemove = parseInt(x);
    karate.log("Days to add to current date is:"+ x);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() - daysToRemove);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = (date.getDate()).toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
    }
    """

    * def dateFormatExcludeDaystmstnp =
    """
    function(x){
    if(x!=""){
    var date = new Date();
    var daysToRemove = parseInt(x);
    karate.log("Days to add to current date is:"+ x);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() - daysToRemove);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = (date.getDate()).toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + ((ddChars[1]?dd:"0"+ddChars[0])+' 00:00:00'));
    }
    }
    """

    * def dateMinus =
    """
    function(x,minusDays){
    var date = new Date(x);
    var daysToRemove = parseInt(minusDays-1);
    karate.log("Days to remove to given date is:"+ daysToRemove);
    karate.log('Given date is:' + date);
    date.setDate(date.getDate() - daysToRemove);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = (date.getDate()).toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
    """

    * def futureDateInDays =
    """
    function(x){
    var date = new Date();
    var daysToAdd = parseInt(x);
    karate.log("Days to add to current date is:"+ x);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() + daysToAdd);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = date.getDate().toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
    """

    * def addMonthAndDateToCurrentDate =
    """
    function(days,month){
    var date = new Date();
    var daysToAdd = parseInt(days)-1;
    karate.log("Given date  is:"+ days);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() + daysToAdd);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    date.setMonth(date.getMonth()+ month);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = date.getDate().toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
  """

    * def daysInMonth =
    """
   function daysInMonth (month, year) {
    karate.log('# of days in a month',new Date(year, month, 0).getDate());
    return new Date(year, month, 0).getDate().toString();
   }
   """


    * def futureDateForLeadEndDate =
    """
    function(x){
    var date = new Date();
    var daysToAdd = parseInt(x);
    karate.log("Days to add to current date is:"+ x);
    karate.log('todaysDate is:' + date);
    date.setDate(date.getDate() + daysToAdd);
    var yyyy = date.getFullYear().toString();
    karate.log('YYYY is:' + yyyy);
    var mm = (date.getMonth()+1).toString();
    karate.log("mm is:" + mm);
    var dd  = date.getDate().toString();
    karate.log("dd is:" + dd);
    var mmChars = mm.split('');
    var ddChars = dd.split('');
    return (yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]));
    }
    """

    * def getDate =
  """
  function(format) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat(format);
    var date = new java.util.Date();
    return sdf.format(date);
  }
  """

    * def findDateDifference =
    """
    function(date1,date2){
    var basePage = Java.type('baseclass.BasePage');
    var basePageDate = new basePage();
    return basePageDate.findDifference(date1,date2);
    }
    """


    * def getAge =
  """
  function(ageSubtract) {
    var date = getDate('yyyy-MM-dd');
    var age = date.split('-')[0]-ageSubtract+'-'+date.split('-')[1]+'-'+date.split('-')[2];
    return age;
  }
  """

    * def custOpndDate =
  """
  function(custOpndDateInMonth)
  {
  var custOpndDateMont = Java.type('feature.utilities.StringUtilities');
  var c = new custOpndDateMont();
  return c.equalToSevenMonth(custOpndDateInMonth);
  }
  """

    * def sliceString =
    """
    function(stringValue){
    return stringValue.slice(stringValue.length - 13);
    }
    """

    * def sliceString12Digits =
    """
    function(stringValue){
    return stringValue.slice(stringValue.length - 12);
    }
    """

    * def decimalRange =
    """
    function(decimalValue,decimalRange){
    return parseFloat(decimalValue).toFixed(decimalRange);
    }
    """

    * def creativeParse =
    """
    function(str,x){
    var testid = str;
    var creLen = x;
    var creativeToReturn = testid.slice(-creLen);
    karate.log('The creative id from testId is:' + creativeToReturn);
    return creativeToReturn;
    }
    """
    * def retreiveSubstring =
    """
    function(str,x,y){
    var stringToSlice = str;
    var str = x;
    var end = y;
    karate.log("The string to substr is:" +stringToSlice);
    var stringToReturn = stringToSlice.substr(str,end);
    karate.log('The substring to return is:' + stringToReturn);
    return stringToReturn;
    }
    """
    * def dataCSV = read('classpath:testdata\\Proposition.csv')

    * def datemonthyearformat =
    """
    function(date) {
    karate.log('Date is:-'+date);
    var d = new Date(date),
    month = '' + (d.getMonth() + 1),
    day = '' + d.getDate(),
    year = d.getFullYear();
    karate.log('Month is:-'+month);
    karate.log('Day is:-'+day);
    karate.log("Year is:-",year);
    if (month.length < 2)
    month = '0' + month;
    if (day.length < 2)
    day = '0' + day;
    return [year, month, day].join('-');
    }
    """


    * def clearIH =
   """
  function(cid,request,offerCode){
  var flag = new Boolean(0);
  var stepDefinition = Java.type('steps.StepDefinition');
  var ihClear = new stepDefinition();
  var i;
    for(i=1;i<=3;i++){
      flag = ihClear.clearInteractionHistory(cid, request, offerCode);
      if(flag){
        break;
      }
    }
  }
   """

    * def retrievePAConfigValues =
    """
    function()
    {
    var stepDef = Java.type('steps.StepDefinition');
    var retPaValues = new stepDef();
    return retPaValues.getPAConfigValuesForPACCAndULOC();
    }
    """


    * def oiiSegmentationCLI =
   """
  function(offerCode,cid,fieldValue,testDatalocation,testDataFileName,testDataSheetname){
   var stepDefinition = Java.type('steps.StepDefinition');
   var oiiSegmentation = new stepDefinition();
   return oiiSegmentation.getOIISegmentationCLILogicValue(offerCode,cid,fieldValue,testDatalocation,testDataFileName,testDataSheetname);
  }
   """

    * def oiiSegmentationMortgage =
   """
  function(offerCode,cid,fieldValue,testDatalocation,testDataFileName,testDataSheetname){
   var stepDefinition = Java.type('steps.StepDefinition');
   var oiiSegmentation = new stepDefinition();
   return oiiSegmentation.getOIISegmentationMortgageLogicValue(offerCode,cid,fieldValue,testDatalocation,testDataFileName,testDataSheetname);
  }
   """



    * def deleteIH =
   """
  function(cid){
   var stepDefinition = Java.type('steps.StepDefinition');
   var deleteIH = new stepDefinition();
   deleteIH.deleteBulkInteractionHistory(cid);
  }
   """

    * def loginToPega =
    """
    function(){
    var login = Java.type('steps.StepDefinition');
    var pegaLogin = new login();
    pegaLogin.loginToPega();
    }
    """

    * def recreateAggregates =
    """
    function(){
    var createAggreagates = Java.type('steps.StepDefinition');
    var recreateAgg = new createAggreagates();
    recreateAgg.recreateAggregatesFor4DD();
    }
    """

    * def recreateAggregatesAfterClearingIH =
    """
    function(){
    var createAggreagatesAfterIH = Java.type('steps.StepDefinition');
    var recreateAggAfterIH = new createAggreagatesAfterIH();
    recreateAggAfterIH.recreateAggregatesAfterClearingIH();
    }
    """

    * def getTestCaseDetailsFromXRAY =
   """
  function(scenarioName){
   var jiraObj = Java.type('jira.xray.JiraBNS');
   var testCaseDetails = new jiraObj();
   testCaseDetails.getTestCaseDetails(scenarioName);
  }
   """

    * def printTestCaseData =
   """
  function(){
   var jiraObj = Java.type('jira.xray.JiraBNS');
   var testCaseDetails = new jiraObj();
   testCaseDetails.printTestCaseData();
  }
   """

    * def getTestRunStatus =
   """
  function(xrayKey){
   var jiraObj = Java.type('jira.xray.JiraBNS');
   var testCaseDetails = new jiraObj();
   testCaseDetails.getTestRunStatus(xrayKey);
  }
   """

    * def getIhRecords =
   """
  function(cid){
   var stepDefinition = Java.type('steps.StepDefinition');
   var ihRecords = new stepDefinition();
   var records = ihRecords.getIHRecordsData(cid)
   var stringUtilities = Java.type('feature.utilities.StringUtilities');
   var jsonObject = new stringUtilities();
   var jsonString = jsonObject.convertToJson(records);
   return jsonString;
  }
   """

    * def getRequiredDataValueFromIH =
      """
      function(dataIH, outcome, requiredValue){
      return karate.get('$dataIH.['+indexOf(karate.get('$dataIH.[*].Outcome'),outcome)+'].'+requiredValue);
      }
      """

    * def zoneCodes_Proposition = []
    * def zoneCodesFunction =
     """
     function(listOfZoneCodes){
     if(getRequiredDataValueFromCSV(dataCSV,offerCode,listOfZoneCodes)=='TRUE'){
     karate.appendTo(zoneCodes_Proposition, listOfZoneCodes+',');
     }
     }
     """

    * def subString =
    """
    function(stringValue,startValue,length){
    return stringValue.substring(startValue,length);
    }
    """

    * def stringLength =
    """
    function(stringValue){
    return stringValue.length;
    }
    """


    * def getDDRRecords =
    """
    function(){
    var stepDefinition = Java.type('steps.StepDefinition');
    var ddrRows = new stepDefinition();
    return ddrRows.getDDRRecordsFromIH();
    }
    """


    * def getCampaignWaveNumber =
    """
    function(ddrRecords,month,year,campaignCode,channelFile){
    var stepDefinition = Java.type('steps.StepDefinition');
    var campaignNumber = new stepDefinition();
    return campaignNumber.getCampaignNumber(ddrRecords,month,year,campaignCode,channelFile);
    }
    """

    * def getPAColValue =
    """
    function(paConfigRecords,primaryProductCode,primaryProductCode,primaryProductSubCode,startDate,EndDate,colName){
    var stepDef = Java.type('steps.StepDefinition');
    var colValue = new stepDef();
    return colvalue.getPAConfigKeyValuePairsForTheProducts(paConfigRecords,primaryProductCode,primaryProductCode,primaryProductSubCode,startDate,EndDate,colName);
    }
    """

    * def getExpiryFromDDR =
    """
    function(ddrRecords,month,year,campaignCode,channelFile){
    var stepDefinition = Java.type('steps.StepDefinition');
    var campaignNumber = new stepDefinition();
    return campaignNumber.expiryFromDDR(ddrRecords,month,year,campaignCode,channelFile);
    }
    """

    * def getStartDateFromDDR =
    """
    function(ddrRecords,month,year,campaignCode,channelFile){
    var stepDefinition = Java.type('steps.StepDefinition');
    var campaignNumber = new stepDefinition();
    return campaignNumber.startDateFromDDR(ddrRecords,month,year,campaignCode,channelFile);
    }
    """

    * def roundNumber =
    """
    function(decimal){
    return Math.round(decimal);
    }
    """
    * def StartDateValidation =
    """
    function(){
    var date = new Date();
    karate.log('todaysDate is:' + date);
    }
    """

    * def compareDatesInDays =
    """
    function(date1,date2){
    karate.log('Date1 is:' + date1);
    karate.log('Date2 is:' + date2);
    var d1 = new Date(date1);
    var d2 = new Date(date2);
    var difference = d2-d1;
    return difference;
    }
    """

    * def randGenCert =
    """
    function(digits){
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
    for (var i = 0; i < digits; i++)
     text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
    }
    """

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
    * def queryBuilderCustAcctPref =
    """
  function(databaseSheetRow_HashMap,sheetName){
  var dataBase = Java.type('feature.utilities.DataBaseData');
  var dataBaseData = new dataBase();
  return dataBaseData.queryBuilderCustAcctPref(databaseSheetRow_HashMap,sheetName);
  }
    """
#    * def callValidation =
#    """
#    function(cid){
#    if (cid_Control=='0')
#         karate.log('Cid is in control')
#      else
#        * call read('classpath:channels/nova/ReusableScenarios.feature@LatestContextualOfferValidation')
#      return(0)
#    }
#    """



    * def sortString =
    """
    function(StringValue,sepChar){
    var strParam = StringValue.split(sepChar);
    var SortString = strParam.sort();
    var finalString = SortString.join('|');
    return(finalString);
    }
    """

    * def chooseCreative =
    """
    function(StringValue1,StringValue2,sepChar){
    var strParam = StringValue2.split(sepChar);
    var webCreative = StringValue1;
    var finalCreative = 0;
    for (var i=0;i<strParam.length;i++)
    {
    if (strParam[i]==webCreative)
    {
    finalCreative = webCreative;
    break;
    }else{
    finalCreative = StringValue2;
    }
    }
    return(finalCreative);
    }
    """
## Return date in YYYYMMDD format
#
#    * def DateInYYYYMMDDFormat =
#    """
#    function(indate){
#     karate.log("date passed to function is:" + indate);
#    var date = new Date(indate);
#    karate.log("date passed to function is:" + date);
#    var yyyy = date.getFullYear().toString();
#    karate.log('YYYY is:' + yyyy);
#    var mm = (date.getMonth()+1).toString();
#    karate.log("mm is:" + mm);
#    var dd  = date.getDate().toString();
#    karate.log("dd is:" + dd);
#    var mmChars = mm.split('');
#    var ddChars = dd.split('');
#    return (yyyy + (mmChars[1]?mm:"0"+mmChars[0]) + (ddChars[1]?dd:"0"+ddChars[0]));
#    }
#    """