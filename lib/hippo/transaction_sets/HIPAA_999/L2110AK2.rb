module Hippo::TransactionSets
  module HIPAA_999

    class L2110AK2 < Hippo::TransactionSets::Base
      loop_name 'L2110AK2'    #Implementation Data Element Note

      #Implementation Data Element Note
      segment Hippo::Segments::IK4,
                :name           => 'Implementation Data Element Note',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600,
                :identified_by => {
                  'IK403' => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13", "I10", "I11", "I12", "I13", "I6", "I9"]
                }

      #Element Context
      segment Hippo::Segments::CTX,
                :name           => 'Element Context',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 700

    end
  end
end
