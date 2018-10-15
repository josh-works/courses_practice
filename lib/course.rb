require_relative './helpers/duration_helper'

class Course
  include DurationHelper
  
  def duration=(raw_value)
    @duration = Duration(raw_value)
  end
  
  attr_reader :name, :duration
  def initialize(name, duration)
    @name = name
    @duration = duration
  end
end
