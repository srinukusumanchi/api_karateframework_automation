@MPSAContribution_PositiveNegative_Validation_5504
Feature: Validate MPSA Contribution Positive and Negative for NOVA test cases

  Background: Common for NOVA Positive and Negative

    # Calling API with URL
    * url baseUrl
    #  Passing Headers for the API
    * configure headers = read('classpath:headers.js')
  # Reading common functions feature file
    * call read('classpath:CommonFunctions.feature')
    * def requestfile = read('classpath:channels/nova/ChannelNOVA.txt')

  @MPSAContribution_5504 @MPSAContribution_5504_Nova_Positive_Validation @5504 @NOVA  @AUTUTESTTOTAL#40
  Scenario Outline: MPSA Contribution_5504_NOVA Validate <TestID> Positive TestCases Response Fields

  #    Reading data from Excel sheet
    * def testDataFileName = MPSAContributionNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('data.ID')
    * print 'CID is '+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

     # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

  #    Defining which NBA Code to test (Retriving from excel sheet)
    * string offerCode = karate.get('data.NBACode')
    * print 'Offer cod  is '+offerCode
  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')


#    Clear IH when it goes to control group
    * call clearIH(cid,requestfile,offerCode)

  #    Printing request body in console
    * print '*********Request**********'+karate.prettyXml(requestfile)

  #    request (Karate keyword) for sending request string
    * request requestfile
  #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

   #    It clears Result fields
    * clearResultFields()

    * call read('classpath:channels/nova/ReusableScenarios.feature@TFSACrossSellOfferValidation_NOVA')


    * print getPassedResults()
    * def failedResults = getFailedResults()
    * print failedResults
    * assert getLength(failedResults) == 0


    Examples:
      | TestID                                                                                                                                                                    |
      | "5504_CUST_TP_CD=PSNL,5504_Primary Country Cd = CA,5504_MRKTBLE_F = Y,5504_Customer Not Decease"                                                                          |
      | "5504_CUST_AGE >18"                                                                                                                                                       |
      | "5504_CUST_AGE=18"                                                                                                                                                        |
      | "5504_LANG_CD in E"                                                                                                                                                       |
      | "5504_LANG_CD in EN"                                                                                                                                                      |
      | "5504_LANG_CD in F"                                                                                                                                                       |
      | "5504_LANG_CD in FR"                                                                                                                                                      |
      | "5504_LANG_CD in small case_e"                                                                                                                                            |
      | "5504_LANG_CD in small case_en"                                                                                                                                           |
      | "5504_LANG_CD in small case_f"                                                                                                                                            |
      | "5504_LANG_CD in small case_fr"                                                                                                                                           |
      | "5504_DO_NOT_SOLICIT_F = N"                                                                                                                                               |
      | "5504_DO_NOT_SOLICIT_F = NULL"                                                                                                                                            |
      | "5504_NOT_AML_KYC = N"                                                                                                                                                    |
      | "5504_NOT_AML_KYC = NULL"                                                                                                                                                 |
      | "5504_ACCT_ODT>90"                                                                                                                                                        |
      | "5504_ACCT_ODT = NULL"                                                                                                                                                    |
      | "5504_PRIMARY_ACCT_HOLDER_FLAG = Y"                                                                                                                                       |
      | "5504_BUSINESS_SEGMENT = Retail"                                                                                                                                          |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                                                     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL > 1"                                                                                     |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA   and CUST_INSIGHTS.CURR_VAL = 1"                                                                                     |
      | "5504_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD = Active"                                                                                       |
      | "5504_PRD CODE=01  SUB PRD CD=01"                                                                                                                                         |
      | "5504_PRD CODE=VGD SUB PRD CD=NF"                                                                                                                                         |
      | "5504_PRD CD = 01 SUB PRD CD = 07"                                                                                                                                        |
      | "5504_PRD CD = 02 SUB PRD CD = 05"                                                                                                                                        |
      | "5504_PRD CD = 19 SUB PRD CD = 05"                                                                                                                                        |
      | "5504_PRD CD = 13 SUB PRD CD = 05"                                                                                                                                        |
      | "5504_PRD CD = 07 SUB PRD CD = 01"                                                                                                                                        |
      | "5504_PRD CD = 23 SUB PRD CD = 02"                                                                                                                                        |
      | "5504_PRD CD = VGD SUB PRD CD= AB"                                                                                                                                        |
      | "5504_PRD CD = VCL SUB PRD CD= BC"                                                                                                                                        |
      | "5504_PRD CD = VLR SUB PRD CD= CD"                                                                                                                                        |
      | "5504_SRC_ACCT_STAT_CD! =  A"                                                                                                                                             |
      | "5504_SRC_ACCT_STAT_CD! = Open"                                                                                                                                           |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = 1"    |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1"    |
      | "5504_CUST_INSIGHTS.INSIGHT_CD =FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1)  AND CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"   |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL! = 1)  OR CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL > 1)" |
      | "5504_5504032201_Ultimate Account holders with MPSA PAC"                                                                                                                  |
      | "5504_5504032202_Ultimate Account holders without MPSA PAC"                                                                                                               |
      | "5504_5504032203_Preferred Account holders with MPSA PAC"                                                                                                                 |
      | "5504_5504032204_Preferred Account holders without MPSA PAC"                                                                                                              |
      | "5504_5504032205_Other (no Ultimate/Preferred) with MPSA PAC"                                                                                                             |
      | "5504_5504032206_Other (no Ultimate/Preferred) without MPSA PAC"                                                                                                          |
      | "5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE < 30 days"                                                                        |
      | "5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE = 30 days"                                                                        |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT = 20 days"                                                                                             |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT = 30 days"                                                                                             |
      | "5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT > 20 and < 30 days"                                                                                    |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL! = 1 and Current date - CUST_INSIGHTS.EVENT_DATE < 60"                                  |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE > 60"                                   |
      | "5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_ENG_RS22022_TARGET_CONTROL && CUST_INSIGHT.CURR_VAL! = 1"                                                                       |
      | "5504_MPSA with PAC && ULTIMATE && PREFERRED - Ultimate and Preferred"                                                                                                    |
      | "5504_MPSA without PAC PAC && ULTIMATE && PREFERRED - Ultimate and Preferred"                                                                                             |
      | "5504_PRD CD IN 01 && SUB PRD CD IN (01,02,03,04) && ACCOUNT_ODT >90"                                                                                                     |
      | "5504_PRD CD IN 02 && SUB PRD CD IN (01,02,03) && ACCOUNT_ODT < 90 && inactive"                                                                                           |
      | "5504_PRD CD IN 19 && SUB PRD CD IN (01,02,03,04,07,08) && ACCOUNT_ODT >90"                                                                                               |
      | "5504_PRD CD IN 07 && SUB PRD CD IN (11,12) && ACCOUNT_ODT >90"                                                                                                           |
      | "5504_PRD CD IN VGD  && SUB PRD CD IN (NF) && ACCOUNT_ODT >90"                                                                                                            |
      | "5504_PRD CD IN VCL  && SUB PRD CD IN (DM) && ACCOUNT_ODT < 90 && inactive"                                                                                               |
      | "5504_PRD CD IN VLR  && SUB PRD CD IN (RC) && ACCOUNT_ODT >90"                                                                                                            |
      | "5504_PRD CD IN VCL  && SUB PRD CD IN (NF) && ACCOUNT_ODT >90"                                                                                                            |
      | "5504_PRD CD IN VFA  && SUB PRD CD IN (A1) && ACCOUNT_ODT >90"                                                                                                            |
      | "5504_CellGroup.PRI && CellGroup.TXR"                                                                                                                                     |
      | "5504_CellGroup.MPC && CellGroup.TXR"                                                                                                                                     |
      | "5504_CellGroup.MPC && CellGroup.TXR && CellGroup.PRI"                                                                                                                    |
      | "5504032205_Other Accounts with MPSA PAC_Preffered Account with SRC_ACCT_STAT_CD!= A"                                                                                     |
      | "5504032205_Other Accounts with MPSA PAC_Ultimate Account with SRC_ACCT_STAT_CD!= A"                                                                                      |
      | "5504032205_Other Accounts with MPSA PAC_Preffered Account with PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                            |
      | "5504032205_Other Accounts with MPSA PAC_Ultimate Account with PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                             |
      | "5504032206_Other Accounts with No MPSA PAC_Preffered Account with SRC_ACCT_STAT_CD!= A"                                                                                  |
      | "5504032206_Other Accounts with No MPSA PAC_Ultimate Account with SRC_ACCT_STAT_CD!= A"                                                                                   |
      | "5504032206_Other Accounts with No MPSA PAC_Preffered Account with PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                         |
      | "5504032206_Other Accounts with No MPSA PAC_Ultimate Account with PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                          |
      | "N_5504032201_Ultimate Account holders with MPSA PAC_No Ultimate Account"                                                                                                 |
      | "N_5504032201_Ultimate Account holders with MPSA PAC_ACCT_SUBSYS_ID! = BB"                                                                                                |
      | "N_5504032201_Ultimate Account holders with MPSA PAC_SRC_SYS_PRD_CD! = 23"                                                                                                |
      | "N_5504032201_Ultimate Account holders with MPSA PAC_SRC_ACCT_STAT_CD! = A"                                                                                               |
      | "N_5504032201_Ultimate Account holders with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                       |
      | "N_5504032202_Ultimate Account holders with No MPSA PAC_No Ultimate Account"                                                                                              |
      | "N_5504032202_Ultimate Account holders with No MPSA PAC_ACCT_SUBSYS_ID! = BB"                                                                                             |
      | "N_5504032202_Ultimate Account holders with No MPSA PAC_SRC_SYS_PRD_CD! = 23"                                                                                             |
      | "N_5504032202_Ultimate Account holders with No MPSA PAC_SRC_ACCT_STAT_CD! = A"                                                                                            |
      | "N_5504032202_Ultimate Account holders with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                    |
      | "N_5504032203_Preffered Account holders with MPSA PAC_No Preferred Account"                                                                                               |
      | "N_5504032203_Preffered Account holders with MPSA PAC_ACCT_SUBSYS_ID! = BB"                                                                                               |
      | "N_5504032203_Preffered Account holders with MPSA PAC_SRC_SYS_PRD_CD! = 23"                                                                                               |
      | "N_5504032203_Preffered Account holders with MPSA PAC_SRC_ACCT_STAT_CD! = A"                                                                                              |
      | "N_5504032203_Preffered Account holders with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                      |
      | "N_5504032204_Preffered Account holders with No MPSA PAC_No Preferred Account"                                                                                            |
      | "N_5504032204_Preffered Account holders with No MPSA PAC_ACCT_SUBSYS_ID! = BB"                                                                                            |
      | "N_5504032204_Preffered Account holders with No MPSA PAC_SRC_SYS_PRD_CD! = 23"                                                                                            |
      | "N_5504032204_Preffered Account holders with No MPSA PAC_SRC_ACCT_STAT_CD! = A"                                                                                           |
      | "N_5504032204_Preffered Account holders with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                                   |


  @MPSAContribution_5504 @MPSAContribution_5504_Nova_NegativeTestCases_Validation @5504 @NOVA @RS21098 @AUTOTESTTOTAL#31
  Scenario Outline: MPSAContribution_5504_NOVA Validate <TestID> Negative TestCases Response Fields
#      Reading data from Excel sheet
    * def testDataFileName = MPSAContributionNovaTestData

    * def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);

    * def cid = karate.get('$data.ID')
    * print 'CID'+cid

    * def acct_num = '00000000'+cid
    * print "account number is " + acct_num

    * string testId = karate.get('data.TestID')
    * print 'Test Cases Id is '+testId

    # Report database records in cucumber report
    * call read('classpath:channels/nova/ReusableScenarios.feature@reportDbRecords')

     #    Defining which NBA Code to test (Retriving from excel sheet)
    * def offerCode = karate.get('data.NBACode')

  #     Generate a NOVA SOAP call
    * call read('classpath:channels/nova/ReusableScenarios.feature@NOVA_REST_CALL')

  #    Printing request body in console
    * print '*********Request**********'+requestfile

  #    request (Karate keyword) for sending request string
    * request requestfile
   #    Performing action on JSON request (Post Action)
    * method post
  #    Verifying Sucess with status code 200
    * status 200
    * def responseString = response
  #    Printing response body in console
    * print '***************Response*************'+karate.prettyXml(responseString)

      #    It clears Result fields
    * clearResultFields()

    * def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")

     #    Validating error response
    * assert (responseStringActual == {})|| (responseStringActual != offerCode)

    Examples:
      | TestID                                                                                                                                    |
      | "N-5504_SRC_ACCT_STAT_CD = NULL"                                                                                                          |
      | "N-5504_CUST_TP_CD != PSNL"                                                                                                               |
      | "N-5504_Primary Country Cd != CA"                                                                                                         |
      | "N-5504_Primary Country Cd = NULL"                                                                                                        |
      | "N-5504_CUST_AGE < 18"                                                                                                                    |
      | "N-5504_CUST_AGE = NULL"                                                                                                                  |
      | "N-5504_LANG_CD NOT in (EN, E, FR, F)"                                                                                                    |
      | "N-5504_LANG_CD = NULL"                                                                                                                   |
      | "N-5504_DO_NOT_SOLICIT_F = Y"                                                                                                             |
      | "N-5504_MRKTBLE_F = N"                                                                                                                    |
      | "N-5504_MRKTBLE_F = NULL"                                                                                                                 |
      | "N-5504_NOT_AML_KYC = Y"                                                                                                                  |
      | "N-5504_Customer Decease - Y"                                                                                                             |
      | "N-5504_Customer Decease - NULL"                                                                                                          |
      | "N-5504_PRIMARY_ACCT_HOLDER_FLAG = N"                                                                                                     |
      | "N-5504_PRIMARY_ACCT_HOLDER_FLAG = NULL"                                                                                                  |
      | "N-5504_BUSINESS_SEGMENT != Retail"                                                                                                       |
      | "N-5504_BUSINESS_SEGMENT = NULL"                                                                                                          |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1"                                                  |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL != 1"                                                  |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD != FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = 1"                                                  |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = FLG_PAYROLL_INCREASE and CUST_INSIGHTS.CURR_VAL = NULL"                                                |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD != CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL => 1"                                                   |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL < 1"                                                     |
      | "N-5504_CUST_INSIGHTS.INSIGHT_CD = CNT_PAGEVISIT_HISA and CUST_INSIGHTS.CURR_VAL = NULL"                                                  |
      | "N-5504_SRC_SYS_PRD_CD != BSAMP and ACCT_SUBSYS_ID = UF and  SRC_ACCT_STAT_CD = Active"                                                   |
      | "N-5504_SRC_SYS_PRD_CD = BSAMP  and ACCT_SUBSYS_ID != UF and SRC_ACCT_STAT_CD = Active"                                                   |
      | "N-5504_SRC_SYS_PRD_CD = BSAMP and ACCT_SUBSYS_ID = UF and SRC_ACCT_STAT_CD != Active"                                                    |
      | "N_5504_PHYSICIANS_F = Y"                                                                                                                 |
      | "N_5504_MD_FINANCIAL_F = Y"                                                                                                               |
      | "N_5504_ITRADE_MCLEOD_F = Y"                                                                                                              |
      | "N_5504_DEDICATED_INVSTMNT_ADVISOR_F = Y"                                                                                                 |
      | "N_5504_CellGroup.TXR_N_INSIGHT_CD! = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE < 30 days"                                   |
      | "N_5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL! = 1 and EVENT_DATE < 30 days"                                     |
      | "N_5504_CellGroup.TXR_INSIGHT_CD = FLG_TAX_REFUND_DEPOSIT and CURR_VAL = 1 and EVENT_DATE > 30 days"                                      |
      | "N_5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT < 20 days"                                                           |
      | "N_5504_CellGroup.NEW_New MPSA account with balance = 0 && ACCT_ODT > 30 days"                                                           |
      | "N_5504_CellGroup.NEW_New MPSA account with balance! = 0 && ACCT_ODT < 30 days"                                                          |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE < 60" |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_CONTRIBUTION and CUST_INSIGHTS.CURR_VAL = 1 and Current date - CUST_INSIGHTS.EVENT_DATE = 60" |
      | "N_5504_CUST_INSIGHTS.INSIGHT_CD = FLG_MPSA_ENG_RS22022_TARGET_CONTROL && CUST_INSIGHT.CURR_VAL = 1"                                      |
      | "N_5504_PRD CD IN 01  &&  SUB PRD CD IN (01,02,03,04) && ACCOUNT_ODT  < 90"                                                               |
      | "N_5504_PRD CD IN 02  &&  SUB PRD CD IN (01,02,03) && ACCOUNT_ODT  = 90"                                                                  |
      | "N_5504_PRD CD IN 19  &&  SUB PRD CD IN (01,02,03,04,07,08) && ACCOUNT_ODT = 90"                                                          |
      | "N_5504_PRD CD IN 07  &&  SUB PRD CD IN (11,12) && ACCOUNT_ODT <90"                                                                       |
      | "N_5504_PRD CD IN 13  &&  SUB PRD CD IN (01,03,07,08) && ACCOUNT_ODT <90"                                                                 |
      | "N_5504_PRD CD IN 23  &&  SUB PRD CD IN (01,03) && ACCOUNT_ODT <90"                                                                       |
      | "N_5504_PRD CD IN VGD && SUB PRD CD IN (NF) && ACCOUNT_ODT = 90"                                                                          |
      | "N_5504_PRD CD IN VCL  && SUB PRD CD IN (DM) && ACCOUNT_ODT = 90"                                                                         |
      | "N_5504_PRD CD IN VLR  && SUB PRD CD IN (RC) && ACCOUNT_ODT = 90"                                                                         |
      | "N_5504_PRD CD IN VCL  && SUB PRD CD IN (NF) && ACCOUNT_ODT < 90"                                                                         |
      | "N_5504_PRD CD IN VFA  && SUB PRD CD IN (A1) && ACCOUNT_ODT < 90"                                                                         |
      | "N_5504032206_Other Accounts with No MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                              |
      | "N_5504032206_Other Accounts with No MPSA PAC_SRC_ACCT_STAT_CD!= A"                                                                       |
      | "N_5504_PRD CD IN VCL && SUB PRD CD IN ZZ  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504_PRD CD IN VCL && SUB PRD CD IN SS  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504_PRD CD IN VLR && SUB PRD CD IN RG  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN VLR && SUB PRD CD IN NF  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN VCL && SUB PRD CD IN RG  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN VCL && SUB PRD CD IN SV  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504_PRD CD IN VFF && SUB PRD CD IN F1  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504_PRD CD IN AXG && SUB PRD CD IN GC  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504_PRD CD IN AXS && SUB PRD CD IN SC  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN AXP && SUB PRD CD IN PC  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN VFF && SUB PRD CD IN TR  && ACCOUNT_ODT < 90"                                                                           |
      | "N_5504_PRD CD IN VGD && SUB PRD CD IN RG  && ACCOUNT_ODT = 90"                                                                           |
      | "N_5504032205_Other Accounts with MPSA PAC_PRIMARY_ACCT_HOLDER_FLAG != Y"                                                                 |
      | "N_5504032205_Other Accounts with MPSA PAC_SRC_ACCT_STAT_CD!= A"                                                                          |
