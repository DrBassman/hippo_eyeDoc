module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2200A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2200A'    #Transmission Receipt Control Identifier

      #Transmission Receipt Control Identifier
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Transmission Receipt Control Identifier',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Information Source Receipt Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Information Source Receipt Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => '050',
                  'DTP02' => 'D8'
                }

      #Information Source Process Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Information Source Process Date',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1205,
                :identified_by => {
                  'DTP01' => '009',
                  'DTP02' => 'D8'
                }

    end
  end
end
