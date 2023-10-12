Feature: Delete IH

  Background:
    * call read('classpath:CommonFunctions.feature')
    * configure afterFeature = printTestCaseData()


  @DeleteIHForNTC
  Scenario Outline: Delete IH for CID's
 # Reading common functions feature file

    * def cid = <CID>
    * print 'CID is '+cid
    * call deleteIH(cid)
#    * call recreateAggregates()
    Examples:
      | CID               |
      | "277291830258867" |
      | "331804706737292" |
      | "732123811801882" |
      | "114517176068175" |
      | "158367549909430" |
      | "574532620516073" |
      | "633532585290011" |
      | "439844198588129" |
      | "207338901348476" |
      | "618045498174251" |
      | "628475799708363" |
      | "807033731678479" |
      | "715113179350709" |
      | "624204334855419" |
      | "099654930219222" |
      | "260121132364946" |
      | "884340713042879" |
      | "141975849661347" |
      | "964466924145796" |
      | "369906209655692" |
      | "330415440489259" |
      | "858896505598424" |
      | "372557762883034" |
      | "784810011743087" |
      | "861667466546071" |
      | "709833705206123" |
      | "313059222125620" |
      | "752796604013215" |
      | "896138472152846" |
      | "998759883369133" |
      | "875148684551008" |
      | "567372844390218" |
      | "123391561285987" |
      | "603501575627630" |
      | "213061121200847" |
      | "516552420973402" |
      | "186989547835188" |
      | "522929591409224" |
      | "108331687077883" |
      | "082912784852695" |
      | "107881557401558" |
      | "826584302331527" |
      | "920132753661355" |
      | "468086021251278" |
      | "278753476243746" |
      | "414907248222163" |
      | "878789814019197" |
      | "872979088976266" |
      | "795639955446122" |
      | "008585217508050" |
      | "213665364117626" |
      | "120470704078431" |
      | "363982566762128" |
      | "456546936552897" |
      | "285625214129584" |
      | "828926565558391" |
      | "814005983726879" |
      | "656856624890226" |
      | "370495078123653" |
      | "550850071588243" |
      | "215289212610051" |
      | "334503188567783" |
      | "954757870437173" |
      | "687877939108148" |
      | "647579984516837" |
      | "562998525430001" |
      | "743021981911778" |
      | "429221297214733" |
      | "354305074072141" |
      | "584292475335145" |
      | "829094468835516" |
      | "368871351142464" |
      | "735878436680523" |
      | "943161211137232" |
      | "225495729163569" |
      | "942622339005575" |
      | "337979293994631" |
      | "341007189855079" |
      | "103982991404766" |
      | "443843254536003" |
      | "957623634410634" |
      | "982872687171637" |
      | "381239245697872" |
      | "487477014441395" |
      | "136250739424601" |
      | "765138871565580" |
      | "372978005448756" |
      | "103226607705394" |
      | "935737633831928" |
      | "343819373375506" |
      | "877463800778725" |
      | "048223153302015" |
      | "668386739042791" |
      | "225816601128406" |
      | "736654664674743" |
      | "449465754026846" |
      | "269683674213181" |
      | "060104221409002" |
      | "903228888319531" |
      | "335382824734970" |
      | "063276430455585" |
      | "204491629264796" |
      | "541055743481276" |
      | "256717188760051" |
      | "459433927252341" |
      | "030174745498751" |
      | "276693609608968" |
      | "066183633092432" |
      | "605582628448844" |
      | "532016387232423" |

  @DeleteIHAfterClearingIH
  Scenario: Recreate Aggregates After Clearing The IH
 # Reading common functions feature file
    * call loginToPega()
    * call recreateAggregatesAfterClearingIH()


  @getTestCaseData
  Scenario Outline: get Test case information
 # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def scenarioName = <ScenarioName>

#    * call getTestCaseDetailsFromXRAY(scenarioName)
    * call getTestRunStatus(scenarioName)
    Examples:
      | ScenarioName       |
#      | "24A_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor are mAndatory for  Receiving of cash $10,000 CAD equivalent to a BNS customer account "                                                              |
#      | "24A_Verify Address collection of conductor is are mAndatory F/X currency Transaction exchange of $3000 CAD equivalent "                                                                                                                          |
#      | "24A_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor is are mAndatory for  Receiving of cash more than  $10,000 CAD  to a BNS customer account "                                                          |
#      | "24A_Verify Address collection of conductor is are mAndatory F/X currency Transaction exchange of more than $3000 CAD  "                                                                                                                          |
#      | "24A_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor is not are mAndatory for  Receiving of cash less than $10,000 CAD  to a BNS customer account "                                                       |
#      | "24A_Verify Address collection of conductor is not are mAndatory for F/X currency Transaction exchange which is less than $3000 CAD  "                                                                                                            |
#      | "24B_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor is are mAndatory for  Receiving of cash $10,000 CAD equivalent to a BNS customer account (non personal customer-personal profile is not linked)"     |
#      | "24B_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor is are mAndatory for  Receiving of cash more than  $10,000 CAD  to a BNS customer account (non personal customer-personal profile is linked)"        |
#      | "24B_Verify Address, Telephone Number, Occupation, Date of Birth, ID collection of conductor is not are mAndatory for  Receiving of cash less than $10,000 CAD  to a BNS customer account (non personal customer-personal profile is not linked)" |
#      | "24A_Verify 'Conductor Information' button is added below Conductor Authenticated Checkbox "                                                                                                                                                      |
#      | "24A_Verify user is able to change the ID details in session recall(LCT) when the details are not update in original non LCT session"                                                                                                             |
#      | "24A_Verify user is not able to update the ID in session recall if the address And ID are updated in original LCT session for personal customer "                                                                                                 |
#      | "24A_Verify user is unable to update the address And ID details in verification tab in session recall where original transaction is LCT"                                                                                                          |
#      | "24A_Verify user receives the error message 'Please confirm that you have authenticated the customer. ' with OK button when he tries to select any option before checking Customer Authenticated checkbox in unpinned session"                    |
#      | "24B_Verify Authenticated checkbox And associated logic will NOT appear in non-personal session( combo card)"                                                                                                                                     |
#      | "24A_Verify First name And Last name are not editable for the personal profile who is linked to a non personal profile ( Combo card)"                                                                                                             |
#      | "24B_Verify Authenticated checkbox And associated logic will NOT appear in non-personal session( not combo card)"                                                                                                                                 |
#      | "24B_Verify FFT stores the conductor  details when conductor information is not pre populated  "                                                                                                                                                  |
#      | "24A_Verify FFT stores the CID of the conductor  when conductor information is pre populated in combo card scenario ( Customer profile is selected)"                                                                                              |
#      | "24B_Verify FFT stores all the conductor information( which are required for the transaction) if conductor details are not populated from CIS on LCT transaction"                                                                                 |
#      | "24B_Verify FFT stores the conductor information(which are required for transaction) if conductor details are not populated from CIS on non LCT transaction"                                                                                      |
#      | "24B_Verify FFT stores all transaction details where the Bank of Canada (BOC) rate is used regardless the aggregated amounts"                                                                                                                     |
#      | "24C_Verify consent question is displayed on FFT for Non BNS customer"                                                                                                                                                                            |
#      | "24C_Verify authentication checkbox is not displayed in Non BNS Customer sundry session"                                                                                                                                                          |
#      | "24C_Varify customer first name And Last name is saved in FFT tables"                                                                                                                                                                             |
#      | "24C_Verify user is able to select any tab only after entering valid first name And last name of the conductor."                                                                                                                                  |
#      | "24C_Verify FFT throw invalid depositor name error when invalid names are entered "                                                                                                                                                               |
#      | "24C_Verify address, telephone number,  Occupation, Date of Birth And ID collection is not mAndatory when receiving of cash below $10,000 CAD  to a BNS customer account "                                                                        |
#      | "24C_Verify address, Occupation, Date of Birth And ID collection is mAndatory when request Certified cheque equal to   CAD $3,000 equivalent "                                                                                                    |
#      | "24C_Verify address, Occupation, Date of Birth And ID collection is mAndatory when request Certified cheque more than CAD $3,000 equivalent "                                                                                                     |
#      | "24C_Verify address, Occupation, Date of Birth And ID collection is not mAndatory when request Certified cheque less to  than CAD $3,000 equivalent "                                                                                             |
#      | "24C_Verify ID collection is mAndatory when cashing any clearing item  manually entered"                                                                                                                                                          |
#      | "24C_Verify ID collection is mAndatory when cashing any USD clearing item manually entered"                                                                                                                                                       |
#      | "24C_Verify ID collection is mAndatory when cashing any clearing item  which is scanned"                                                                                                                                                          |
#      | "24C_Verify First name And Last name of the conductor are not editable in session recall"                                                                                                                                                         |
#      | "24C_Verify conductor details are modifiable in same day session recall"                                                                                                                                                                          |
#      | "Verify whether amount is deposited into the customer account using Combo Card with Conductor being Personal Customer with Third Party instructor information"                                                                                    |
#      | "Verify Customer can able to do unPinned session with deposit greater than 10k in Business account with Conductor being Personal customer"                                                                                                        |
#      | "Verify Customer can able to do unPinned session with deposit less than 10k in Business account with Conductor being Personal customer"                                                                                                           |
#      | "Verify Customer can able to do unPinned session with deposit less than 10k in Business account with Conductor being Personal customer"                                                                                                           |
#      | "Verify Customer can able to do unPinned session with deposit > 10k in Business account with Conductor being Personal customer with 3rd party instructor details."                                                                                |
#      | "Verify User can do transaction >10k in different dispositions and collect 3rd party instructor details for different dispositions."                                                                                                              |
#      | "Verify User do FX deposit >10K then user should collect 3rd party instructor details"                                                                                                                                                            |
#      | "Verify User does a bill payment using cash if it is LCT transaction then user should collect 3rd party instructor details."                                                                                                                      |
#      | "Verify Teller is able to see 3rd party determination screen with 3rd party question Yes/No options when LCTR does."                                                                                                                              |
#      | "Verify If Teller selects Yes, Teller can see Transactions Table with Transaction Description,Transaction Account,Transaction Amount and 3rd Party Instructor columns."                                                                           |
#      | "Verify Teller able to see Name, Address and Employment Tabs when individual selected."                                                                                                                                                           |
#      | "Verify When User landed on 3rd Party Instructor Screen all tabs fields should be blank for first time."                                                                                                                                          |
#      | "Verify Teller able to fill fields in Name Tab."                                                                                                                                                                                                  |
#      | "Verify Teller trying to navigate to Address tab without filling the mandtory field LastName in Name Tab,will populate Error message."                                                                                                            |
#      | "Verify Teller trying to navigate to Address tab without filling the mandtory field Relationship dropdown in Name Tab,will populate Error message."                                                                                               |
#      | "Verify after saving the instructor details, Instructor details should be available in 3rd Party Instructor details dropdown on screen."                                                                                                          |
#      | "Verify ability to collect Individual Address details on the Address screen to collect 3rd Party Instructor details."                                                                                                                             |
#      | "Verify will get error popup message upon saving, if user not filled mandotory details."                                                                                                                                                          |
#      | "Verify Teller should be filled all mandatory details in Adress Tab, Then only Teller can add Employment details in Employment tab."                                                                                                              |
#      | "Verify Instructor details should be saved when all mandatory fields filled in all Tabs."                                                                                                                                                         |
#      | "Verify When Entity is selected, Teller should see Name,Address, Bussiness Info and Authorized Personnel Tabs"                                                                                                                                    |
#      | "Verify Teller can able to answer Business Type dropdown question(Is this Entity registered or incorporated? ) with Yes/No"                                                                                                                       |
#      | "Verify Teller can see all credit transactions accosiated with customer and 3rd instrustor details added by Teller in dropdown."                                                                                                                  |
#      | "Verify Teller can see an error popup when without collecting 3rd Party Instructor details atleast one record during post session."                                                                                                               |
#      | "Verify Teller can't see the 3rd Party hyperlink or table and Instructor information added/saved when Teller selects 3rd party determination question answer Yes to No."                                                                          |
#      | "Verify Teller can see the 3rd Party hyperlink or table and Instructor information added/saved when Teller selects 3rd party determination question answer No to Yes."                                                                            |
#      | "Verify Instructor info should be removed when customer changes Third Party Instructor answer or Cash transaction has been reversed. "                                                                                                            |
#      | "Verify Teller can able to access Yes/No options."                                                                                                                                                                                                |
#      | "Verify Teller naviagate to 3rd Instructor Screen and see Individual selected by defult."                                                                                                                                                         |
#      | "Verify Teller trying to save without filling the mandatory field FirstName in Name Tab, will populate Error message"                                                                                                                             |
#      | "Verify ability to delete instructor details."                                                                                                                                                                                                    |
#      | "Verify Teller can able to return back to 3rd party determination screen when clicks return."                                                                                                                                                     |
#      | "Verify When Entity is selected, Teller should see Name,Address, Bussiness Info and Authorized Personnel Tabs"                                                                                                                                    |
#      | "Verify When Entity is selected, Teller should see Name,Address, Bussiness Info and Authorized Personnel Tabs"                                                                                                                                    |
#      | "Verify User can able to see all related fields under address tab when entity is selected"                                                                                                                                                        |
#      | "Verify Teller can see all related fields under Business info tab when entity selected"                                                                                                                                                           |
#      | "Verify When Entity is selected, Teller should see Authorized Personnel and user will be presented 3 freeform fields to collect Authorized Personnel names"                                                                                       |
#      | "Verify DOB field should be added when Individual is selected on 3rd Party Instructor Screen"                                                                                                                                                     |
#      | "Verify Mobile Telephone Number field should be removed and added Business Telephone Number + Ext in Individual Address tab"                                                                                                                      |
      | "PCMLTFACBT-359  " |
      | "PCMLTFACBT-1108"  |
      | "PCMLTFACBT-1140 " |
      | "PCMLTFACBT-1108"  |
      | "PCMLTFACBT-1137 " |
      | "Not Found       " |
      | "PCMLTFACBT-1129 " |
      | "PCMLTFACBT-1111 " |
      | "PCMLTFACBT-1119 " |
      | "PCMLTFACBT-1132 " |
      | "PCMLTFACBT-1229 " |
      | "PCMLTFACBT-1230 " |
      | "PCMLTFACBT-1235 " |
      | "PCMLTFACBT-1251 " |
      | "PCMLTFACBT-1256"  |
      | "Not Found       " |
      | "Not Found       " |
      | "PCMLTFACBT-1262 " |
      | "PCMLTFACBT-1263 " |
      | "PCMLTFACBT-1264 " |
      | "PCMLTFACBT-1265 " |
      | "PCMLTFACBT-1266 " |
      | "PCMLTFACBT-1273 " |
      | "PCMLTFACBT-1276 " |
      | "Not Found       " |
      | "PCMLTFACBT-1278 " |
      | "PCMLTFACBT-1279 " |
      | "PCMLTFACBT-1282 " |
      | "PCMLTFACBT-1283 " |
      | "PCMLTFACBT-1284 " |
      | "PCMLTFACBT-1285 " |
      | "PCMLTFACBT-1293 " |
      | "PCMLTFACBT-1294 " |
      | "PCMLTFACBT-1297 " |
      | "PCMLTFACBT-1315 " |
      | "Not Found       " |
      | "PCMLTFACBT-1685 " |
      | "PCMLTFACBT-1687 " |
      | "PCMLTFACBT-1688 " |
      | "PCMLTFACBT-1688 " |
      | "PCMLTFACBT-1689 " |
      | "PCMLTFACBT-1748 " |
      | "Not Found       " |
      | "Not Found       " |
      | "PCMLTFACBT-706  " |
      | "PCMLTFACBT-708  " |
      | "PCMLTFACBT-711  " |
      | "PCMLTFACBT-1711 " |
      | "PCMLTFACBT-712  " |
      | "PCMLTFACBT-1341 " |
      | "PCMLTFACBT-1342 " |
      | "PCMLTFACBT-1347 " |
      | "PCMLTFACBT-384  " |
      | "PCMLTFACBT-386  " |
      | "PCMLTFACBT-714  " |
      | "PCMLTFACBT-715  " |
      | "PCMLTFACBT-1349 " |
      | "Not Found       " |
      | "PCMLTFACBT-1352 " |
      | "PCMLTFACBT-1353 " |
      | "PCMLTFACBT-1699 " |
      | "PCMLTFACBT-1700 " |
      | "PCMLTFACBT-1706 " |
      | "PCMLTFACBT-707  " |
      | "PCMLTFACBT-710  " |
      | "PCMLTFACBT-2781 " |
      | "PCMLTFACBT-385  " |
      | "PCMLTFACBT-716  " |
      | "PCMLTFACBT-1349 " |
      | "PCMLTFACBT-1739 " |
      | "PCMLTFACBT-3037 " |
      | "PCMLTFACBT-3055 " |
      | "PCMLTFACBT-2948 " |
      | "PCMLTFACBT-2806 " |
      | "PCMLTFACBT-1711 " |






