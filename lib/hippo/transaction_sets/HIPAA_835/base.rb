module Hippo::TransactionSets
  module HIPAA_835

    class Base < Hippo::TransactionSets::Base

      #Transaction Set Header
      segment Hippo::Segments::ST,
                :name           => 'Transaction Set Header',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'ST01' => '835'
                }

      #Financial Information
      segment Hippo::Segments::BPR,
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
      segment Hippo::Segments::TRN,
                :name           => 'Reassociation Trace Number',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 400,
                :identified_by => {
                  'TRN01' => '1'
                }

      #Foreign Currency Information
      segment Hippo::Segments::CUR,
                :name           => 'Foreign Currency Information',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 500,
                :identified_by => {
                  'CUR01' => 'PR'
                }

      #Receiver Identification
      segment Hippo::Segments::REF,
                :name           => 'Receiver Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 590,
                :identified_by => {
                  'REF01' => 'EV'
                }

      #Version Identification
      segment Hippo::Segments::REF,
                :name           => 'Version Identification',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 600,
                :identified_by => {
                  'REF01' => 'F2'
                }

      #Production Date
      segment Hippo::Segments::DTM,
                :name           => 'Production Date',
                :minimum        => 0,
                :maximum        => 1,
                :position       => 700,
                :identified_by => {
                  'DTM01' => '405'
                }

      #Payer Identification
      loop    Hippo::TransactionSets::HIPAA_835::L1000A,
                :name           => 'Payer Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 800,
                :identified_by => {
                  'N1.N101' => 'PR'
                }

      #Payee Identification
      loop    Hippo::TransactionSets::HIPAA_835::L1000B,
                :name           => 'Payee Identification',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 1400,
                :identified_by => {
                  'N1.N101' => 'PE',
                  'N1.N103' => ["FI", "XV", "XX"]
                }

      #Header Number
      loop    Hippo::TransactionSets::HIPAA_835::L2000,
                :name           => 'Header Number',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 30

      #Provider Adjustment
      segment Hippo::Segments::PLB,
                :name           => 'Provider Adjustment',
                :minimum        => 0,
                :maximum        => 99999,
                :position       => 100

      #Transaction Set Trailer
      segment Hippo::Segments::SE,
                :name           => 'Transaction Set Trailer',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 200

    end
  end
end
