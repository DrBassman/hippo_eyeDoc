module Hippo::TransactionSets
  module HIPAA_271

    class L2100A < Hippo::TransactionSets::Base
      loop_name 'L2100A'    #Information Source Name

      #Information Source Name
      segment Hippo::Segments::NM1,
                :name           => 'Information Source Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => ["2B", "36", "GP", "P5", "PR"],
                  'NM102' => ["1", "2"],
                  'NM108' => ["24", "46", "FI", "NI", "PI", "XV", "XX"]
                }

      #Information Source Contact Information
      segment Hippo::Segments::PER,
                :name           => 'Information Source Contact Information',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 800,
                :identified_by => {
                  'PER01' => 'IC'
                }

      #Request Validation
      segment Hippo::Segments::AAA,
                :name           => 'Request Validation',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 850,
                :identified_by => {
                  'AAA01' => ["N", "Y"],
                  'AAA03' => ["04", "41", "42", "79", "80", "T4"],
                  'AAA04' => ["C", "N", "P", "R", "S", "W", "X", "Y"]
                }

    end
  end
end
