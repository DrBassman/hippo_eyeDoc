module Hippo_eyeDoc::Segments
  class VEH < Hippo_eyeDoc::Segments::Base

    segment_identifier 'VEH'

    field :name                 => 'AssignedNumber',
          :sequence             => 1,
          :datatype             => :integer,
          :minimum              => 1,
          :maximum              => 6,
          :required             => false,
          :data_element_number  => 554

    field :name                 => 'VehicleIdentificationNumber',
          :sequence             => 2,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 539

    field :name                 => 'Year',
          :sequence             => 3,
          :datatype             => :integer,
          :minimum              => 4,
          :maximum              => 4,
          :required             => false,
          :data_element_number  => 1095

    field :name                 => 'AgencyQualifierCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 559

    field :name                 => 'ReferenceIdentification',
          :sequence             => 5,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 6,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'ReferenceIdentification',
          :sequence             => 7,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'Length',
          :sequence             => 8,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 8,
          :required             => false,
          :data_element_number  => 82

    field :name                 => 'ReferenceIdentification',
          :sequence             => 9,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 127

    field :name                 => 'StateOrProvinceCode',
          :sequence             => 10,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 156

    field :name                 => 'LocationIdentifier',
          :sequence             => 11,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 310

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 12,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

    field :name                 => 'Amount',
          :sequence             => 13,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 610

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 14,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

    field :name                 => 'Amount',
          :sequence             => 15,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 610

    field :name                 => 'ActionCode',
          :sequence             => 16,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 306

    field :name                 => 'CountryCode',
          :sequence             => 17,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 26

    field :name                 => 'Name',
          :sequence             => 18,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 60,
          :required             => false,
          :data_element_number  => 93

    field :name                 => 'CountryCode',
          :sequence             => 19,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 26

  end
end
