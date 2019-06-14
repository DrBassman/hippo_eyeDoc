module Hippo_eyeDoc::TransactionSets
  module HIPAA_271

    class L2115D < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2115D'    #Dependent Eligibility or Benefit Additional Information

      #Dependent Eligibility or Benefit Additional Information
      segment Hippo_eyeDoc::Segments::III,
                :name           => 'Dependent Eligibility or Benefit Additional Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1710

    end
  end
end
