module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2420F < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2420F'    #Referring Provider Name

      #Referring Provider Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Referring Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM101' => ["DN", "P3"],
                  'NM102' => '1'
                }

      #Referring Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Referring Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 5250,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2"]
                }

    end
  end
end
