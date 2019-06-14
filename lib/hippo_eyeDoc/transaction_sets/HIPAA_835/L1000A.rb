module Hippo_eyeDoc::TransactionSets
  module HIPAA_835

    class L1000A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L1000A'    #Payer Identification

      #Payer Identification
      segment Hippo_eyeDoc::Segments::N1,
                :name           => 'Payer Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 800,
                :identified_by => {
                  'N101' => 'PR'
                }

      #Payer Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Payer Address',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1000

      #Payer City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Payer City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1100

      #Additional Payer Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Additional Payer Identification',
                :minimum        => 0,
                :maximum        => 4,
                :position       => 1200,
                :identified_by => {
                  'REF01' => ["2U", "EO", "HI", "NF"]
                }

      #Payer Business Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Payer Business Contact Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1300,
                :identified_by => {
                  'PER01' => 'CX'
                }

      #Payer Technical Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Payer Technical Contact Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 1303,
                :identified_by => {
                  'PER01' => 'BL'
                }

      #Payer WEB Site
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Payer WEB Site',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1305,
                :identified_by => {
                  'PER01' => 'IC',
                  'PER03' => 'UR'
                }

    end
  end
end
