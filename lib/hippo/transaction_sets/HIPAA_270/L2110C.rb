module Hippo::TransactionSets
  module HIPAA_270

    class L2110C < Hippo::TransactionSets::Base
      loop_name 'L2110C'    #Subscriber Eligibility or Benefit Inquiry

      #Subscriber Eligibility or Benefit Inquiry
      segment Hippo::Segments::EQ,
                :name           => 'Subscriber Eligibility or Benefit Inquiry',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1300

      #Subscriber Spend Down Amount
      segment Hippo::Segments::AMT,
                :name           => 'Subscriber Spend Down Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1350,
                :identified_by => {
                  'AMT01' => 'R'
                }

      #Subscriber Spend Down Total Billed Amount
      segment Hippo::Segments::AMT,
                :name           => 'Subscriber Spend Down Total Billed Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1355,
                :identified_by => {
                  'AMT01' => 'PB'
                }

      #Subscriber Eligibility or Benefit Additional Inquiry Information
      segment Hippo::Segments::III,
                :name           => 'Subscriber Eligibility or Benefit Additional Inquiry Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1390,
                :identified_by => {
                  'III01' => 'ZZ'
                }

      #Subscriber Additional Information
      segment Hippo::Segments::REF,
                :name           => 'Subscriber Additional Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'REF01' => ["9F", "G1"]
                }

      #Subscriber Eligibility/Benefit Date
      segment Hippo::Segments::DTP,
                :name           => 'Subscriber Eligibility/Benefit Date',
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
