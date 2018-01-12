module Hippo::TransactionSets
  module HIPAA_837

    class L2320 < Hippo::TransactionSets::Base
      loop_name 'L2320'    #Other Subscriber Information

      #Other Subscriber Information
      segment Hippo::Segments::SBR,
                :name           => 'Other Subscriber Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 2900,
                :identified_by => {
                  'SBR01' => ["A", "B", "C", "D", "E", "F", "G", "H", "P", "S", "T", "U"],
                  'SBR02' => ["01", "18", "19", "20", "21", "39", "40", "53", "G8"]
                }

      #Claim Level Adjustments
      segment Hippo::Segments::CAS,
                :name           => 'Claim Level Adjustments',
                :minimum        => 0,
                :maximum        => 5,
                :position       => 2950,
                :identified_by => {
                  'CAS01' => ["CO", "CR", "OA", "PI", "PR"]
                }

      #Coordination of Benefits (COB) Payer Paid Amount
      segment Hippo::Segments::AMT,
                :name           => 'Coordination of Benefits (COB) Payer Paid Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3000,
                :identified_by => {
                  'AMT01' => 'D'
                }

      #Coordination of Benefits (COB) Total Non-Covered Amount
      segment Hippo::Segments::AMT,
                :name           => 'Coordination of Benefits (COB) Total Non-Covered Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3020,
                :identified_by => {
                  'AMT01' => 'A8'
                }

      #Remaining Patient Liability
      segment Hippo::Segments::AMT,
                :name           => 'Remaining Patient Liability',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3050,
                :identified_by => {
                  'AMT01' => 'EAF'
                }

      #Other Insurance Coverage Information
      segment Hippo::Segments::OI,
                :name           => 'Other Insurance Coverage Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3110,
                :identified_by => {
                  'OI03' => ["N", "W", "Y"],
                  'OI06' => ["I", "Y"]
                }

      #Outpatient Adjudication Information
      segment Hippo::Segments::MOA,
                :name           => 'Outpatient Adjudication Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3200

      #Other Subscriber Name
      loop    Hippo::TransactionSets::HIPAA_837::L2330A,
                :name           => 'Other Subscriber Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3250,
                :identified_by => {
                  'NM1.NM101' => 'IL',
                  'NM1.NM102' => ["1", "2"],
                  'NM1.NM108' => ["II", "MI"]
                }

      #Other Payer Name
      loop    Hippo::TransactionSets::HIPAA_837::L2330B,
                :name           => 'Other Payer Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 3250,
                :identified_by => {
                  'NM1.NM101' => 'PR',
                  'NM1.NM102' => '2',
                  'NM1.NM108' => ["PI", "XV"]
                }

      #Other Payer Referring Provider
      loop    Hippo::TransactionSets::HIPAA_837::L2330C,
                :name           => 'Other Payer Referring Provider',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 3250,
                :identified_by => {
                  'NM1.NM101' => ["DN", "P3"],
                  'NM1.NM102' => '1'
                }

      #Other Payer Rendering Provider
      loop    Hippo::TransactionSets::HIPAA_837::L2330D,
                :name           => 'Other Payer Rendering Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 3650,
                :identified_by => {
                  'NM1.NM101' => '82',
                  'NM1.NM102' => ["1", "2"]
                }

      #Other Payer Service Facility Location
      loop    Hippo::TransactionSets::HIPAA_837::L2330E,
                :name           => 'Other Payer Service Facility Location',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 4650,
                :identified_by => {
                  'NM1.NM101' => '77',
                  'NM1.NM102' => '2'
                }

      #Other Payer Supervising Provider
      loop    Hippo::TransactionSets::HIPAA_837::L2330F,
                :name           => 'Other Payer Supervising Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 5650,
                :identified_by => {
                  'NM1.NM101' => 'DQ',
                  'NM1.NM102' => '1'
                }

      #Other Payer Billing Provider
      loop    Hippo::TransactionSets::HIPAA_837::L2330G,
                :name           => 'Other Payer Billing Provider',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 6350,
                :identified_by => {
                  'NM1.NM101' => '85',
                  'NM1.NM102' => ["1", "2"]
                }

    end
  end
end
