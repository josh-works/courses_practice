require_relative 'test_helper'

class DurationTest < MiniTest::Test
  
  def setup
    @days = Days.new(4)
    @weeks = Weeks.new(3)
    @months = Months.new(6)
  end
  
  def test_course_exists
    assert_equal 4, @days.quantity
    assert_equal 3, @weeks.quantity
    assert_equal 6, @months.quantity
  end
  
  def test_class_method_value_functions
    assert_instance_of Days, Days[4]
    assert_instance_of Weeks, Weeks[3]
    assert_instance_of Months, Months[3]
  end
  
  def test_duration_to_s
    results = @days.to_s
    
    assert_equal "4 days", results
  end
  
  def test_inspect
    assert_equal "Days[4]", @days.inspect
  end
end

