module Hippo::Segments
  class SD1 < Hippo::Segments::Base

    segment_identifier 'SD1'

    field :name                 => 'ItemDescriptionType',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 349

    field :name                 => 'SafetyCharacteristicHazardCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => true,
          :data_element_number  => 821

    field :name                 => 'AgencyQualifierCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 559

    field :name                 => 'SourceSubqualifier',
          :sequence             => 4,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 822

    field :name                 => 'ProductDescriptionCode',
          :sequence             => 5,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 12,
          :required             => false,
          :data_element_number  => 751

    field :name                 => 'Description',
          :sequence             => 6,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 80,
          :required             => false,
          :data_element_number  => 352

    field :name                 => 'StateOrProvinceCode',
          :sequence             => 7,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 156

    field :name                 => 'CountryCode',
          :sequence             => 8,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 26

  end
end
