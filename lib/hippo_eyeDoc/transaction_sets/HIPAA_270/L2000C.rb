module Hippo_eyeDoc::TransactionSets
  module HIPAA_270

    class L2000C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000C'    #Subscriber Level

      #Subscriber Level
      segment Hippo_eyeDoc::Segments::HL,
                :name           => 'Subscriber Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '22',
                  'HL04' => ["0", "1"]
                }

      #Subscriber Trace Number
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Subscriber Trace Number',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 200,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Subscriber Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_270::L2100C,
                :name           => 'Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM1.NM101' => 'IL',
                  'NM1.NM102' => ["1", "2"]
                }

      #Dependent Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_270::L2000D,
                :name           => 'Dependent Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '23',
                  'HL.HL04' => '0'
                }

    end
  end
end
