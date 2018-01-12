module Hippo::TransactionSets
  module HIPAA_837

    class Base < Hippo::TransactionSets::Base
      #Transaction Set Header
      segment Hippo::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50,
                :identified_by => {
                  'ST01' => '837'
                }

      #Beginning of Hierarchical Transaction
      segment Hippo::Segments::BHT,
                :name           => 'Beginning of Hierarchical Transaction',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'BHT01' => '0019',
                  'BHT02' => ["00", "18"],
                  'BHT06' => ["31", "CH", "RP"]
                }

      #Submitter Name
      loop    Hippo::TransactionSets::HIPAA_837::L1000A,
                :name           => 'Submitter Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'NM1.NM101' => '41',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => '46'
                }

      #Receiver Name
      loop    Hippo::TransactionSets::HIPAA_837::L1000B,
                :name           => 'Receiver Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => '40',
                  'NM1.NM102' => '2',
                  'NM1.NM108' => '46'
                }

      #Billing Provider Hierarchical Level
      loop    Hippo::TransactionSets::HIPAA_837::L2000A,
                :name           => 'Billing Provider Hierarchical Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 10,
                :identified_by => {
                  'HL.HL03' => '20',
                  'HL.HL04' => '1'
                }

      #Transaction Set Trailer
      segment Hippo::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 5550

    end
  end
end
