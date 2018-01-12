module Hippo::TransactionSets
  module HIPAA_276

    class L2000D < Hippo::TransactionSets::Base
      loop_name 'L2000D'    #Subscriber Level

      #Subscriber Level
      segment Hippo::Segments::HL,
                :name           => 'Subscriber Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '22',
                  'HL04' => ["0", "1"]
                }

      #Subscriber Demographic Information
      segment Hippo::Segments::DMG,
                :name           => 'Subscriber Demographic Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'DMG01' => 'D8'
                }

      #Subscriber Name
      loop    Hippo::TransactionSets::HIPAA_276::L2100D,
                :name           => 'Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => 'IL',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => ["24", "II", "MI"]
                }

      #Claim Status Tracking Number
      loop    Hippo::TransactionSets::HIPAA_276::L2200D,
                :name           => 'Claim Status Tracking Number',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 900,
                :identified_by => {
                  'TRN.TRN01' => '1'
                }

    end
  end
end
