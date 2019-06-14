module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L1000A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L1000A'    #Submitter Name

      #Submitter Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Submitter Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'NM101' => '41',
                  'NM102' => ["1", "2"],
                  'NM108' => '46'
                }

      #Submitter EDI Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Submitter EDI Contact Information',
                :minimum        => 1,
                :maximum        => 2,
                :position       => 450,
                :identified_by => {
                  'PER01' => 'IC',
                  'PER03' => ["EM", "FX", "TE"]
                }

    end
  end
end
