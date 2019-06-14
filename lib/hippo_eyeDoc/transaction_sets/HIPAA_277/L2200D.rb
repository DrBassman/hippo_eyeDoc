module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2200D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2200D'    #Claim Status Tracking Number

      #Claim Status Tracking Number
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Claim Status Tracking Number',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN01' => '2'
                }

      #Claim Level Status Information
      segment Hippo_eyeDoc::Segments::STC,
                :name           => 'Claim Level Status Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 1000,
                :identified_by => {
                  'STC03' => ["U", "WQ"]
                }

      #Payer Claim Control Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Payer Claim Control Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1100,
                :identified_by => {
                  'REF01' => '1K'
                }

      #Claim Identifier Number For Clearinghouse and Other Transmission Intermediaries
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Claim Identifier Number For Clearinghouse and Other Transmission Intermediaries',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1110,
                :identified_by => {
                  'REF01' => 'D9'
                }

      #Institutional Bill Type Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Institutional Bill Type Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1120,
                :identified_by => {
                  'REF01' => 'BLT'
                }

      #Claim Level Service Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Claim Level Service Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

      #Service Line Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2220D,
                :name           => 'Service Line Information',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 1800

    end
  end
end
