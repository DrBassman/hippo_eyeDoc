module Hippo::TransactionSets
  module HIPAA_277

    class L2000C < Hippo::TransactionSets::Base
      loop_name 'L2000C'    #Billing Provider of Service Level

      #Billing Provider of Service Level
      segment Hippo::Segments::HL,
                :name           => 'Billing Provider of Service Level',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '19',
                  'HL04' => ["0", "1"]
                }

      #Billing Provider Name
      loop    Hippo::TransactionSets::HIPAA_277::L2100C,
                :name           => 'Billing Provider Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => '85',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => ["FI", "XX"]
                }

      #Provider of Service Information Trace Identifier
      loop    Hippo::TransactionSets::HIPAA_277::L2200C,
                :name           => 'Provider of Service Information Trace Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN.TRN01' => '1'
                }

      #Patient Level
      loop    Hippo::TransactionSets::HIPAA_277::L2000D,
                :name           => 'Patient Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'HL.HL03' => 'PT'
                }

    end
  end
end
