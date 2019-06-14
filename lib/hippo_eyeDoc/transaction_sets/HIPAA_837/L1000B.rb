module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L1000B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L1000B'    #Receiver Name

      #Receiver Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Receiver Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM101' => '40',
                  'NM102' => '2',
                  'NM108' => '46'
                }

    end
  end
end
