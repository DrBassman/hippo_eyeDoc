module Hippo::TransactionSets
  module HIPAA_276

    class L2000C < Hippo::TransactionSets::Base
      loop_name 'L2000C'    #Service Provider Level

      #Service Provider Level
      segment Hippo::Segments::HL,
                :name           => 'Service Provider Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '19',
                  'HL04' => '1'
                }

      #Provider Name
      loop    Hippo::TransactionSets::HIPAA_276::L2100C,
                :name           => 'Provider Name',
                :minimum        => 1,
                :maximum        => 2,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => '1P',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => ["FI", "SV", "XX"]
                }

    end
  end
end
