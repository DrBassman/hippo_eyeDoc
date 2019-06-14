module Hippo_eyeDoc::Segments
  class PID < Hippo_eyeDoc::Segments::Base

    segment_identifier 'PID'

    field :name                 => 'ItemDescriptionType',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 349

    field :name                 => 'ProductProcessCharacteristicCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 750

    field :name                 => 'AgencyQualifierCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 559

    field :name                 => 'ProductDescriptionCode',
          :sequence             => 4,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 12,
          :required             => false,
          :data_element_number  => 751

    field :name                 => 'Description',
          :sequence             => 5,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 80,
          :required             => false,
          :data_element_number  => 352

    field :name                 => 'SurfaceLayerPositionCode',
          :sequence             => 6,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 752

    field :name                 => 'SourceSubqualifier',
          :sequence             => 7,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 822

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 8,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

    field :name                 => 'LanguageCode',
          :sequence             => 9,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 819

  end
end
