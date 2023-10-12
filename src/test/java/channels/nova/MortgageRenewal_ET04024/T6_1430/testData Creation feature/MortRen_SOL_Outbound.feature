Feature: SOL Outbound Test Cases

  Scenario: Validate CC SOL Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    Given Condition the customer where (Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_BOR AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    Given Condition the customer where (Primary Customer_BANKRUPTCY_DT= NULL_BOR AND CoBorrower_BANKRUPTCY_DT = NULL_COS) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COS As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB and COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB and COS As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB and COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB and COS As CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_Deceased_F = N for Primary Customer
    Given Condition the customer where (Deceased_F = N for Primary Customer) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_Deceased_F = N for COB
    Given Condition the customer where (Deceased_F = N for COB) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate CC SOL Response for Mortage Renewal_Deceased_F = N for COS
    Given Condition the customer where (Deceased_F = N for COS) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
	
#	T6 -1430 Offer  - Segmentation - Positve Test cases

	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT  =20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT  =20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
  
	
#	T5 - 4862 Offer - Segmentation - Positve Test cases

	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

	
#	T4 - 4864 Offer - Segmentation - Positve Test cases

	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count  = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count  = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
	
#	T3 - 4866 Offer - Segmentation - Positve Test cases

	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT =20000 and Count = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count  = 2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And  SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN = 26 and CRNT_BAL_AMT = 20000 and Count  = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
	
#	Negative Test cases

	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL
    Given Condition the customer where (Primary_Customer_BANKRUPTCY_DT != NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_Secondary_Customer_BANKRUPTCY_DT != NULL
    Given Condition the customer where (Secondary_Customer_BANKRUPTCY_DT != NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_Secondary_Customer_BANKRUPTCY_DT != NULL And Primary_Customer_BANKRUPTCY_DT = NULL
    Given Condition the customer where (Secondary_Customer_BANKRUPTCY_DT != NULL And Primary_Customer_BANKRUPTCY_DT = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_Secondary_Customer_BANKRUPTCY_DT = NULL And Primary_Customer_BANKRUPTCY_DT != NULL
    Given Condition the customer where (Secondary_Customer_BANKRUPTCY_DT = NULL And Primary_Customer_BANKRUPTCY_DT != NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_CUST_TP_CD != PSNL
    Given Condition the customer where (CUST_TP_CD != PSNL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_CUST_TP_CD = NULL
    Given Condition the customer where (CUST_TP_CD = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SOL_LAST_LOGIN_DT = NULL
    Given Condition the customer where (SOL_LAST_LOGIN_DT = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MOB_LAST_LOGIN_DT = NULL
    Given Condition the customer where (MOB_LAST_LOGIN_DT = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming  for Mortage Renewal_Deceased_F = Y for COBorrower
    Given Condition the customer where (Deceased_F = Y for COBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming  for Mortage Renewal_Deceased_F = NULL for CoBorrower
    Given Condition the customer where (Deceased_F = NULL for CoBorrower) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming  for Mortage Renewal_Deceased_F = Y for Primary Customer
    Given Condition the customer where (Deceased_F = Y for Primary Customer) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming  for Mortage Renewal_Deceased_F = NULL for Primary Customer
    Given Condition the customer where (Deceased_F = NULL for Primary Customer) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_LANG_CD = K
    Given Condition the customer where (LANG_CD = K) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_LANG_CD = NE
    Given Condition the customer where (LANG_CD = NE) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_LANG_CD = NULL
    Given Condition the customer where (LANG_CD = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_CR_RSK_IND = D
    Given Condition the customer where (CR_RSK_IND = D) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_CR_RSK_IND = E
    Given Condition the customer where (CR_RSK_IND = E) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 1
    Given Condition the customer where (RENEW_LIMITED_F = 1) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 2
    Given Condition the customer where (RENEW_LIMITED_F = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_CASHBACK_F  = Y
    Given Condition the customer where (CASHBACK_F  = Y) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_NOT_FRCLSR_F = N
    Given Condition the customer where (MORT_NOT_FRCLSR_F = N) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 911
    Given Condition the customer where (SRC_SYS_PRD_CD = 911) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 931
    Given Condition the customer where (SRC_SYS_PRD_CD = 931) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 951
    Given Condition the customer where (SRC_SYS_PRD_CD = 951) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_INTEREST_RATE = 2
    Given Condition the customer where (INTEREST_RATE = 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_INTEREST_RATE < 2
    Given Condition the customer where (INTEREST_RATE < 2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MAT_DT - Current Date != (7,6,5,4,2)
    Given Condition the customer where (MAT_DT - Current Date != (7,6,5,4,2)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_AMORTIZATION_REMAIN < 26
    Given Condition the customer where (AMORTIZATION_REMAIN < 26) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    Given Condition the customer where (MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_ARREARS_MONTHS > 0
    Given Condition the customer where (MORT_ARREARS_MONTHS > 0) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    Given Condition the customer where (MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = BLANK
    Given Condition the customer where (MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = BLANK) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    Given Condition the customer where (MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the customer where (MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the customer where (MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the customer where (MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = NULL
    Given Condition the customer where (SRC_ACCT_STAT_CD = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = Open
    Given Condition the customer where (SRC_ACCT_STAT_CD = Open) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_EDW_ACCT_STAT_CD = B
    Given Condition the customer where (EDW_ACCT_STAT_CD = B) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_EDW_ACCT_STAT_CD = NULL
    Given Condition the customer where (EDW_ACCT_STAT_CD = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SCD_NUM = NULL
    Given Condition the customer where (SCD_NUM = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_SCD_NUM = Blank
    Given Condition the customer where (SCD_NUM = Blank) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_COMM_TYPE != Residential
    Given Condition the customer where (MORT_COMM_TYPE != Residential) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_MORT_COMM_TYPE = NULL
    Given Condition the customer where (MORT_COMM_TYPE = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_ACCT_NUM = NULL
    Given Condition the customer where (ACCT_NUM = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_ACCT_NUM = BLANK
    Given Condition the customer where (ACCT_NUM = BLANK) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_PRIMARY_ACCT_HOLDER_FLAG = N
    Given Condition the customer where (PRIMARY_ACCT_HOLDER_FLAG = N) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_PRIMARY_ACCT_HOLDER_FLAG = NULL
    Given Condition the customer where (PRIMARY_ACCT_HOLDER_FLAG = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BLANK
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BLANK) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = NULL
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = NULL) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = Zero
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = Zero) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != UO
    Given Condition the customer where (ACCT_SUBSYS_ID != UO) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate SOL Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != AC
    Given Condition the customer where (ACCT_SUBSYS_ID != AC) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
	
#	T6 - 1430 - Segmentation - Negative Test cases

	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T6 1430 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
	
#	T5 - 4862 - Segmentation - Negative Test cases

	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T5 4862 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
	
#	T4 - 4864 - SOL - Segmentation - Negative Test cases

	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T4 4864 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
	
#	T3 - 4866 - Segmentation - Negative Test cases

	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT = NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count =2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = CA and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = B and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN <  26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and MOB_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count >2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
  Scenario: Validate T3 4866 SOL Response of Mortgage Renewal is not coming for SOL Segmentation where ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (ACCT_SUBSYS_ID = AC and EDW_ACCT_STAT_CD = A and  SOL_LAST_LOGIN_DT=NULL And MOB_LAST_LOGIN_DT=NULL and AMORTIZATION_REMAIN >= 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer didn't get the Mortgage Renewal offer in CC channel
	
	
#	Priority Multiple Mortgage Renewal Account Same Py Offers Test Cases

	
  Scenario: Validate multiple Mortgage Renewals offers and the Offer is displayed based on Higher ACCT_DIM.CRNT_BAL_AMT
    Given Condition the customer along with general eligibility criteria with multiple Mortgage Renewals offers
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer should display a Mortgage Renewal offer based on Higher ACCT_DIM.CRNT_BAL_AMT in CC channel
	
  Scenario: Validate multiple Mortgage Renewals offers with same CRNT_BAL_AMT,Lowest accountnumber  Mortgage Renewals offer is displayed
    Given Condition the customer along with general eligibility criteria with multiple Mortgage Renewals offers with same CRNT_BAL_AMT
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer should display a Mortgage Renewal offer based on Lowest accountnumber in CC channel
	
	
#	Priority Multiple Mortgage Renewal Account Different Py Offers Test Cases

	
  Scenario: Validate that prioritization is applied with in the same Mortgage renewal offer for a customer  is displayed for higher ACCT_DIM.CRNT_BAL_AMT
    Given Condition the customer along with general eligibility criteria with same Mortgage renewal offer for a customer
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer should display a Mortgage Renewal offer based on higher ACCT_DIM.CRNT_BAL_AMT in CC channel
	
  Scenario: Validate that prioritization is appliedwith in the same Mortgage renewal offer for a customer with same CRNT_BAL_AMT,Lowest accountnumber  Mortgage Renewals offer is displayed
    Given Condition the customer along with general eligibility criteria with same Mortgage renewal offer for a customer with same CRNT_BAL_AMT
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer should display a Mortgage Renewal offer based on Lowest accountnumber in CC channel
	
	
#	Condition data  for Test coverage for Mortgage Renewal Campaign
	
	
  Scenario: Validate T1 4870 CC OutBound Response of Mortgage Renewal for a customer where Product Code = MRC 
    Given Condition the customer where (Product Code = MRC) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T3 4866 CC OutBound Response of Mortgage Renewal for a customer where Product Code = MTG 
    Given Condition the customer where (Product Code = MTG) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T6 1430, T5 4862 or T4 4864 CC OutBound Response of Mortgage Renewal for a customer where Product Code = MRS
    Given Condition the customer where (Product Code = MRS) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T1 4870 CC OutBound Response of Mortgage Renewal for a customer where Product Name = MTG RETENTION
    Given Condition the customer where (Product Name = MTG RETENTION) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T3 4866 CC OutBound Response of Mortgage Renewal for a customer where Product Name = 3 MONTH RENEWAL 
    Given Condition the customer where (Product Name = 3 MONTH RENEWAL ) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T6 1430 CC OutBound Response of Mortgage Renewal for a customer where Product Name = 6 MONTH EARLY RENEWAL CALLS
    Given Condition the customer where (Product Name = 6 MONTH EARLY RENEWAL CALLS) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T5 4862 or T4 4864 CC OutBound Response of Mortgage Renewal for a customer where Product Name = MTG Renewals-Non CCC Calls
    Given Condition the customer where (Product Name = MTG Renewals-Non CCC Calls) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T1 4870 CC OutBound Response of Mortgage Renewal for a customer where Campaign Name = MTG RETENTION POC 
    Given Condition the customer where (Campaign Name = MTG RETENTION POC) along with general eligibility criteria
    When run the batch file for CC channel 
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T3 4866 CC OutBound Response of Mortgage Renewal for a customer where Campaign Name = MTG RETENTION T3
    Given Condition the customer where (Campaign Name = MTG RETENTION T3) along with general eligibility criteria
    When run the batch file for CC channel 
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T6 1430 CC OutBound Response of Mortgage Renewal for a customer where Campaign Name = MTG RETENTION T6 ET04024
    Given Condition the customer where (Campaign Name = MTG RETENTION T6 ET04024) along with general eligibility criteria
    When run the batch file for CC channel 
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Validate T5 4862 or T4 4864 CC OutBound Response of Mortgage Renewal for a customer where Campaign Name = Mortgage Renew Now ET04024 
    Given Condition the customer where (Campaign Name = Mortgage Renew Now ET04024) along with general eligibility criteria
    When run the batch file for CC channel 
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Verify the Mortage Renewal CC OutBound for a customer where INDV_GNDR_CD  = M
    Given Condition the customer where (INDV_GNDR_CD  = M) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Verify the Mortage Renewal CC OutBound for a customer where INDV_GNDR_CD  = F
    Given Condition the customer where (INDV_GNDR_CD  = F) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel

  Scenario: Verify the Mortage Renewal CC OutBound for a customer where LANG_CD  = F
    Given Condition the customer where (LANG_CD  = F) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
   Scenario: Verify the Mortage Renewal CC OutBound for a customer where LANG_CD  = E
    Given Condition the customer where (LANG_CD  = E) along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that customer has got a Mortgage Renewal offer in CC channel
	
  Scenario: Verify below fields to be populated based on the eligible Mortgage Account  
    Given Condition the customer along with general eligibility criteria
    When run the batch file for CC channel
    Then open the CC channel file
    And verify that below fields to be populated based on the eligible Mortgage Account
	Then |Coborrower Cust ID|
    Then |Mortgage Number|
    Then |Mortgage Maturity Date|
    Then |Current Term (in months)|
    Then |Mortgage Balance|
    Then |CO-BORROWER NAME|






	
	
	
	

	
	
	