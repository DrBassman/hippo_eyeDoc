module Hippo_eyeDoc::TransactionSets
  module HIPAA_835

    class Base < Hippo_eyeDoc::TransactionSets::Base

      #Transaction Set Header
      segment Hippo_eyeDoc::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '835'
                }

      #Financial Information
      segment Hippo_eyeDoc::Segments::BPR,
                :name           => 'Financial Information',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200,
                :identified_by => {
                  'BPR01' => ["C", "D", "H", "I", "P", "U", "X"],
                  'BPR03' => ["C", "D"],
                  'BPR04' => ["ACH", "BOP", "CHK", "FWT", "NON"]
                }

      #Reassociation Trace Number
      segment Hippo_eyeDoc::Segments::TRN,
                :name           => 'Reassociation Trace Number',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Foreign Currency Information
      segment Hippo_eyeDoc::Segments::CUR,
                :name           => 'Foreign Currency Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'CUR01' => 'PR'
                }

      #Receiver Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Receiver Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 590,
                :identified_by => {
                  'REF01' => 'EV'
                }

      #Version Identification
      segment Hippo_eyeDoc::Segments::REF,
                :name           => 'Version Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600,
                :identified_by => {
                  'REF01' => 'F2'
                }

      #Production Date
      segment Hippo_eyeDoc::Segments::DTM,
                :name           => 'Production Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 700,
                :identified_by => {
                  'DTM01' => '405'
                }

      #Payer Identification
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_835::L1000A,
                :name           => 'Payer Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 800,
                :identified_by => {
                  'N1.N101' => 'PR'
                }

      #Payee Identification
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_835::L1000B,
                :name           => 'Payee Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'N1.N101' => 'PE',
                  'N1.N103' => ["FI", "XV", "XX"]
                }

      #Header Number
      loop    Hippo_eyeDoc::TransactionSets::HIPAA_835::L2000,
                :name           => 'Header Number',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 30

      #Provider Adjustment
      segment Hippo_eyeDoc::Segments::PLB,
                :name           => 'Provider Adjustment',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100

      #Transaction Set Trailer
      segment Hippo_eyeDoc::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200

    end
  end
end
