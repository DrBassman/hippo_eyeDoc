require 'rubygems'
gem 'minitest'
require 'minitest/autorun'
require 'pp'
require 'pry'

require File.expand_path(File.join('..','lib','hippo_eyeDoc'), File.dirname(__FILE__))

module Hippo_eyeDoc::Segments
  class TSS < Hippo_eyeDoc::Segments::Base
    segment_identifier 'TSS'

    field :name => 'Field1'
    field :name => 'Field2'
    field :name => 'Field3'
    field :name => 'Field4'
    field :name => 'CommonName'
    field :name => 'CommonName'
    field :name => 'DateField', :datatype => :date
    field :name => 'TimeField', :datatype => :time
    field :name => 'IntegerField', :datatype => :integer
    field :name => 'DecimalField', :datatype => :decimal
  end

  class TCS < Hippo_eyeDoc::Segments::Base
    segment_identifier 'TCS'

    composite_field 'CompositeField' do
      field :name => 'Field1'
      field :name => 'Field2'
      field :name => 'Field3'
      field :name => 'CompositeCommonName'
    end

    composite_field 'CompositeField' do
      field :name => 'Field4'
      field :name => 'Field5'
      field :name => 'Field6'
      field :name => 'CompositeCommonName'
    end

    field :name => 'Field7'
  end
end

module Hippo_eyeDoc::TransactionSets
  module Test
    class L0001 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L0001'

      segment Hippo_eyeDoc::Segments::TSS,
                :name           => 'Test Simple Segment #1',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50
    end

    class L0002 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L0002'

      segment Hippo_eyeDoc::Segments::TCS,
                :name           => 'Test Compound Segment #4',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'Field7' => ['Preset Field 7', 'Foo2']
                }

      segment Hippo_eyeDoc::Segments::TSS,
                :name           => 'Test Simple Segment #5',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50,
                :identified_by => {
                  'TSS01' => 'Last Segment'
                }
    end

    class L0004 < Hippo_eyeDoc::TransactionSets::Base
      loop_name 'L0004'

      segment Hippo_eyeDoc::Segments::TSS,
                :name => 'Indicator of Child Location',
                :identified_by => {'TSS01' => ['HAS CHILD LOOP','HAS NO CHILD LOOP']}

      loop Hippo_eyeDoc::TransactionSets::Test::L0001,
                :name           => 'Test Sub-Loop L0001',
                :identified_by  => {
                  'TSS.TSS01'   => 'Multiple Parents',
                },
                :parent_context_conditions => {
                  'TSS.TSS01' => 'HAS NO CHILD LOOP'
                }

      segment Hippo_eyeDoc::Segments::TSS,
                :name => 'Indicator of Child Location',
                :identified_by => {'TSS01' => 'Multiple Parents'}

    end

    class Base < Hippo_eyeDoc::TransactionSets::Base

      segment Hippo_eyeDoc::Segments::ST,
        :identified_by => {
        'ST01' => 'Test'
      }

      segment Hippo_eyeDoc::Segments::TSS,
                :name           => 'Test Simple Segment #1',
                :minimum        => 1,
                :maximum        => 5,
                :position       => 50,
                :identified_by => {
                  'TSS01' => 'Blah'
                }

      segment Hippo_eyeDoc::Segments::TCS,
                :name           => 'Test Compound Segment #2',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :identified_by => {
                  'Field7' => 'Preset Field 7'
                }

      segment Hippo_eyeDoc::Segments::TSS,
                :name           => 'Test Simple Segment #3',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50,
                :identified_by => {
                  'TSS01' => 'Last Standalone Segment'
                }

      loop Hippo_eyeDoc::TransactionSets::Test::L0001,
                :name           => 'Test Sub-Loop',
                :identified_by  => {
                  'TSS.TSS01'   => 'Foo'
                }

      loop Hippo_eyeDoc::TransactionSets::Test::L0002,
                :name           => 'Test Sub-Loop',
                :maximum        => 5,
                :identified_by  => {
                  'TCS.Field7'   => 'Foo2'
                }

      segment Hippo_eyeDoc::Segments::SE,
        :identified_by => {
          'SE02' => 'Test'
      }
    end
  end
end
