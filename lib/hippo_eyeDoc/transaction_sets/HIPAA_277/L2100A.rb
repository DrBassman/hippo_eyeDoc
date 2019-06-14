module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2100A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100A'    #Information Source Name

      #Information Source Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Information Source Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM101' => ["AY", "PR"],
                  'NM102' => '2',
                  'NM108' => ["46", "FI", "PI", "XV"]
                }

    end
  end
end
