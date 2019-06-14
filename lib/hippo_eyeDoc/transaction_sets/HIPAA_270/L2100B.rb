module Hippo_eyeDoc::TransactionSets
  module HIPAA_270

    class L2100B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2100B'    #Information Receiver Name

      #Information Receiver Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Information Receiver Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => ["1P", "2B", "36", "80", "FA", "GP", "P5", "PR"],
                  'NM102' => ["1", "2"],
                  'NM108' => ["24", "34", "FI", "PI", "PP", "SV", "XV", "XX"]
                }

      #Information Receiver Additional Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Information Receiver Additional Identification',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 400,
                :identified_by => {
                  'REF01' => ["0B", "1C", "1D", "1J", "4A", "CT", "EL", "EO", "HPI", "JD", "N5", "N7", "Q4", "SY", "TJ"]
                }

      #Information Receiver Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Information Receiver Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600

      #Information Receiver City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Information Receiver City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 700

      #Information Receiver Provider Information
      segment Hippo_eyeDoc::Segments::PRV,
                :name           => 'Information Receiver Provider Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'PRV01' => ["AD", "AT", "BI", "CO", "CV", "H", "HH", "LA", "OT", "P1", "P2", "PC", "PE", "R", "RF", "SB", "SK", "SU"]
                }

    end
  end
end
