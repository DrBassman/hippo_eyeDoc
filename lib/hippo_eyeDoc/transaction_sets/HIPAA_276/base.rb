module Hippo_eyeDoc::TransactionSets
  module HIPAA_276

    class Base < Hippo_eyeDoc::TransactionSets::Base

      #Transaction Set Header
      segment Hippo_eyeDoc::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '276'
                }

      #Beginning of Hierarchical Transaction
      segment Hippo_eyeDoc::Segments::BHT,
                :name           => 'Beginning of Hierarchical Transaction',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'BHT01' => '0010',
                  'BHT02' => '13'
                }

      #Information Source Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2000A,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '20',
                  'HL.HL04' => '1'
                }

      #Information Receiver Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2000B,
                :name           => 'Information Receiver Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '21',
                  'HL.HL04' => '1'
                }

      #Service Provider Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2000C,
                :name           => 'Service Provider Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '19',
                  'HL.HL04' => '1'
                }

      #Subscriber Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2000D,
                :name           => 'Subscriber Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '22',
                  'HL.HL04' => ["0", "1"]
                }

      #Dependent Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_276::L2000E,
                :name           => 'Dependent Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '23'
                }

      #Transaction Set Trailer
      segment Hippo_eyeDoc::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1600

    end
  end
end
