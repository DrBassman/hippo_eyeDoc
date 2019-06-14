module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2400 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2400'    #Service Line Number

      #Service Line Number
      segment Hippo_eyeDoc::Segments::LX,
                :name           => 'Service Line Number',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3650

      #Professional Service
      segment Hippo_eyeDoc::Segments::SV1,
                :name           => 'Professional Service',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3700,
                :identified_by => {
                  'SV103' => ["MJ", "UN"]
                }

      #Durable Medical Equipment Service
      segment Hippo_eyeDoc::Segments::SV5,
                :name           => 'Durable Medical Equipment Service',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4000,
                :identified_by => {
                  'SV502' => 'DA',
                  'SV506' => ["1", "4", "6"]
                }

      #Line Supplemental Information
      segment Hippo_eyeDoc::Segments::PWK,
                :name           => 'Line Supplemental Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 4200,
                :identified_by => {
                  'PWK01' => ["03", "04", "05", "06", "07", "08", "09", "10", "11", "13", "15", "21", "A3", "A4", "AM", "AS", "B2", "B3", "B4", "BR", "BS", "BT", "CB", "CK", "CT", "D2", "DA", "DB", "DG", "DJ", "DS", "EB", "HC", "HR", "I5", "IR", "LA", "M1", "MT", "NN", "OB", "OC", "OD", "OE", "OX", "OZ", "P4", "P5", "PE", "PN", "PO", "PQ", "PY", "PZ", "RB", "RR", "RT", "RX", "SG", "V5", "XP"],
                  'PWK02' => ["AA", "BM", "EL", "EM", "FT", "FX"]
                }

      #Durable Medical Equipment Certificate of Medical Necessity Indicator
      segment Hippo_eyeDoc::Segments::PWK,
                :name           => 'Durable Medical Equipment Certificate of Medical Necessity Indicator',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4220,
                :identified_by => {
                  'PWK01' => 'CT',
                  'PWK02' => ["AB", "AD", "AF", "AG", "NS"]
                }

      #Ambulance Transport Information
      segment Hippo_eyeDoc::Segments::CR1,
                :name           => 'Ambulance Transport Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4250,
                :identified_by => {
                  'CR104' => ["A", "B", "C", "D", "E"],
                  'CR105' => 'DH'
                }

      #Durable Medical Equipment Certification
      segment Hippo_eyeDoc::Segments::CR3,
                :name           => 'Durable Medical Equipment Certification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4350,
                :identified_by => {
                  'CR301' => ["I", "R", "S"],
                  'CR302' => 'MO'
                }

      #Ambulance Certification
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Ambulance Certification',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 4500,
                :identified_by => {
                  'CRC01' => '07',
                  'CRC02' => ["N", "Y"],
                  'CRC03' => ["01", "04", "05", "06", "07", "08", "09", "12"]
                }

      #Hospice Employee Indicator
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Hospice Employee Indicator',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4520,
                :identified_by => {
                  'CRC01' => '70',
                  'CRC02' => ["N", "Y"],
                  'CRC03' => '65'
                }

      #Condition Indicator/Durable Medical Equipment
      segment Hippo_eyeDoc::Segments::CRC,
                :name           => 'Condition Indicator/Durable Medical Equipment',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4530,
                :identified_by => {
                  'CRC01' => '09',
                  'CRC02' => ["N", "Y"],
                  'CRC03' => ["38", "ZV"]
                }

      #Date - Service Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Service Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 4550,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

      #Date - Prescription Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Prescription Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4555,
                :identified_by => {
                  'DTP01' => '471',
                  'DTP02' => 'D8'
                }

      #DATE - Certification Revision/Recertification Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'DATE - Certification Revision/Recertification Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4560,
                :identified_by => {
                  'DTP01' => '607',
                  'DTP02' => 'D8'
                }

      #Date - Begin Therapy Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Begin Therapy Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4580,
                :identified_by => {
                  'DTP01' => '463',
                  'DTP02' => 'D8'
                }

      #Date - Last Certification Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last Certification Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4590,
                :identified_by => {
                  'DTP01' => '461',
                  'DTP02' => 'D8'
                }

      #Date - Last Seen Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last Seen Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 45,
                :identified_by => {
                  'DTP01' => '304',
                  'DTP02' => 'D8'
                }

      #Date - Test Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Test Date',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 45,
                :identified_by => {
                  'DTP01' => ["738", "739"],
                  'DTP02' => 'D8'
                }

      #Date - Shipped Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Shipped Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 45,
                :identified_by => {
                  'DTP01' => '011',
                  'DTP02' => 'D8'
                }

      #Date - Last X-ray Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Last X-ray Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 45,
                :identified_by => {
                  'DTP01' => '455',
                  'DTP02' => 'D8'
                }

      #Date - Initial Treatment Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Date - Initial Treatment Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 45,
                :identified_by => {
                  'DTP01' => '454',
                  'DTP02' => 'D8'
                }

      #Ambulance Patient Count
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Ambulance Patient Count',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4600,
                :identified_by => {
                  'QTY01' => 'PT'
                }

      #Obstetric Anesthesia Additional Units
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Obstetric Anesthesia Additional Units',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4610,
                :identified_by => {
                  'QTY01' => 'FL'
                }

      #Test Result
      segment Hippo_eyeDoc::Segments::MEA,
                :name           => 'Test Result',
                :minimum        => 0,
                :maximum        => 5,
                :position       => 4620,
                :identified_by => {
                  'MEA01' => ["OG", "TR"],
                  'MEA02' => ["HT", "R1", "R2", "R3", "R4"]
                }

      #Contract Information
      segment Hippo_eyeDoc::Segments::CN1,
                :name           => 'Contract Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4650,
                :identified_by => {
                  'CN101' => ["01", "02", "03", "04", "05", "06", "09"]
                }

      #Repriced Line Item Reference Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Repriced Line Item Reference Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4700,
                :identified_by => {
                  'REF01' => '9B'
                }

      #Adjusted Repriced Line Item Reference Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Adjusted Repriced Line Item Reference Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4710,
                :identified_by => {
                  'REF01' => '9D'
                }

      #Prior Authorization
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Prior Authorization',
                :minimum        => 0,
                :maximum        => 5,
                :position       => 4730,
                :identified_by => {
                  'REF01' => 'G1'
                }

      #Line Item Control Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Line Item Control Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 47,
                :identified_by => {
                  'REF01' => '6R'
                }

      #Mammography Certification Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Mammography Certification Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 47,
                :identified_by => {
                  'REF01' => 'EW'
                }

      #Clinical Laboratory Improvement Amendment (CLIA) Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Clinical Laboratory Improvement Amendment (CLIA) Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 47,
                :identified_by => {
                  'REF01' => 'X4'
                }

      #Referring Clinical Laboratory Improvement Amendment (CLIA) Facility Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Referring Clinical Laboratory Improvement Amendment (CLIA) Facility Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 47,
                :identified_by => {
                  'REF01' => 'F4'
                }

      #Immunization Batch Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Immunization Batch Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 47,
                :identified_by => {
                  'REF01' => 'BT'
                }

      #Referral Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Referral Number',
                :minimum        => 0,
                :maximum        => 5,
                :position       => 47,
                :identified_by => {
                  'REF01' => '9F'
                }

      #Sales Tax Amount
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Sales Tax Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4810,
                :identified_by => {
                  'AMT01' => 'T'
                }

      #Postage Claimed Amount
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Postage Claimed Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4830,
                :identified_by => {
                  'AMT01' => 'F4'
                }

      #File Information
      segment Hippo_eyeDoc::Segments::K3,
                :name           => 'File Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 4850

      #Line Note
      segment Hippo_eyeDoc::Segments::NTE,
                :name           => 'Line Note',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4860,
                :identified_by => {
                  'NTE01' => ["ADD", "DCP"]
                }

      #Third Party Organization Notes
      segment Hippo_eyeDoc::Segments::NTE,
                :name           => 'Third Party Organization Notes',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4865,
                :identified_by => {
                  'NTE01' => 'TPO'
                }

      #Purchased Service Information
      segment Hippo_eyeDoc::Segments::PS1,
                :name           => 'Purchased Service Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4880

      #Line Pricing/Repricing Information
      segment Hippo_eyeDoc::Segments::HCP,
                :name           => 'Line Pricing/Repricing Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4920,
                :identified_by => {
                  'HCP01' => ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14"]
                }

      #Drug Identification
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2410,
                :name           => 'Drug Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4940,
                :identified_by => {
                  'LIN.LIN02' => ["EN", "EO", "HI", "N4", "ON", "UK", "UP"]
                }

      #Rendering Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420A,
                :name           => 'Rendering Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => '82',
                  'NM1.NM102' => ["1", "2"]
                }

      #Purchased Service Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420B,
                :name           => 'Purchased Service Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => 'QB',
                  'NM1.NM102' => ["1", "2"]
                }

      #Service Facility Location Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420C,
                :name           => 'Service Facility Location Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => '77',
                  'NM1.NM102' => '2'
                }

      #Supervising Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420D,
                :name           => 'Supervising Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => 'DQ',
                  'NM1.NM102' => '1'
                }

      #Ordering Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420E,
                :name           => 'Ordering Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => 'DK',
                  'NM1.NM102' => '1'
                }

      #Referring Provider Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420F,
                :name           => 'Referring Provider Name',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 5000,
                :identified_by => {
                  'NM1.NM101' => ["DN", "P3"],
                  'NM1.NM102' => '1'
                }

      #Ambulance Pick-up Location
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420G,
                :name           => 'Ambulance Pick-up Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5310,
                :identified_by => {
                  'NM1.NM101' => 'PW',
                  'NM1.NM102' => '2'
                }

      #Ambulance Drop-off Location
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2420H,
                :name           => 'Ambulance Drop-off Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5380,
                :identified_by => {
                  'NM1.NM101' => '45',
                  'NM1.NM102' => '2'
                }

      #Line Adjudication Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2430,
                :name           => 'Line Adjudication Information',
                :minimum        => 0,
                :maximum        => 15,
                :position       => 5400

      #Form Identification Code
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2440,
                :name           => 'Form Identification Code',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 5510,
                :identified_by => {
                  'LQ.LQ01' => ["AS", "UT"]
                }

    end
  end
end
