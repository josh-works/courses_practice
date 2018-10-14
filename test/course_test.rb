require_relative 'test_helper'

class CourseTest < MiniTest::Test
  
  def setup
    @math = Course.new("Math", "7 days")
  end
  
  def test_course_exists
    assert @math
    assert @math.name
    assert @math.duration
  end
  
  def test_course_duration_in_days
    math = Course.new("Math", Day[657])
    assert_instance_of Day, math.duration
  end
  
  def test_course_duration_in_weeks
    skip
    math = Course.new("Math", Week[657])
    assert_instance_of Week, math.duration
  end
  
  def test_course_duration_in_months
    skip
    math = Course.new("Math", Month[7])
    assert_instance_of Month, math.duration
  end
end

