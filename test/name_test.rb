require_relative 'test_helper'

class NameTest < MiniTest::Test
  
  def setup
    @name = Name.new("Biology")
  end
  
  def test_it_exists
    assert @name
    assert_equal "Biology", @name.to_s
    assert_equal "Name(Biology)", @name.inspect
  end
  
  def test_it_can_be_changed
    @name = "Life Science"
    assert_equal "Life Science", @name.to_s
  end
  
  def test_valid_names_are_not_exceptional
    refute @name.exceptional?
  end
end