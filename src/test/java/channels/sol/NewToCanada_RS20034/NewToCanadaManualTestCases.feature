@MANUAL

Feature: Manual Test Cases For New To Canada

  @5043 @SOL @RS20034 @MANUAL
  Scenario: Validate that 5043 offer is presented to customer till the persistance days and will not be displayed for the rest period
    Given condition the customer according to the 5043 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @5043 @SOL @RS20034 @MANUAL
  Scenario: Verify 5043 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 5043 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 5043 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH