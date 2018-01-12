module Hippo::TransactionSets
  module HIPAA_270

    class L2000A < Hippo::TransactionSets::Base
      loop_name 'L2000A'    #Information Source Level

      #Information Source Level
      segment Hippo::Segments::HL,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '20',
                  'HL04' => '1'
                }

      #Information Source Name
      loop    Hippo::TransactionSets::HIPAA_270::L2100A,
                :name           => 'Information Source Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM1.NM101' => ["2B", "36", "GP", "P5", "PR"],
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => ["24", "46", "FI", "NI", "PI", "XV", "XX"]
                }

      #Information Receiver Level
      loop    Hippo::TransactionSets::HIPAA_270::L2000B,
                :name           => 'Information Receiver Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '21',
                  'HL.HL04' => '1'
                }

    end
  end
end
