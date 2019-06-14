module Hippo_eyeDoc::Segments
  class EM < Hippo_eyeDoc::Segments::Base

    segment_identifier 'EM'

    field :name                 => 'WeightUnitCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 188

    field :name                 => 'Weight',
          :sequence             => 2,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 10,
          :required             => false,
          :data_element_number  => 81

    field :name                 => 'VolumeUnitQualifier',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 184

    field :name                 => 'Volume',
          :sequence             => 4,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 8,
          :required             => false,
          :data_element_number  => 183

    field :name                 => 'CountryCode',
          :sequence             => 5,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 26

    field :name                 => 'ConstructionType',
          :sequence             => 6,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 1429

    field :name                 => 'Date',
          :sequence             => 7,
          :datatype             => :date,
          :minimum              => 8,
          :maximum              => 8,
          :required             => false,
          :data_element_number  => 373

  end
end
