module Hippo::TransactionSets
  module HIPAA_999

    class L2000AK2 < Hippo::TransactionSets::Base
      loop_name 'L2000AK2'    #Transaction Set Response Header

      #Transaction Set Response Header
      segment Hippo::Segments::AK2,
                :name           => 'Transaction Set Response Header',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 300

      #Error Identification
      loop    Hippo::TransactionSets::HIPAA_999::L2100AK2,
                :name           => 'Error Identification',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 400,
                :identified_by => {
                  'IK3.IK304' => ["1", "2", "3", "4", "5", "6", "7", "8", "I4", "I6", "I7", "I8", "I9"]
                }

      #Transaction Set Response Trailer
      segment Hippo::Segments::IK5,
                :name           => 'Transaction Set Response Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 800,
                :identified_by => {
                  'IK501' => ["A", "E", "M", "R", "W", "X"]
                }

    end
  end
end
