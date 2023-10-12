@CIEPROG-50

Feature: Manual Test Cases For D2D Welcome

  @4330 @SOL @RS17103 @MANUAL
  Scenario: Validate that 4330 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4330 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4330 @SOL @RS17103 @MANUAL
  Scenario: Verify 4330 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 4330 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 4330 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH

  @4331 @SOL @RS17103 @MANUAL
  Scenario: Validate that 4331 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4331 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4331 @SOL @RS17103 @MANUAL
  Scenario: Verify 4331 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 4331 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 4331 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH

  @4332 @SOL @RS17103 @MANUAL
  Scenario: Validate that 4332 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4332 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4332 @SOL @RS17103 @MANUAL
  Scenario: Verify 4332 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 4332 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 4332 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH

  @4334 @SOL @RS17103 @MANUAL
  Scenario: Validate that 4334 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4334 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4334 @SOL @RS17103 @MANUAL
  Scenario: Verify 4334 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 4334 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 4334 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH

  @4658 @SOL @RS17103 @MANUAL
  Scenario: Validate that 4658 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4658 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4658 @SOL @RS17103 @MANUAL
  Scenario: Verify 4658 conditioned customer id is went to control group in IH (Control = 'Y')
    Given condition the customer according to the 4658 eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    Then SOAP response doesn't  have 4658 offer
    Then go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH

