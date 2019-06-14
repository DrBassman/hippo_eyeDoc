module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330C'    #Other Payer Referring Provider

      #Other Payer Referring Provider
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Payer Referring Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3250,
                :identified_by => {
                  'NM101' => ["DN", "P3"],
                  'NM102' => '1'
                }

      #Other Payer Referring Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Payer Referring Provider Secondary Identification',
                :minimum        => 1,
                :maximum        => 3,
                :position       => 3550,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2"]
                }

    end
  end
end
