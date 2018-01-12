require File.expand_path('test_helper', File.dirname(__FILE__))

class TestTransactionSetBase < MiniTest::Unit::TestCase
  def test_preset_values_are_set
    ts = Hippo::TransactionSets::Test::Base.new
    ts.TCS
    ts.TSS.build

    assert_equal 'TSS*Blah~TCS***Preset Field 7~', ts.to_s
  end

  def test_segment_ordering_is_correct
    ts = Hippo::TransactionSets::Test::Base.new
    ts.TCS.Field1 = 'Foo'
    ts.TSS.Field2 = 'Bar'

    assert_equal 'TSS*Blah*Bar~TCS*Foo**Preset Field 7~', ts.to_s
  end

  def test_raises_error_on_invalid_segment
    ts = Hippo::TransactionSets::Test::Base.new
    assert_raises Hippo::Exceptions::InvalidSegment do
      ts.BLAH {|blah| }
    end
  end

  def test_identified_by_values_are_set
    ts = Hippo::TransactionSets::Test::Base.new
    ts.L0001 {|l0001| }

    assert_equal 'TSS*Foo~', ts.to_s
  end

  def test_accessing_segments_with_same_segment_id
    ts = Hippo::TransactionSets::Test::Base.new
    ts.TSS.Field2 = 'Bar'
    ts.TCS.Field1 = 'Foo'
    ts.TSS_02.Field2 = 'Baz'

    assert_equal 'TSS*Blah*Bar~TCS*Foo**Preset Field 7~TSS*Last Standalone Segment*Baz~', ts.to_s
  end

  def test_accessing_segments_by_name
    ts = Hippo::TransactionSets::Test::Base.new
    ts.find_by_name('Test Simple Segment #1') do |tss|
      tss.Field2 = 'Baz'
    end

    assert_equal 'TSS*Blah*Baz~', ts.to_s
  end

  def test_accessing_segments_by_name_regexp
    ts = Hippo::TransactionSets::Test::Base.new
    ts.find_by_name(/Segment/) do |tss|
      tss.Field2 = 'Baz'
    end

    assert_equal 'TSS*Blah*Baz~', ts.to_s
  end
  
  def test_assigning_segment_values_with_block_syntax
    ts = Hippo::TransactionSets::Test::Base.new

    ts.TSS do |tss|
      tss.Field2 = 'Bar'
      tss.Field3 = 'Baz'
    end

    ts.TCS do |tcs|
      tcs.Field1 = 'Blah'
      tcs.CompositeCommonName_02 = 'CNBlah'
    end

    ts.TSS_02 do |tss|
      tss.Field2 = 'Boo'
    end

    assert_equal 'TSS*Blah*Bar*Baz~TCS*Blah*:::CNBlah*Preset Field 7~TSS*Last Standalone Segment*Boo~', ts.to_s

    # test nexted block syntax on non-looping component
    ts.L0001 do |l0001|
      l0001.TSS do |tss|
        tss.Field2 = 'SubBar'
      end
    end

    assert_equal 'TSS*Blah*Bar*Baz~TCS*Blah*:::CNBlah*Preset Field 7~TSS*Last Standalone Segment*Boo~TSS*Foo*SubBar~', ts.to_s

    # test nexted block syntax on non-looping component
    ts.L0002 do |l0002|
      l0002.TCS do |tcs|
        tcs.Field2 = 'SubBarBlah'
      end

      l0002.TSS do |tss|
        tss.Field2 = 'SubBarRepeater'
      end
    end

    assert_equal 'TSS*Blah*Bar*Baz~TCS*Blah*:::CNBlah*Preset Field 7~TSS*Last Standalone Segment*Boo~TSS*Foo*SubBar~TCS*:SubBarBlah**Foo2~TSS*Last Segment*SubBarRepeater~', ts.to_s
  end

  def test_intializing_with_segment_array_populates_transaction_set
    tss = Hippo::Segments::TSS.new
    tss.TSS01 = 'Blah'

    tcs = Hippo::Segments::TCS.new
    tcs.Field7 = 'Preset Field 7'

    tss2 = Hippo::Segments::TSS.new
    tss2.TSS01 = 'Last Standalone Segment'

    # start L0001 segments
    tss3 = Hippo::Segments::TSS.new
    tss3.TSS01 = 'Foo'

    segment_array = [tss, tcs, tss2, tss3]

    assert_equal segment_array.map(&:to_s).join, Hippo::TransactionSets::Test::Base.new(:segments => segment_array).to_s
    assert_empty segment_array
  end
end
