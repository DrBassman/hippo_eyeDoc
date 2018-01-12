module Hippo::Segments
  class GE < Base

    segment_identifier  'GE'

    field   :name                 => 'NumberOfTransactionSetsIncluded',
            :sequence             => 1,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 6,
            :required             => true,
            :data_element_number  => 97

    field   :name                 => 'GroupControlNumber',
            :sequence             => 2,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 9,
            :required             => true,
            :data_element_number  => 28

  end
end
