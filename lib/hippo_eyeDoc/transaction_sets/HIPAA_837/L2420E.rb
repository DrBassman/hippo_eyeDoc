module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2420E < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2420E'    #Ordering Provider Name

      #Ordering Provider Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Ordering Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5000,
                :identified_by => {
                  'NM101' => 'DK',
                  'NM102' => '1'
                }

      #Ordering Provider Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Ordering Provider Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5140

      #Ordering Provider City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Ordering Provider City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5200

      #Ordering Provider Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Ordering Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 5250,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2"]
                }

      #Ordering Provider Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Ordering Provider Contact Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5300,
                :identified_by => {
                  'PER01' => 'IC',
                  'PER03' => ["EM", "FX", "TE"]
                }

    end
  end
end
