require_relative 'test_helper'

class ExceptionalValueTest < MiniTest::Test
  
  def setup
    @ev = ExceptionalValue.new("55 cycles")
  end
  
  def test_exceptional_value_exists
    assert @ev
  end
end