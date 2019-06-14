module Hippo_eyeDoc::TransactionSets
  module HIPAA_276

    class L2100A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100A'    #Payer Name

      #Payer Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Payer Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM101' => 'PR',
                  'NM102' => '2',
                  'NM108' => ["PI", "XV"]
                }

    end
  end
end
