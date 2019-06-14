module Hippo_eyeDoc::TransactionSets
  module HIPAA_835

    class L2000 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000'    #Header Number

      #Header Number
      segment Hippo_eyeDoc::Segments::LX,
                :name           => 'Header Number',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 30

      #Provider Summary Information
      segment Hippo_eyeDoc::Segments::TS3,
                :name           => 'Provider Summary Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 50

      #Provider Supplemental Summary Information
      segment Hippo_eyeDoc::Segments::TS2,
                :name           => 'Provider Supplemental Summary Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 70

      #Claim Payment Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_835::L2100,
                :name           => 'Claim Payment Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 100,
                :identified_by => {
                  'CLP.CLP02' => ["1", "2", "3", "4", "19", "20", "21", "22", "23", "25"],
                  'CLP.CLP06' => ["12", "13", "14", "15", "16", "17", "AM", "CH", "DS", "HM", "LM", "MA", "MB", "MC", "OF", "TV", "VA", "WC", "ZZ"]
                }

    end
  end
end
