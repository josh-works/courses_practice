require_relative 'test_helper'

class CourseTest < MiniTest::Test
  
  def setup
    @math = Course.new("Math", Days[657])
  end
  
  def test_course_exists
    assert @math
    assert @math.name
    assert @math.duration
  end
  
  def test_course_duration_in_days
    math = Course.new("Math", Days[657])
    assert_instance_of Days, math.duration
  end
  
  def test_course_duration_in_weeks
    math = Course.new("Math", Weeks[657])
    assert_instance_of Weeks, math.duration
  end
  
  def test_course_duration_in_months
    math = Course.new("Math", Months[7])
    assert_instance_of Months, math.duration
  end
  
  def test_format_duration
    result = format_duration(@math.duration)
    assert_equal "675 glorious days", result
  end
end

