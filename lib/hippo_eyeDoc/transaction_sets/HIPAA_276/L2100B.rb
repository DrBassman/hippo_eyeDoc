module Hippo_eyeDoc::TransactionSets
  module HIPAA_276

    class L2100B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100B'    #Information Receiver Name

      #Information Receiver Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Information Receiver Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM101' => '41',
                  'NM102' => ["1", "2"],
                  'NM108' => '46'
                }

    end
  end
end
