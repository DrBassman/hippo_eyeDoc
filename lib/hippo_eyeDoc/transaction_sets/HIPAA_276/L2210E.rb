module Hippo_eyeDoc::TransactionSets
  module HIPAA_276

    class L2210E < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2210E'    #Service Line Information

      #Service Line Information
      segment Hippo_eyeDoc::Segments::SVC,
                :name           => 'Service Line Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1300

      #Service Line Item Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Service Line Item Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'REF01' => 'FJ'
                }

      #Service Line Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Service Line Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1500,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

    end
  end
end
