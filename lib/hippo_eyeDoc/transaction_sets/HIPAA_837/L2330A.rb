module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2330A < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2330A'    #Other Subscriber Name

      #Other Subscriber Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Other Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3250,
                :identified_by => {
                  'NM101' => 'IL',
                  'NM102' => ["1", "2"],
                  'NM108' => ["II", "MI"]
                }

      #Other Subscriber Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Other Subscriber Address',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3320

      #Other Subscriber City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Other Subscriber City, State, ZIP Code',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3400

      #Other Subscriber Secondary Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Other Subscriber Secondary Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3550,
                :identified_by => {
                  'REF01' => 'SY'
                }

    end
  end
end
