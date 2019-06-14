module Hippo_eyeDoc::Segments
  class PCT < Hippo_eyeDoc::Segments::Base

    segment_identifier 'PCT'

    field :name                 => 'PercentQualifier',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1004

    field :name                 => 'PercentageAsDecimal',
          :sequence             => 2,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 10,
          :required             => true,
          :data_element_number  => 954

  end
end
