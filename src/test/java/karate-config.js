function() {

  var env = karate.env; // get java system property 'karate.env'
  var channel = env;
  karate.log('Currently executing in channel:- ', channel);

  if (channel == 'AS400') {

    // over-ride only those that need to be

    var config = { // base config
            dbSchema:'EDPPEGAT',
            baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL',
            testDataPath: '/src/test/java/testdata',
            testDataLocation: '/src/test/java/testdata/as400',
            GICtestDataFileName: 'AS400_TestData_GIC_1210.xlsx',
            testDataSheetName: 'AS400',
            CLItestDataFileName: 'AS400_CLI_TestData.xlsx',
            CCPTeamTestData: 'AS400_ReturnMail_CLI_Creditor_TestData.xlsx',
            CreditorInsurancetestDataFileName: 'AS400_CreditorInsurance_TestData.xlsx',
            ReturnMailFileName: 'AS400_ReturnMail_TestData.xlsx',
            MortgageRenewalFileName: 'AS400_MortgageRenewals_TestData.xlsx',
            PAULOCTestDataAS400FileName: 'AS400_ULOC_TestData.xlsx',
            PACCTestDataAS400FileName:'AS400_PACC_TestData.xlsx',
            D2DXSellAS400TestData:'AS400_D2DXsell_TestData.xlsx',
            //Pavani:Added Datasheet name for PAULOC INSURANCE
            ULOCINSAs400TestData:'AS400_ULOC_Insurance_TestData.xlsx',
             //Pavani:Added Datasheet name for ODP
             ODPAs400TestData:'AS400_ODP_TestData.xlsx',
             //Pavani:Added Datasheet name for Proactive Dormancy
              ProDormancyAs400TestData:'AS400_ProDormancy_TestData.xlsx',
              //Pavani Added for Mising invalid file
              InvalidmissingemailAs400TestData5778:'AS400_MissingInvalidEmail_CIE5778_TestData.xlsx',
              InvalidmissingemailAs400TestData5779:'AS400_MissingInvalidEmail_CIE5779_TestData.xlsx',
               //Pavani: Added data sheetf or D2D Xsell Top1 offer
                D2DXSellTop1AS400TestData: 'AS400_D2DXsell_Top1_TestData.xlsx',
               //Pritam: Added datasheets for NOVA D2DBundle- XSellSneakPeak Near Primacy
                D2DNearPrimacyAS400TestData:'AS400_Xsell_SneakPeak_6185_6186_6187_6188_TestData.xlsx',
                //Pritam:Added Data sheets path for AS400 for ULOCCLI campaign - offer CIE6001 and CIE6002
                ULOCCLIAS400TestData : 'AS400_ULOC_CLI_CIE6001_TestData.xlsx',
                ULOCCLIAS400_Ofr_TestData : 'AS400_ULOC_CLI_CIE6002_TestData.xlsx',
                //Pritam:Added Data sheets path for AS400 for ULOCCLI campaign - offer CIE6090
                ULOCCLIAS400TestData6090 : 'AS400_ULOC_CLI_CIE6090_TestData.xlsx',
                ULOCCLIAS400TestData6218 : 'AS400_ULOC_CLI_CIE6218_TestData.xlsx',
                ULOCCLIAS400TestData6219 : 'AS400_ULOC_CLI_CIE6219_TestData.xlsx',
                ULOCCLIAS400TestData6220 : 'AS400_ULOC_CLI_CIE6220_TestData.xlsx',
            soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
            soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',
                 };

  }else if(channel == 'SOL'){
            var config = { // base config
              dbSchema:'EDPPEGAT',
              baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL',
//              baseUrl: 'https://peganba-ist-appgw.bns:443/prweb/PRSOAPServlet/SOAP/NBAData/Services',
              testDataLocation: '/src/test/java/testdata/sol',
              NTCtestDataFileName: 'SOL_NTC_TestData.xlsx',
              WelcometestDataFileName: 'SOL_WELCOME_TestData.xlsx',
              FundAccounttestDataFileName: 'SOL_FUNDACCOUNT_TestData.xlsx',
              DigitalPaymenttestDataFileName: 'SOL_DigitalPayment_TestData.xlsx',
              DigitalAdoptiontestDataFileName: 'SOL_DigitalAdoption_TestData.xlsx',
              BillPaymenttestDataFileName: 'SOL_BillPayment_TestData.xlsx',
              VisaDebittestDataFileName: 'SOL_VisaDebit_TestData.xlsx',
              RewardtestDataFileName: 'SOL_Reward_TestData.xlsx',
              InteractestDataFileName: 'SOL_InteracFlash_TestData',
              CrossSelltestDataFileName: 'SOL_CrossSell_TestData.xlsx',
              //Pavani:Added Data sheets path for SOL for SPSP loan campaign
              SPSP_Loan_RepaySOLFileName: 'SOL_SPSP_Loan_Repay_TestData.xlsx',
              CrediitorInsurancetestDataFileName: 'SOL_CreditorInsurance_TestData.xlsx',
              CreditorInsuranceSOLRetargetingtestDataFile: 'SOL_CreditorInsurance_Retargeting_TestData.xlsx',
              NTCMortgageAcquisitionSOLDataFile: 'SOL_NTC_MA_TestData.xlsx',
              NTC5151PosTestDataFileName: 'SOL_NTC_POSITIVE_TESTDATA_CIE5151.xlsx',
              NTC5151NegTestDataFileName: 'SOL_NTC_NEGATIVE_TESTDATA_CIE5151.xlsx',
              //Pavani:Added Data sheets path for SOL for D2D Welcome NTB offer
              D2D_Welcome_NTB_DataFileName: 'SOL_Welcome_NTB_TestData.xlsx',
              NTBAdvicePlustestDataFileName:'SOL_NTB_AdvicePlus_TestData.xlsx',
              //Avanthi:Added data sheets for SOL D2D Offer Fulfilment Reminder
              D2DOfferFulfilmentReminderSOL:'SOL_D2D_OfferFulfilmentReminder_TestData.xlsx',
              //Pritam: Added data sheets for SOL Itrade Xsell AlwaysOn
              ItradeXsellAlwaysOnSOLTestData:'SOL_Itrade_Xsell_AlwaysOn_6109_TestData.xlsx',
              //Pritam: Added datasheets for SOL D2DBundle- XSellSneakPeak Near Primacy
              D2DNearPrimacySOLTestData: 'SOL_Xsell_SneakPeak_6185_6186_6187_6188_TestData.xlsx',
              //Pavani:Added datasheet for SSI fund and PAC offers  -Oct 12  2023 release
              SSIFUNDSOLTestData:'SOL_SSI_Fund_Account_6233_TestData.xlsx',
              SSIPACSOLTestData:'SOL_SSI_PACSetup_Account_6234_TestData.xlsx',
              testDataFileName: 'SOL_TestData.xlsx',
              testDataSheetName: 'SOL',
              soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
              soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',

            };
   }else if(channel == 'NOVA'){
               var config = { // base config
                 dbSchema:'EDPPEGAT',
                 baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers',
                 testDataPath: '/src/test/java/testdata',
                 testDataLocation: '/src/test/java/testdata/nova',
                 testDataSheetName: 'NOVA',
                 CLItestDataFileName: 'NOVA_CLI_TestData.xlsx',
                 GICtestDataFileName: 'NOVA_TestData_GIC_4587.xlsx',
                 FundsAccountDataFileName: 'NOVA_FUNDACCOUNT_TestData.xlsx',
                 NTCMANOVATestData: 'NOVA_NTC_MA_TestData.xlsx',
                 BillPaymentNovaTestData: 'NOVA_BillPayment_TestData.xlsx',
                 CrossSellNOVAtestDataFileName: 'NOVA_CrossSell_TestData.xlsx',
                 CreditorInsurancetestDataFileName: 'NOVA_CreditorInsurance_TestData.xlsx',
                 CreditorInsuranceNOVARetargetingtestDataFileName: 'NOVA_CreditorInsurance_Retargeting_TestData.xlsx',
                 TFSACrossSellNovaTestData: 'NOVA_TFSA_CrossSell_TestData.xlsx',
                 RRSPCrossSellNovaTestData: 'NOVA_RRSP_CrossSell_TestData.xlsx',
                 RESPCrossSellNovaTestData: 'NOVA_RESP_CrossSell_TestData.xlsx',
                 TFSAFundNovaTestData:  'NOVA_TFSAFund_TestData.xlsx',
                 RRSPFundNovaTestData:  'NOVA_RRSPFund_TestData.xlsx',
                 NTC5151MobPosTestData:  'NOVA_NTC_Positive_TESTDATA_CIE5151.xlsx',
                 NTC5151MobNegTestData:  'NOVA_NTC_NEGATIVE_TESTDATA_CIE5151.xlsx',
                 SuppCardCrossSellNovatestData: 'NOVA_SuppCard_CrossSell_TestData.xlsx',
                 MPSAContributionNovaTestData:'NOVA_MPSAFund_TestData_Oct_27_2022.xlsx',
                 MPSACrossSellNovaTestData: 'NOVA_MPSA_CrossSell_TestData.xlsx',
                 RESPContributionNovaTestData:'NOVA_RESPFund_TestData.xlsx',
                 WelcomeNovaTestData:'NOVA_WELCOME_TestData.xlsx',
                 ODPRightSizingNovaTestData:'NOVA_ODPRightSizing_TestData.xlsx',
                 NTCCreditNovaTestData:'NOVA_NTCCredit_TestData.xlsx',
                 NTCMortgageAcquisitionNovaTestData:'NOVA_NTC_MA_TestData.xlsx',
                 PAULOCTestDataNOVATestData:'NOVA_ULOC_TestData.xlsx',
                 //Pavani:Added Data sheets path for NOVA for SPSP loan campaign
                 SPSP_Loan_RepayNOVAFileName:'NOVA_SPSP_Loan_Repay_TestData.xlsx',
                 PACCTestDataNOVATestData:'NOVA_PACC_TestData.xlsx',
                 BillPaymentTxnNOVATestData:'NOVA_BillPaymentTxn_TestData.xlsx',
                 VisaDebitAcqNOVATestData:'NOVA_VisaDebitAcq_TestData.xlsx',
                 testDataFileName: 'MortRenewal_Nova_TestData_loaded_16Jan.xlsx',
                 //Pavani:Added Data sheets path for NOVA for Travel Insurance campaign
                 TravelInsuranceNovaTestData:'NOVA_TravelInsurance_TestData.xlsx',
//                 testDataFileName: 'MortRenewal_Nova_TestData_RFR.xlsx',
                 paULOCPACCSheetName: 'PA_CCUL_Customer',
                 //Pavani:Added Data sheets name for NOVA for D2DXSell campaign
                 D2DXSellNovaTestData:'NOVA_D2DXSell_TestData.xlsx',
                 //Pavani:Added Datasheet name for PAULOC INSURANCE
                 ULOCINSNovaTestData:'NOVA_ULOC_Insurance_TestData.xlsx',
                 //Pavani:Added Datasheet name for Insurance Reminder
                 InsuranceReminderNovaTestData:'NOVA_InsuranceClaimReminder_TestData.xlsx',
                 //Pavani:Added Datasheet name for ScotiaSmart Money
                  ScotiaSmartMoneyNovaTestData:'NOVA_SSMAlwaysOn_Engagement_CIE5796_TestData.xlsx',
                   //Pavani:Added Data sheets path for NOVA for D2D Welcome NTB offer
                   D2D_Welcome_NTB_NOVATestData: 'NOVA_Welcome_NTB_TestData.xlsx',
                   //Pavani:Added Data sheets path for NOVA for D2D Welcome NTB offer
                   NTB_AdvicePlus_NOVATestData: 'NOVA_NTB_AdvicePlus_TestData.xlsx',
                   //Pavani:Added Data sheets path for NOVA for MPSA Welcome Bonus
                   MPSA_Welcome_Bonus_NOVATestData: 'NOVA_MPSAWelcomeBonus_TestData.xlsx',
                   TFSAFundContributionNovaTestData : 'NOVA_TFSAFund_TestData.xlsx',
                   //Pavani:Added Data sheets path for NOVA for VisaDebitandInterac campaign
                   VisaDebitandInteracNovaTestData : 'NOVA_VisaDebit_Interac_CIE5970_TestData.xlsx',
                   //Pavani:Added Data sheets path for NOVA for ULOCCLI campaign - offer CIE6001
                   ULOCCLINovaTestData : 'NOVA_ULOC_CLI_CIE6001_TestData.xlsx',
                   ULOCCLINova_Ofr_TestData : 'NOVA_ULOC_CLI_CIE6002_TestData.xlsx',
                   //Avanthi:Added Data sheets path for NOVA for ULOCCLI campaign - offer CIE6090
                   ULOCCLINovaTestData6090 : 'NOVA_ULOC_CLI_CIE6090_TestData.xlsx',

                   //Pavani: Added data sheetf or D2D Xsell Top1 offer
                   D2DXSellTop1NovaTestData: 'NOVA_D2DXsell_Top1_TestData.xlsx',
                   //Avanthi:Added data sheets for NOVA D2D Offer Fulfilment Reminder
                 D2DOfferFulfilmentReminderNOVA:'NOVA_D2D_OfferFulfilmentReminder_TestData.xlsx',
                 //Pritam: Added data sheets for NOVA International Money Transfer
                 InternationalMoneyTransferNOVATestData:'NOVA_International_Money_6087_TestData.xlsx',
                 //Pritam: Added data sheets for NOVA Itrade Xsell AlwaysOn
                ItradeXsellAlwaysOnNOVATestData:'NOVA_Itrade_Xsell_AlwaysOn_6109_TestData.xlsx',
                 //Pritam: Added datasheets for NOVA D2DBundle- XSellSneakPeak Near Primacy
                D2DNearPrimacyNOVATestData:'NOVA_Xsell_SneakPeak_6185_6186_6187_6188_TestData.xlsx',
                //PAvani:Added datasheet for Supp cards Reminder offer -sept28 2023 release
                SuppCardCrossSellReminderNovatestData: 'NOVA_SuppCard_CrossSell_Reminder_TestData.xlsx',
                //Pavani:Added datasheet for SSI Fund and PAC offer  -Oct 12  2023 release
                SSIFUNDNOVATestData:'NOVA_SSI_Fund_Account_6233_TestData.xlsx',
                SSIPACNOVATestData:'NOVA_SSI_PACSetup_Account_6234_TestData.xlsx',
                 soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
                 soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',

               };
   }else if(channel == 'EMAIL'){
              var config = { // base config
                dbSchema:'EDPPEGAT',
                testDataLocation: '/src/test/java/testdata/CrossSell',
                testDataFileName: 'EMAIL_TestData_4891.xlsx',
              };

   } else if(channel == 'Sanity-SOL'){
                 var config = { // base config
                   dbSchema:'EDPPEGAT',
                   baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL',
                   testDataLocation: '/src/test/java/testdata/',
                   testDataFileName: 'Sanity.xlsx',
                   testDataSheetName: 'Sanity',
                   soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
                   soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',
                 };
                }
   else if(channel == 'Sanity-AS400'){
                 var config = { // base config
                   dbSchema:'EDPPEGAT',
                   baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRSOAPServlet/SOAP/NBAData/Services?WSDL',
                   testDataPath: '/src/test/java/testdata',
                   testDataLocation: '/src/test/java/testdata/',
                   testDataFileName: 'Sanity.xlsx',
                   testDataSheetName: 'Sanity',

                   soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
                   soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',
                 };
                }

   else if(channel == 'Sanity-NOVA'){
                    var config = { // base config
                    dbSchema:'EDPPEGAT',
                    baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers',
                    testDataPath: '/src/test/java/testdata',
                    testDataLocation: '/src/test/java/testdata/',
                    testDataFileName: 'Sanity.xlsx',
                    testDataSheetName: 'Sanity',
                    };
                    }
   else if(channel == 'Sanity-ORN'){
                    var config = { // base config
                    dbSchema:'EDPPEGAT',
                    baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers',
                    testDataPath: '/src/test/java/testdata',
                    testDataLocation: '/src/test/java/testdata/',
                    testDataFileName: 'Sanity.xlsx',
                    testDataSheetName: 'Sanity',
                    paULOCPACCSheetName: 'PA_CCUL_Customer',

                    };
                    }
   else if(channel == 'OUTBOUND'){
                 var config = { // base config
                   dbSchema:'EDPPEGAT',
                   testDataLocation: '/src/test/java/testdata/CLI',
                   testDataFileName: 'OUTBOUND_CLI_TESTDATA.xlsx',
                 };
   }
   else if(channel == 'ORN'){
                 var config = { // base config
                 dbSchema:'EDPPEGAT',
                 baseUrl: 'https://cie-qat1-appgw.bns/prweb/PRRestService/Interaction/v1/offers',
                 testDataPath: '/src/test/java/testdata',
                 testDataLocation: '/src/test/java/testdata/ORN',
                 testDataSheetName: 'ORN',
                 CLItestDataFileName: 'ORN_CLI_TestData.xlsx',
                 PAULOCTestDataORNTestData: 'ORN_ULOC_TestData.xlsx',
                 paULOCPACCSheetName: 'PA_CCUL_Customer',
                 PACCORNTestData: 'ORN_PACC_TestData.xlsx',
                 D2DXSellORNTestData:'ORN_D2DXSell_TestData.xlsx',
                 SuppCardCrossSellORNTestData: 'ORN_SuppCard_CrossSell_TestData.xlsx',
                 D2DXSellORNTestData:'ORN_D2DXsell_TestData.xlsx',
                 //Added by Pavani:May 25th Release 2023 for ORN onbaording of TFSA and RRSP crosssell
                 TFSACrossSellORNTestData: 'ORN_TFSA_CrossSell_TestData.xlsx',
                 RRSPCrossSellORNTestData: 'ORN_RRSP_CrossSell_TestData.xlsx',
                 //Added by Pavani:June 8th Release 2023 for ORN onboarding of TFSA,RESP and RRSP contrib and RESP crosssell
                 RESPCrossSellORNTestData: 'ORN_RESP_CrossSell_TestData.xlsx',
                 TFSAFundORNTestData:  'ORN_TFSAFund_TestData.xlsx',
                 RRSPFundORNTestData:  'ORN_RRSPFund_TestData.xlsx',
                 RESPContributionORNTestData : 'ORN_RESPFund_TestData.xlsx',
                 //Avanthi:Added Data sheets path for ORN for ULOCCLI campaign - offer CIE6090
                  ULOCCLIORNTestData6090 : 'ORN_ULOC_CLI_CIE6090_TestData.xlsx',
                  ULOCCLIORNTestData6001 : 'ORN_ULOC_CLI_CIE6001_TestData.xlsx',
                  ULOCCLIORNTestData6002 : 'ORN_ULOC_CLI_CIE6002_TestData.xlsx',
                  //Pritam: Added data sheets for ORN International Money Transfer
                  InternationalMoneyTransferORNTestData:'ORN_International_Money_6087_TestData.xlsx',
                //Pavani: Added ORN data sheet for D2D Offer reminder for June 22 2023 release
                D2DOfferFulfilmentReminderORN:'ORN_D2D_OfferFulfilmentReminder_TestData.xlsx',
                //Pavani:Added Data sheets path for ORN onboarding for MPSA Welcome Bonus for July 7th 2023 release
                MPSA_Welcome_Bonus_ORNTestData: 'ORN_MPSAWelcomeBonus_TestData.xlsx',
                //Pavani:Added datasheet for SSI Fund offer  -Oct 12  2023 release
                SSIFUNDORNTestData:'ORN_SSI_Fund_Account_6233_TestData.xlsx',
                SSIPACORNTestData:'ORN_SSI_PACSetup_Account_6234_TestData.xlsx',
                 soapAction: 'urn:PegaRULES:SOAP:NBAData:Services#GetNBA',
                 soapAction_Disposition: 'urn:PegaRULES:SOAP:NBAData:Services#SetDisposition',
                 };
   }


   karate.configure('connectTimeout', 50000);
   karate.configure('ssl',true);
   karate.configure('logPrettyResponse',true)
//   karate.configure('proxy','http://gateway.bns:8000');
   karate.configure('readTimeout', 1000000);
   return config;
}