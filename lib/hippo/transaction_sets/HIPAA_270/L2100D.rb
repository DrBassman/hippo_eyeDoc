module Hippo::TransactionSets
  module HIPAA_270

    class L2100D < Hippo::TransactionSets::Base
      loop_name 'L2100D'    #Dependent Name

      #Dependent Name
      segment Hippo::Segments::NM1,
                :name           => 'Dependent Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => '03',
                  'NM102' => '1'
                }

      #Dependent Additional Identification
      segment Hippo::Segments::REF,
                :name           => 'Dependent Additional Identification',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 400,
                :identified_by => {
                  'REF01' => ["18", "1L", "1W", "6P", "CT", "EA", "EJ", "F6", "GH", "HJ", "IF", "IG", "MRC", "N6", "SY", "Y4"]
                }

      #Dependent Address
      segment Hippo::Segments::N3,
                :name           => 'Dependent Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600

      #Dependent City, State, ZIP Code
      segment Hippo::Segments::N4,
                :name           => 'Dependent City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 700

      #Provider Information
      segment Hippo::Segments::PRV,
                :name           => 'Provider Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'PRV01' => ["AD", "AT", "BI", "CO", "CV", "H", "HH", "LA", "OT", "P1", "P2", "PC", "PE", "R", "RF", "SK", "SU"]
                }

      #Dependent Demographic Information
      segment Hippo::Segments::DMG,
                :name           => 'Dependent Demographic Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1000

      #Dependent Relationship
      segment Hippo::Segments::INS,
                :name           => 'Dependent Relationship',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1100,
                :identified_by => {
                  'INS01' => 'N',
                  'INS02' => ["01", "19", "34"]
                }

      #Dependent Health Care Diagnosis Code
      segment Hippo::Segments::HI,
                :name           => 'Dependent Health Care Diagnosis Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1150

      #Dependent Date
      segment Hippo::Segments::DTP,
                :name           => 'Dependent Date',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => ["102", "291"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Dependent Eligibility or Benefit Inquiry
      loop    Hippo::TransactionSets::HIPAA_270::L2110D,
                :name           => 'Dependent Eligibility or Benefit Inquiry',
                :minimum        => 1,
                :maximum        => 99,
                :position       => 1300

    end
  end
end
