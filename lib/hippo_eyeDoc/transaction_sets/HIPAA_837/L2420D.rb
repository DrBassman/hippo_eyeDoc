module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2420D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2420D'    #Supervising Provider Name

      #Supervising Provider Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Supervising Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM101' => 'DQ',
                  'NM102' => '1'
                }

      #Supervising Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Supervising Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 5250,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2", "LU"]
                }

    end
  end
end
