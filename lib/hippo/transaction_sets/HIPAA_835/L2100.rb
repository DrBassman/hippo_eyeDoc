module Hippo::TransactionSets
  module HIPAA_835

    class L2100 < Hippo::TransactionSets::Base
      loop_name 'L2100'    #Claim Payment Information

      #Claim Payment Information
      segment Hippo::Segments::CLP,
                :name           => 'Claim Payment Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'CLP02' => ["1", "2", "3", "4", "19", "20", "21", "22", "23", "25"],
                  'CLP06' => ["12", "13", "14", "15", "16", "17", "AM", "CH", "DS", "HM", "LM", "MA", "MB", "MC", "OF", "TV", "VA", "WC", "ZZ"]
                }

      #Claim Adjustment
      segment Hippo::Segments::CAS,
                :name           => 'Claim Adjustment',
                :minimum        => 0,
                :maximum        => 99,
                :position       => 200,
                :identified_by => {
                  'CAS01' => ["CO", "OA", "PI", "PR"]
                }

      #Patient Name
      segment Hippo::Segments::NM1,
                :name           => 'Patient Name',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 290,
                :identified_by => {
                  'NM101' => 'QC',
                  'NM102' => '1'
                }

      #Insured Name
      segment Hippo::Segments::NM1,
                :name           => 'Insured Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 300,
                :identified_by => {
                  'NM101' => 'IL',
                  'NM102' => ["1", "2"],
                  'NM108' => ["FI", "II", "MI"]
                }

      #Corrected Patient/Insured Name
      segment Hippo::Segments::NM1,
                :name           => 'Corrected Patient/Insured Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 310,
                :identified_by => {
                  'NM101' => '74',
                  'NM102' => ["1", "2"]
                }

      #Service Provider Name
      segment Hippo::Segments::NM1,
                :name           => 'Service Provider Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 320,
                :identified_by => {
                  'NM101' => '82',
                  'NM102' => ["1", "2"],
                  'NM108' => ["BD", "BS", "FI", "MC", "PC", "SL", "UP", "XX"]
                }

      #Crossover Carrier Name
      segment Hippo::Segments::NM1,
                :name           => 'Crossover Carrier Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 330,
                :identified_by => {
                  'NM101' => 'TT',
                  'NM102' => '2',
                  'NM108' => ["AD", "FI", "NI", "PI", "PP", "XV"]
                }

      #Corrected Priority Payer Name
      segment Hippo::Segments::NM1,
                :name           => 'Corrected Priority Payer Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 340,
                :identified_by => {
                  'NM101' => 'PR',
                  'NM102' => '2',
                  'NM108' => ["AD", "FI", "NI", "PI", "PP", "XV"]
                }

      #Other Subscriber Name
      segment Hippo::Segments::NM1,
                :name           => 'Other Subscriber Name',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 350,
                :identified_by => {
                  'NM101' => 'GB',
                  'NM102' => ["1", "2"]
                }

      #Inpatient Adjudication Information
      segment Hippo::Segments::MIA,
                :name           => 'Inpatient Adjudication Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 370

      #Outpatient Adjudication Information
      segment Hippo::Segments::MOA,
                :name           => 'Outpatient Adjudication Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 380

      #Other Claim Related Identification
      segment Hippo::Segments::REF,
                :name           => 'Other Claim Related Identification',
                :minimum        => 0,
                :maximum        => 5,
                :position       => 400,
                :identified_by => {
                  'REF01' => ["1L", "1W", "28", "6P", "9A", "9C", "BB", "CE", "EA", "F8", "G1", "G3", "IG", "SY"]
                }

      #Rendering Provider Identification
      segment Hippo::Segments::REF,
                :name           => 'Rendering Provider Identification',
                :minimum        => 0,
                :maximum        => 10,
                :position       => 450,
                :identified_by => {
                  'REF01' => ["0B", "1A", "1B", "1C", "1D", "1G", "1H", "1J", "D3", "G2", "LU"]
                }

      #Statement From or To Date
      segment Hippo::Segments::DTM,
                :name           => 'Statement From or To Date',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 500,
                :identified_by => {
                  'DTM01' => ["232", "233"]
                }

      #Coverage Expiration Date
      segment Hippo::Segments::DTM,
                :name           => 'Coverage Expiration Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 505,
                :identified_by => {
                  'DTM01' => '036'
                }

      #Claim Received Date
      segment Hippo::Segments::DTM,
                :name           => 'Claim Received Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 510,
                :identified_by => {
                  'DTM01' => '050'
                }

      #Claim Contact Information
      segment Hippo::Segments::PER,
                :name           => 'Claim Contact Information',
                :minimum        => 0,
                :maximum        => 2,
                :position       => 600,
                :identified_by => {
                  'PER01' => 'CX',
                  'PER03' => ["EM", "FX", "TE"]
                }

      #Claim Supplemental Information
      segment Hippo::Segments::AMT,
                :name           => 'Claim Supplemental Information',
                :minimum        => 0,
                :maximum        => 13,
                :position       => 620,
                :identified_by => {
                  'AMT01' => ["AU", "D8", "DY", "F5", "I", "NL", "T", "T2", "ZK", "ZL", "ZM", "ZN", "ZO"]
                }

      #Claim Supplemental Information Quantity
      segment Hippo::Segments::QTY,
                :name           => 'Claim Supplemental Information Quantity',
                :minimum        => 0,
                :maximum        => 14,
                :position       => 640,
                :identified_by => {
                  'QTY01' => ["CA", "CD", "LA", "LE", "NE", "NR", "OU", "PS", "VS", "ZK", "ZL", "ZM", "ZN", "ZO"]
                }

      #Service Payment Information
      loop    Hippo::TransactionSets::HIPAA_835::L2110,
                :name           => 'Service Payment Information',
                :minimum        => 0,
                :maximum        => 999,
                :position       => 700

    end
  end
end
