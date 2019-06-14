module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2000E < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2000E'    #Dependent Level

      #Dependent Level
      segment Hippo_eyeDoc::Segments::HL,
                :name           => 'Dependent Level',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'HL03' => '23'
                }

      #Dependent Name
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2100E,
                :name           => 'Dependent Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM1.NM101' => 'QC',
                  'NM1.NM102' => '1'
                }

      #Claim Status Tracking Number
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_277::L2200E,
                :name           => 'Claim Status Tracking Number',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 900,
                :identified_by => {
                  'TRN.TRN01' => '2'
                }

    end
  end
end
