module Hippo_eyeDoc::TransactionSets
  module HIPAA_997

    class Base < Hippo_eyeDoc::TransactionSets::Base

      #Transaction Set Header
      segment Hippo_eyeDoc::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '997'
                }

      #Functional Group Response Header
      segment Hippo_eyeDoc::Segments::AK1,
                :name           => 'Functional Group Response Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200

      #Transaction Set Response Header
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_997::L2000,
                :name           => 'Transaction Set Response Header',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 300

      #Functional Group Response Trailer
      segment Hippo_eyeDoc::Segments::AK9,
                :name           => 'Functional Group Response Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 700,
                :identified_by => {
                  'AK901' => ["A", "E", "M", "P", "R", "W", "X"]
                }

      #Transaction Set Trailer
      segment Hippo_eyeDoc::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 800

    end
  end
end
