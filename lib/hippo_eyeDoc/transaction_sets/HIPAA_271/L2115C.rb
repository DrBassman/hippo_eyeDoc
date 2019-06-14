module Hippo_eyeDoc::TransactionSets
  module HIPAA_271

    class L2115C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2115C'    #Subscriber Eligibility or Benefit Additional Information

      #Subscriber Eligibility or Benefit Additional Information
      segment Hippo_eyeDoc::Segments::III,
                :name           => 'Subscriber Eligibility or Benefit Additional Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1710

    end
  end
end
