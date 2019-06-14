module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2420B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2420B'    #Purchased Service Provider Name

      #Purchased Service Provider Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Purchased Service Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM101' => 'QB',
                  'NM102' => ["1", "2"]
                }

      #Purchased Service Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Purchased Service Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 5250,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2"]
                }

    end
  end
end
