module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2420G < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2420G'    #Ambulance Pick-up Location

      #Ambulance Pick-up Location
      segment Hippo_eyeDoc::Segments::NM1,
                :name           => 'Ambulance Pick-up Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5310,
                :identified_by => {
                  'NM101' => 'PW',
                  'NM102' => '2'
                }

      #Ambulance Pick-up Location Address
      segment Hippo_eyeDoc::Segments::N3,
                :name           => 'Ambulance Pick-up Location Address',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 5340

      #Ambulance Pick-up Location City, State, ZIP Code
      segment Hippo_eyeDoc::Segments::N4,
                :name           => 'Ambulance Pick-up Location City, State, ZIP Code',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 5350

    end
  end
end
