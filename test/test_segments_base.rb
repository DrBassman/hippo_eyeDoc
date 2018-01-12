require File.expand_path('test_helper', File.dirname(__FILE__))

class TestSegmentsBase < MiniTest::Unit::TestCase
  def setup; end;
  def teardown; end;

  def test_empty_segment
    seg = Hippo::Segments::TSS.new

    assert_equal '', seg.to_s
  end

  def test_basic_populated_segment
    seg = Hippo::Segments::TSS.new

    seg.Field1 = 'TestField1'
    seg.Field2 = 'TestField2'
    seg.Field3 = 'TestField3'
    seg.Field4 = 'TestField4'

    assert_equal 'TSS*TestField1*TestField2*TestField3*TestField4~', seg.to_s
  end

  def test_empty_field_in_segment
    seg = Hippo::Segments::TSS.new

    seg.Field2 = 'TestField2'
    seg.Field3 = 'TestField3'
    seg.Field4 = 'TestField4'

    assert_equal 'TSS**TestField2*TestField3*TestField4~', seg.to_s

    seg = Hippo::Segments::TSS.new

    seg.Field2 = 'TestField2'

    assert_equal 'TSS**TestField2~', seg.to_s
  end

  def test_segment_orders_properly
    seg = Hippo::Segments::TSS.new

    seg.Field3 = 'TestField3'
    seg.Field2 = 'TestField2'
    seg.Field1 = 'TestField1'
    seg.Field4 = 'TestField4'

    assert_equal 'TSS*TestField1*TestField2*TestField3*TestField4~', seg.to_s
  end

  def test_assign_values_with_same_field_names
    seg = Hippo::Segments::TSS.new
    seg.CommonName = 'Value1'
    seg.CommonName_02 = 'Value2'

    assert_equal 'TSS*****Value1*Value2~', seg.to_s

    seg.CommonName_01 = 'Value3'
    seg.CommonName_02 = 'Value4'

    assert_equal 'TSS*****Value3*Value4~', seg.to_s
  end

  def test_compound_segment
    seg = Hippo::Segments::TCS.new

    seg.Field1  = 'Comp1Field1'
    seg.Field2  = 'Comp1Field2'

    assert_equal 'TCS*Comp1Field1:Comp1Field2~', seg.to_s

    seg.Field7 = 'Field7'

    assert_equal 'TCS*Comp1Field1:Comp1Field2**Field7~', seg.to_s
  end

  def test_compound_segment_with_empty_initial_fields
    seg = Hippo::Segments::TCS.new

    seg.Field2  = 'Comp1Field2'

    assert_equal 'TCS*:Comp1Field2~', seg.to_s
  end

  def test_compound_segment_assign_values_with_same_field_names

    seg = Hippo::Segments::TCS.new

    seg.CompositeCommonName = 'CompVal1'
    seg.CompositeCommonName_02 = 'CompVal2'

    assert_equal 'TCS*:::CompVal1*:::CompVal2~', seg.to_s

    seg.CompositeCommonName_1 = 'CompVal3'
    seg.CompositeCommonName_2 = 'CompVal4'

    assert_equal 'TCS*:::CompVal3*:::CompVal4~', seg.to_s

    seg.TCS01_04 = 'CompVal5'
    seg.TCS02_04 = 'CompVal6'

    assert_equal 'TCS*:::CompVal5*:::CompVal6~', seg.to_s

    assert_equal 'CompVal5', seg.TCS01_04
  end

  def test_assign_invalid_field_throws_error
    assert_raises(Hippo::Exceptions::InvalidField) do
      seg = Hippo::Segments::NM1.new
      seg.InvalidField = 'Error should be raised.'
    end
  end

  def test_raises_invalid_value_for_date_fields
    seg = Hippo::Segments::TSS.new

    assert_raises(Hippo::Exceptions::InvalidValue) { seg.DateField = "asdf" }
    assert_raises(Hippo::Exceptions::InvalidValue) { seg.DateField = "0810" }

    seg.DateField = Date.today
    seg.DateField = "20120120"
    seg.DateField = Time.now
    seg.DateField = nil
  end

  def test_raises_invalid_value_for_time_fields
    seg = Hippo::Segments::TSS.new

    assert_raises(Hippo::Exceptions::InvalidValue) { seg.TimeField = "asdf" }
    assert_raises(Hippo::Exceptions::InvalidValue) { seg.TimeField = "25111201" }
    assert_raises(Hippo::Exceptions::InvalidValue) { seg.TimeField = Date.today }

    seg.TimeField = "0120"
    seg.TimeField = Time.now
    seg.TimeField = nil
  end

  def test_performs_type_conversion
    seg = Hippo::Segments::TSS.new

    seg.DateField = '20120121'
    assert_equal Date.new(2012,01,21), seg.DateField

    seg.TimeField = '231101'
    assert_equal Time.new(Date.today.year, Date.today.month, Date.today.day, 23,11,01), seg.TimeField

    seg.IntegerField = '2'
    assert_equal 2, seg.IntegerField

    seg.DecimalField = '123.45'
    assert_equal BigDecimal.new('123.45'), seg.DecimalField

    assert_equal 'TSS*******20120121*231101*2*123.45~', seg.to_s
  end

  def test_fixed_width_segment
    isa = Hippo::Segments::ISA.new

    assert_equal "ISA*  *#{' ' * 10}*  *#{' ' * 10}*  *#{' ' * 15}*  *#{' ' * 15}*#{Date.today.strftime('%y%m%d')}*#{Time.now.strftime('%H%M')}* *     *#{'0' * 9}* * * ~", isa.to_s

    isa.AuthorizationInformationQualifier  = '00'
    isa.SecurityInformationQualifier       = '00'
    isa.InterchangeIdQualifier_01          = 'ZZ'
    isa.InterchangeSenderId                = '593208085'
    isa.InterchangeIdQualifier_02          = 'ZZ'
    isa.InterchangeReceiverId              = 'OVERRIDE'
    isa.InterchangeDate                    = Time.now
    isa.InterchangeTime                    = Time.now
    isa.RepetitionSeparator                = Hippo::DEFAULT_REPETITION_SEPARATOR
    isa.InterchangeControlVersionNumber    = '00501'
    isa.InterchangeControlNumber           = 12345
    isa.AcknowledgmentRequested            = '1'
    isa.InterchangeUsageIndicator          = 'T'
    isa.ComponentElementSeparator          = Hippo::DEFAULT_COMPOSITE_SEPARATOR

    assert_equal "ISA*00*          *00*          *ZZ*593208085      *ZZ*OVERRIDE       *#{Date.today.strftime('%y%m%d')}*#{Time.now.strftime('%H%M')}*^*00501*000012345*1*T*:~", isa.to_s
  end

  def test_access_empty_composite_returns_nil
    seg = Hippo::Segments::TCS.new

    assert_equal nil, seg.TCS01_01
  end

  def test_segment_parse_for_composite_fields
    input_string = "STC*A7:755:87*20121127*U*2200******A3:448**REJECTED AT CLEARINGHOUSE PAY-TO PROVIDER PRIMARY ID# IS NOT USED (1235196510) (59141)"
    seg = Hippo::Segments::STC.new.parse(input_string)
    assert_equal input_string + '~', seg.to_s
  end

  def test_empty_fields_are_removed
    n1 = Hippo::Segments::N1.new.parse("N1*PE*    *XX*1234567890")
    assert_equal "N1*PE**XX*1234567890~", n1.to_s
  end

  def test_remove_empty_fields_doesnt_change_populated_fields
    original = "N1*PE*SOME RANDOM   NAME HERE*XX*1234567890"
    n1 = Hippo::Segments::N1.new.parse(original)
    assert_equal original + '~', n1.to_s
  end
end
