module Hippo_eyeDoc::TransactionSets
  module HIPAA_271

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
                  'HL04' => ["0", "1"]
                }

      #Request Validation
      segment Hippo_eyeDoc::Segments::AAA,
                :name           => 'Request Validation',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 250,
                :identified_by => {
                  'AAA01' => ["N", "Y"],
                  'AAA03' => ["04", "41", "42", "79"],
                  'AAA04' => ["C", "N", "P", "R", "S", "Y"]
                }

      #Information Source Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_271::L2100A,
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
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_271::L2000B,
                :name           => 'Information Receiver Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '21',
                  'HL.HL04' => ["0", "1"]
                }

    end
  end
end
