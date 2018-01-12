module Hippo::Segments
  class EQ < Hippo::Segments::Base

    segment_identifier 'EQ'

    field :name                 => 'ServiceTypeCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 1365

    composite_field 'CompositeMedicalProcedureIdentifier' do

      field :name                 => 'ProductServiceIdQualifier',
            :sequence             => 1,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => true,
            :data_element_number  => 235

      field :name                 => 'ProductServiceId',
            :sequence             => 2,
            :datatype             => :string,
            :minimum              => 1,
            :maximum              => 48,
            :required             => true,
            :data_element_number  => 234

      field :name                 => 'ProcedureModifier',
            :sequence             => 3,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1339

      field :name                 => 'ProcedureModifier',
            :sequence             => 4,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1339

      field :name                 => 'ProcedureModifier',
            :sequence             => 5,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1339

      field :name                 => 'ProcedureModifier',
            :sequence             => 6,
            :datatype             => :string,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1339

      field :name                 => 'Description',
            :sequence             => 7,
            :datatype             => :string,
            :minimum              => 1,
            :maximum              => 80,
            :required             => false,
            :data_element_number  => 352

      field :name                 => 'ProductServiceId',
            :sequence             => 8,
            :datatype             => :string,
            :minimum              => 1,
            :maximum              => 48,
            :required             => false,
            :data_element_number  => 234

    end

    field :name                 => 'CoverageLevelCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1207

    field :name                 => 'InsuranceTypeCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1336

    composite_field 'CompositeDiagnosisCodePointer' do

      field :name                 => 'DiagnosisCodePointer',
            :sequence             => 1,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 2,
            :required             => true,
            :data_element_number  => 1328

      field :name                 => 'DiagnosisCodePointer',
            :sequence             => 2,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1328

      field :name                 => 'DiagnosisCodePointer',
            :sequence             => 3,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1328

      field :name                 => 'DiagnosisCodePointer',
            :sequence             => 4,
            :datatype             => :integer,
            :minimum              => 1,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 1328

    end

  end
end
