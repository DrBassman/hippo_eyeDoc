module Hippo_eyeDoc::TransactionSets
  module HIPAA_837

    class L2000C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000C'    #Patient Hierarchical Level

      #Patient Hierarchical Level
      segment Hippo_eyeDoc::Segments::HL,
                :name           => 'Patient Hierarchical Level',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 10,
                :identified_by => {
                  'HL03' => '23',
                  'HL04' => '0'
                }

      #Patient Information
      segment Hippo_eyeDoc::Segments::PAT,
                :name           => 'Patient Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 70,
                :identified_by => {
                  'PAT01' => ["01", "19", "20", "21", "39", "40", "53", "G8"]
                }

      #Patient Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_837::L2010CA,
                :name           => 'Patient Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM1.NM101' => 'QC',
                  'NM1.NM102' => '1'
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
                }

    end
  end
end
