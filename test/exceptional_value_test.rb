require_relative 'test_helper'

class ExceptionalValueTest < MiniTest::Test
  
  def setup
    @ev = ExceptionalValue.new("55 cycles")
  end
  
  def test_exceptional_value_exists
    assert @ev
    assert_equal "55 cycles", @ev.raw_value
    assert_equal "Unspecified", @ev.reason
  end
  
  def test_inspect_returns_raw_value
    assert_equal "55 cycles", @ev.inspect
  end
  
  def test_exceptional_values_are_exceptional
    assert @ev.exceptional?
  end
end