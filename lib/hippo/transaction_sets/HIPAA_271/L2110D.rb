module Hippo::TransactionSets
  module HIPAA_271

    class L2110D < Hippo::TransactionSets::Base
      loop_name 'L2110D'    #Dependent Eligibility or Benefit Information

      #Dependent Eligibility or Benefit Information
      segment Hippo::Segments::EB,
                :name           => 'Dependent Eligibility or Benefit Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1300,
                :identified_by => {
                  'EB01' => ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "CB", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "MC", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
                }

      #Health Care Services Delivery
      segment Hippo::Segments::HSD,
                :name           => 'Health Care Services Delivery',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1350

      #Dependent Additional Identification
      segment Hippo::Segments::REF,
                :name           => 'Dependent Additional Identification',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1400,
                :identified_by => {
                  'REF01' => ["18", "1L", "1W", "49", "6P", "9F", "ALS", "CLI", "F6", "FO", "G1", "IG", "N6", "NQ"]
                }

      #Dependent Eligibility/Benefit Date
      segment Hippo::Segments::DTP,
                :name           => 'Dependent Eligibility/Benefit Date',
                :minimum        => 0,
                :maximum        => 20,
                :position       => 1500,
                :identified_by => {
                  'DTP01' => ["096", "193", "194", "198", "290", "291", "292", "295", "304", "307", "318", "346", "348", "349", "356", "357", "435", "472", "636", "771"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Dependent Request Validation
      segment Hippo::Segments::AAA,
                :name           => 'Dependent Request Validation',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 1600,
                :identified_by => {
                  'AAA01' => ["N", "Y"],
                  'AAA03' => ["15", "33", "52", "53", "54", "55", "56", "57", "60", "61", "62", "63", "69", "70", "98", "AA", "AE", "AF", "AG", "AO", "CI", "E8", "IA", "MA"],
                  'AAA04' => ["C", "N", "R", "W", "X", "Y"]
                }

      #Message Text
      segment Hippo::Segments::MSG,
                :name           => 'Message Text',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 1700

      #Dependent Eligibility or Benefit Additional Information
      loop    Hippo::TransactionSets::HIPAA_271::L2115D,
                :name           => 'Dependent Eligibility or Benefit Additional Information',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 1710

      #Loop Header
      segment Hippo::Segments::LS,
                :name           => 'Loop Header',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1780

      #Dependent Benefit Related Entity Name
      loop    Hippo::TransactionSets::HIPAA_271::L2120D,
                :name           => 'Dependent Benefit Related Entity Name',
                :minimum        => 0,
                :maximum        => 23,
                :position       => 1800,
                :identified_by => {
                  'NM1.NM101' => ["13", "1I", "1P", "2B", "36", "73", "FA", "GP", "GW", "I3", "IL", "LR", "OC", "P3", "P4", "P5", "PR", "PRP", "SEP", "TTP", "VER", "VN", "VY", "X3", "Y2"],
                  'NM1.NM102' => ["1", "2"]
                }

      #Loop Trailer
      segment Hippo::Segments::LE,
                :name           => 'Loop Trailer',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2250

    end
  end
end
