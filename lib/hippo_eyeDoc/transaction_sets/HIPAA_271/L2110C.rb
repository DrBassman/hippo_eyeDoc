module Hippo_eyeDoc::TransactionSets
  module HIPAA_271

    class L2110C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2110C'    #Subscriber Eligibility or Benefit Information

      #Subscriber Eligibility or Benefit Information
      segment Hippo_eyeDoc::Segments::EB,
                :name           => 'Subscriber Eligibility or Benefit Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1300,
                :identified_by => {
                  'EB01' => ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "CB", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "MC", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
                }

      #Health Care Services Delivery
      segment Hippo_eyeDoc::Segments::HSD,
                :name           => 'Health Care Services Delivery',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1350

      #Subscriber Additional Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Subscriber Additional Identification',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1400,
                :identified_by => {
                  'REF01' => ["18", "1L", "1W", "49", "6P", "9F", "ALS", "CLI", "F6", "FO", "G1", "IG", "M7", "N6", "NQ"]
                }

      #Subscriber Eligibility/Benefit Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Subscriber Eligibility/Benefit Date',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 1500,
                :identified_by => {
                  'DTP01' => ["096", "193", "194", "198", "290", "291", "292", "295", "304", "307", "318", "346", "348", "349", "356", "357", "435", "472", "636", "771"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Subscriber Request Validation
      segment Hippo_eyeDoc::Segments::AAA,
                :name           => 'Subscriber Request Validation',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1600,
                :identified_by => {
                  'AAA01' => ["N", "Y"],
                  'AAA03' => ["15", "33", "52", "53", "54", "55", "56", "57", "60", "61", "62", "63", "69", "70", "98", "AA", "AE", "AF", "AG", "AO", "CI", "E8", "IA", "MA"],
                  'AAA04' => ["C", "N", "R", "W", "X", "Y"]
                }

      #Message Text
      segment Hippo_eyeDoc::Segments::MSG,
                :name           => 'Message Text',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 1700

      #Subscriber Eligibility or Benefit Additional Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_271::L2115C,
                :name           => 'Subscriber Eligibility or Benefit Additional Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 1710

      #Loop Header
      segment Hippo_eyeDoc::Segments::LS,
                :name           => 'Loop Header',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1780

      #Subscriber Benefit Related Entity Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_271::L2120C,
                :name           => 'Subscriber Benefit Related Entity Name',
                :minimum        => 0,
                :maximum        => 23,
                :position       => 1800,
                :identified_by => {
                  'NM1.NM101' => ["13", "1I", "1P", "2B", "36", "73", "FA", "GP", "GW", "I3", "IL", "LR", "OC", "P3", "P4", "P5", "PR", "PRP", "SEP", "TTP", "VER", "VN", "VY", "X3", "Y2"],
                  'NM1.NM102' => ["1", "2"]
                }

      #Loop Trailer
      segment Hippo_eyeDoc::Segments::LE,
                :name           => 'Loop Trailer',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2250

    end
  end
end
