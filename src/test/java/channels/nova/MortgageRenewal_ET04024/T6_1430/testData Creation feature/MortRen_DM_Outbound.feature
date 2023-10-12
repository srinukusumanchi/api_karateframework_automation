Feature: DM Outbound Test Cases

  Scenario: Validate DM Response for Mortage Renewal_BANKRUPTCY_DT = NULL_SOL
    Given Condition the customer where (BANKRUPTCY_DT = NULL_SOL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_BANKRUPTCY_DT = NULL_BOR
    Given Condition the customer where (BANKRUPTCY_DT = NULL_BOR) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB
    Given Condition the customer where (Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COB) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS
    Given Condition the customer where (Primary Customer_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT = NULL_COS) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COB As CoBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = SOL As Primary Customer COS As CoBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COB As CoBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BOR As Primary Customer COS As CoBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_Deceased_F = N for Primary Customer
    Given Condition the customer where (Deceased_F = N for Primary Customer) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_Deceased_F = N for COB
    Given Condition the customer where (Deceased_F = N for COB) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response for Mortage Renewal_Deceased_F = N for COS
    Given Condition the customer where (Deceased_F = N for COS) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
	
#	DM - T6 -1430 Offer - NONSOL  - Segmentation - Positive Test cases

	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN =26 and CRNT_BAL_AMT = 20000 and Count =2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN =26 and CRNT_BAL_AMT = 20000 and Count =2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
	
#	DM - T3 - 4866 Offer - NONSOL - Segmentation - Positve Test cases

	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  > 26 and CRNT_BAL_AMT > 20000 and Count < 2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  > 26 and CRNT_BAL_AMT > 20000 and Count < 2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN =26 and CRNT_BAL_AMT = 20000 and Count =2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN =26 and CRNT_BAL_AMT = 20000 and Count =2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer has got a Mortgage Renewal offer in DM channel
	
	
#	DM - Negative Test cases

	
  Scenario: Validate DM Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_SOL
    Given Condition the customer where (Primary_Customer_BANKRUPTCY_DT != NULL_SOL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_Primary_Customer_BANKRUPTCY_DT != NULL_BOR
    Given Condition the customer where (Primary_Customer_BANKRUPTCY_DT != NULL_BOR) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB
    Given Condition the customer where (BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COB) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS
    Given Condition the customer where (BANKRUPTCY_DT= NULL_SOL AND CoBorrower_BANKRUPTCY_DT!= NULL_COS) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB
    Given Condition the customer where (BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COB) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COS
    Given Condition the customer where (BANKRUPTCY_DT!= NULL_SOL AND CoBorrower_BANKRUPTCY_DT= NULL_COS) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CUST_TP_CD != PSNL
    Given Condition the customer where (CUST_TP_CD != PSNL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CUST_TP_CD = NULL
    Given Condition the customer where (CUST_TP_CD = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming  for Mortage Renewal_Deceased_F = Y for COBorrower
    Given Condition the customer where (Deceased_F = Y for COBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming  for Mortage Renewal_Deceased_F = NULL for CoBorrower
    Given Condition the customer where (Deceased_F = NULL for CoBorrower) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming  for Mortage Renewal_Deceased_F = Y for Primary Customer
    Given Condition the customer where (Deceased_F = Y for Primary Customer) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming  for Mortage Renewal_Deceased_F = NULL for Primary Customer
    Given Condition the customer where (Deceased_F = NULL for Primary Customer) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_LANG_CD = K
    Given Condition the customer where (LANG_CD = K) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_LANG_CD = NE
    Given Condition the customer where (LANG_CD = NE) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_LANG_CD = NULL
    Given Condition the customer where (LANG_CD = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CR_RSK_IND = D
    Given Condition the customer where (CR_RSK_IND = D) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CR_RSK_IND = E
    Given Condition the customer where (CR_RSK_IND = E) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 1
    Given Condition the customer where (RENEW_LIMITED_F = 1) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_RENEW_LIMITED_F = 2
    Given Condition the customer where (RENEW_LIMITED_F = 2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CASHBACK_F  = Y
    Given Condition the customer where (CASHBACK_F  = Y) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_NOT_FRCLSR_F = N
    Given Condition the customer where (MORT_NOT_FRCLSR_F = N) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 911
    Given Condition the customer where (SRC_SYS_PRD_CD = 911) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 931
    Given Condition the customer where (SRC_SYS_PRD_CD = 931) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_SRC_SYS_PRD_CD = 951
    Given Condition the customer where (SRC_SYS_PRD_CD = 951) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_INTEREST_RATE = 0
    Given Condition the customer where (INTEREST_RATE = 0) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_INTEREST_RATE < 0
    Given Condition the customer where (INTEREST_RATE < 0) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MAT_DT - Current Date != (7,4)
    Given Condition the customer where (MAT_DT - Current Date != (7,4)) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_AMORTIZATION_REMAIN < 26
    Given Condition the customer where (AMORTIZATION_REMAIN < 26) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)
    Given Condition the customer where (MORT_PB_TRANSIT_REGION != (2,3,4,5,6,7)) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_ARREARS_MONTHS > 0
    Given Condition the customer where (MORT_ARREARS_MONTHS > 0) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL
    Given Condition the customer where (MORT_ADJ_CONTR_AMORT_REMAIN_MONTHS = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)
    Given Condition the customer where (MORT_FUND_CODE = (1900, 1901, 1902, 1912, 1916, 1922)) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)
    Given Condition the customer where (MORT_FUND_CODE = (1904, 1905, 1910, 1924) and ACCT_DIM.SERV_TRNST_NUM = 12088)) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = NULL
    Given Condition the customer where (SRC_ACCT_STAT_CD = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_SRC_ACCT_STAT_CD = Open
    Given Condition the customer where (SRC_ACCT_STAT_CD = Open) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_COMM_TYPE != Residential
    Given Condition the customer where (MORT_COMM_TYPE != Residential) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_MORT_COMM_TYPE = NULL
    Given Condition the customer where (MORT_COMM_TYPE = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = BLANK
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = BLANK) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = NULL
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_IP_AR_RELATN_TYPE_CD = Zero
    Given Condition the customer where (IP_AR_RELATN_TYPE_CD = Zero) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_ACCT_SUBSYS_ID != UO
    Given Condition the customer where (ACCT_SUBSYS_ID != UO) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_DO_NOT_EMAIL_F = N
    Given Condition the customer where (DO_NOT_EMAIL_F = N) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_DO_NOT_EMAIL_F = NULL
    Given Condition the customer where (DO_NOT_EMAIL_F = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CUST_ADDR_ISSUE_F = Y
    Given Condition the customer where (CUST_ADDR_ISSUE_F = Y) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_ACCT_DIM.SERV_TRNST_NUM = NULL
    Given Condition the customer where (ACCT_DIM.SERV_TRNST_NUM = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_CUST_AGE = NULL
    Given Condition the customer where (CUST_AGE = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_INTEREST_RATE = NULL
    Given Condition the customer where (INTEREST_RATE = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate DM Response is not coming for Mortage Renewal_FIXED_VAR_F = NULL
    Given Condition the customer where (FIXED_VAR_F = NULL) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
	
#	DM - T6 -1430 Offer - NONSOL - Segmentation - Negative Test cases

	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T6 1430 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
	
#	DM - T3 - 4866 Offer - NONSOL - Segmentation - Negative Test cases

	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  has some value  and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN  < 26 and CRNT_BAL_AMT >=20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT < 20000 and Count <=2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
  Scenario: Validate T3 4866 DM Response of Mortgage Renewal is not coming for NON-SOL Segmentation Where SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2
    Given Condition the customer where (SOL_LAST_LOGIN_DT And MOB_LAST_LOGIN_DT  are NULL and AMORTIZATION_REMAIN > =26 and CRNT_BAL_AMT >= 20000 and Count > 2) along with general eligibility criteria
    When run the batch file for DM channel 
    Then open the DM channel file 
    And verify that customer didn't get Mortgage Renewal offer in DM channel
	
	
	
	