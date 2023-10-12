@MANUAL @SFMMORTGAGEACQUISITION

Feature: Manual Test Cases For SFM OutBound Mortage Aquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where CUST_TP_CD = PSNL
    Given Condition the customer where (CUST_TP_CD = PSNL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where Country_CD = CA
    Given Condition the customer where (Country_CD = CA) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where CUST_AGE = 18
    Given Condition the customer where (CUST_AGE = 18) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where CUST_AGE > 18
    Given Condition the customer where (CUST_AGE > 18) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where MRKTBLE_F = Y
    Given Condition the customer where (MRKTBLE_F = Y) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where Deceased_F = N
    Given Condition the customer where (Deceased_F = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = E
    Given Condition the customer where (LANG_CD = E) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = EN
    Given Condition the customer where (LANG_CD = EN) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = F
    Given Condition the customer where (LANG_CD = F) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = FR
    Given Condition the customer where (LANG_CD = FR) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = e
    Given Condition the customer where (LANG_CD = e) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = en
    Given Condition the customer where (LANG_CD = en) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = f
    Given Condition the customer where (LANG_CD = f) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where LANG_CD = fr
    Given Condition the customer where (LANG_CD = fr) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where NOT_AML_KYC = N
    Given Condition the customer where (NOT_AML_KYC = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where NOT_AML_KYC = NULL
    Given Condition the customer where (AML_KYC = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where PRIM_PROV_CD = ONTARIO And CLOSEST_TRANSIT_NUM = 00026
    Given Condition the customer where (PRIM_PROV_CD = ONTARIO And CLOSEST_TRANSIT_NUM = 00026) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where SOL_LAST_LOGIN_DT = NULL
    Given Condition the customer where (SOL_LAST_LOGIN_DT = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where SOL_LAST_LOGIN_DT = BLANK
    Given Condition the customer where (SOL_LAST_LOGIN_DT = BLANK) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where SOL_LAST_LOGIN_DT > 90 Days of Current Date
    Given Condition the customer where (SOL_LAST_LOGIN_DT > 90 Days) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where ASSIGNED_FA_TRANSIT = NULL
    Given Condition the customer where (ASSIGNED_FA_TRANSIT = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where ASSIGNED_FA_TRANSIT = BLANK
    Given Condition the customer where (ASSIGNED_FA_TRANSIT = BLANK) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where DO_NOT_SOLICIT_F = N
    Given Condition the customer where (DO_NOT_SOLICIT_F = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where DO_NOT_SOLICIT_F = NULL
    Given Condition the customer where (DO_NOT_SOLICIT_F = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where DO_NOT_CALL_F = N
    Given Condition the customer where (DO_NOT_CALL_F = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where DO_NOT_CALL_F = NULL
    Given Condition the customer where (DO_NOT_CALL_F = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where INDV_FRST_NM != NULL
    Given Condition the customer where (INDV_FRST_NM != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where INDV_LAST_NM != NULL
    Given Condition the customer where (INDV_LAST_NM != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where INDV_HOME_TEL_NUM != NULL
    Given Condition the customer where (INDV_HOME_TEL_NUM != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where PRIM_CITY_NM != NULL
    Given Condition the customer where (PRIM_CITY_NM != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mortage Acquisition SFM OutBound for a customer where PRIM_POST_CD != NULL
    Given Condition the customer where (PRIM_POST_CD != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


# Segmentation Positive Test Cases

  # LeadType1 Test Cases
  Scenario: Verify the Mort Acq Segmentation SFM OutBound where MLS_LISTING_FLAG = 'Y' And MLS_ADDED_AT_DT = 0-30 Days For Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'Y' And MLS_ADDED_AT_DT = 0-30 Days ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is NULL of Current Date (Digitally InActive) For Getting the Lead Type1
    Given Condition the customer where (SOL_LAST_LOGIN_DT is NULL of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is BLANK of Current Date (Digitally InActive) For Getting the Lead Type1
    Given Condition the customer where (SOL_LAST_LOGIN_DT is BLANK of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is > 90 days of Current Date (Digitally InActive) For Getting the Lead Type1
    Given Condition the customer where (SOL_LAST_LOGIN_DT is > 90 days of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  # Lead Type2 Test Cases

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where MORT_COUNT_30DAY =>1 For Getting the Lead Type2
    Given Condition the customer where (MORT_COUNT_30DAY =>1) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is NULL of Current Date (Digitally InActive) For Getting the Lead Type2
    Given Condition the customer where (SOL_LAST_LOGIN_DT is NULL of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is BLANK of Current Date (Digitally InActive) For Getting the Lead Type2
    Given Condition the customer where (SOL_LAST_LOGIN_DT is BLANK of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is > 90 days of Current Date (Digitally InActive) For Getting the Lead Type2
    Given Condition the customer where (SOL_LAST_LOGIN_DT is > 90 days of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

    #Lead Type 3 Test Cases

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where TV_TS_MORT_FLAG = ‘Y’ For Getting the Lead Type3
    Given Condition the customer where (TV_TS_MORT_FLAG = ‘Y’) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is NULL of Current Date (Digitally InActive) For Getting the Lead Type3
    Given Condition the customer where (SOL_LAST_LOGIN_DT is NULL of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is BLANK of Current Date (Digitally InActive) For Getting the Lead Type3
    Given Condition the customer where (SOL_LAST_LOGIN_DT is BLANK of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is > 90 days of Current Date (Digitally InActive) For Getting the Lead Type3
    Given Condition the customer where (SOL_LAST_LOGIN_DT is > 90 days of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

    # Lead Type4 Test Cases

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where MORT_OUT_PYMT_FLAG = 'Y' For Getting the Lead Type4
    Given Condition the customer where (MORT_OUT_PYMT_FLAG = 'Y') along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is NULL of Current Date (Digitally InActive) For Getting the Lead Type4
    Given Condition the customer where (SOL_LAST_LOGIN_DT is NULL of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is BLANK of Current Date (Digitally InActive) For Getting the Lead Type4
    Given Condition the customer where (SOL_LAST_LOGIN_DT is BLANK of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Mort Acq Segmentation SFM OutBound where SOL_LAST_LOGIN_DT is > 90 days of Current Date (Digitally InActive) For Getting the Lead Type4
    Given Condition the customer where (SOL_LAST_LOGIN_DT is > 90 days of Current Date ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


# DDR Date Triggers

  Scenario: Validate that change in DDR date triggers the outbound strategy for CCT file generation
    Given Create the wave in the DDR Table
    When Generate the CCT OutBound File
    And Update the Wave in the DDR Table Created in the Step1
    Then it should trigger the outbound strategy to Generate the CCT file


# Negative Test Cases

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where CUST_TP_CD = !PSNL
    Given Condition the customer where (CUST_TP_CD != PSNL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where CUST_TP_CD = NULL
    Given Condition the customer where (CUST_TP_CD = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Country_CD = !CA
    Given Condition the customer where (Country_CD = !CA) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Country_CD = NULL
    Given Condition the customer where (Country_CD = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Customer age is less than 18 years
    Given Condition the customer where (Customer age is less than 18 years) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Customer age is Null
    Given Condition the customer where (Customer age is Null) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MRKTBLE_F = N
    Given Condition the customer where (MRKTBLE_F = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MRKTBLE_F = NULL
    Given Condition the customer where (MRKTBLE_F = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Deceased_F = Y
    Given Condition the customer where (Deceased_F = Y) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Deceased_F = NULL
    Given Condition the customer where (Deceased_F = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Language Code is K
    Given Condition the customer where (Language Code is K) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Language Code is NE
    Given Condition the customer where (Language Code is NE) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where Language Code is Null
    Given Condition the customer where (Language Code is Null) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where NOT_AML_KYC = Y
    Given Condition the customer where (NOT_AML_KYC = Y) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where PRIM_PROV_CD = NULL
    Given Condition the customer where (PRIM_PROV_CD = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where CLOSEST_TRANSIT_NUM = NULL
    Given Condition the customer where (CLOSEST_TRANSIT_NUM = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where SOL_LAST_LOGIN_DT < 90 Days Of Current Days
    Given Condition the customer where (SOL_LAST_LOGIN_DT < 90 Days) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where ASSIGNED_FA_TRANSIT != NULL
    Given Condition the customer where (ASSIGNED_FA_TRANSIT != NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where ASSIGNED_FA_TRANSIT != BLANK
    Given Condition the customer where (ASSIGNED_FA_TRANSIT != BLANK) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where DO_NOT_SOLICIT_F = Y
    Given Condition the customer where (DO_NOT_SOLICIT_F = Y ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where DO_NOT_CALL_F = Y
    Given Condition the customer where (DO_NOT_CALL_F = Y) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where INDV_FRST_NM = NULL
    Given Condition the customer where (INDV_FRST_NM = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where INDV_LAST_NM = NULL
    Given Condition the customer where (INDV_LAST_NM = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where PRIM_ADDR_LINE_1 = NULL
    Given Condition the customer where (PRIM_ADDR_LINE_1 = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where PRIM_CITY_NM = NULL
    Given Condition the customer where (PRIM_CITY_NM = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where PRIM_POST_CD = NULL
    Given Condition the customer where (PRIM_POST_CD = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


# Segmentation Negative Test Cases

  # LeadType1 Negative Test Cases

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MLS_LISTING_FLAG = 'N' And MLS_ADDED_AT_DT = 0-30 Days For Not Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'N' And MLS_ADDED_AT_DT = 0-30 Days) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MLS_LISTING_FLAG = 'N' And MLS_ADDED_AT_DT > 30 Days For Not Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'N' And MLS_ADDED_AT_DT > 30 Days) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MLS_LISTING_FLAG = 'Y' And MLS_ADDED_AT_DT > 30 Days For Not Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'Y' And MLS_ADDED_AT_DT > 30 Days) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MLS_LISTING_FLAG = 'NULL' And MLS_ADDED_AT_DT = 0-30 Days For Not Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'NULL' And MLS_ADDED_AT_DT = 0-30 Days ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MLS_LISTING_FLAG = 'NULL' And MLS_ADDED_AT_DT > 30 Days For Not Getting the Lead Type1
    Given Condition the customer where (MLS_LISTING_FLAG = 'NULL' And MLS_ADDED_AT_DT > 30 Days ) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date For Not Getting the Lead Type1
    Given Condition the customer where (SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  # LeadType2 Negative Test Cases

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MORT_COUNT_30DAY < 1 For Not Getting the Lead Type2
    Given Condition the customer where (MORT_COUNT_30DAY < 1) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where SOL_LAST_LOGIN_DT is with in 90Days of Current Date (Digitally Active) For Not Getting the Lead Type2
    Given Condition the customer where (SOL_LAST_LOGIN_DT is with in 90Days of Current Date (Digitally Active)) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


  # LeadType3 Negative Test Cases

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where TV_TS_MORT_FLAG = N For Not Getting the Lead Type3
    Given Condition the customer where (TV_TS_MORT_FLAG = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where TV_TS_MORT_FLAG = NULL For Not Getting the Lead Type3
    Given Condition the customer where (TV_TS_MORT_FLAG = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date For Not Getting the Lead Type3
    Given Condition the customer where (SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  # LeadType4 Negative Test Cases

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MORT_OUT_PYMT_FLAG = N For Not Getting the Lead Type4
    Given Condition the customer where (MORT_OUT_PYMT_FLAG = N) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where MORT_OUT_PYMT_FLAG = NULL For Not Getting the Lead Type4
    Given Condition the customer where (MORT_OUT_PYMT_FLAG = NULL) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition

  Scenario: Verify the Mortage Acquisition SFM OutBound is not coming for a customer where SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date For Not Getting the Lead Type4
    Given Condition the customer where (SOL_LAST_LOGIN_DT is with in 90Days (Digitally Active) of Current Date) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer didn't get the MortgageAcquisition


# Validate prioritization of accounts in case of multiple Mortgage Acquisition leads  in SFM file

  Scenario: Verify the Lead Type 1 should be prioritized When we have Mort Acq customer has all the LeadType 1, 2
    Given Condition the customer where (customer has all the LeadType 1, 2) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 1 should be prioritized When we have Mort Acq customer has all the LeadType 1, 3
    Given Condition the customer where (customer has all the LeadType 1, 3) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 1 should be prioritized When we have Mort Acq customer has all the LeadType 1, 4
    Given Condition the customer where (customer has all the LeadType 1, 4) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 3 should be prioritized When we have Mort Acq customer has all the LeadType 2, 3
    Given Condition the customer where (customer has all the LeadType 2, 2) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 4 should be prioritized When we have Mort Acq customer has all the LeadType 2, 4
    Given Condition the customer where (customer has all the LeadType 2, 4) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 3 should be prioritized When we have Mort Acq customer has all the LeadType 3, 4
    Given Condition the customer where (customer has all the LeadType 3, 4) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel

  Scenario: Verify the Lead Type 1 should be prioritized When we have Mort Acq customer has all the LeadType 1, 2, 3
    Given Condition the customer where (customer has all the LeadType 1, 2, 3) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Lead Type 3 should be prioritized When we have Mort Acq customer has all the LeadType 2, 3, 4
    Given Condition the customer where (customer has all the LeadType 2, 3, 4) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


  Scenario: Verify the Lead Type 1 should be prioritized When we have Mort Acq customer has all the LeadType 1, 2, 3, 4
    Given Condition the customer where (customer has all the LeadType 1, 2, 3, 4) along with general eligibility criteria
    When run the batch file for SFM channel
    Then open the SFM channel file
    And verify that customer has got a Mortgage Acquisition offer in SFM channel


# Validate the SFM file for layout

  Scenario: Verify the Mortage Acquisition SFM OutBound File Layout for a customer

# Validate the SFM file for Schedule

  Scenario: Verify the Mortage Acquisition SFM OutBound File Schedule for a customer

# Validate the SFM file for distribution

  Scenario: Verify the Mortage Acquisition SFM OutBound File Distribution for a customer

