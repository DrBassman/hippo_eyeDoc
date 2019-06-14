module Hippo_eyeDoc::Segments
  class AAA < Hippo_eyeDoc::Segments::Base

    segment_identifier 'AAA'

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 1073

    field :name                 => 'AgencyQualifierCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 559

    field :name                 => 'RejectReasonCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 901

    field :name                 => 'FollowUpActionCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 889

  end
end
