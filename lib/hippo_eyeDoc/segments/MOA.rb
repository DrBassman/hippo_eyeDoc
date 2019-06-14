module Hippo_eyeDoc::Segments
  class MOA < Hippo_eyeDoc::Segments::Base

    segment_identifier 'MOA'

    field :name                 => 'PercentageAsDecimal',
          :sequence             => 1,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 10,
          :required             => false,
          :data_element_number  => 954

    field :name                 => 'MonetaryAmount',
          :sequence             => 2,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'ReferenceIdentification',
          :sequence             => 3,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 4,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 5,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 6,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 7,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'MonetaryAmount',
          :sequence             => 8,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'MonetaryAmount',
          :sequence             => 9,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

  end
end
