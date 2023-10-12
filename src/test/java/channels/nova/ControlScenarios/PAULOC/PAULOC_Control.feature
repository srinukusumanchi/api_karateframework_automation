Feature: Control Scenarios for PAULOC
  Scenario: Verify that 10% IPT for PAULOC in Inbound channel (CSE) is logged as control = B and 90% is logged as control = N in IH, when PA_Table.control = N during the Blackout Period PAULOC_1
    Given Check PA_CCUL_Customer.Control
    When In OB Scheduler Table – Set Digital Start Date and Wave End Date in Future, and Wave Start Date in Past then Flush
    And Check Initial IH
    And Run REST/SOAP Call for All 20 CIDs
    Then Check IH – Approximately 10% should be Control = B and 90% with Control = N
  Scenario: Verify that IPT for PAULOC in Inbound channels (MOB/CSE) is logged as control = Y in IH, when PA_CC.control = Y During the Blackout Period PAULOC_2
    Given Check PA_CCUL_Customer.Control
    When In OB Scheduler Table – Set Digital Start Date and Wave End Date in Future, and Wave Start Date in Past then Flush
    And Initial IH
    And Run SOAP and REST Calls for the CIDs
    Then Check IH – Should be logged with Control = Y
  Scenario: Verify that for PAULOC PST in Inbound channels (MOB/CSE) gets the same control value from IPT when there is an IPT in Inbound During the Blackout Period PAULOC_3
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And In OB Scheduler Table – Set Digital Start Date and Wave End Date in Future, and Wave Start Date in Past then Flush
    And Run SOAP and REST Calls – CSE and MOB for each CID
    Then Check IH – Control should retain the values from IPT
  Scenario: Verify that Abandon creative of PAULOC PST in MOB gets the same control value from IPT when there is an IPT in Inbound During the Blackout Period PAULOC_4
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And In OB Scheduler Table – Set Digital Start Date and Wave End Date in Future, and Wave Start Date in Past then Flush
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Run REST Calls – MOB for each CID
    Then Check IH – For Abandon and Reminder Creatives Control should retain the values from IPT
  Scenario: Verify that PST for Initial PAULOC Offer in Outbound channels (EML/…) get logged as Control = Y when PA_Table.Control = Y and there is an IPT and PST in Inbound During the Blackout Period PAULOC_5
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    Then Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
  Scenario: Verify that PST for Initial PAULOC Offer in Outbound channels (EML/…) gets logged as Control = N
  when PA_Table.Control = N or NULL and there is an IPT and PST in Inbound having Control = B or N
  During the Blackout Period PAULOC_6
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    Then Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
  Scenario: Verify that PAULOC PST in Inbound channels (MOB/CSE) gets the same control value from IPT when there is an IPT in Inbound and PST in Outbound During the Blackout Period PAULOC_7
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    Then Check IH –Control should retain the values from IPT
  Scenario: Verify that Initial PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Inbound After the Blackout Period PAULOC_8
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Perform SOAP/REST calls for MOB and CSE for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that Initial PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = N when PA_Table.Control = N or NULL and there is an IPT in Inbound having Control = B or N After the Blackout Period PAULOC_9
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Perform SOAP/REST calls for MOB and CSE for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that Abandon PAULOC PST in Inbound channels (MOB) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Inbound After the Blackout Period PAULOC_10
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Perform REST calls for MOB for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that Abandon PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = N when PA_Table.Control = N or NULL and there is an IPT in Inbound having Control = B or N After the Blackout Period PAULOC_11
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Perform REST calls for MOB for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that Reminder PAULOC PST in Inbound channels (MOB) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Inbound After the Blackout Period PAULOC_12
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Update PA Table Pre-Approved End Date such that current date is within last 7 days of the wave using the following query:
    And Check PA_CCUL_Customer.Control
    And Perform REST calls for MOB for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that Reminder PAULOC PST in Inbound channels (MOB) gets logged as Control = N when PA_Table.Control = N or NULL and there is an IPT in Inbound having Control = B or N After the Blackout Period PAULOC_13
    Given Check PA_CCUL_Customer.Control
    When Check IH for IPT
    And Run SOAP and REST Calls – CSE and MOB for each CID
    And Check IH – Control should retain the values from IPT
    And Check OB Scheduler Table and DSS to Ensure that Current Date is not in the Reminder Period
    And Run OB Scheduler
    And Check IH – Control should be logged as Y when PA Table control = Y and Control should be logged as N when PA Table control = N or NULL
    And Perform SOAP/REST calls for MOB and CSE for each CID
    And Check IH –Control should retain the values from IPT
    And Set Outbound Scheduler Digital Start Date <= Current Date (Mar. 30, 2022)
    And Update PA Table Pre-Approved End Date such that current date is within last 7 days of the wave using the following query:
    And Check PA_CCUL_Customer.Control
    And Perform REST calls for MOB for each CID
    Then Check IH –Control should flip from B to N and should retain the values from IPT for N and Y
  Scenario: Verify that PAULOC IPT in Outbound channels (EML/…) is logged as control = N in IH, when PA_Table.control = N or NULL During the Blackout Period PAULOC_14
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH – No records should be logged
    And Run Outbound Scheduler
    Then Check IH – IST in Outbound Channels should be logged as Control = Y when PA_Table.Control = Y and logged as Control = N when PA_Table.Control = N
  Scenario: Verify that PAULOC IPT in Outbound channels (EML/…) is logged as control = Y in IH, when PA_CC.control = Y During the Blackout Period PAULOC_15
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH – No records should be logged
    And Run Outbound Scheduler
    Then Check IH – IST in Outbound Channels should be logged as Control = Y when PA_Table.Control = Y and logged as Control = N when PA_Table.Control = N
  Scenario: Verify that 10% PST for PAULOC in Inbound channel (CSE) is logged as control = B and 90% is logged as control = N in IH, when PA_Table.control = N and there is an IPT in Outbound During the Blackout Period PAULOC_16
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH – No records should be logged
    And Run Outbound Scheduler
    And Check IH – IST in Outbound Channels should be logged as Control = Y when PA_Table.Control = Y and logged as Control = N when PA_Table.Control = N
    And Run REST/SOAP Call for All 20 CIDs
    Then Check IH – Approximately 10% should be Control = B and 90% with Control = N
  Scenario: Verify that PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Outbound During the Blackout Period PAULOC_17
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH – No records should be logged
    And Run Outbound Scheduler
    And Check IH – IST in Outbound Channels should be logged as Control = Y when PA_Table.Control = Y and logged as Control = N when PA_Table.Control = N
    And Run REST/SOAP Call for All 20 CIDs
    Then Check IH – Approximately 10% should be Control = B and 90% with Control = N
  Scenario: Verify that 2nd PAULOC PST in Inbound channels (MOB/CSE) gets the same control value from 1st IB PST when there is an IPT in Outbound and PST in Inbound During the Blackout Period PAULOC_18
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Run REST/SOAP Call for All CIDs
    Then Check IH – Control should get the same value from the first PST in Inbound
  Scenario: Verify that PAULOC Abandon PST in Inbound channel (MOB) is logged with the same control value from the 1st PST in Inbound, when PA_Table.control = N or Y and IPT is in Outbound PAULOC_19
  #and 1st PST in Inbound has Control = B/N/Y During the Blackout Period
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Perform REST calls for MOB for each CID
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in 1st PST in Inbound
  Scenario: Verify that PAULOC Abandon PST in Outbound channels (EML/…) is logged with the same control value from IPT in Outbound, when PA_Table.control = N or Y and IPT is in Outbound and 1st PST in Inbound has Control = B/N/Y During the Blackout Period PAULOC_20
    Given Check Outbound Scheduler Table Settings
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Run Outbound Scheduler
    Then Check IH - Abandon PST in Outbound channels should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Outbound and PST in Inbound having Control = Y After the Blackout Period PAULOC_21
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST in Inbound channels (MOB/CSE) gets logged as Control = N when PA_Table.Control = N or NULL and there is an IPT in Outbound having Control = N and PST in Inbound having Control = N or B After the Blackout Period PAULOC_22
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST for Abandon Creative in Inbound channel (MOB) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Outbound and PST in Inbound having Control = Y After the Blackout Period PAULOC_23
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST for Abandon Creative in Inbound channel (MOB) gets logged as Control = N when PA_Table.Control = N or NULL and there is an IPT in Outbound having Control = N PAULOC_24
  #and PST in Inbound having Control = N or B After the Blackout Period
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Insert CUST_INSIGHTS trigger using the following Queries:
    And Check CUST_INSIGHTS Table
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST for Reminder Creative in Inbound channel (MOB) gets logged as Control = Y when PA_Table.Control = Y and there is an IPT having Control = Y in Outbound and PST in Inbound having Control = Y After the Blackout Period PAULOC_25
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check DSS Table for Reminder Period
    And Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Update PA Table Pre-Approved End Date such that current date is within last 7 days of the wave using the following query:
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
  Scenario: Verify that PAULOC PST for Reminder Creative in Inbound channel (MOB) gets logged as Control = N when PA_Table.Control = N or NULL PAULOC_26
  #and there is an IPT in Outbound having Control = N and PST in Inbound having Control = N or B After the Blackout Period
    Given Check Outbound Scheduler Table Settings – Digital Start Date should be <= Curr_Date (Mar. 31, 2022)
    When Check DSS Table for Reminder Period
    And Check PA_CCUL_Customer.Control
    And Check IH for IPT in Outbound and PST in Inbound
    And Update PA Table Pre-Approved End Date such that current date is within last 7 days of the wave using the following query:
    And Run REST Call for MOB for All the CIDs
    Then Check IH - Abandon PST in Inbound channel should be logged with the same control value from as in IPT in Outbound
