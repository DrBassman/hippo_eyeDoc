module Hippo::TransactionSets
  module HIPAA_270

    class L2000D < Hippo::TransactionSets::Base
      loop_name 'L2000D'    #Dependent Level

      #Dependent Level
      segment Hippo::Segments::HL,
                :name           => 'Dependent Level',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '23',
                  'HL04' => '0'
                }

      #Dependent Trace Number
      segment Hippo::Segments::TRN,
                :name           => 'Dependent Trace Number',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 200,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Dependent Name
      loop    Hippo::TransactionSets::HIPAA_270::L2100D,
                :name           => 'Dependent Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM1.NM101' => '03',
                  'NM1.NM102' => '1'
                }

    end
  end
end
