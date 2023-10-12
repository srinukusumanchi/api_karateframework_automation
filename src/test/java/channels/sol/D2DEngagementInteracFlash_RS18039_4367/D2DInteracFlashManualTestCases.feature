@MANUAL_CIMCAMP-404 @CIEPROG-120

Feature: Manual Test Cases For D2D Interac Flash

  @4367 @SOL @18039 @MANUAL
  Scenario: Validate that 4367 offer is presented to customer till the persistance days and will not be displayed for the rest period
    Given condition the customer according to the 4367 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

