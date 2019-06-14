module Hippo_eyeDoc::Segments
  class N3 < Hippo_eyeDoc::Segments::Base

    segment_identifier 'N3'

    field :name                 => 'AddressInformation',
          :sequence             => 1,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 55,
          :required             => true,
          :data_element_number  => 166

    field :name                 => 'AddressInformation',
          :sequence             => 2,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 55,
          :required             => false,
          :data_element_number  => 166

  end
end
