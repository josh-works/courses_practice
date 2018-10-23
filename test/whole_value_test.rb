require_relative 'test_helper'

class WholeValueTest < MiniTest::Test
  
  def test_is_not_exceptional_by_default
    refute WholeValue.new.exceptional?
  end
end