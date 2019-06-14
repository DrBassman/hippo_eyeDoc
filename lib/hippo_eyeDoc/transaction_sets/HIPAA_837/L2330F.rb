module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330F < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330F'    #Other Payer Supervising Provider

      #Other Payer Supervising Provider
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Payer Supervising Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5650,
                :identified_by => {
                  'NM101' => 'DQ',
                  'NM102' => '1'
                }

      #Other Payer Supervising Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Payer Supervising Provider Secondary Identification',
                :minimum        => 1,
                :maximum        => 3,
                :position       => 6050,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2", "LU"]
                }

    end
  end
end
