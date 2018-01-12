module Hippo::Segments
  class PDR < Hippo::Segments::Base

    segment_identifier 'PDR'

    field :name                 => 'TypeOfRealEstateAssetCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1074

    field :name                 => 'CodeListQualifierCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1270

    field :name                 => 'IndustryCode',
          :sequence             => 3,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 1271

    field :name                 => 'OccupancyCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 689

  end
end
