module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class Base < Hippo_eyeDoc::TransactionSets::Base

      #Transaction Set Header
      segment Hippo_eyeDoc::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '277'
                }

      #Beginning of Hierarchical Transaction
      segment Hippo_eyeDoc::Segments::BHT,
                :name           => 'Beginning of Hierarchical Transaction',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'BHT01' => '0085',
                  'BHT02' => '08',
                  'BHT06' => 'TH'
                }

      #Information Source Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2000A,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '20',
                  'HL.HL04' => '1'
                }

      #Information Receiver Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2000B,
                :name           => 'Information Receiver Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '21',
                  'HL.HL04' => ["0", "1"]
                }

      #Billing Provider of Service Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2000C,
                :name           => 'Billing Provider of Service Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '19',
                  'HL.HL04' => ["0", "1"]
                }

      #Transaction Set Trailer
      segment Hippo_eyeDoc::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2700

    end
  end
end
