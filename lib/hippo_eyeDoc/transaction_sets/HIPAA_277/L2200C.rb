module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2200C < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2200C'    #Provider of Service Information Trace Identifier

      #Provider of Service Information Trace Identifier
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Provider of Service Information Trace Identifier',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Billing Provider Status Information
      segment Hippo_eyeDoc::Segments::STC,
                :name           => 'Billing Provider Status Information',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 1000,
                :identified_by => {
                  'STC03' => ["U", "WQ"]
                }

      #Provider Secondary Identifier
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Provider Secondary Identifier',
                :minimum        => 0,
                :maximum        => 3,
                :position       => 1100,
                :identified_by => {
                  'REF01' => ["0B", "1G", "G2", "LU", "SY", "TJ"]
                }

      #Total Accepted Quantity
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Total Accepted Quantity',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1210,
                :identified_by => {
                  'QTY01' => 'QA'
                }

      #Total Rejected Quantity
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Total Rejected Quantity',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1215,
                :identified_by => {
                  'QTY01' => 'QC'
                }

      #Total Accepted Amount
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Total Accepted Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1220,
                :identified_by => {
                  'AMT01' => 'YU'
                }

      #Total Rejected Amount
      segment Hippo_eyeDoc::Segments::AMT,
                :name           => 'Total Rejected Amount',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1225,
                :identified_by => {
                  'AMT01' => 'YY'
                }

    end
  end
end
