module Hippo_eyeDoc::TransactionSets
  module HIPAA_276

    class L2200D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2200D'    #Claim Status Tracking Number

      #Claim Status Tracking Number
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Claim Status Tracking Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Payer Claim Control Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Payer Claim Control Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1000,
                :identified_by => {
                  'REF01' => '1K'
                }

      #Institutional Bill Type Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Institutional Bill Type Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1010,
                :identified_by => {
                  'REF01' => 'BLT'
                }

      #Application or Location System Identifier
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Application or Location System Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1030,
                :identified_by => {
                  'REF01' => 'LU'
                }

      #Group Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Group Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1035,
                :identified_by => {
                  'REF01' => '6P'
                }

      #Patient Control Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Patient Control Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1040,
                :identified_by => {
                  'REF01' => 'EJ'
                }

      #Pharmacy Prescription Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Pharmacy Prescription Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1045,
                :identified_by => {
                  'REF01' => 'XZ'
                }

      #Claim Identification Number For Clearinghouses and Other Transmission Intermediaries
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Claim Identification Number For Clearinghouses and Other Transmission Intermediaries',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1050,
                :identified_by => {
                  'REF01' => 'D9'
                }

      #Claim Submitted Charges
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Claim Submitted Charges',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1100,
                :identified_by => {
                  'AMT01' => 'T3'
                }

      #Claim Service Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Claim Service Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

      #Service Line Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2210D,
                :name           => 'Service Line Information',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 1300

    end
  end
end
