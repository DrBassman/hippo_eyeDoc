module Hippo::Segments
  class PKD < Hippo::Segments::Base

    segment_identifier 'PKD'

    field :name                 => 'PackagingCode',
          :sequence             => 1,
          :datatype             => :string,
          :minimum              => 3,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 103

    field :name                 => 'SourceSubqualifier',
          :sequence             => 2,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 822

    field :name                 => 'AgencyQualifierCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 559

    field :name                 => 'PackagingDescriptionCode',
          :sequence             => 4,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 7,
          :required             => false,
          :data_element_number  => 754

    field :name                 => 'OwnershipCode',
          :sequence             => 5,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 102

  end
end
