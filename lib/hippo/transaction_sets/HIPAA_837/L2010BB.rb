module Hippo::TransactionSets
  module HIPAA_837

    class L2010BB < Hippo::TransactionSets::Base
      loop_name 'L2010BB'    #Payer Name

      #Payer Name
      segment Hippo::Segments::NM1,
                :name           => 'Payer Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM101' => 'PR',
                  'NM102' => '2',
                  'NM108' => ["PI", "XV"]
                }

      #Payer Address
      segment Hippo::Segments::N3,
                :name           => 'Payer Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 250

      #Payer City, State, ZIP Code
      segment Hippo::Segments::N4,
                :name           => 'Payer City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 300

      #Payer Secondary Identification
      segment Hippo::Segments::REF,
                :name           => 'Payer Secondary Identification',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 350,
                :identified_by => {
                  'REF01' => ["2U", "EI", "FY", "NF"]
                }

      #Billing Provider Secondary Identification
      segment Hippo::Segments::REF,
                :name           => 'Billing Provider Secondary Identification',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 370,
                :identified_by => {
                  'REF01' => ["G2", "LU"]
                }

    end
  end
end
