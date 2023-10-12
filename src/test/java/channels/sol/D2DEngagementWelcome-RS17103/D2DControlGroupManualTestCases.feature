@CIEPROG-50

Feature: Manual Test Cases For D2D Welcome

  @SOL @RS17103 @MANUAL
  Scenario: Verify the customer id with D2D welcome offer and let it goes to control group in IH for the D2D continuum (Control = 'Y')
    Given condition the customer according to the D2D Welcome eligibility criteria
    And clear the IH and run the SOAP call until it goes to Control
    When perform the SOAP operation and check the response
    And SOAP response doesn't  have D2D offer
    And go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH
    When condition this customer for Digital Adoption
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Fund Account and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Bill Payment and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Cross Sell and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Reward Reinforcement and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Interac Flash and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Visa Debit and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer
    When condition this customer for Digital Payments and run D2D Activity
    Then check the offer should be in Control group only
    Then perform the SOAP call and response doesn't have this offer

  @EMAIL @RS17103 @MANUAL
  Scenario: Verify the Seed customer id with D2D welcome offer and let it goes to control group in IH for the D2D continuum (Control = 'Y')
    Given condition the seed customer according to the D2D Welcome eligibility criteria
    And clear the IH for the seed customer in Delete Interaction
    And run the Email batch activity
    And go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH
    When condition this seed customer for Digital email and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Fund Account and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Bill Payment and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Cross Sell and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Reward Reinforcement and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Interac Flash and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Visa Debit and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Digital Payments and run D2D Activity
    Then check the offer should be in Control group only
    When condition this seed customer for Mapping Tomorrow and run D2D Activity
    Then check the offer should be in Control group only

  @EMAILCROSSCHANNEL @RS17103 @MANUAL
  Scenario: Verify the Seed customer id with D2D welcome offer goes to control group and for the D2D continuum offers should have control-'Y' in SOL SOAP call
    Given condition the seed customer according to the D2D Welcome eligibility criteria
    And clear the IH for the seed customer in Delete Interaction
    And run the Email batch activity
    And go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y logged in IH
    When perform the SOAP operation in SOL and check the response
    Then SOAP response doesn't  have D2D Welcome offer
    When go to Pega and search with your CID in the interaction History
    Then check the Control Group Status as Y in IH for the SOAP call
    When condition this seed customer for Digital Adoption and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Fund Account and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Bill Payment and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Cross Sell and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Reward Reinforcement and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Interac Flash and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Visa Debit and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer
    When condition this seed customer for Digital Payments and run Email batch Activity
    Then check the offer should be in Control group only
    And perform the SOAP call and response doesn't have this offer

