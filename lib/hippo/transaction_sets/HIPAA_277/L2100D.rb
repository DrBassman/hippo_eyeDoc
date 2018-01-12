module Hippo::TransactionSets
  module HIPAA_277

    class L2100D < Hippo::TransactionSets::Base
      loop_name 'L2100D'    #Patient Name

      #Patient Name
      segment Hippo::Segments::NM1,
                :name           => 'Patient Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'NM101' => 'QC',
                  'NM102' => '1',
                  'NM108' => ["II", "MI"]
                }

    end
  end
end
