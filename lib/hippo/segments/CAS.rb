module Hippo::Segments
  class CAS < Hippo::Segments::Base

    segment_identifier 'CAS'

    field :name                 => 'ClaimAdjustmentGroupCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1033

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => true,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 3,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => true,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 4,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 5,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 6,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 7,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 8,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 9,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 10,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 11,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 12,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 13,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 14,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 15,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 16,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'ClaimAdjustmentReasonCode',
          :sequence             => 17,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 5,
          :required             => false,
          :data_element_number  => 1034

    field :name                 => 'MonetaryAmount',
          :sequence             => 18,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'Quantity',
          :sequence             => 19,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

  end
end
