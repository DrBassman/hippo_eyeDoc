module Hippo::TransactionSets
  module HIPAA_999

    class L2100AK2 < Hippo::TransactionSets::Base
      loop_name 'L2100AK2'    #Error Identification

      #Error Identification
      segment Hippo::Segments::IK3,
                :name           => 'Error Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'IK304' => ["1", "2", "3", "4", "5", "6", "7", "8", "I4", "I6", "I7", "I8", "I9"]
                }

      #Segment Context
      segment Hippo::Segments::CTX,
                :name           => 'Segment Context',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 500

      #Business Unit Identifier
      segment Hippo::Segments::CTX,
                :name           => 'Business Unit Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 510

      #Implementation Data Element Note
      loop    Hippo::TransactionSets::HIPAA_999::L2110AK2,
                :name           => 'Implementation Data Element Note',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 600,
                :identified_by => {
                  'IK4.IK403' => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "I10", "I11", "I12", "I13", "I6", "I9"]
                }

    end
  end
end
