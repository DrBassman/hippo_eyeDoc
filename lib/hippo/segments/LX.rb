module Hippo::Segments
  class LX < Hippo::Segments::Base

    segment_identifier 'LX'

    def self.increment_sequence_number
      @@sequence_number ||= 0
      @@sequence_number += 1
    end

    field :name                 => 'AssignedNumber',
          :sequence             => 1,
          :datatype             => :integer,
          :minimum              => 1,
          :maximum              => 6,
          :required             => true,
          :data_element_number  => 554

  end
end
