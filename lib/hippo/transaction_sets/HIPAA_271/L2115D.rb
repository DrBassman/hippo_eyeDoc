module Hippo::TransactionSets
  module HIPAA_271

    class L2115D < Hippo::TransactionSets::Base
      loop_name 'L2115D'    #Dependent Eligibility or Benefit Additional Information

      #Dependent Eligibility or Benefit Additional Information
      segment Hippo::Segments::III,
                :name           => 'Dependent Eligibility or Benefit Additional Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1710

    end
  end
end
