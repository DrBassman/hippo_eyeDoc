module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330E < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330E'    #Other Payer Service Facility Location

      #Other Payer Service Facility Location
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Payer Service Facility Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4650,
                :identified_by => {
                  'NM101' => '77',
                  'NM102' => '2'
                }

      #Other Payer Service Facility Location Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Payer Service Facility Location Secondary Identification',
                :minimum        => 1,
                :maximum        => 3,
                :position       => 5550,
                :identified_by => {
                  'REF01' => ["0B", "G2", "LU"]
                }

    end
  end
end
