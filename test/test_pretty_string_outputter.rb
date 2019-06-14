require File.expand_path('test_helper', File.dirname(__FILE__))

class TestPrettyStringOutputter < MiniTest::Unit::TestCase
  def setup
    @ts = Hippo_eyeDoc::TransactionSets::Test::Base.new
    @ts.parse('ST*Test~TSS*Blah*Bar*Baz~TCS*Blah*:::CNBlah*Preset Field 7~TSS*Last Standalone Segment*Boo~TSS*Foo*SubBar~TCS*:SubBarBlah**Foo2~TSS*Last Segment*SubBarRepeater~')
  end

  def test_segment_to_pretty_string_returns_segment_to_s
    assert_equal @ts.TSS.to_s + "\n", @ts.TSS.to_pretty_string
  end

  def test_transaction_to_pretty_string_returns_proper_value
    expected_output = <<-EOF
ST*Test~
  TSS*Blah*Bar*Baz~
  TCS*Blah*:::CNBlah*Preset Field 7~
  TSS*Last Standalone Segment*Boo~
  TSS*Foo*SubBar~
  TCS*:SubBarBlah**Foo2~
    TSS*Last Segment*SubBarRepeater~
    EOF

    assert_equal expected_output, @ts.to_pretty_string
  end

  def test_sample835_output
    sample_835 = Hippo_eyeDoc::TransactionSets::HIPAA_835::Base.new
    sample_835.parse(File.read('samples/005010X221A1_business_scenario_1.edi'))

    assert_equal File.read('samples/sample835.pretty_string'), sample_835.to_pretty_string
  end
end
