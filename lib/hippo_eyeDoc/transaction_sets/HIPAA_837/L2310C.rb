module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2310C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2310C'    #Service Facility Location Name

      #Service Facility Location Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Service Facility Location Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2500,
                :identified_by => {
                  'NM101' => '77',
                  'NM102' => '2'
                }

      #Service Facility Location Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Service Facility Location Address',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2650

      #Service Facility Location City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Service Facility Location City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 2700

      #Service Facility Location Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Service Facility Location Secondary Identification',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 2710,
                :identified_by => {
                  'REF01' => ["0B", "G2", "LU"]
                }

      #Service Facility Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Service Facility Contact Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2750,
                :identified_by => {
                  'PER01' => 'IC',
                  'PER03' => 'TE'
                }

    end
  end
end
