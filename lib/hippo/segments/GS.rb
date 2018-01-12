module Hippo::Segments
  class GS < Base

    segment_identifier  'GS'

    field   :name                 => 'FunctionalIdentifierCode',
            :sequence             => 1,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => true,
            :data_element_number  => 479

    field   :name                 => 'ApplicationSendersCode',
            :sequence             => 2,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 15,
            :required             => true,
            :data_element_number  => 142

    field   :name                 => 'ApplicationReceiversCode',
            :sequence             => 3,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 15,
            :required             => true,
            :data_element_number  => 124

    field   :name                 => 'Date',
            :sequence             => 4,
            :datatype             => :date,
            :minimum              => 8,
            :maximum              => 8,
            :required             => true,
            :data_element_number  => 373

    field   :name                 => 'Time',
            :sequence             => 5,
            :datatype             => :time,
            :minimum              => 4,
            :maximum              => 4,
            :required             => true,
            :data_element_number  => 337

    field   :name                 => 'GroupControlNumber',
            :sequence             => 6,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 9,
            :required             => true,
            :data_element_number  => 28

    field   :name                 => 'ResponsibleAgencyCode',
            :sequence             => 7,
            :datatype             => :list,
            :minimum              => 1,
            :maximum              => 2,
            :required             => true,
            :data_element_number  => 455

    field   :name                 => 'VersionReleaseIndustryIdentifierCode',
            :sequence             => 8,
            :datatype             => :string,
            :minimum              => 1,
            :maximum              => 12,
            :required             => true,
            :data_element_number  => 480

  end
end
