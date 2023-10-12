Feature: AS400 Inbound Test Cases

  Scenario: Validate AS400 Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL
    Given Condition the test data according to the AS400 Inbound Eligibility with Customer_BANKRUPTCY_DT= NULL_SOL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_BOR
    Given Condition the test data according to the AS400 Inbound Eligibility with Customer_BANKRUPTCY_DT= NULL_BOR
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_CUST_TP_CD = PSNL
    Given Condition the test data according to the AS400 Inbound Eligibility with CUST_TP_CD = PSNL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Deceased_F = N
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = N
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = E
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = E
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = EN
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = EN
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = F
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = F
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = FR
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = FR
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = e
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = e
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = en
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = en
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = f
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = f
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_LANG_CD = fr
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = fr
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_CR_RSK_IND != (D,E)
    Given Condition the test data according to the AS400 Inbound Eligibility with CR_RSK_IND != (D,E)
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_CR_RSK_IND = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with CR_RSK_IND = NULL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_INDV_FRST_NM = !NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with INDV_FRST_NM = !NULL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_INDV_LAST_NM = !NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with INDV_LAST_NM = !NULL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_RENEW_LIMITED_F = 0
    Given Condition the test data according to the AS400 Inbound Eligibility with RENEW_LIMITED_F = 0
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_RENEW_LIMITED_F >2
    Given Condition the test data according to the AS400 Inbound Eligibility with RENEW_LIMITED_F >2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_CASHBACK_F  = N
    Given Condition the test data according to the AS400 Inbound Eligibility with CASHBACK_F  = N
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_CASHBACK_F  = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with CASHBACK_F  = NULL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_NOT_FRCLSR_F = Y
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_NOT_FRCLSR_F = Y
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_NOT_FRCLSR_F = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_NOT_FRCLSR_F = NULL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_SRC_SYS_PRD_CD != (911,931,951)
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_SYS_PRD_CD != (911,931,951)
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_INTEREST_RATE >0
    Given Condition the test data according to the AS400 Inbound Eligibility with INTEREST_RATE >0
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MAT_DT - Current Date  < 6
    Given Condition the test data according to the AS400 Inbound Eligibility with MAT_DT - Current Date  < 6
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_AMORTIZATION_REMAIN > 6
    Given Condition the test data according to the AS400 Inbound Eligibility with AMORTIZATION_REMAIN > 6
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 2
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 3
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 3
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 4
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 4
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 5
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 5
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 6
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 6
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 7
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION = 7
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_ARREARS_MONTHS < 0
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_ARREARS_MONTHS < 0
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS <= 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS <= 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_FUND_CODE != (1900, 1901, 1902, 1912, 1916, 1922, 1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600)
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_FUND_CODE != (1900, 1901, 1902, 1912, 1916, 1922, 1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600)
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_SRC_ACCT_STAT_CD = Active
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_ACCT_STAT_CD = Active
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_MORT_COMM_TYPE = Residential
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_COMM_TYPE = Residential
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_ACCT_NUM = 23 Digit Numeric Value
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_NUM = 23 Digit Numeric Value
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = SOL
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_ACCT_SUBSYS_ID = UO
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = UO
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    Given Condition the test data according to the AS400 Inbound Eligibility with Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    Given Condition the test data according to the AS400 Inbound Eligibility with Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account
    Given Condition the test data according to the AS400 Inbound Eligibility with BANKRUPTCY != NULL for COB for one Account
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account
    Given Condition the test data according to the AS400 Inbound Eligibility with BANKRUPTCY != NULL for COS for one Account
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Deceased_F = N for COB
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = N for COB
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Mortage Renewal_Deceased_F = N for COS
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = N for COS
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = Y for COB for one Account
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate AS400 Response for Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = Y for COS for one Account
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID
	
	
	#AS400 - T6 -1430 Offer - SOL - Segmentation - Positve Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID
	
  
#  AS400 - T6 -1430 Offer - NONSOL - Segmentation - Positve Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NON-SOL Segmentation Where   SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID
	
	
#	AS400 - T6 -1430 Offer - SOLX - Segmentation - Positve Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT  has Value AND AMORTIZATION_REMAIN Between 6 to 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT  has Value AND AMORTIZATION_REMAIN Between 6 to 26
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT and MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID
	
	
#	AS400 - T6 -1430 Offer - NONSOLX - Segmentation - Positve Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NONSOLX Segmentation where MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NONSOLX Segmentation where MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal for NONSOLX Segmentation where MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000 And Count >2
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT <20000 And Count >2
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID
	
	
#	AS400 - Negative Test cases


  Scenario: Validate AS400 Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_SOL
    Given Condition the test data according to the AS400 Inbound Eligibility with Primary_Customer_BANKRUPTCY_DT != NULL_SOL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_BOR
    Given Condition the test data according to the AS400 Inbound Eligibility with Primary_Customer_BANKRUPTCY_DT != NULL_BOR
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_CUST_TP_CD != PSNL
    Given Condition the test data according to the AS400 Inbound Eligibility with CUST_TP_CD != PSNL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_CUST_TP_CD = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with CUST_TP_CD = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming  for Mortage Renewal_Deceased_F = Y
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = Y
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming  for Mortage Renewal_Deceased_F = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_LANG_CD = K
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = K
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_LANG_CD = NE
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = NE
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_LANG_CD = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with LANG_CD = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_CR_RSK_IND = D
    Given Condition the test data according to the AS400 Inbound Eligibility with CR_RSK_IND = D
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_CR_RSK_IND = E
    Given Condition the test data according to the AS400 Inbound Eligibility with CR_RSK_IND = E
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 1
    Given Condition the test data according to the AS400 Inbound Eligibility with RENEW_LIMITED_F = 1
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 2
    Given Condition the test data according to the AS400 Inbound Eligibility with RENEW_LIMITED_F = 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_CASHBACK_F  = Y
    Given Condition the test data according to the AS400 Inbound Eligibility with CASHBACK_F  = Y
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_NOT_FRCLSR_F = N
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_NOT_FRCLSR_F = N
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 911
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_SYS_PRD_CD = 911
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 931
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_SYS_PRD_CD = 931
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 951
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_SYS_PRD_CD = 951
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MAT_DT - Current Date >6
    Given Condition the test data according to the AS400 Inbound Eligibility with MAT_DT - Current Date >6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_AMORTIZATION_REMAIN < 6
    Given Condition the test data according to the AS400 Inbound Eligibility with AMORTIZATION_REMAIN < 6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_ARREARS_MONTHS > 0
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_ARREARS_MONTHS > 0
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_ACCT_STAT_CD = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = Open
    Given Condition the test data according to the AS400 Inbound Eligibility with SRC_ACCT_STAT_CD = Open
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_COMM_TYPE != Residential
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_COMM_TYPE != Residential
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_MORT_COMM_TYPE = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with MORT_COMM_TYPE = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BLANK
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BLANK
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = NULL
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = NULL
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = Zero
    Given Condition the test data according to the AS400 Inbound Eligibility with IP_AR_RELATN_TYPE_CD = Zero
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate AS400 Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != UO
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID != UO
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB
    Given Condition the test data according to the AS400 Inbound Eligibility with BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS
    Given Condition the test data according to the AS400 Inbound Eligibility with BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB
    Given Condition the test data according to the AS400 Inbound Eligibility with BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_INTEREST_RATE < 0
    Given Condition the test data according to the AS400 Inbound Eligibility with INTEREST_RATE < 0
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = Y for COB
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = Y for COB
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = Y for COS
    Given Condition the test data according to the AS400 Inbound Eligibility with Deceased_F = Y for COS
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH
	
	
#	AS400 - T6 -1430 Offer - SOL - Segmentation - Negative Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >=26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  = NULL And MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >= 20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  = NULL And MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >= 20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count > 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH
	
	
#	AS400 - T6 -1430 Offer - NONSOL - Segmentation - Negative Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH
	
	
#	T6 -1430 Offer - SOLX - Segmentation - Negative Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND MOB_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = CA AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN > 26
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN < 6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT > 20000
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT has Value AND AMORTIZATION_REMAIN Between 6 to 26 OR Count < 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for SOLX Segmentation where ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT= NULL And AND MOB_LAST_LOGIN_ST = NULL AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    Given Condition the test data according to the AS400 Inbound Eligibility with ACCT_SUBSYS_ID = AC AND EDW_ACCT_STAT_CD = A AND SOL_LAST_LOGIN_DT= NULL And AND MOB_LAST_LOGIN_ST = NULL AMORTIZATION_REMAIN Between 6 to 26 OR CRNT_BAL_AMT < 20000 OR Count > 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH
	
	
#	T6 -1430 Offer - NONSOLX - Segmentation - Negative Test cases


  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NONSOLX Segmentation where MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has some value and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has some value and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NONSOLX Segmentation where MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN > 26
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN > 26
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NONSOLX Segmentation where MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN < 6
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT and  SOL_LAST_LOGIN_DT has NULL Value  and  AMORTIZATION_REMAIN < 6
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NONSOLX Segmentation where MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT > 20000
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And CRNT_BAL_AMT > 20000
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 AS400 Response of Mortgage Renewal is not coming for NONSOLX Segmentation where MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And Count < 2
    Given Condition the test data according to the AS400 Inbound Eligibility with MOB_LAST_LOGIN_DT=NULL and  SOL_LAST_LOGIN_DT = NULL and  AMORTIZATION_REMAIN < 26 and  AMORTIZATION_REMAIN > 6 And Count < 2
    When Perform the getNBA operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH
	
	
	
#	T6 - 1430 - Disposition Test Cases


  Scenario: Verify when Perform Customer Defer (RML) disposition in AS400 Channel and give a SOAP call in AS400 channel then offer should display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display

  Scenario: Verify when Perform Customer Self-Serve (CSE) disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display

  Scenario: Verify when Perform Refer to Other Team disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display

  Scenario: Verify when Perform Refer to Sales disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display

  Scenario: Verify when Perform Book Appointment disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display

  Scenario: Verify when Perform Decline disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should not display in next 90 days
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display in next 90 days

  Scenario: Perform Accept disposition in AS400 Channel and give a SOAP call in AS400 channel  then offer should not display
    Given Condition the test data according to the AS400 Inbound Eligibility
    When Perform the getNBA operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display
	
	
#	Priority Same Mortgage Renewal Offers Test Cases


  Scenario: Validate that prioritization is applied with in the same Mortgage renewal offers when presenting a AS400 offer for a customer  is displayed for higher ACCT_DIM.CRNT_BAL_AMT
    Given Condition the test data according to the AS400 Inbound Eligibility with multiple Mortgage Renewals offers when presenting a AS400 offer for a customer
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on higher ACCT_DIM.CRNT_BAL_AMT

  Scenario: Validate that prioritization is appliedwith in the same Mortgage renewal offer when presenting a AS400 offer for a customer with same CRNT_BAL_AMT,Lowest accountnumber  Mortgage Renewals offer is displayed
    Given Condition the test data according to the AS400 Inbound Eligibility with multiple Mortgage Renewals offers when presenting a AS400 offer for a customer with same CRNT_BAL_AMT
    When Perform the getNBA operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on Lowest accountnumber


  Scenario: Validate According to outbound CCT Channel, 1430 Offer is returned for the AS400  Inbound Channel
    Given Condition a 1430 Offer Customer According to outbound CCT Channel, Make Sure that this Customer not Eligble For Inbound AS400 channel
    When Run the OutBound Scheduler
    And Open the CCT Batch file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer is returned for the AS400  Inbound Channel

  Scenario: Validate According to outbound EMAIL Channel, 1430 Offer is returned for the AS400  Inbound Channel
    Given Condition a 1430 Offer Customer According to outbound EMAIL Channel, Make Sure that this Customer not Eligble For Inbound AS400 channel except credit indicator, Renew flag ,Mat date and active status (For UO account)
    When Run the OutBound Scheduler
    And Open the EMAIL Batch file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer is returned for the AS400  Inbound Channel

  Scenario: Validate According to outbound DM Channel, 1430 Offer is returned for the AS400  Inbound Channel
    Given Condition a 1430 Offer Customer According to outbound DM Channel, the lead is presented in AS400 irrespective of customer level eligibility credit indicator, Renew flag ,Mat date and active status (For UO account)
    When Run the OutBound Scheduler
    And Open the DM file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer is returned for the AS400  Inbound Channel

  Scenario: Validate According to outbound SB Channel, 1430 Offer is returned for the AS400  Inbound Channel
    Given Condition a 1430 Offer Customer According to outbound SB Channel, the lead is presented in AS400 irrespective of customer level eligibility credit indicator, Renew flag ,Mat date and active status (For UO account)
    When Run the OutBound Scheduler
    And Open the SB Outbound file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer is returned for the AS400  Inbound Channel

  Scenario: Validate According to outbound CCT SOL Channel, 1430 Offer should not be returned for the AS400  Inbound Channel, Since its already supressed
    Given Condition a 1430 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
    When Run the OutBound Scheduler
    And Open the CCT Batch file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer should not be returned for the AS400 Inbound Channel, Since its already supressed

  Scenario: Validate According to outbound CCT DIA Channel, 1430 Offer should not be returned for the AS400  Inbound Channel, Since its already supressed
    Given Condition a 1430 Offer Customer According to outbound CCT DIA Channel, And the Customer is Accepted the Offer in DIA Channel
    When Run the OutBound Scheduler
    And Open the DIA Batch file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer should not be returned for the AS400 Inbound Channel, Since its already supressed

  Scenario: Validate According to outbound CCT  CSA Channel, 1430 Offer should not be returned for the AS400  Inbound Channel, Since its already supressed
    Given Condition a 1430 Offer Customer According to outbound CCT  CSA Channel, And the Customer is Accepted the Offer in CSA Channel
    When Run the OutBound Scheduler
    And Open the CSA Batch file
    And Verify the Offer is available for the Customer
    Then Take the CID and And perform the post operation on the AS400 SOAP call
    And Verify the Offer should not be returned for the AS400 Inbound Channel, Since its already supressed


#	Control Group Test Case

  Scenario: Validate the customer according to the 1430 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
    Given condition the customer according to the 1430 eligibility criteria
    And clear the IH and run the SOAP call And it should not go to Control
    When perform the SOAP operation and check the response
    Then SOAP response should have 1430 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as N in IH


#	Cross Supression Between AS400 And NOVA


  Scenario: Validate AS400 Response for Disposition Accept that Offer should not be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Accept in AS400
    And Check the getInteractions in NOVA
    Then Offer should not be returned in NOVA According to Kill Matrix

  Scenario: Validate AS400 Response for Disposition Decline that Offer should not be returned in NOVA According to Kill in next 90 Days Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Decline in AS400
    And Check the getInteractions in NOVA
    Then Offer should not be returned in NOVA According to Kill in next 90 Days Matrix

  Scenario: Validate AS400 Response for Disposition Book Appointment that Offer should be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Book Appointment in AS400
    And Check the getInteractions in NOVA
    Then Offer should be returned in NOVA According to Kill matrix

  Scenario: Validate AS400 Response for Disposition Refer to Sales that Offer should be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Refer to Sales in AS400
    And Check the getInteractions in NOVA
    Then Offer should be returned in NOVA According to Kill matrix

  Scenario: Validate AS400 Response for Disposition Refer to Other Team that Offer should be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Refer to Other Team in AS400
    And Check the getInteractions in NOVA
    Then Offer should be returned in NOVA According to Kill matrix

  Scenario: Validate AS400 Response for Disposition Customer Self-Serve that Offer should be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Customer Self-Serve in AS400
    And Check the getInteractions in NOVA
    Then Offer should be returned in NOVA According to Kill matrix

  Scenario: Validate AS400 Response for Disposition Customer Defer that Offer should be returned in NOVA According to Kill Matrix
    Given Perform GetNBA in AS400
    When Perform Set Disposition Customer Defer in AS400
    And Check the getInteractions in NOVA
    Then Offer should be returned in NOVA According to Kill matrix


#	Supression File From PEGA TO CCT


  Scenario: Verify the supression records performed based on the disposition and kill matrix logic
    Given Precond: Make sure Dispositions were performed for few customers in AS400 and NOVA channels
    When Generate the Supression file from PEGA to CCT
    Then Verify the supression records performed based on the disposition and kill matrix logic


#	Unica Disposition table agianst the NOVA offer as per Kill matrix


  Scenario: Verify According to the dispositions performed for 1430 offers other than AS400 channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
    Given Precond: Make sure Dispositions were performed for 1430 offers other than AS400 channels
    When Generate the disposition file in CCT  and send it to PEGA
    Then As per the supression and kill matrix logic leads should be displayed/supressed in all the channels


#	End channel Testing for offer 1430 presentment for all applicable teams


  Scenario: Validate AS400 Response for Mortage Renewal End channel Testing for offer 1430 presentment for all applicable teams
    Given Log in to AS400 System with service team
    When Go to TCS screen
    And Search customer by providing mortgage number
    And Select offer in the NBA list screen
    Then Verify the Presentment details in the NBA List and detailed screen


#	End channel Testing for all dispositions of offer 1430


  Scenario: Validate AS400 Response for Mortage Renewal End channel Testing for all dispositions of offer 1430
    Given Log in to AS400 System  with service team
    When Go to TCS screen
    And Search customer by providing mortgage number
    And Select offer in the NBA list screen
    And Verify the Presentment details in the NBA List and detailed screen
    Then Select a  disposition from the list and perform


#	End channel Testing for talking points of 1430


  Scenario: Validate AS400 Response for Mortage Renewal End channel Testing for talking points of offer 1430
    Given Log in to AS400 System with service team
    When Go to TCS screen
    And Search customer by providing mortgage number
    And Select offer in the NBA list screen
    And Verify the Presentment details in the NBA List and detailed screen
    And Press F1
    Then verify the talking points are displayed in the  explorer


#	End channel Testing for fulfillment of offer 1430


  Scenario: Validate AS400 Response for Mortage Renewal End Channel Testing For Fulfillment of Offer 1430
    Given Log in to AS400 System with service team
    When Go to TCS screen
    And Search customer by providing mortgage number
    And Select offer in the NBA list screen
    Then Verify the Presentment details in the NBA List and detailed screen


#	AS400 Extract Testing


  Scenario: Validate AS400 Extract Testing

	




















	

	
	
	






















































































	
	
  
	
	
  