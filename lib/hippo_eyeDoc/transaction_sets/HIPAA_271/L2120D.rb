module Hippo_eyeDoc::TransactionSets
  module HIPAA_271

    class L2120D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2120D'    #Dependent Benefit Related Entity Name

      #Dependent Benefit Related Entity Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Dependent Benefit Related Entity Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1800,
                :identified_by => {
                  'NM101' => ["13", "1I", "1P", "2B", "36", "73", "FA", "GP", "GW", "I3", "IL", "LR", "OC", "P3", "P4", "P5", "PR", "PRP", "SEP", "TTP", "VER", "VN", "VY", "X3", "Y2"],
                  'NM102' => ["1", "2"]
                }

      #Dependent Benefit Related Entity Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Dependent Benefit Related Entity Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2000

      #Dependent Benefit Related Entity City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Dependent Benefit Related Entity City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2100

      #Dependent Benefit Related Entity Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Dependent Benefit Related Entity Contact Information',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 2200,
                :identified_by => {
                  'PER01' => 'IC'
                }

      #Dependent Benefit Related Provider Information
      segment Hippo_eyeDoc::Segments::PRV,
                :name           => 'Dependent Benefit Related Provider Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2230,
                :identified_by => {
                  'PRV01' => ["AD", "AT", "BI", "CO", "CV", "H", "HH", "LA", "OT", "P1", "P2", "PC", "PE", "R", "RF", "SB", "SK", "SU"]
                }

    end
  end
end
