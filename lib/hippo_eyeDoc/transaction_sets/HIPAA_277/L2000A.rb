module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2000A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000A'    #Information Source Level

      #Information Source Level
      segment Hippo_eyeDoc::Segments::HL,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '20',
                  'HL04' => '1'
                }

      #Information Source Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2100A,
                :name           => 'Information Source Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => ["AY", "PR"],
                  'NM1.NM102' => '2',
                  'NM1.NM108' => ["46", "FI", "PI", "XV"]
                }

      #Transmission Receipt Control Identifier
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2200A,
                :name           => 'Transmission Receipt Control Identifier',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN.TRN01' => '1'
                }

    end
  end
end
