module Hippo::TransactionSets
  module HIPAA_277

    class L2000B < Hippo::TransactionSets::Base
      loop_name 'L2000B'    #Information Receiver Level

      #Information Receiver Level
      segment Hippo::Segments::HL,
                :name           => 'Information Receiver Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '21',
                  'HL04' => ["0", "1"]
                }

      #Information Receiver Name
      loop    Hippo::TransactionSets::HIPAA_277::L2100B,
                :name           => 'Information Receiver Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => '41',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => '46'
                }

      #Information Receiver Application Trace Identifier
      loop    Hippo::TransactionSets::HIPAA_277::L2200B,
                :name           => 'Information Receiver Application Trace Identifier',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN.TRN01' => '2'
                }

    end
  end
end
