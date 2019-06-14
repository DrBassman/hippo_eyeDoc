module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2220D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2220D'    #Service Line Information

      #Service Line Information
      segment Hippo_eyeDoc::Segments::SVC,
                :name           => 'Service Line Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1800

      #Service Line Level Status Information
      segment Hippo_eyeDoc::Segments::STC,
                :name           => 'Service Line Level Status Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 1900,
                :identified_by => {
                  'STC03' => 'U'
                }

      #Service Line Item Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Service Line Item Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2000,
                :identified_by => {
                  'REF01' => 'FJ'
                }

      #Pharmacy Prescription Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Pharmacy Prescription Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2010,
                :identified_by => {
                  'REF01' => 'XZ'
                }

      #Service Line Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Service Line Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2100,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

    end
  end
end
