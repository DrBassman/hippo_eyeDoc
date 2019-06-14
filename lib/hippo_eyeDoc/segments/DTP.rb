module Hippo_eyeDoc::Segments
  class DTP < Hippo_eyeDoc::Segments::Base

    segment_identifier 'DTP'

    field :name                 => 'DateTimeQualifier',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => true,
          :data_element_number  => 374

    field :name                 => 'DateTimePeriodFormatQualifier',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => true,
          :data_element_number  => 1250

    field :name                 => 'DateTimePeriod',
          :sequence             => 3,
          :datatype             => :date,
          :minimum              => 1,
          :maximum              => 35,
          :required             => true,
          :data_element_number  => 1251

  end
end
