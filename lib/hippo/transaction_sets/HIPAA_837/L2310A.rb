module Hippo::TransactionSets
  module HIPAA_837

    class L2310A < Hippo::TransactionSets::Base
      loop_name 'L2310A'    #Referring Provider Name

      #Referring Provider Name
      segment Hippo::Segments::NM1,
                :name           => 'Referring Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM101' => ["DN", "P3"],
                  'NM102' => '1'
                }

      #Referring Provider Secondary Identification
      segment Hippo::Segments::REF,
                :name           => 'Referring Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 2710,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2"]
                }

    end
  end
end
