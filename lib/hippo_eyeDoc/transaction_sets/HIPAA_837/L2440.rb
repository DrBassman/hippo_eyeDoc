module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2440 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2440'    #Form Identification Code

      #Form Identification Code
      segment Hippo_eyeDoc::Segments::LQ,
                :name           => 'Form Identification Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5510,
                :identified_by => {
                  'LQ01' => ["AS", "UT"]
                }

      #Supporting Documentation
      segment Hippo_eyeDoc::Segments::FRM,
                :name           => 'Supporting Documentation',
                :minimum        => 1,
                :maximum        => 99,
                :position       => 5520

    end
  end
end
