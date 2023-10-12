Feature: Nova Inbound Test Cases

  Scenario: Validate NOVA Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL
    Given Condition the test data according to the Nova Inbound Eligibility with Customer_BANKRUPTCY_DT= NULL_SOL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_BOR
    Given Condition the test data according to the Nova Inbound Eligibility with Customer_BANKRUPTCY_DT= NULL_BOR
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CUST_TP_CD = PSNL
    Given Condition the test data according to the Nova Inbound Eligibility with CUST_TP_CD = PSNL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_SOL_LAST_LOGIN_DT = !NULL
    Given Condition the test data according to the Nova Inbound Eligibility with SOL_LAST_LOGIN_DT = !NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MOB_LAST_LOGIN_DT = !NULL
    Given Condition the test data according to the Nova Inbound Eligibility with MOB_LAST_LOGIN_DT = !NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Deceased_F = N
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = N
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = E
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = E
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = EN
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = EN
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = F
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = F
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = FR
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = FR
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = e
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = e
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = en
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = en
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = f
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = f
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_LANG_CD = fr
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = fr
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CR_RSK_IND != (D,E)
    Given Condition the test data according to the Nova Inbound Eligibility with CR_RSK_IND != (D,E)
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CR_RSK_IND = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with CR_RSK_IND = NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_INDV_FRST_NM = !NULL
    Given Condition the test data according to the Nova Inbound Eligibility with INDV_FRST_NM = !NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_INDV_LAST_NM = !NULL
    Given Condition the test data according to the Nova Inbound Eligibility with INDV_LAST_NM = !NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_RENEW_LIMITED_F = 0
    Given Condition the test data according to the Nova Inbound Eligibility with RENEW_LIMITED_F = 0
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_RENEW_LIMITED_F >2
    Given Condition the test data according to the Nova Inbound Eligibility with RENEW_LIMITED_F >2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CASHBACK_F  = N
    Given Condition the test data according to the Nova Inbound Eligibility with CASHBACK_F  = N
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CASHBACK_F  = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with CASHBACK_F  = NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_NOT_FRCLSR_F = Y
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_NOT_FRCLSR_F = Y
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_NOT_FRCLSR_F = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_NOT_FRCLSR_F = NULL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_SRC_SYS_PRD_CD != (911,931,951)
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_SYS_PRD_CD != (911,931,951)
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_INTEREST_RATE >0
    Given Condition the test data according to the Nova Inbound Eligibility with INTEREST_RATE >0
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_AMORTIZATION_REMAIN = 26
    Given Condition the test data according to the Nova Inbound Eligibility with AMORTIZATION_REMAIN = 26
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_AMORTIZATION_REMAIN > 26
    Given Condition the test data according to the Nova Inbound Eligibility with AMORTIZATION_REMAIN > 26
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 2
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 3
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 3
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 4
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 4
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 5
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 5
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 6
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 6
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_PB_TRANSIT_REGION = 7
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION = 7
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_ARREARS_MONTHS < 0
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_ARREARS_MONTHS < 0
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS  > 0 Should be > AMORTIZATION_REMAIN
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS <= 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS <= 0  AMORTIZATION_REMAIN < MORT_CONTR_AMORT_MONTHS
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_FUND_CODE !=(1900, 1901, 1902, 1912, 1916, 1922, 1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600)
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_FUND_CODE !=(1900, 1901, 1902, 1912, 1916, 1922, 1904, 1905, 1910, 1924, 0526,0528,0533,0549,0550,0551,0595,0600)
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate Validate NOVA Response for Mortage Renewal_TERM = Any Numeric
    Given Condition the test data according to the Nova Inbound Eligibility with TERM = Any Numeric
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CRNT_BAL_AMT = 20000
    Given Condition the test data according to the Nova Inbound Eligibility with CRNT_BAL_AMT = 20000
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_CRNT_BAL_AMT > 20000
    Given Condition the test data according to the Nova Inbound Eligibility with CRNT_BAL_AMT > 20000
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_SRC_ACCT_STAT_CD = Active
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_ACCT_STAT_CD = Active
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_EDW_ACCT_STAT_CD = A
    Given Condition the test data according to the Nova Inbound Eligibility with EDW_ACCT_STAT_CD = A
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_SCD_NUM = 13 Digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with SCD_NUM = 13 Digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_MORT_COMM_TYPE = Residential
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_COMM_TYPE = Residential
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_ACCT_NUM = 23 Digit Numeric Value
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_NUM = 23 Digit Numeric Value
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = SOL
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_ACCT_SUBSYS_ID = UO
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = UO
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_ACCT_SUBSYS_ID = AC
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    Given Condition the test data according to the Nova Inbound Eligibility with Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    Given Condition the test data according to the Nova Inbound Eligibility with Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COB for one Account
    Given Condition the test data according to the Nova Inbound Eligibility with BANKRUPTCY != NULL for COB for one Account
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Multiple Accounts Mortage Renewal_BANKRUPTCY != NULL for COS for one Account
    Given Condition the test data according to the Nova Inbound Eligibility with BANKRUPTCY != NULL for COS for one Account
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Deceased_F = N for COB
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = N for COB
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Mortage Renewal_Deceased_F = N for COS
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = N for COS
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Multiple Accounts Mortage Renewal_Deceased_F = Y for COB for one Account
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = Y for COB for one Account
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate NOVA Response for Multiple Accounts Mortage Renewal_Deceased_F = Y for COS for one Account
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = Y for COS for one Account
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # T6 -1430 Offer  - Segmentation - Positve Test cases


  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # T5 - 4862 Offer - SOL- Segmentation - Positve Test cases


  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT > 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT > 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # T4 - 4864 Offer - Segmentation - Positve Test cases


  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT > 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT > 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # T3 - 4866 Offer - Segmentation - Positve Test cases  (ACCT_DIM.MAT_DT <= 2021-05-31 AND CUST_DIM.ASSIGNED_FA_ID is not null/blank)


  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # T1 - 4870 Offer - Segmentation - Positve Test cases  (ACCT_DIM.MAT_DT <= 2021-05-31 AND CUST_DIM.ASSIGNED_FA_ID is not null/blank)


  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT  And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT =20000 and Count <=2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count < 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count = 2 And ASSIGNED_FA_ID = 7digit Number
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And Validate the SOAP Response Against the Proposition, IH and the DB values for this Particular CID


 # Negative Test cases


  Scenario: Validate NOVA Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_SOL
    Given Condition the test data according to the Nova Inbound Eligibility with Primary_Customer_BANKRUPTCY_DT != NULL_SOL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH.

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_BOR
    Given Condition the test data according to the Nova Inbound Eligibility with Primary_Customer_BANKRUPTCY_DT != NULL_BOR
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_CUST_TP_CD != PSNL
    Given Condition the test data according to the Nova Inbound Eligibility with CUST_TP_CD != PSNL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_CUST_TP_CD = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with CUST_TP_CD = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = Y
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = Y
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_LANG_CD = K
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = K
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_LANG_CD = NE
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = NE
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_LANG_CD = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with LANG_CD = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_CR_RSK_IND = D
    Given Condition the test data according to the Nova Inbound Eligibility with CR_RSK_IND = D
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_CR_RSK_IND = E
    Given Condition the test data according to the Nova Inbound Eligibility with CR_RSK_IND = E
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 1
    Given Condition the test data according to the Nova Inbound Eligibility with RENEW_LIMITED_F = 1
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 2
    Given Condition the test data according to the Nova Inbound Eligibility with RENEW_LIMITED_F = 2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_CASHBACK_F  = Y
    Given Condition the test data according to the Nova Inbound Eligibility with CASHBACK_F  = Y
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_NOT_FRCLSR_F = N
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_NOT_FRCLSR_F = N
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 911
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_SYS_PRD_CD = 911
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 931
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_SYS_PRD_CD = 931
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 951
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_SYS_PRD_CD = 951
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MAT_DT - Current Date != (6,5,4,3,1)
    Given Condition the test data according to the Nova Inbound Eligibility with MAT_DT - Current Date != (6,5,4,3,1)
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_AMORTIZATION_REMAIN < 26
    Given Condition the test data according to the Nova Inbound Eligibility with AMORTIZATION_REMAIN < 26
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_ARREARS_MONTHS > 0
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_ARREARS_MONTHS > 0
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_ACCT_STAT_CD = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = Open
    Given Condition the test data according to the Nova Inbound Eligibility with SRC_ACCT_STAT_CD = Open
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_EDW_ACCT_STAT_CD = B
    Given Condition the test data according to the Nova Inbound Eligibility with EDW_ACCT_STAT_CD = B
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_EDW_ACCT_STAT_CD = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with EDW_ACCT_STAT_CD = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_NOVA_SCD_NUM = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with NOVA_SCD_NUM = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_NOVA_SCD_NUM = BLANK
    Given Condition the test data according to the Nova Inbound Eligibility with NOVA_SCD_NUM = BLANK
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_COMM_TYPE != Residential
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_COMM_TYPE != Residential
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_MORT_COMM_TYPE = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with MORT_COMM_TYPE = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BLANK
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = BLANK
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = Zero
    Given Condition the test data according to the Nova Inbound Eligibility with IP_AR_RELATN_TYPE_CD = Zero
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != UO
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID != UO
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != AC
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID != AC
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB
    Given Condition the test data according to the Nova Inbound Eligibility with BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS
    Given Condition the test data according to the Nova Inbound Eligibility with BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB
    Given Condition the test data according to the Nova Inbound Eligibility with BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming for Mortage Renewal_INTEREST_RATE < 0
    Given Condition the test data according to the Nova Inbound Eligibility with INTEREST_RATE < 0
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = Y for COBorrower
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = Y for COBorrower
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate NOVA Response is not coming  for Mortage Renewal_Deceased_F = Y for COS
    Given Condition the test data according to the Nova Inbound Eligibility with Deceased_F = Y for COS
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


 # NOVA - T6 - 1430 - SOL -Segmentation - Negative Test cases


  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


  # NOVA - T5 - 4862 - SOL - Segmentation - Negative Test cases


  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


 # T4 - 4864 - Segmentation - Negative Test cases


  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


 # T3 - 4866 - Segmentation - Negative Test cases (ACCT_DIM.MAT_DT <= 2021-05-31 AND CUST_DIM.ASSIGNED_FA_ID is not null/blank)


  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DTand AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DTand AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


 # NOVA - T1 - 4870 - Segmentation - Negative Test cases  (ACCT_DIM.MAT_DT <= 2021-05-31 AND CUST_DIM.ASSIGNED_FA_ID is not null/blank)
  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT  and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <2 And ASSIGNED_FA_ID = 7 digit Numberic
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DTand AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    Given Condition the test data according to the Nova Inbound Eligibility with ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DTand AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2 And ASSIGNED_FA_ID = NULL
    When Perform the getInteraction operation for this customer
    Then Offer Should not be displayed in the SOAP Response
    And There should be no entry in the IH


 # T6 - 1430 - Disposition Test Cases


  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal and Perform Accept(ATC) disposition in NOVA Channel and give a SOAP call in NOVA channel then offer should not display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display

  Scenario: Validate T6 1430 NOVA Response of Mortgage Renewal and Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in NOVA channel  then offer should display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display


 # T5 - 4862 - Disposition Test Cases


  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal and Perform Accept(ATC) disposition in NOVA Channel and give a SOAP call in NOVA channel then offer should not display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display

  Scenario: Validate T5 4862 NOVA Response of Mortgage Renewal and Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in NOVA channel  then offer should display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display


 # T4 - 4864 - Disposition Test Cases


  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal and Perform Accept(ATC) disposition in NOVA Channel and give a SOAP call in NOVA channel then offer should not display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display

  Scenario: Validate T4 4864 NOVA Response of Mortgage Renewal and Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in NOVA channel  then offer should display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display


 # T3 - 4866 - Disposition Test Cases


  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal and Perform Accept(ATC) disposition in NOVA Channel and give a SOAP call in NOVA channel then offer should not display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display

  Scenario: Validate T3 4866 NOVA Response of Mortgage Renewal and Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in NOVA channel  then offer should display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display


 # T1 - 4870 - Disposition Test Cases


  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal and Perform Accept(ATC) disposition in NOVA Channel and give a SOAP call in NOVA channel then offer should not display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should not display

  Scenario: Validate T1 4870 NOVA Response of Mortgage Renewal and Perform Viewed(VWD) disposition in NOVA Channel and give a SOAP call in NOVA channel  then offer should display
    Given Condition the test data according to the Nova Inbound Eligibility
    When Perform the getInteraction operation for this customer
    Then Set disposition by giving CID, response tracking code, treatment tracking code & disposition tracking code
    And There offer should display


 # Priority Multiple Mortgage Renewal Offers Test Cases


  Scenario: Validate NOVA Response of multiple Mortgage Renewals offers and the Offer is displayed based on Higher ACCT_DIM.CRNT_BAL_AMT
    Given Condition the test data according to the Nova Inbound Eligibility with multiple Mortgage Renewals offers
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on Higher ACCT_DIM.CRNT_BAL_AMT

  Scenario: Validate NOVA Response for multiple Mortgage Renewals offers with same CRNT_BAL_AMT,Lowest accountnumber  Mortgage Renewals offer is displayed
    Given Condition the test data according to the Nova Inbound Eligibility with multiple Mortgage Renewals offers with same CRNT_BAL_AMT
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on Lowest accountnumber


 # Priority Same Mortgage Renewal Offers Test Cases


  Scenario: Validate that prioritization is applied with in the same Mortgage renewal offers when presenting a NOVA offer for a customer  is displayed for higher ACCT_DIM.CRNT_BAL_AMT
    Given Condition the test data according to the Nova Inbound Eligibility with same Mortgage renewal offers when presenting a NOVA offer for a customer
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on higher ACCT_DIM.CRNT_BAL_AMT

  Scenario: Validate that prioritization is applied with in the same Mortgage renewal offer when presenting a NOVA offer for a customer with same CRNT_BAL_AMT,Lowest accountnumber  Mortgage Renewals offer is displayed
    Given Condition the test data according to the Nova Inbound Eligibility with same Mortgage renewal offers when presenting a NOVA offer for a customer with same CRNT_BAL_AMT
    When Perform the getInteraction operation for this customer
    Then Check then SOAP Response
    And There Offer should display based on Lowest accountnumber




#
#  Scenario: Validate According to outbound CCT SOL Channel, 1430 Offer is returned for the NOVA Inbound Channel
#    GIVEN Condition a 1430 Offer Customer According to outbound CCT SOL Channel, Make Sure that this Customer not Eligble For Inbound NOVA channel
#	When Run the OutBound Scheduler
#    And Open the CCT Batch file
#    And Verify the Offer is available for the Customer
#    Then Take the CID and And perform the post operation on the NOVA SOAP call
#    And Verify the Offer is returned for the NOVA Inbound Channel
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4862 Offer is returned for the NOVA Inbound Channel
#   GIVEN Condition a 4862 Offer Customer According to outbound CCT SOL Channel, Make Sure that this Customer not Eligble For Inbound NOVA channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer is returned for the NOVA Inbound Channel
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4864 Offer is returned for the NOVA Inbound Channel
#   GIVEN Condition a 4864 Offer Customer According to outbound CCT SOL Channel, Make Sure that this Customer not Eligble For Inbound NOVA channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer is returned for the NOVA Inbound Channel
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4866 Offer is returned for the NOVA Inbound Channel
#   GIVEN Condition a 4866 Offer Customer According to outbound CCT SOL Channel, Make Sure that this Customer not Eligble For Inbound NOVA channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer is returned for the NOVA Inbound Channel
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4870 Offer is returned for the NOVA Inbound Channel
#   GIVEN Condition a 4870 Offer Customer According to outbound CCT SOL Channel, Make Sure that this Customer not Eligble For Inbound NOVA channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer is returned for the NOVA Inbound Channel
#
#
#
#  Scenario: Validate According to outbound CCT SOL Channel, 1430 Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#   GIVEN Condition a 1430 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4862 Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#   GIVEN Condition a 4862 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4864 Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#   GIVEN Condition a 4864 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4866 Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#   GIVEN Condition a 4866 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#
#  Scenario: Validate According to outbound CCT SOL Channel, 4870 Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#   GIVEN Condition a 4870 Offer Customer According to outbound CCT SOL Channel, And the Customer is Accepted the Offer in SOL Channel
#   When Run the OutBound Scheduler
#   And Open the CCT Batch file
#   And Verify the Offer is available for the Customer
#   Then Take the CID and And perform the post operation on the NOVA SOAP call
#   And Verify the Offer should not be returned for the NOVA Inbound Channel, Since its already supressed
#
#
#   # Control Group Test Case
#
#
#  Scenario: Validate the customer according to the 1430 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
#    Given condition the customer according to the 1430 eligibility criteria
#    And clear the IH and run the SOAP call And it should not go to Control
#    When perform the SOAP operation and check the response
#    Then SOAP response should have 1430 offer
#    Then go to Pega and search with your CID in the interaction History
#    Then check the Control Group Status as N in IH
#
#  Scenario: Validate the customer according to the 4862 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
#    Given condition the customer according to the 4862 eligibility criteria
#    And clear the IH and run the SOAP call And it should not go to Control
#    When perform the SOAP operation and check the response
#    Then SOAP response should have 4862 offer
#    Then go to Pega and search with your CID in the interaction History
#    Then check the Control Group Status as N in IH
#
#  Scenario: Validate the customer according to the 4864 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
#    Given condition the customer according to the 4864 eligibility criteria
#    And clear the IH and run the SOAP call And it should not go to Control
#    When perform the SOAP operation and check the response
#    Then SOAP response should have 4864 offer
#    Then go to Pega and search with your CID in the interaction History
#    Then check the Control Group Status as N in IH
#
#  Scenario: Validate the customer according to the 4866 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
#    Given condition the customer according to the 4866 eligibility criteria
#    And clear the IH and run the SOAP call And it should not go to Control
#    When perform the SOAP operation and check the response
#    Then SOAP response should have 4866 offer
#    Then go to Pega and search with your CID in the interaction History
#    Then check the Control Group Status as N in IH
#
#  Scenario: Validate the customer according to the 4870 eligibility criteria, offer should display in SOAP response and Control Group Status as N in IH
#    Given condition the customer according to the 4870 eligibility criteria
#    And clear the IH and run the SOAP call And it should not go to Control
#    When perform the SOAP operation and check the response
#    Then SOAP response should have 4870 offer
#    Then go to Pega and search with your CID in the interaction History
#    Then check the Control Group Status as N in IH
#
#
#	# Cross Supression Between NOVA AND AS400
#
#
#  Scenario: Validate NOVA Response for Mortage Renewal that Offer should not be returned in AS400 According to Kill Matrix
#    Given Perform GetInteractions in NOVA
#    When Perform Set Disposition Accept in NOVA
#    AND Check the get NBA in AS400
#    Then Offer should not be returned in AS400 According to Kill Matrix
#
#  Scenario: Validate NOVA Response for Mortage Renewal that Offer should be returned in AS400 According to Kill Matrix
#    Given Perform GetInteractions in NOVA
#    When Perform Set Disposition Accept in NOVA
#    AND Check the get NBA in AS400
#    Then Offer should be returned in AS400 According to Kill Matrix
#
#
#
#	# Supression File From PEGA TO CCT
#
#
#  Scenario: Verify the supression records performed based on the disposition and kill matrix logic
#	GIVEN Precond: Make sure Dispositions were performed for few customers in AS400 and NOVA channels
#    WHEN Generate the Supression file from PEGA to CCT
#    THEN Verify the supression records performed based on the disposition and kill matrix logic
#
#
#
#	# Unica Disposition table agianst the NOVA offer as per Kill matrix
#
#
#  Scenario: Verify According to the dispositions performed for 1430 offers other than NOVA channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#	GIVEN Precond: Make sure Dispositions were performed for 1430 offers other than NOVA channels
#    WHEN Generate the disposition file in CCT  and send it to PEGA
#    THEN As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#
#  Scenario: Verify According to the dispositions performed for 4862 offers other than NOVA channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#	GIVEN Precond: Make sure Dispositions were performed for 4862 offers other than NOVA channels
#    WHEN Generate the disposition file in CCT  and send it to PEGA
#    THEN As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#
#  Scenario: Verify According to the dispositions performed for 4864 offers other than NOVA channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#	GIVEN Precond: Make sure Dispositions were performed for 4864 offers other than NOVA channels
#    WHEN Generate the disposition file in CCT  and send it to PEGA
#    THEN As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#
#  Scenario: Verify According to the dispositions performed for 4866 offers other than NOVA channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#	GIVEN Precond: Make sure Dispositions were performed for 4866 offers other than NOVA channels
#    WHEN Generate the disposition file in CCT  and send it to PEGA
#    THEN As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#
#  Scenario: Verify According to the dispositions performed for 4870 offers other than NOVA channels, As per the supression and kill matrix logic leads should be displayed/supressed in all the channels
#	GIVEN Precond: Make sure Dispositions were performed for 4870 offers other than NOVA channels
#    WHEN Generate the disposition file in CCT  and send it to PEGA
#    THEN As per the supression and kill matrix logic leads should be displayed/supressed in all the channels