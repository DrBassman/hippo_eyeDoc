module Hippo_eyeDoc::TransactionSets
  module HIPAA_277

    class L2200B < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L2200B'    #Information Receiver Application Trace Identifier

      #Information Receiver Application Trace Identifier
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Information Receiver Application Trace Identifier',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 900,
                :identified_by => {
                  'TRN01' => '2'
                }

      #Information Receiver Status Information
      segment Hippo_eyeDoc::Segments::STC,
                :name           => 'Information Receiver Status Information',
                :minimum        => 1,
                :maximum        => 99999,
                :position       => 1000,
                :identified_by => {
                  'STC03' => ["U", "WQ"]
                }

      #Total Accepted Quantity
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Total Accepted Quantity',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1210,
                :identified_by => {
                  'QTY01' => '90'
                }

      #Total Rejected Quantity
      segment Hippo_eyeDoc::Segments::QTY,
                :name           => 'Total Rejected Quantity',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 1211,
                :identified_by => {
                  'QTY01' => 'AA'
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
                :position       => 1222,
                :identified_by => {
                  'AMT01' => 'YY'
                }

    end
  end
end
