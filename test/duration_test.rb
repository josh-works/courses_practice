require_relative 'test_helper'

class DurationTest < MiniTest::Test
  
  def setup
    @day = Days.new(4)
    @week = Weeks.new(3)
    @month = Months.new(6)
  end
  
  def test_course_exists
    assert_equal 4, @day.quantity
    assert_equal 3, @week.quantity
    assert_equal 6, @month.quantity
  end
  
  def test_class_method_value
    assert_instance_of Days, Days[4]
    assert_instance_of Weeks, Weeks[3]
    assert_instance_of Months, Months[3]
  end
end