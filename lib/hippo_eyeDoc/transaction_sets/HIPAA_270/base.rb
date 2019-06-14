module Hippo_eyeDoc::TransactionSets
  module HIPAA_270

    class Base < Hippo_eyeDoc::TransactionSets::Base

      #Transaction Set Header
      segment Hippo_eyeDoc::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '270'
                }

      #Beginning of Hierarchical Transaction
      segment Hippo_eyeDoc::Segments::BHT,
                :name           => 'Beginning of Hierarchical Transaction',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'BHT01' => '0022',
                  'BHT02' => ["01", "13"]
                }

      #Information Source Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_270::L2000A,
                :name           => 'Information Source Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => '20',
                  'HL.HL04' => '1'
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
