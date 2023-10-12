Feature: Default

	Background:
		#@CIMCAMP-12616
		* url baseUrl
		* configure headers = read('classpath:headers.js')
		* call read('classpath:CommonFunctions.feature')
		* def requestfile = read('classpath:channels/orn/ChannelORN.txt')
		

	
	@CIMCAMP-16314 @CIMCAMP-16317 @CIMCAMP-16313 @5839 @MPSAWelcomeBonus @MPSAWelcomeBonus_Base_ORN_Validation @ORN @Positive_and_Negative-ORN.feature @RS22116 @Sanity-ORN
	Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> IH for Base Positive TestCases
		* def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
		* def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
		* def cid = karate.get('data.ID')
		* print 'CID is '+cid
		* def acct_num = '00000000'+cid
		* print "account number is " + acct_num
		* string testId = karate.get('data.TestID')
		* print 'Test Cases Id is '+testId
		* call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
		* string offerCode = karate.get('data.NBACode')
		* print 'Offer cod  is '+offerCode
		* call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
		* call clearIH(cid,requestfile,offerCode)
		* print '*********Request**********'+karate.prettyXml(requestfile)
		* request requestfile
		* method post
		* status 200
		* def responseString = response
		* print '***************Response*************'+karate.prettyXml(responseString)
		* clearResultFields()
		* call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_ORN')
		* call read('classpath:channels/orn/ReusableScenarios.feature@fetchIHRows')
		* call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidationWithIH')
		* print getPassedResults()
		* def failedResults = getFailedResults()
		* print failedResults
		* assert getLength(failedResults) == 0
		
			Examples: 
				| TestID             | 
				| "5839_ORN_BASE_01" |	

	
	@CIMCAMP-16315 @CIMCAMP-16317 @CIMCAMP-16313 @5839 @MPSAWelcomeBonus @MPSAWelcomeBonus_Positive_ORN_Validation @ORN @Positive_and_Negative-ORN.feature @RS22116
	Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> Positive TestCases
		* def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
		* def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
		* def cid = karate.get('data.ID')
		* print 'CID is '+cid
		* def acct_num = '00000000'+cid
		* print "account number is " + acct_num
		* string testId = karate.get('data.TestID')
		* print 'Test Cases Id is '+testId
		* string offerCode = karate.get('data.NBACode')
		* print 'Offer cod  is '+offerCode
		* call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
		* call clearIH(cid,requestfile,offerCode)
		* print '*********Request**********'+karate.prettyXml(requestfile)
		* request requestfile
		* method post
		* status 200
		* def responseString = response
		* print '***************Response*************'+karate.prettyXml(responseString)
		* clearResultFields()
		* call read('classpath:channels/orn/ReusableScenarios.feature@MPSAWelcomeBonusOfferValidation_ORN')
		* print getPassedResults()
		* def failedResults = getFailedResults()
		* print failedResults
		* assert getLength(failedResults) == 0
		
			Examples: 
				| TestID                                                                 | 
				| "5839_ORN_CUST_AGE_eq_18"                                              | 
				| "5839_ORN_LANG_CD_eq_fr"                                               | 
				| "5839_ORN_NOT_AML_KYC_eq_NULL"                                         | 
				| "5839_ORN_MD_FINANCIAL_F_eq_NULL"                                      | 
				| "5839_ORN_ITRADE_MCLEOD_F_eq_NULL"                                     | 
				| "5839_ORN_ITRADE_MCLEOD_F_eq_Y"                                        | 
				| "5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_NULL"                        | 
				| "5839_ORN_DO_NOT_SOLICIT_F_eq_NULL"                                    | 
				| "5839_ORN_ACCT_ODT_eq_30"                                              | 
				| "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_ne_1"    | 
				| "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_NULL" | 
				| "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_ne_1"     | 
				| "5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_NULL"  |	

	
	@CIMCAMP-16316 @CIMCAMP-16317 @CIMCAMP-16313 @5839 @MPSAWelcomeBonus @MPSAWelcomeBonus_Negative_ORN_Validation @ORN @Positive_and_Negative-ORN.feature @RS22116
	Scenario Outline: MPSA Welcome Bonus_5839_ORN Validate <TestID> Negative TestCases
		* def testDataFileName = MPSA_Welcome_Bonus_ORNTestData
		* def data = ReadValueFromTestData("TestID",<TestID>,testDataLocation,testDataFileName,testDataSheetName);
		* def cid = karate.get('$data.ID')
		* print 'CID'+cid
		* def acct_num = '00000000'+cid
		* print "account number is " + acct_num
		* string testId = karate.get('data.TestID')
		* print 'Test Cases Id is '+testId
		* call read('classpath:channels/orn/ReusableScenarios.feature@reportDbRecords')
		* def offerCode = karate.get('data.NBACode')
		* call read('classpath:channels/orn/ReusableScenarios.feature@ORN_REST_CALL')
		* print '*********Request**********'+requestfile
		* request requestfile
		* method post
		* status 200
		* def responseString = response
		* print '***************Response*************'+karate.prettyXml(responseString)
		* clearResultFields()
		* def responseStringActual = responseString == '{}' ? {} : karate.jsonPath(responseString,"$.offers[0].offer_code")
		* assert (responseStringActual == {})|| (responseStringActual != offerCode)
		
			Examples: 
				| TestID                                                                | 
				| "N_5839_ORN_DECEASED_F_eq_Y"                                          | 
				| "N_5839_ORN_DECEASED_F_eq_NULL"                                       | 
				| "N_5839_ORN_CUST_TP_CD_ne_PSNL"                                       | 
				| "N_5839_ORN_PRIM_CNTRY_CD_ne_CA"                                      | 
				| "N_5839_ORN_PRIM_CNTRY_CD_eq_NULL"                                    | 
				| "N_5839_ORN_CUST_AGE_lt_18"                                           | 
				| "N_5839_ORN_CUST_AGE_eq_NULL"                                         | 
				| "N_5839_ORN_LANG_CD_ne_en_fr"                                         | 
				| "N_5839_ORN_LANG_CD_eq_NULL"                                          | 
				| "N_5839_ORN_NOT_AML_KYC_eq_Y"                                         | 
				| "N_5839_ORN_MD_FINANCIAL_F_eq_Y"                                      | 
				| "N_5839_ORN_DEDICATED_INVSTMNT_ADVISOR_F_eq_Y"                        | 
				| "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_Y"                                   | 
				| "N_5839_ORN_HAS_CLOSED_MPSA_F_eq_NULL"                                | 
				| "N_5839_ORN_MRKTBLE_F_n_eq_Y"                                         | 
				| "N_5839_ORN_MRKTBLE_F_eq_NULL"                                        | 
				| "N_5839_ORN_DO_NOT_SOLICIT_F_eq_Y"                                    | 
				| "N_5839_ORN_SRC_ACCT_STAT_CD_ne_Active"                               | 
				| "N_5839_ORN_SRC_ACCT_STAT_CD_eq_NULL"                                 | 
				| "N_5839_ORN_ACCT_SUBSYS_ID_ne_UF"                                     | 
				| "N_5839_ORN_ACCT_SUBSYS_ID_eq_NULL"                                   | 
				| "N_5839_ORN_SRC_SYS_PRD_CD_ne_BSAMP"                                  | 
				| "N_5839_ORN_SRC_SYS_PRD_CD_eq_NULL"                                   | 
				| "N_5839_ORN_ACCT_ODT_eq_0"                                            | 
				| "N_5839_ORN_ACCT_ODT_gt_30"                                           | 
				| "N_5839_ORN_ACCT_ODT_eq_NULL"                                         | 
				| "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_ne_Y"                            | 
				| "N_5839_ORN_PRIMARY_ACCT_HOLDER_FLAG_eq_NULL"                         | 
				| "N_5839_ORN_INSIGHT_CD_ne_MPSA_WELCOME_BONUS"                         | 
				| "N_5839_ORN_CURR_VAL_eq_NULL"                                         | 
				| "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_CONTROL_CURR_VAL_eq_1" | 
				| "N_5839_ORN_INSIGHT_CD_eq_FLG_MPSA_ACQ_RS22021_TARGET_CURR_VAL_eq_1"  |
