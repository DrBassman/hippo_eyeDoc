module Hippo::TransactionSets
  module HIPAA_837

    class L2000A < Hippo::TransactionSets::Base
      include Hippo::Outputters::PaperClaim

      loop_name 'L2000A'    #Billing Provider Hierarchical Level

      #Billing Provider Hierarchical Level
      segment Hippo::Segments::HL,
                :name           => 'Billing Provider Hierarchical Level',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 10,
                :identified_by => {
                  'HL03' => '20',
                  'HL04' => '1'
                }

      #Billing Provider Specialty Information
      segment Hippo::Segments::PRV,
                :name           => 'Billing Provider Specialty Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 30,
                :identified_by => {
                  'PRV01' => 'BI',
                  'PRV02' => 'PXC'
                }

      #Foreign Currency Information
      segment Hippo::Segments::CUR,
                :name           => 'Foreign Currency Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'CUR01' => '85'
                }

      #Billing Provider Name
      loop    Hippo::TransactionSets::HIPAA_837::L2010AA,
                :name           => 'Billing Provider Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM1.NM101' => '85',
                  'NM1.NM102' => ["1", "2"]
                }

      #Pay-to Address Name
      loop    Hippo::TransactionSets::HIPAA_837::L2010AB,
                :name           => 'Pay-to Address Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 150,
                :identified_by => {
                  'NM1.NM101' => '87',
                  'NM1.NM102' => ["1", "2"]
                }

      #Pay-To Plan Name
      loop    Hippo::TransactionSets::HIPAA_837::L2010AC,
                :name           => 'Pay-To Plan Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 450,
                :identified_by => {
                  'NM1.NM101' => 'PE',
                  'NM1.NM102' => '2',
                  'NM1.NM108' => ["PI", "XV"]
                }

      #Subscriber Hierarchical Level
      loop    Hippo::TransactionSets::HIPAA_837::L2000B,
                :name           => 'Subscriber Hierarchical Level',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 10,
                :identified_by => {
                  'HL.HL03' => '22',
                  'HL.HL04' => ["0", "1"]
                }

    end
  end
end
