module Hippo_eyeDoc::TransactionSets
  module HIPAA_270

    class L2110D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2110D'    #Dependent Eligibility or Benefit Inquiry

      #Dependent Eligibility or Benefit Inquiry
      segment Hippo_eyeDoc::Segments::EQ,
                :name           => 'Dependent Eligibility or Benefit Inquiry',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1300

      #Dependent Eligibility or Benefit Additional Inquiry Information
      segment Hippo_eyeDoc::Segments::III,
                :name           => 'Dependent Eligibility or Benefit Additional Inquiry Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1390,
                :identified_by => {
                  'III01' => 'ZZ'
                }

      #Dependent Additional Information
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Dependent Additional Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'REF01' => ["9F", "G1"]
                }

      #Dependent Eligibility/Benefit Date
      segment Hippo_eyeDoc::Segments::DTP,
                :name           => 'Dependent Eligibility/Benefit Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1500,
                :identified_by => {
                  'DTP01' => '291',
                  'DTP02' => ["D8", "RD8"]
                }

    end
  end
end
