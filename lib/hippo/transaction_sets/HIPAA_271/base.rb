module Hippo::TransactionSets
  module HIPAA_271

    class Base < Hippo::TransactionSets::Base

      #Transaction Set Header
      segment Hippo::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '271'
                }

      #Beginning of Hierarchical Transaction
      segment Hippo::Segments::BHT,
                :name           => 'Beginning of Hierarchical Transaction',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'BHT01' => '0022',
                  'BHT02' => ["06", "11"]
                }

      #Information Source Level
      loop    Hippo::TransactionSets::HIPAA_271::L2000A,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '20',
                  'HL.HL04' => ["0", "1"]
                }

      #Transaction Set Trailer
      segment Hippo::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2300

    end
  end
end
