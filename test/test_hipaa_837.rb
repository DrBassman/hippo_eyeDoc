require File.expand_path('test_helper', File.dirname(__FILE__))

class TestHIPAA837 < MiniTest::Unit::TestCase

  def test_commercial_health_insurance
=begin
This example file is based on the Commercial Health Insurance example (3.1.1) published in the 5010X222A1 TR3.

Patient is a different person than the Subscriber. Payer is commercial health insurance company.

SUBSCRIBER: Jane Smith
PATIENT ADDRESS:236 N. Main St., Miami, Fl, 33413
TELEPHONE NUMBER: 305-555-1111
SEX: F
DOB: 05/01/43
EMPLOYER: ACME Inc.
GROUP #: 2222-SJ
KEY INSURANCE COMPANY ID #: JS00111223333

PATIENT: Ted Smith
PATIENT ADDRESS:236 N. Main St., Miami, Fl, 33413
TELEPHONE NUMBER: 305-555-1111
SEX: M
DOB: 05/01/73
KEY INSURANCE COMPANY ID #: JS01111223333

DESTINATION PAYER: Key Insurance Company
PAYER ADDRESS: 3333 Ocean St. South Miami, FL 33000
PAYER ID: 999996666

SUBMITTER: Premier Billing Service
EDI#: TGJ23
CONTACT PERSON AND PHONE NUMBER: JERRY, 305-555-2222 ext. 231

RECEIVER: Key Insurance Company
EDI #:66783JJT

BILLING PROVIDER: Dr. Ben Kildare,
ADDRESS: 234 Seaway St, Miami, FL, 33111
NPI: 9876543210
TIN: 587654321
KEY INSURANCE COMPANY PROVIDER ID #: KA6663
Taxonomy Code: 203BF0100Y

PAY-TO PROVIDER: Kildare Associates,
PROVIDER ADDRESS: 2345 Ocean Blvd, Miami, Fl 33111
RENDERING PROVIDER: Dr. Ben Kildare 

PATIENT ACCOUNT NUMBER: 2-646-3774
CASE: Patient has sore throat.

INITIAL VISIT: DOS=10/03/06. POS=Office
SERVICES: Office visit, intermediate service, established patient, throat culture.
CHARGES: Office first visit = $40.00, Lab test for strep = $15.00

FOLLOW-UP VISIT: DOS=10/10/06 POS=Office
Antibiotics didn’t work (pain continues).
SERVICES: Office visit, intermediate service, established patient, mono screening.
CHARGES: Follow-up visit = $35.00, lab test for mono = $10.00.

TOTAL CHARGES: $100.00.
ELECTRONIC ROUTE: Billing provider (sender), to VAN to Key Insurance Company (receiver).
VAN claim identification number = 17312345600006351.

=end

    ts = Hippo::TransactionSets::HIPAA_837::Base.new

    ts.ST do |st|
      st.TransactionSetControlNumber        = '0021'
      st.ImplementationConventionReference  = '005010X222A1'
    end

    ts.BHT do |bht|
      bht.TransactionSetPurposeCode = '00'
      bht.ReferenceIdentification   = '244579'
      bht.Date                      = '20061015'
      bht.Time                      = '1023'
      bht.TransactionTypeCode       = 'CH'
    end

    ts.L1000A do |l1000a|
      l1000a.NM1 do |nm1|
        nm1.EntityTypeQualifier        = '2'
        nm1.NameLastOrOrganizationName = 'PREMIER BILLING SERVICE'
        nm1.IdentificationCode         = 'TGJ23'
      end

      l1000a.PER do |per|
        per.Name                            = 'JERRY'
        per.CommunicationNumberQualifier_01 = 'TE'
        per.CommunicationNumber_01          = '3055552222'
        per.CommunicationNumberQualifier_02 = 'EX'
        per.CommunicationNumber_02          = '231'
      end
    end

    ts.L1000B do |l1000b|
      l1000b.NM1 do |nm1|
        nm1.EntityTypeQualifier        = '2'
        nm1.NameLastOrOrganizationName = 'KEY INSURANCE COMPANY'
        nm1.IdentificationCode         = '66783JJT'
      end
    end

    ts.L2000A do |l2000a|
      l2000a.HL do |hl|
        hl.HL01 = ts.increment('HL')
        hl.HL04 = 1
      end

      l2000a.PRV do |prv|
        prv.ReferenceIdentification    = '203BF0100Y'
      end

      l2000a.L2010AA do |l2010aa|

        l2010aa.NM1 do |nm1|
          nm1.EntityTypeQualifier           = '2'
          nm1.NameLastOrOrganizationName    = 'BEN KILDARE SERVICE'
          nm1.IdentificationCodeQualifier   = 'XX'
          nm1.IdentificationCode            = '9876543210'
        end

        l2010aa.N3 do |n3|
          n3.AddressInformation             = '234 SEAWAY ST'
        end

        l2010aa.N4 do |n4|
          n4.CityName                       = 'MIAMI'
          n4.StateOrProvinceCode            = 'FL'
          n4.PostalCode                     = '33111'
        end

        l2010aa.REF do |ref|
          ref.ReferenceIdentificationQualifier = 'EI'
          ref.ReferenceIdentification          = '587654321'
        end
      end

      l2000a.L2010AB do |l2010ab|
        l2010ab.NM1 do |nm1|
          nm1.EntityTypeQualifier         = '2'
        end

        l2010ab.N3 do |n3|
          n3.AddressInformation             = '2345 OCEAN BLVD'
        end

        l2010ab.N4 do |n4|
          n4.CityName                       = 'MIAMI'
          n4.StateOrProvinceCode            = 'FL'
          n4.PostalCode                     = '33111'
        end
      end

      l2000a.L2000B do |l2000b|
        l2000b.HL do |hl|
          hl.HL01 = ts.increment('HL')
          hl.HL02 = l2000a.HL.HL01
          hl.HL04 = 1
        end

        l2000b.SBR do |sbr|
          sbr.PayerResponsibilitySequenceNumberCode = 'P'
          sbr.ReferenceIdentification               = '2222-SJ'
          sbr.ClaimFilingIndicatorCode              = 'CI'
        end

        l2000b.L2010BA do |l2010ba|
          l2010ba.NM1 do |nm1|
            nm1.EntityTypeQualifier         = '1'
            nm1.NameLastOrOrganizationName  = 'SMITH'
            nm1.NameFirst                   = 'JANE'
            nm1.IdentificationCodeQualifier = 'MI'
            nm1.IdentificationCode          = 'JS00111223333'
          end

          l2010ba.DMG do |dmg|
            dmg.DateTimePeriod              = '19430501'
            dmg.GenderCode                  = 'F'
          end
        end

        l2000b.L2010BB do |l2010bb|
          l2010bb.NM1 do |nm1|
            nm1.EntityTypeQualifier           = '2'
            nm1.NameLastOrOrganizationName    = 'KEY INSURANCE COMPANY'
            nm1.IdentificationCodeQualifier   = 'PI'
            nm1.IdentificationCode            = '999996666'
          end

          # second ref segment in L2010BB
          l2010bb.REF_02 do |ref|
            ref.ReferenceIdentificationQualifier = 'G2'
            ref.ReferenceIdentification          = 'KA6663'
          end
        end

        l2000b.L2000C do |l2000c|
          l2000c.HL do |hl|
            hl.HL01 = ts.increment('HL')
            hl.HL02 = l2000b.HL.HL01
            hl.HL04 = 0
          end

          l2000c.PAT do |pat|
            pat.IndividualRelationshipCode = '19'
          end

          l2000c.L2010CA do |l2010ca|
            l2010ca.NM1 do |nm1|
              nm1.NameLastOrOrganizationName  = 'SMITH'
              nm1.NameFirst                   = 'TED'
            end

            l2010ca.N3 do |n3|
              n3.AddressInformation             = '236 N MAIN ST'
            end

            l2010ca.N4 do |n4|
              n4.CityName                       = 'MIAMI'
              n4.StateOrProvinceCode            = 'FL'
              n4.PostalCode                     = '33413'
            end

            l2010ca.DMG do |dmg|
              dmg.DateTimePeriod  = '19730501'
              dmg.GenderCode      = 'M'
            end
          end

          l2000c.L2300 do |l2300|
            l2300.CLM do |clm|
              clm.ClaimSubmitterSIdentifier         = '26463774'
              clm.MonetaryAmount                    = '100'
              clm.FacilityCodeValue                 = '11'
              clm.FacilityCodeQualifier             = 'B'
              clm.ClaimFrequencyTypeCode            = '1'
              clm.YesNoConditionOrResponseCode      = 'Y'
              clm.ProviderAcceptAssignmentCode      = 'A'
              clm.YesNoConditionOrResponseCode_02   = 'Y'
              clm.ReleaseOfInformationCode          = 'I'
            end

            l2300.REF_11 do |ref| #('Claim Identifier For Transmission Intermediaries') do |ref|
              ref.ReferenceIdentification = '17312345600006351'
            end

            l2300.HI do |hi|
              hi.CodeListQualifierCode_01 = 'BK'
              hi.IndustryCode_01          = '0340'

              hi.CodeListQualifierCode_02 = 'BF'
              hi.IndustryCode_03          = 'V7389'
            end

            l2300.L2400.build do |l2400|
              l2400.LX.LX01 = l2300.increment('LX')

              l2400.SV1 do |sv1|
                sv1.ProductServiceIdQualifier     = 'HC'
                sv1.ProductServiceId              = '99213'
                sv1.MonetaryAmount                = '40'
                sv1.UnitOrBasisForMeasurementCode = 'UN'
                sv1.Quantity                      = '1'
                sv1.DiagnosisCodePointer          = 1
              end

              l2400.DTP('Date - Service Date') do |dtp|
                dtp.DateTimePeriodFormatQualifier = 'D8'
                dtp.DateTimePeriod                = '20061003'
              end
            end

            l2300.L2400.build do |l2400|
              l2400.LX.LX01 = l2300.increment('LX')

              l2400.SV1 do |sv1|
                sv1.ProductServiceIdQualifier     = 'HC'
                sv1.ProductServiceId              = '87070'
                sv1.MonetaryAmount                = '15'
                sv1.UnitOrBasisForMeasurementCode = 'UN'
                sv1.Quantity                      = '1'
                sv1.DiagnosisCodePointer          = 1
              end

              l2400.DTP('Date - Service Date') do |dtp|
                dtp.DateTimePeriodFormatQualifier = 'D8'
                dtp.DateTimePeriod                = '20061003'
              end
            end

            l2300.L2400.build do |l2400|
              l2400.LX.LX01 = l2300.increment('LX')

              l2400.SV1 do |sv1|
                sv1.ProductServiceIdQualifier     = 'HC'
                sv1.ProductServiceId              = '99214'
                sv1.MonetaryAmount                = '35'
                sv1.UnitOrBasisForMeasurementCode = 'UN'
                sv1.Quantity                      = '1'
                sv1.DiagnosisCodePointer          = 2
              end

              l2400.DTP('Date - Service Date') do |dtp|
                dtp.DateTimePeriodFormatQualifier = 'D8'
                dtp.DateTimePeriod                = '20061010'
              end
            end

            l2300.L2400.build do |l2400|
              l2400.LX.LX01 = l2300.increment('LX')

              l2400.SV1 do |sv1|
                sv1.ProductServiceIdQualifier     = 'HC'
                sv1.ProductServiceId              = '86663'
                sv1.MonetaryAmount                = '10'
                sv1.UnitOrBasisForMeasurementCode = 'UN'
                sv1.Quantity                      = '1'
                sv1.DiagnosisCodePointer          = 2
              end

              l2400.DTP('Date - Service Date') do |dtp|
                dtp.DateTimePeriodFormatQualifier = 'D8'
                dtp.DateTimePeriod                = '20061010'
              end
            end
          end
        end
      end
    end


    ts.SE do |se|
      se.TransactionSetControlNumber = ts.ST.TransactionSetControlNumber
    end

    ts.SE.NumberOfIncludedSegments    = ts.segment_count

    published_answer = File.read('samples/005010X222A1_commercial_health_insurance.edi')
    assert_equal published_answer.chomp, ts.to_s
  end

  def test_anesthesia
=begin
Patient is the same as the subscriber. Payer is Medicare. 
Encounter is billed directly to Medicare.

SUBSCRIBER/PATIENT: Margaret Jones
ADDRESS: 123 Rainbow Road, Nashville, TN 37232
TELEPHONE: 615-555-1212
SEX: F
DOB: 03/03/1974
EMPLOYER: ACME Inc.
SUBSCRIBER #: 123456789A

SECONDARY COVERAGE

DESTINATION PAYER: ABC Payer
PAYER ADDRESS: P.O. Box 1465, Nashville, TN, 37232
PAYER ORGANIZATION ID: 05440

RECEIVER: ABC Payer
EDI #: 05440

BILLING PROVIDER/SENDER: Provider Medical Group
ADDRESS: 1234 West End Ave, Nashville, TN, 37232
NPI#: 2366554859
TIN: 756473826
EDI #: N305
CONTACT PERSON AND PHONE NUMBER: Nina, 615-555-1212 ext.911

RENDERING PROVIDER: Dr. Jacob E. Townsend/Anesthesiologist
NPI: 5678912345
MEDICARE PROVIDER ID#: 9741234
PLACE OF SERVICE: Provider OP Hospital
PLACE OF SERVICE ADDRESS: 345 Main Drive, Nashville, TN,37232
PLACE OF SERVICE ID#: 43294867

PATIENT ACCOUNT NUMBER: 543211230
CASE: Laser Eye Surgery.

VISIT: DOS=1/12/2005 POS=Outpatient Hospital
SERVICES: Anesthesia for the Laser Eye Surgery
CHARGES: Anesthesia, 61 minutes = $827.00
CONCURRENCY: 2 cases
PHYSICAL STATUS: Normal
PATIENT CONTROL #: 153829140
MEDICAL RECORD ID #: 006653794

TOTAL CHARGES: $827.00

ELECTRONIC ROUTE: Billing Provider (sender) to ABC PAYER direct
=end

    ts = Hippo::TransactionSets::HIPAA_837::Base.new

    ts.ST.TransactionSetControlNumber        = '0001'
    ts.ST.ImplementationConventionReference  = '005010X222A1'

    ts.BHT do |bht|
      bht.TransactionSetPurposeCode = '00'
      bht.ReferenceIdentification   = '0123'
      bht.Date                      = '20050117'
      bht.Time                      = '1023'
      bht.TransactionTypeCode       = 'CH'
    end

    ts.L1000A do |l1000a|
      l1000a.NM1 do |nm1|
        nm1.EntityTypeQualifier        = '2'
        nm1.NameLastOrOrganizationName = 'PROVIDER MEDICAL GROUP'
        nm1.IdentificationCode         = 'N305'
      end

      l1000a.PER do |per|
        per.Name                            = 'NINA'
        per.CommunicationNumberQualifier_01 = 'TE'
        per.CommunicationNumber_01          = '6155551212'
        per.CommunicationNumberQualifier_02 = 'EX'
        per.CommunicationNumber_02          = '911'
      end
    end

    ts.L1000B do |l1000b|
      l1000b.NM1 do |nm1|
        nm1.EntityTypeQualifier        = '2'
        nm1.NameLastOrOrganizationName = 'ABC PAYER'
        nm1.IdentificationCode         = '05440'
      end
    end

    ts.L2000A.build do |l2000a|
      l2000a.HL do |hl|
        hl.HL01 = ts.increment('HL')
        hl.HL04 = 1
      end

      l2000a.L2010AA do |l2010aa|

        l2010aa.NM1 do |nm1|
          nm1.EntityTypeQualifier           = '2'
          nm1.NameLastOrOrganizationName    = 'PROVIDER MEDICAL GROUP'
          nm1.IdentificationCodeQualifier   = 'XX'
          nm1.IdentificationCode            = '2366554859'
        end

        l2010aa.N3 do |n3|
          n3.AddressInformation             = '1234 WEST END AVE'
        end

        l2010aa.N4 do |n4|
          n4.CityName                       = 'NASHVILLE'
          n4.StateOrProvinceCode            = 'TN'
          n4.PostalCode                     = '37232'
        end

        l2010aa.REF do |ref|
          ref.ReferenceIdentificationQualifier = 'EI'
          ref.ReferenceIdentification          = '756473826'
        end
      end

      l2000a.L2000B.build do |l2000b|
        l2000b.HL do |hl|
          hl.HL01 = ts.increment('HL')
          hl.HL02 = l2000a.HL.HL01
          hl.HL04 = 0
        end

        l2000b.SBR do |sbr|
          sbr.PayerResponsibilitySequenceNumberCode = 'P'
          sbr.IndividualRelationshipCode            = '18'
          sbr.ClaimFilingIndicatorCode              = 'MB'
        end

        l2000b.L2010BA do |l2010ba|
          l2010ba.NM1 do |nm1|
            nm1.EntityTypeQualifier         = '1'
            nm1.NameLastOrOrganizationName  = 'JONES'
            nm1.NameFirst                   = 'MARGARET'
            nm1.IdentificationCodeQualifier = 'MI'
            nm1.IdentificationCode          = '123456789A'
          end

          l2010ba.N3.AddressInformation     = '123 RAINBOW ROAD'

          l2010ba.N4 do |n4|
            n4.CityName                     = 'NASHVILLE'
            n4.StateOrProvinceCode          = 'TN'
            n4.PostalCode                   = '37232'
          end

          l2010ba.DMG do |dmg|
            dmg.DateTimePeriod              = '19740303'
            dmg.GenderCode                  = 'F'
          end
        end

        l2000b.L2010BB do |l2010bb|
          l2010bb.NM1 do |nm1|
            nm1.EntityTypeQualifier           = '2'
            nm1.NameLastOrOrganizationName    = 'ABC PAYER'
            nm1.IdentificationCodeQualifier   = 'PI'
            nm1.IdentificationCode            = '05440'
          end
        end

        l2000b.L2300.build do |l2300|
          l2300.CLM do |clm|
            clm.ClaimSubmitterSIdentifier         = '153829140'
            clm.MonetaryAmount                    = '827'
            clm.FacilityCodeValue                 = '22'
            clm.FacilityCodeQualifier             = 'B'
            clm.ClaimFrequencyTypeCode            = '1'
            clm.YesNoConditionOrResponseCode      = 'Y'
            clm.ProviderAcceptAssignmentCode      = 'A'
            clm.YesNoConditionOrResponseCode_02   = 'Y'
            clm.ReleaseOfInformationCode          = 'Y'
          end

          l2300.HI do |hi|
            hi.CodeListQualifierCode_01 = 'BK'
            hi.IndustryCode_01          = '36616'
          end

          l2300.L2310B do |l2310b|
            l2310b.NM1 do |nm1|
              nm1.EntityTypeQualifier           = '1'
              nm1.NameLastOrOrganizationName    = 'TOWNSEND'
              nm1.NameFirst                     = 'JACOB'
              nm1.NameMiddle                    = 'E'
              nm1.IdentificationCodeQualifier   = 'XX'
              nm1.IdentificationCode            = '5678912345'
            end

            l2310b.PRV do |prv|
              prv.ReferenceIdentificationQualifier  = 'ZZ'
              prv.ReferenceIdentification           = '207L00000X'
            end
          end

          l2300.L2310C do |l2310c|
            l2310c.NM1 do |nm1|
              nm1.EntityTypeQualifier           = '2'
              nm1.NameLastOrOrganizationName    = 'PROVIDER OP HOSP'
              nm1.IdentificationCodeQualifier   = 'XX'
              nm1.IdentificationCode            = '432198765'
            end

            l2310c.N3.AddressInformation     = '345 MAIN DRIVE'

            l2310c.N4 do |n4|
              n4.CityName                     = 'NASHVILLE'
              n4.StateOrProvinceCode          = 'TN'
              n4.PostalCode                   = '37232'
            end
          end

          l2300.L2400.build do |l2400|
            l2400.LX.LX01 = l2300.increment('LX')

            l2400.SV1 do |sv1|
              sv1.ProductServiceIdQualifier     = 'HC'
              sv1.ProductServiceId              = '00142'
              sv1.ProcedureModifier_01          = 'QK'
              sv1.ProcedureModifier_02          = 'QS'
              sv1.ProcedureModifier_03          = 'P1'
              sv1.MonetaryAmount                = '827'
              sv1.UnitOrBasisForMeasurementCode = 'MJ'
              sv1.Quantity                      = '61'
              sv1.DiagnosisCodePointer          = 1
            end

            l2400.DTP('Date - Service Date') do |dtp|
              dtp.DateTimePeriodFormatQualifier = 'D8'
              dtp.DateTimePeriod                = '20050112'
            end
          end
        end
      end
    end


    ts.SE do |se|
      se.TransactionSetControlNumber = ts.ST.TransactionSetControlNumber
    end

    ts.SE.NumberOfIncludedSegments    = ts.segment_count

    published_answer = File.read('samples/005010X222A1_anesthesia.edi')
    assert_equal published_answer.chomp, ts.to_s

  end
end
