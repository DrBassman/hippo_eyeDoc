module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2410 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2410'    #Drug Identification

      #Drug Identification
      segment Hippo_eyeDoc::Segments::LIN,
                :name           => 'Drug Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4940,
                :identified_by => {
                  'LIN02' => ["EN", "EO", "HI", "N4", "ON", "UK", "UP"]
                }

      #Drug Quantity
      segment Hippo_eyeDoc::Segments::CTP,
                :name           => 'Drug Quantity',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 4950

      #Prescription or Compound Drug Association Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Prescription or Compound Drug Association Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4960,
                :identified_by => {
                  'REF01' => ["VY", "XZ"]
                }

    end
  end
end
