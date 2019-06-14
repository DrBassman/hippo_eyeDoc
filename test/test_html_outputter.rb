require File.expand_path('test_helper', File.dirname(__FILE__))

class TestHTMLOutputter < MiniTest::Unit::TestCase
  def setup
    @parser = Hippo_eyeDoc::Parser.new
    @sample_835 = @parser.parse_file('samples/005010X221A1_business_scenario_1.edi').first
    @sample_837 = @parser.parse_file('samples/005010X231A1_01.edi').first
  end

  def test_segment_to_html_returns_segment_to_s
    assert_equal @sample_835.BPR.to_s, @sample_835.BPR.to_html
  end

  def test_transaction_to_html_returns_string
    assert_kind_of String, @sample_835.to_html
  end

  def test_verify_output_against_known_good_html
    assert_equal File.read('samples/sample835.html'), @sample_835.to_html
    assert_equal File.read('samples/sample837.html'), @sample_837.to_html
  end
end
