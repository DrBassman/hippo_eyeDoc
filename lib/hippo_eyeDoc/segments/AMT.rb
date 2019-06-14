module Hippo_eyeDoc::Segments
  class AMT < Hippo_eyeDoc::Segments::Base

    segment_identifier 'AMT'

    field :name                 => 'AmountQualifierCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => true,
          :data_element_number  => 522

    field :name                 => 'MonetaryAmount',
          :sequence             => 2,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => true,
          :data_element_number  => 782

    field :name                 => 'CreditDebitFlagCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 478

  end
end
