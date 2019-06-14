module Hippo_eyeDoc::Segments
  class EB < Hippo_eyeDoc::Segments::Base

    segment_identifier 'EB'

    field :name                 => 'EligibilityOrBenefitInformationCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1390

    field :name                 => 'CoverageLevelCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1207

    field :name                 => 'ServiceTypeCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 1365

    field :name                 => 'InsuranceTypeCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1336

    field :name                 => 'PlanCoverageDescription',
          :sequence             => 5,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 50,
          :required             => false,
          :data_element_number  => 1204

    field :name                 => 'TimePeriodQualifier',
          :sequence             => 6,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 615

    field :name                 => 'MonetaryAmount',
          :sequence             => 7,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'PercentageAsDecimal',
          :sequence             => 8,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 10,
          :required             => false,
          :data_element_number  => 954

    field :name                 => 'QuantityQualifier',
          :sequence             => 9,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 673

    field :name                 => 'Quantity',
          :sequence             => 10,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 11,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 12,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

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
