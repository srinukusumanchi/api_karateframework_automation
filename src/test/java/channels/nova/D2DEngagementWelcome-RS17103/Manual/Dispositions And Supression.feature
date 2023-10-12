@MANUAL @NOVA @D2DWelcome @RS17103
Feature: Validation for Cross Sell Disposition and Suppression for D2DWelcome NOVA offers

  Scenario:Validate NOVA Response should not be returned for D2D Welcome (4330) Offer when Accept(ATC) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4330
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(Accepted)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is not returned back

  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4330) Offer when Viewed(VWD) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4330 in NOVA
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(viewed)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is  returned back


  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4330) Offer when ATP Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4330 in NOVA
    Then run the soap request for NOVA channel
    Then perform Accept in Progress Disposition for the customer
    Then run the soap request for NOVA channel
    Then validate offer is returned back in NOVA channel


  Scenario:Validate NOVA Response should not be returned for D2D Welcome (4331) Offer when Accept(ATC) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4331
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(Accepted)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is not returned back

  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4331) Offer when Viewed(VWD) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4331 in NOVA
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(viewed)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is  returned back


  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4331) Offer when ATP Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4331 in NOVA
    Then run the soap request for NOVA channel
    Then perform Accept in Progress Disposition for the customer
    Then run the soap request for NOVA channel
    Then validate offer is returned back in NOVA channel

  Scenario:Validate NOVA Response should not be returned for D2D Welcome (4332) Offer when Accept(ATC) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4332
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(Accepted)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is not returned back

  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4332) Offer when Viewed(VWD) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4332 in NOVA
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(viewed)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is  returned back


  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4332) Offer when ATP Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4332 in NOVA
    Then run the soap request for NOVA channel
    Then perform Accept in Progress Disposition for the customer
    Then run the soap request for NOVA channel
    Then validate offer is returned back in NOVA channel

  Scenario:Validate NOVA Response should not be returned for D2D Welcome (4334) Offer when Accept(ATC) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4334
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(Accepted)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is not returned back

  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4334) Offer when Viewed(VWD) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4334 in NOVA
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(viewed)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is  returned back


  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4334) Offer when ATP Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4334 in NOVA
    Then run the soap request for NOVA channel
    Then perform Accept in Progress Disposition for the customer
    Then run the soap request for NOVA channel
    Then validate offer is returned back in NOVA channel

  Scenario:Validate NOVA Response should not be returned for D2D Welcome (4658) Offer when Accept(ATC) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4658
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(Accepted)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is not returned back

  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4658) Offer when Viewed(VWD) Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4658 in NOVA
    When ACCT_ODT is Less Than 30 days
    Then RUN getInteraction Request for NOVA channel
    Then perform set diposition(viewed)  for MOB channel using the response codes
    Then perform GetInteraction Request in NOVA channel
    Then verify offer is  returned back


  Scenario:Validate NOVA Response should  be returned for D2D Welcome (4658) Offer when ATP Disposition is done in NOVA channel According to Kill Matrix
    Given condition the customer according to the eligibility criteria for offer 4658 in NOVA
    Then run the soap request for NOVA channel
    Then perform Accept in Progress Disposition for the customer
    Then run the soap request for NOVA channel
    Then validate offer is returned back in NOVA channel