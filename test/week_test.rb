require_relative 'test_helper'

class WeekTest < MiniTest::Test
  
  def setup
    @week = Week.new(4)
  end
  
  def test_course_exists
    assert_equal 4, @week.quantity
  end
  
  def test_class_method_value
    assert_instance_of Week, Week[4]
  end
  
end