module Hippo_eyeDoc::Segments
  class LQ < Hippo_eyeDoc::Segments::Base

    segment_identifier 'LQ'

    field :name                 => 'CodeListQualifierCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1270

    field :name                 => 'IndustryCode',
          :sequence             => 2,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 1271

  end
end
