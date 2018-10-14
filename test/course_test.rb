require_relative 'test_helper'
gem 'minitest'
require 'minitest/autorun'

class CourseTest < MiniTest::Test
  
  def setup
    @math = Course.new("Math", "7 days")
  end
  
  def test_course_exists
    assert @math
    assert @math.name
    assert @math.duration
  end
  
  def test_course_duration_is_days
    math = Course.new("Math", Days[657])
    assert_instance_of Days, math.duration
  end
end

