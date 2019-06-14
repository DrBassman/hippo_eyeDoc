module Hippo_eyeDoc::Segments
  class AK5 < Hippo_eyeDoc::Segments::Base

    segment_identifier 'AK5'

    field :name                 => 'TransactionSetAcknowledgmentCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 717

    field :name                 => 'TransactionSetSyntaxErrorCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 718

    field :name                 => 'TransactionSetSyntaxErrorCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 718

    field :name                 => 'TransactionSetSyntaxErrorCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 718

    field :name                 => 'TransactionSetSyntaxErrorCode',
          :sequence             => 5,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 718

    field :name                 => 'TransactionSetSyntaxErrorCode',
          :sequence             => 6,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 718

  end
end
