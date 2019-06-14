module Hippo_eyeDoc::TransactionSets
  module HIPAA_997

    class L2100 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100'    #AK2/AK3 Error Identification

      #AK2/AK3 Error Identification
      segment Hippo_eyeDoc::Segments::AK3,
                :name           => 'AK2/AK3 Error Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'AK304' => ["1", "2", "3", "4", "5", "6", "7", "8"]
                }

      #Data Element Note
      segment Hippo_eyeDoc::Segments::AK4,
                :name           => 'Data Element Note',
                :minimum        => 0,
                :maximum        => 99,
                :position       => 500,
                :identified_by => {
                  'AK403' => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "13"]
                }

    end
  end
end
