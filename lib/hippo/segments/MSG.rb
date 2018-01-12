module Hippo::Segments
  class MSG < Hippo::Segments::Base

    segment_identifier 'MSG'

    field :name                 => 'FreeFormMessageText',
          :sequence             => 1,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 264,
          :required             => true,
          :data_element_number  => 933

    field :name                 => 'PrinterCarriageControlCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 934

    field :name                 => 'Number',
          :sequence             => 3,
          :datatype             => :integer,
          :minimum              => 1,
          :maximum              => 9,
          :required             => false,
          :data_element_number  => 1470

  end
end
