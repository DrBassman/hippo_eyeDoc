module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330D'    #Other Payer Rendering Provider

      #Other Payer Rendering Provider
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Payer Rendering Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3650,
                :identified_by => {
                  'NM101' => '82',
                  'NM102' => ["1", "2"]
                }

      #Other Payer Rendering Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Payer Rendering Provider Secondary Identification',
                :minimum        => 1,
                :maximum        => 3,
                :position       => 4150,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2", "LU"]
                }

    end
  end
end
