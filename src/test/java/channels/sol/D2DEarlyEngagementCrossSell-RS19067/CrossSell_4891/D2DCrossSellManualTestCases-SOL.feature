@MANUAL_CIMCAMP-461 @CIEPROG-234

Feature: Manual Test Cases For D2D Cross Sell

  @4891 @SOL @RS19067 @MANUAL
  Scenario: Validate that 4891 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4891 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4892 @SOL @RS19067 @MANUAL
  Scenario: Validate that 4892 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4892 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4893 @SOL @RS19067 @MANUAL
  Scenario: Validate that 4893 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4893 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility

  @4894 @SOL @19067 @MANUAL
  Scenario: Validate that 4894 offer is presented to customer till the persistence days and will not be displayed for the rest period
    Given condition the customer according to the 4894 eligibility criteria
    When perform the SOAP operation and check the Offer displayed in the response
    Then go to pega and search with your CID in the interaction history
    And get the persistence days and the rest period from the IH
    And Suppose persistence days are 5 days and the rest period is 3 days
    Then check the SOAP response is showing until the persistence days completes
    And offer has to be displayed recursively after the rest period completes until it meets the eligibility
