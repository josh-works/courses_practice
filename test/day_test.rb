require_relative 'test_helper'

class DayTest < MiniTest::Test
  
  def setup
    @day = Day.new(7)
  end
  
  def test_course_exists
    assert_equal 7, @day.quantity
  end
end