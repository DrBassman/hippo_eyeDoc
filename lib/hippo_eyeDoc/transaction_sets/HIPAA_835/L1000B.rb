module Hippo_eyeDoc::TransactionSets
  module HIPAA_835

    class L1000B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L1000B'    #Payee Identification

      #Payee Identification
      segment Hippo_eyeDoc::Segments::N1,
                :name           => 'Payee Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'N101' => 'PE',
                  'N103' => ["FI", "XV", "XX"]
                }

      #Payee Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Payee Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1600

      #Payee City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Payee City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1700

      #Payee Additional Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Payee Additional Identification',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 1800,
                :identified_by => {
                  'REF01' => ["0B", "D3", "PQ", "TJ"]
                }

      #Remittance Delivery Method
      segment Hippo_eyeDoc::Segments::RDM,
                :name           => 'Remittance Delivery Method',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2000,
                :identified_by => {
                  'RDM01' => ["BM", "EM", "FT", "OL"]
                }

    end
  end
end
