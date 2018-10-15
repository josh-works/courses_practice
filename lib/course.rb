require_relative './helpers/duration_helper'

class Course
  include DurationHelper
  
  attr_reader :name, :duration
  def initialize(name, duration)
    @name = name
    @duration = duration
  end
end
