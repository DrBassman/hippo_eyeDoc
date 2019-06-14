module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2010AC < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2010AC'    #Pay-To Plan Name

      #Pay-To Plan Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Pay-To Plan Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 450,
                :identified_by => {
                  'NM101' => 'PE',
                  'NM102' => '2',
                  'NM108' => ["PI", "XV"]
                }

      #Pay-to Plan Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Pay-to Plan Address',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 550

      #Pay-To Plan City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Pay-To Plan City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 600

      #Pay-to Plan Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Pay-to Plan Secondary Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 650,
                :identified_by => {
                  'REF01' => ["2U", "FY", "NF"]
                }

      #Pay-To Plan Tax Identification Number
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Pay-To Plan Tax Identification Number',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 655,
                :identified_by => {
                  'REF01' => 'EI'
                }

    end
  end
end
