module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2300 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2300'    #Claim Information

      #Claim Information
      segment Hippo_eyeDoc::Segments::CLM,
                :name           => 'Claim Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1300,
                :identified_by => {
                  'CLM06' => ["N", "Y"],
                  'CLM07' => ["A", "B", "C"],
                  'CLM08' => ["N", "W", "Y"],
                  'CLM09' => ["I", "Y"]
                }

      #Date - Onset of Current Illness or Symptom
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Onset of Current Illness or Symptom',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1350,
                :identified_by => {
                  'DTP01' => '431',
                  'DTP02' => 'D8'
                }

      #Date - Initial Treatment Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Initial Treatment Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1370,
                :identified_by => {
                  'DTP01' => '454',
                  'DTP02' => 'D8'
                }

      #Date - Last Seen Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last Seen Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1390,
                :identified_by => {
                  'DTP01' => '304',
                  'DTP02' => 'D8'
                }

      #Date - Acute Manifestation
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Acute Manifestation',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '453',
                  'DTP02' => 'D8'
                }

      #Date - Accident
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Accident',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '439',
                  'DTP02' => 'D8'
                }

      #Date - Last Menstrual Period
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last Menstrual Period',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '484',
                  'DTP02' => 'D8'
                }

      #Date - Last X-ray Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last X-ray Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '455',
                  'DTP02' => 'D8'
                }

      #Date - Hearing and Vision Prescription Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Hearing and Vision Prescription Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '471',
                  'DTP02' => 'D8'
                }

      #Date - Disability Dates
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Disability Dates',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => ["314", "360", "361"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Date - Last Worked
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last Worked',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '297',
                  'DTP02' => 'D8'
                }

      #Date - Authorized Return to Work
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Authorized Return to Work',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '296',
                  'DTP02' => 'D8'
                }

      #Date - Admission
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Admission',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '435',
                  'DTP02' => 'D8'
                }

      #Date - Discharge
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Discharge',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '096',
                  'DTP02' => 'D8'
                }

      #Date - Assumed and Relinquished Care Dates
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Assumed and Relinquished Care Dates',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 13,
                :identified_by => {
                  'DTP01' => ["090", "091"],
                  'DTP02' => 'D8'
                }

      #Date - Property and Casualty Date of First Contact
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Property and Casualty Date of First Contact',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '444',
                  'DTP02' => 'D8'
                }

      #Date - Repricer Received Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Repricer Received Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 13,
                :identified_by => {
                  'DTP01' => '050',
                  'DTP02' => 'D8'
                }

      #Claim Supplemental Information
      segment Hippo_eyeDoc::Segments::PWK,
                :name           => 'Claim Supplemental Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 1550,
                :identified_by => {
                  'PWK01' => ["03", "04", "05", "06", "07", "08", "09", "10", "11", "13", "15", "21", "A3", "A4", "AM", "AS", "B2", "B3", "B4", "BR", "BS", "BT", "CB", "CK", "CT", "D2", "DA", "DB", "DG", "DJ", "DS", "EB", "HC", "HR", "I5", "IR", "LA", "M1", "MT", "NN", "OB", "OC", "OD", "OE", "OX", "OZ", "P4", "P5", "PE", "PN", "PO", "PQ", "PY", "PZ", "RB", "RR", "RT", "RX", "SG", "V5", "XP"],
                  'PWK02' => ["AA", "BM", "EL", "EM", "FT", "FX"]
                }

      #Contract Information
      segment Hippo_eyeDoc::Segments::CN1,
                :name           => 'Contract Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1600,
                :identified_by => {
                  'CN101' => ["01", "02", "03", "04", "05", "06", "09"]
                }

      #Patient Amount Paid
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Patient Amount Paid',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1760,
                :identified_by => {
                  'AMT01' => 'F5'
                }

      #Service Authorization Exception Code
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Service Authorization Exception Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 17,
                :identified_by => {
                  'REF01' => '4N'
                }

      #Mandatory Medicare (Section 4081) Crossover Indicator
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Mandatory Medicare (Section 4081) Crossover Indicator',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 17,
                :identified_by => {
                  'REF01' => 'F5'
                }

      #Mammography Certification Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Mammography Certification Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 17,
                :identified_by => {
                  'REF01' => 'EW'
                }

      #Referral Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Referral Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 17,
                :identified_by => {
                  'REF01' => '9F'
                }

      #Prior Authorization
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Prior Authorization',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1800,
                :identified_by => {
                  'REF01' => 'G1'
                }

      #Payer Claim Control Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Payer Claim Control Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1810,
                :identified_by => {
                  'REF01' => 'F8'
                }

      #Clinical Laboratory Improvement Amendment (CLIA) Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Clinical Laboratory Improvement Amendment (CLIA) Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1820,
                :identified_by => {
                  'REF01' => 'X4'
                }

      #Repriced Claim Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Repriced Claim Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1830,
                :identified_by => {
                  'REF01' => '9A'
                }

      #Adjusted Repriced Claim Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Adjusted Repriced Claim Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1840,
                :identified_by => {
                  'REF01' => '9C'
                }

      #Investigational Device Exemption Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Investigational Device Exemption Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1850,
                :identified_by => {
                  'REF01' => 'LX'
                }

      #Claim Identifier For Transmission Intermediaries
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Claim Identifier For Transmission Intermediaries',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1860,
                :identified_by => {
                  'REF01' => 'D9'
                }

      #Medical Record Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Medical Record Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1890,
                :identified_by => {
                  'REF01' => 'EA'
                }

      #Demonstration Project Identifier
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Demonstration Project Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 18,
                :identified_by => {
                  'REF01' => 'P4'
                }

      #Care Plan Oversight
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Care Plan Oversight',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 18,
                :identified_by => {
                  'REF01' => '1J'
                }

      #File Information
      segment Hippo_eyeDoc::Segments::K3,
                :name           => 'File Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 18

      #Claim Note
      segment Hippo_eyeDoc::Segments::NTE,
                :name           => 'Claim Note',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1900,
                :identified_by => {
                  'NTE01' => ["ADD", "CER", "DCP", "DGN", "TPO"]
                }

      #Ambulance Transport Information
      segment Hippo_eyeDoc::Segments::CR1,
                :name           => 'Ambulance Transport Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1950,
                :identified_by => {
                  'CR104' => ["A", "B", "C", "D", "E"],
                  'CR105' => 'DH'
                }

      #Spinal Manipulation Service Information
      segment Hippo_eyeDoc::Segments::CR2,
                :name           => 'Spinal Manipulation Service Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2000,
                :identified_by => {
                  'CR208' => ["A", "C", "D", "E", "F", "G", "M"]
                }

      #Ambulance Certification
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Ambulance Certification',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 2200,
                :identified_by => {
                  'CRC01' => '07',
                  'CRC02' => ["N", "Y"],
                  'CRC03' => ["01", "04", "05", "06", "07", "08", "09", "12"]
                }

      #Patient Condition Information: Vision
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Patient Condition Information: Vision',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 2210,
                :identified_by => {
                  'CRC01' => ["E1", "E2", "E3"],
                  'CRC02' => ["N", "Y"],
                  'CRC03' => ["L1", "L2", "L3", "L4", "L5"]
                }

      #Homebound Indicator
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Homebound Indicator',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2220,
                :identified_by => {
                  'CRC01' => '75',
                  'CRC02' => 'Y',
                  'CRC03' => 'IH'
                }

      #EPSDT Referral
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'EPSDT Referral',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2230,
                :identified_by => {
                  'CRC01' => 'ZZ',
                  'CRC02' => ["N", "Y"],
                  'CRC03' => ["AV", "NU", "S2", "ST"]
                }

      #Health Care Diagnosis Code
      segment Hippo_eyeDoc::Segments::HI,
                :name           => 'Health Care Diagnosis Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2310

      #Anesthesia Related Procedure
      segment Hippo_eyeDoc::Segments::HI,
                :name           => 'Anesthesia Related Procedure',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2313

      #Condition Information
      segment Hippo_eyeDoc::Segments::HI,
                :name           => 'Condition Information',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 2320

      #Claim Pricing/Repricing Information
      segment Hippo_eyeDoc::Segments::HCP,
                :name           => 'Claim Pricing/Repricing Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2410,
                :identified_by => {
                  'HCP01' => ["00", "01", "02", "03", "04", "05", "07", "08", "09", "10", "11", "12", "13", "14"]
                }

      #Referring Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310A,
                :name           => 'Referring Provider Name',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => ["DN", "P3"],
                  'NM1.NM102' => '1'
                }

      #Rendering Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310B,
                :name           => 'Rendering Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => '82',
                  'NM1.NM102' => ["1", "2"]
                }

      #Service Facility Location Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310C,
                :name           => 'Service Facility Location Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => '77',
                  'NM1.NM102' => '2'
                }

      #Supervising Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310D,
                :name           => 'Supervising Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => 'DQ',
                  'NM1.NM102' => '1'
                }

      #Ambulance Pick-up Location
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310E,
                :name           => 'Ambulance Pick-up Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => 'PW',
                  'NM1.NM102' => '2'
                }

      #Ambulance Drop-off Location
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2310F,
                :name           => 'Ambulance Drop-off Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM1.NM101' => '45',
                  'NM1.NM102' => '2'
                }

      #Other Subscriber Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2320,
                :name           => 'Other Subscriber Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 2900,
                :identified_by => {
                  'SBR.SBR01' => ["A", "B", "C", "D", "E", "F", "G", "H", "P", "S", "T", "U"],
                  'SBR.SBR02' => ["01", "18", "19", "20", "21", "39", "40", "53", "G8"]
                }

      #Service Line Number
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2400,
                :name           => 'Service Line Number',
                :minimum        => 1,
                :maximum        => 50,
                :position       => 3650

    end
  end
end
