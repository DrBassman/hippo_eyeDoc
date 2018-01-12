module Hippo::TransactionSets
  module HIPAA_997

    class L2000 < Hippo::TransactionSets::Base
      loop_name 'L2000'    #Transaction Set Response Header

      #Transaction Set Response Header
      segment Hippo::Segments::AK2,
                :name           => 'Transaction Set Response Header',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 300

      #AK2/AK3 Error Identification
      loop    Hippo::TransactionSets::HIPAA_997::L2100,
                :name           => 'AK2/AK3 Error Identification',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 400,
                :identified_by => {
                  'AK3.AK304' => ["1", "2", "3", "4", "5", "6", "7", "8"]
                }

      #Transaction Set Response Trailer
      segment Hippo::Segments::AK5,
                :name           => 'Transaction Set Response Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 600,
                :identified_by => {
                  'AK501' => ["A", "E", "M", "R", "W", "X"]
                }

    end
  end
end
