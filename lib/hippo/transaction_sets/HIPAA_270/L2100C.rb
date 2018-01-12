module Hippo::TransactionSets
  module HIPAA_270

    class L2100C < Hippo::TransactionSets::Base
      loop_name 'L2100C'    #Subscriber Name

      #Subscriber Name
      segment Hippo::Segments::NM1,
                :name           => 'Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => 'IL',
                  'NM102' => ["1", "2"]
                }

      #Subscriber Additional Identification
      segment Hippo::Segments::REF,
                :name           => 'Subscriber Additional Identification',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 400,
                :identified_by => {
                  'REF01' => ["18", "1L", "1W", "3H", "6P", "CT", "EA", "EJ", "F6", "GH", "HJ", "IG", "N6", "NQ", "SY", "Y4"]
                }

      #Subscriber Address
      segment Hippo::Segments::N3,
                :name           => 'Subscriber Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600

      #Subscriber City, State, ZIP Code
      segment Hippo::Segments::N4,
                :name           => 'Subscriber City, State, ZIP Code',
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

      #Subscriber Demographic Information
      segment Hippo::Segments::DMG,
                :name           => 'Subscriber Demographic Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1000

      #Multiple Birth Sequence Number
      segment Hippo::Segments::INS,
                :name           => 'Multiple Birth Sequence Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1100,
                :identified_by => {
                  'INS01' => 'Y',
                  'INS02' => '18'
                }

      #Subscriber Health Care Diagnosis Code
      segment Hippo::Segments::HI,
                :name           => 'Subscriber Health Care Diagnosis Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1150

      #Subscriber Date
      segment Hippo::Segments::DTP,
                :name           => 'Subscriber Date',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => ["102", "291"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Subscriber Eligibility or Benefit Inquiry
      loop    Hippo::TransactionSets::HIPAA_270::L2110C,
                :name           => 'Subscriber Eligibility or Benefit Inquiry',
                :minimum        => 0,
                :maximum        => 99,
                :position       => 1300

    end
  end
end
