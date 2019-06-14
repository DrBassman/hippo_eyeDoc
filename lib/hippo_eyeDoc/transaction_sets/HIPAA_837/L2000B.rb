module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2000B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000B'    #Subscriber Hierarchical Level

      #Subscriber Hierarchical Level
      segment Hippo_eyeDoc::Segments::HL,
                :name           => 'Subscriber Hierarchical Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 10,
                :identified_by => {
                  'HL03' => '22',
                  'HL04' => ["0", "1"]
                }

      #Subscriber Information
      segment Hippo_eyeDoc::Segments::SBR,
                :name           => 'Subscriber Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50,
                :identified_by => {
                  'SBR01' => ["A", "B", "C", "D", "E", "F", "G", "H", "P", "S", "T", "U"]
                }

      #Patient Information
      segment Hippo_eyeDoc::Segments::PAT,
                :name           => 'Patient Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 70

      #Subscriber Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2010BA,
                :name           => 'Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM1.NM101' => 'IL',
                  'NM1.NM102' => ["1", "2"]
                }

      #Payer Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2010BB,
                :name           => 'Payer Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM1.NM101' => 'PR',
                  'NM1.NM102' => '2',
                  'NM1.NM108' => ["PI", "XV"]
                }

      #Claim Information
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2300,
                :name           => 'Claim Information',
                :minimum        => 1,
                :maximum        => 100,
                :position       => 1300,
                :identified_by => {
                  'CLM.CLM06' => ["N", "Y"],
                  'CLM.CLM07' => ["A", "B", "C"],
                  'CLM.CLM08' => ["N", "W", "Y"],
                  'CLM.CLM09' => ["I", "Y"]
                },
                :parent_context_conditions => {
                  'HL.HL04' => '0'
                }

      #Patient Hierarchical Level
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2000C,
                :name           => 'Patient Hierarchical Level',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 10,
                :identified_by => {
                  'HL.HL03' => '23',
                  'HL.HL04' => '0'
                }

    end
  end
end
