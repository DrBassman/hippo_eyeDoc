module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2010CA < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2010CA'    #Patient Name

      #Patient Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Patient Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM101' => 'QC',
                  'NM102' => '1'
                }

      #Patient Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Patient Address',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 250

      #Patient City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Patient City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300

      #Patient Demographic Information
      segment Hippo_eyeDoc::Segments::DMG,
                :name           => 'Patient Demographic Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 320,
                :identified_by => {
                  'DMG01' => 'D8',
                  'DMG03' => ["F", "M", "U"]
                }

      #Property and Casualty Claim Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Property and Casualty Claim Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 360,
                :identified_by => {
                  'REF01' => 'Y4'
                }

      #Property and Casualty Patient Identifier
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Property and Casualty Patient Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 362,
                :identified_by => {
                  'REF01' => ["1W", "SY"]
                }

      #Property and Casualty Patient Contact Information
      segment Hippo_eyeDoc::Segments::PER,
                :name           => 'Property and Casualty Patient Contact Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'PER01' => 'IC',
                  'PER03' => 'TE'
                }

    end
  end
end
