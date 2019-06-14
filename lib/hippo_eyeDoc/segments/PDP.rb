module Hippo_eyeDoc::Segments
  class PDP < Hippo_eyeDoc::Segments::Base

    segment_identifier 'PDP'

    field :name                 => 'TypeOfPersonalOrBusinessAssetCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1188

    field :name                 => 'CommodityCodeQualifier',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 23

    field :name                 => 'CommodityCode',
          :sequence             => 3,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 22

  end
end
