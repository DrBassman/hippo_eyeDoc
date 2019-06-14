require File.expand_path('test_helper', File.dirname(__FILE__))

class TestParser < MiniTest::Unit::TestCase
  def setup
    @parser = Hippo_eyeDoc::Parser.new
  end

  def test_parse_returns_array_of_transaction_sets
    transaction_sets = @parser.parse_file('samples/005010X221A1_business_scenario_1.edi')

    assert_instance_of Array, transaction_sets

    transaction_sets.each do |ts|
      assert_kind_of Hippo_eyeDoc::TransactionSets::Base, ts
    end
  end

  def test_raises_error_on_extra_segments
    ts = Hippo_eyeDoc::TransactionSets::Test::Base.new
    ts.ST
    ts.TSS.Field2 = 'Bar'
    ts.TSS.Field3 = 'Baz'
    ts.TCS.Field1 = 'Blah'
    ts.TCS.CompositeCommonName_02 = 'CNBlah'
    ts.TSS_02.Field2 = 'Boo'

    # test nested block syntax on non-looping component
    ts.L0001.TSS.Field2 = 'SubBar'

    # test nested block syntax on non-looping component
    ts.L0002 do |l0002|
      l0002.TCS.Field2 = 'SubBarBlah'
      l0002.TSS.Field2 = 'SubBarRepeater'
    end

    #'TSS*Blah*Bar*Baz~TCS*Blah*:::CNBlah*Preset Field 7~TSS*Last Segment*Boo~TSS*Foo*SubBar~TCS*:SubBarBlah**Foo2~TSS*Last Segment*SubBarRepeater~', ts.to_s

    ts_result = @parser.parse_string(ts.to_s).first

    assert_equal ts.values.to_s, ts_result.values.to_s
  end

  def test_reads_separators_from_isa
    @parser.parse_file('samples/005010X231A1_01.edi')

    assert_equal '*', @parser.field_separator
    assert_equal '^', @parser.repetition_separator
    assert_equal ':', @parser.composite_separator
    assert_equal '~', @parser.segment_separator

    @parser = Hippo_eyeDoc::Parser.new
    transaction_set = @parser.parse_file('samples/005010X231A1_02.edi')

    assert_equal '!', @parser.field_separator
    assert_equal '@', @parser.repetition_separator
    assert_equal '~', @parser.composite_separator
    assert_equal '^', @parser.segment_separator

    assert_equal transaction_set.first.ST.ST01, '999'
  end

  def test_adds_enveloping_to_transaction_set
    transaction_set = @parser.parse_file('samples/005010X231A1_01.edi').first

    assert_equal 445289179, transaction_set.ISA.ISA13
    assert_equal 1, transaction_set.GS.GS06
  end

  def test_parses_repeating_loops
    ts = Hippo_eyeDoc::TransactionSets::Test::Base.new
    ts.ST
    [1,2,3,4,5].each do |i|
      ts.TSS.build do |tss|
        tss.Field2 = 'Bar' + i.to_s
        tss.Field3 = 'Baz' + i.to_s
      end
    end

    ts.TCS.Field1    = 'Blah'
    ts.TSS_02.Field2 = 'Boo'
    ts.SE.SE01       = ts.segment_count

    # ST*Test~TSS*Blah*Bar1*Baz1~TSS*Blah*Bar2*Baz2~TSS*Blah*Bar3*Baz3~TSS*Blah*Bar4*Baz4~TSS*Blah*Bar5*Baz5~TCS*Blah**Preset Field 7~TSS*Last Standalone Segment*Boo~SE**Test
    assert_equal ts.values.to_s, @parser.parse_string(ts.to_s).first.values.to_s
  end

  def test_parses_partial_transaction_set
    ts_01 = Hippo_eyeDoc::TransactionSets::Test::Base.new
    ts_01.L0002 do |l0002|
      l0002.TCS.Field2 = 'SubBarBlah'
      l0002.TSS.Field2 = 'SubBarRepeater'
    end

    # TCS*:SubBarBlah**Foo2~TSS*Last Segment*SubBarRepeater~
    ts_02 = Hippo_eyeDoc::TransactionSets::Test::L0002.new
    ts_02.parse(ts_01.to_s)

    assert_equal ts_01.L0002.values.to_s, ts_02.values.to_s
  end

  def test_parse_l2000a
    files = ['samples/837_L2000A_01.edi', 'samples/837_L2000A_02.edi']
    files.each do |f|
      l2000a = Hippo_eyeDoc::TransactionSets::HIPAA_837::L2000A.new.parse(File.read(f))

      # when L2000B HL04 is '0' we must have a L2000C child
      if l2000a.L2000B.HL.HL04 == '0'
        assert_nil l2000a.L2000B.L2000C.HL.HL02
      else
        assert_equal l2000a.L2000B.HL.HL01, l2000a.L2000B.L2000C.HL.HL02
      end
    end
  end

  def test_same_child_exists_in_multiple_levels
    no_child_loop_string = "TSS*HAS NO CHILD LOOP~TSS*Multiple Parents~"
    ts                   = Hippo_eyeDoc::TransactionSets::Test::L0004.new

    ts.parse(no_child_loop_string)
    assert_equal 'TSS*Multiple Parents~', ts.values[1].TSS.to_s


    child_loop_string = "TSS*HAS CHILD LOOP~TSS*Multiple Parents~"
    ts                   = Hippo_eyeDoc::TransactionSets::Test::L0004.new

    ts.parse(child_loop_string)
    assert_equal 'TSS*Multiple Parents~', ts.values[2].to_s
  end

  def test_strips_leading_whitespace_from_segment_identifier
    initial_string = "    ST*Test~\n      TSS*Blah*BOOM~"
    ts             = Hippo_eyeDoc::TransactionSets::Test::Base.new

    ts.parse(initial_string)

    assert_equal ts.TSS.TSS02, 'BOOM'
  end
end
