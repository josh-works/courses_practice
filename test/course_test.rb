require_relative 'test_helper'

class CourseTest < MiniTest::Test
  
  def setup
    @math = Course.new("Math", Days[33])
    @bio = Course.new("Biology", Weeks[3])
    @stats = Course.new("Statistics", Months[2])
  end
  
  def test_course_exists
    assert @math
    assert @math.name
    assert @math.duration
  end
  
  def test_course_duration_in_days
    math = Course.new("Math", Days[33])
    assert_instance_of Days, math.duration
  end
  
  def test_course_duration_in_weeks
    math = Course.new("Math", Weeks[33])
    assert_instance_of Weeks, math.duration
  end
  
  def test_course_duration_in_months
    math = Course.new("Math", Months[7])
    assert_instance_of Months, math.duration
  end
  
  def test_format_duration_days
    result = @math.format_duration
    assert_equal "33 glorious days", result
  end
  
  def test_format_duration_weeks
    result = @bio.format_duration
    assert_equal "3 delightful weeks", result
  end
  
  def test_format_duration_months
    result = @stats.format_duration
    assert_equal "2 gruling months", result
  end
  
  def test_render_course_info
    assert_equal "Math (33 glorious days)", @math.render_course_info
  end
  
  def test_change_duration_to_other_duration_object
    @math.duration = Days[5]
    assert_equal Days, @math.duration.class
    assert_equal 5, @math.duration.quantity
    assert_equal "Days[5]", @math.duration.inspect
  end
  
  def test_change_duration_with_properly_formatted_string
    @math.duration = "5 days"
    assert_equal Days, @math.duration.class
    assert_equal 5, @math.duration.quantity
    assert_equal "Days[5]", @math.duration.inspect
  end
  
  def test_change_duration_with_mix_of_strings
    @stats.duration = "3 weeks"
    @bio.duration = "6 months"
    assert_equal Weeks, @stats.duration.class
    assert_equal Months, @bio.duration.class
  end
  
  def test_change_duration_with_invalid_string_returns_exceptional_value
    @math.duration = "4 cycles"
    assert_instance_of ExceptionalValue, @math.duration
  end
end

