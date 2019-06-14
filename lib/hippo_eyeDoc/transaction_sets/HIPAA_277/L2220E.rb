module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2220E < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2220E'    #Service Line Information

      #Service Line Information
      segment Hippo_eyeDoc::Segments::SVC,
                :name           => 'Service Line Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1800

      #Service Line Status Information
      segment Hippo_eyeDoc::Segments::STC,
                :name           => 'Service Line Status Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 1900

      #Service Line Item Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Service Line Item Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2000,
                :identified_by => {
                  'REF01' => 'FJ'
                }

      #Service Line Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Service Line Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2100,
                :identified_by => {
                  'DTP01' => '472',
                  'DTP02' => ["D8", "RD8"]
                }

    end
  end
end
