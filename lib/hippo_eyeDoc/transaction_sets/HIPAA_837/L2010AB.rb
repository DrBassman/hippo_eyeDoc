module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2010AB < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2010AB'    #Pay-to Address Name

      #Pay-to Address Name
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Pay-to Address Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM101' => '87',
                  'NM102' => ["1", "2"]
                }

      #Pay-to Address - ADDRESS
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Pay-to Address - ADDRESS',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 250

      #Pay-To Address City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Pay-To Address City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 300

    end
  end
end
