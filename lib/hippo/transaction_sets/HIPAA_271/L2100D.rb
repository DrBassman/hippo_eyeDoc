module Hippo::TransactionSets
  module HIPAA_271

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
                  'REF01' => ["18", "1L", "1W", "49", "6P", "CE", "CT", "EA", "EJ", "F6", "GH", "HJ", "IF", "IG", "MRC", "N6", "NQ", "Q4", "SY", "Y4"]
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

      #Dependent Request Validation
      segment Hippo::Segments::AAA,
                :name           => 'Dependent Request Validation',
                :minimum        => 0,
                :maximum        => 9,
                :position       => 850,
                :identified_by => {
                  'AAA01' => ["N", "Y"],
                  'AAA03' => ["15", "35", "42", "43", "45", "47", "48", "49", "51", "52", "56", "57", "58", "60", "61", "62", "63", "64", "65", "66", "67", "68", "71", "77"],
                  'AAA04' => ["C", "N", "R", "S", "W", "X", "Y"]
                }

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
                  'INS02' => ["01", "19", "20", "21", "39", "40", "53", "G8"]
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
                :maximum        => 9,
                :position       => 1200,
                :identified_by => {
                  'DTP01' => ["096", "102", "152", "291", "307", "318", "340", "341", "342", "343", "346", "347", "356", "357", "382", "435", "442", "458", "472", "539", "540", "636", "771"],
                  'DTP02' => ["D8", "RD8"]
                }

      #Dependent Military Personnel Information
      segment Hippo::Segments::MPI,
                :name           => 'Dependent Military Personnel Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1275,
                :identified_by => {
                  'MPI01' => ["A", "C", "L", "O", "P", "S", "T"],
                  'MPI02' => ["AE", "AO", "AS", "AT", "AU", "CC", "DD", "HD", "IR", "LX", "PE", "RE", "RM", "RR", "RU"],
                  'MPI03' => ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "Q", "R", "S", "U", "W"]
                }

      #Dependent Eligibility or Benefit Information
      loop    Hippo::TransactionSets::HIPAA_271::L2110D,
                :name           => 'Dependent Eligibility or Benefit Information',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 1300,
                :identified_by => {
                  'EB.EB01' => ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "CB", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "MC", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
                }

    end
  end
end
