module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330G < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330G'    #Other Payer Billing Provider

      #Other Payer Billing Provider
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Payer Billing Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 6350,
                :identified_by => {
                  'NM101' => '85',
                  'NM102' => ["1", "2"]
                }

      #Other Payer Billing Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Payer Billing Provider Secondary Identification',
                :minimum        => 1,
                :maximum        => 2,
                :position       => 6600,
                :identified_by => {
                  'REF01' => ["G2", "LU"]
                }

    end
  end
end
