module Hippo_eyeDoc::Segments
  class UR < Hippo_eyeDoc::Segments::Base

    segment_identifier 'UR'

    field :name                 => 'ApprovalCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 1318

    field :name                 => 'Quantity',
          :sequence             => 2,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

  end
end
