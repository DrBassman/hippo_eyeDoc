module Hippo_eyeDoc::Segments
  class CTP < Hippo_eyeDoc::Segments::Base

    segment_identifier 'CTP'

    field :name                 => 'ClassOfTradeCode',
          :sequence             => 1,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 687

    field :name                 => 'PriceIdentifierCode',
          :sequence             => 2,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 236

    field :name                 => 'UnitPrice',
          :sequence             => 3,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 17,
          :required             => false,
          :data_element_number  => 212

    field :name                 => 'Quantity',
          :sequence             => 4,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 15,
          :required             => false,
          :data_element_number  => 380

    composite_field 'CompositeUnitOfMeasure' do

      field :name                 => 'UnitOrBasisForMeasurementCode',
            :sequence             => 1,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => true,
            :data_element_number  => 355

      field :name                 => 'Exponent',
            :sequence             => 2,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 15,
            :required             => false,
            :data_element_number  => 1018

      field :name                 => 'Multiplier',
            :sequence             => 3,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 10,
            :required             => false,
            :data_element_number  => 649

      field :name                 => 'UnitOrBasisForMeasurementCode',
            :sequence             => 4,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 355

      field :name                 => 'Exponent',
            :sequence             => 5,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 15,
            :required             => false,
            :data_element_number  => 1018

      field :name                 => 'Multiplier',
            :sequence             => 6,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 10,
            :required             => false,
            :data_element_number  => 649

      field :name                 => 'UnitOrBasisForMeasurementCode',
            :sequence             => 7,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 355

      field :name                 => 'Exponent',
            :sequence             => 8,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 15,
            :required             => false,
            :data_element_number  => 1018

      field :name                 => 'Multiplier',
            :sequence             => 9,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 10,
            :required             => false,
            :data_element_number  => 649

      field :name                 => 'UnitOrBasisForMeasurementCode',
            :sequence             => 10,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 355

      field :name                 => 'Exponent',
            :sequence             => 11,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 15,
            :required             => false,
            :data_element_number  => 1018

      field :name                 => 'Multiplier',
            :sequence             => 12,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 10,
            :required             => false,
            :data_element_number  => 649

      field :name                 => 'UnitOrBasisForMeasurementCode',
            :sequence             => 13,
            :datatype             => :list,
            :minimum              => 2,
            :maximum              => 2,
            :required             => false,
            :data_element_number  => 355

      field :name                 => 'Exponent',
            :sequence             => 14,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 15,
            :required             => false,
            :data_element_number  => 1018

      field :name                 => 'Multiplier',
            :sequence             => 15,
            :datatype             => :decimal,
            :minimum              => 1,
            :maximum              => 10,
            :required             => false,
            :data_element_number  => 649

    end

    field :name                 => 'PriceMultiplierQualifier',
          :sequence             => 6,
          :datatype             => :list,
          :minimum              => 3,
          :maximum              => 3,
          :required             => false,
          :data_element_number  => 648

    field :name                 => 'Multiplier',
          :sequence             => 7,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 10,
          :required             => false,
          :data_element_number  => 649

    field :name                 => 'MonetaryAmount',
          :sequence             => 8,
          :datatype             => :decimal,
          :minimum              => 1,
          :maximum              => 18,
          :required             => false,
          :data_element_number  => 782

    field :name                 => 'BasisOfUnitPriceCode',
          :sequence             => 9,
          :datatype             => :list,
          :minimum              => 2,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 639

    field :name                 => 'ConditionValue',
          :sequence             => 10,
          :datatype             => :string,
          :minimum              => 1,
          :maximum              => 10,
          :required             => false,
          :data_element_number  => 499

    field :name                 => 'MultiplePriceQuantity',
          :sequence             => 11,
          :datatype             => :integer,
          :minimum              => 1,
          :maximum              => 2,
          :required             => false,
          :data_element_number  => 289

  end
end
