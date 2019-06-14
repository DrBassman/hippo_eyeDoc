module Hippo_eyeDoc::Segments
  class INS < Hippo_eyeDoc::Segments::Base

    segment_identifier 'INS'

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => true,
          :data_element_number  => 1073

    field :name                 => 'IndividualRelationshipCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => true,
          :data_element_number  => 1069

    field :name                 => 'MaintenanceTypeCode',
          :sequence             => 3,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 875

    field :name                 => 'MaintenanceReasonCode',
          :sequence             => 4,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1203

    field :name                 => 'BenefitStatusCode',
          :sequence             => 5,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1216

    composite_field 'MedicareStatusCode' do

      field :name                 => 'MedicarePlanCode',
            :sequence             => 1,
            :datatype             => :list,
            :minimum              => 1,
            :maximum              => 1,
            :required             => true,
            :data_element_number  => 1218

      field :name                 => 'EligibilityReasonCode',
            :sequence             => 2,
            :datatype             => :list,
            :minimum              => 1,
            :maximum              => 1,
            :required             => false,
            :data_element_number  => 1701

      field :name                 => 'EligibilityReasonCode',
            :sequence             => 3,
            :datatype             => :list,
            :minimum              => 1,
            :maximum              => 1,
            :required             => false,
            :data_element_number  => 1701

      field :name                 => 'EligibilityReasonCode',
            :sequence             => 4,
            :datatype             => :list,
            :minimum              => 1,
            :maximum              => 1,
            :required             => false,
            :data_element_number  => 1701

    end

    field :name                 => 'ConsolidatedOmnibusBudgetReconciliationActCobraQualifying',
          :sequence             => 7,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 1219

    field :name                 => 'EmploymentStatusCode',
          :sequence             => 8,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 584

    field :name                 => 'StudentStatusCode',
          :sequence             => 9,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1220

    field :name                 => 'YesNoConditionOrResponseCode',
          :sequence             => 10,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1073

    field :name                 => 'DateTimePeriodFormatQualifier',
          :sequence             => 11,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 1250

    field :name                 => 'DateTimePeriod',
          :sequence             => 12,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 35,
          :required             => false,
          :data_element_number  => 1251

    field :name                 => 'ConfidentialityCode',
          :sequence             => 13,
          :datatype             => :list,
          :minimum              => 1,
          :maximum              => 1,
          :required             => false,
          :data_element_number  => 1165

    field :name                 => 'CityName',
          :sequence             => 14,
          :datatype             => :string,
          :minimum              => 2,
          :maximum              => 30,
          :required             => false,
          :data_element_number  => 19

    field :name                 => 'StateOrProvinceCode',
          :sequence             => 15,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 156

    field :name                 => 'CountryCode',
          :sequence             => 16,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 26

    field :name                 => 'Number',
          :sequence             => 17,
          :datatype             => :integer,
          :minimum              => 1,
          :maximum              => 9,
          :required             => false,
          :data_element_number  => 1470

  end
end
