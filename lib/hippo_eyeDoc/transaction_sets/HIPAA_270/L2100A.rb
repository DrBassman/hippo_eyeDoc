module Hippo_eyeDoc::TransactionSets
  module HIPAA_270

    class L2100A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100A'    #Information Source Name

      #Information Source Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Information Source Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => ["2B", "36", "GP", "P5", "PR"],
                  'NM102' => ["1", "2"],
                  'NM108' => ["24", "46", "FI", "NI", "PI", "XV", "XX"]
                }

    end
  end
end
