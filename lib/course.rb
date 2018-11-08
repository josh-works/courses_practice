require_relative './helpers/duration_helper'
require_relative './helpers/name_helper'

class Course
  include DurationHelper
  include NameHelper
  
  def duration=(raw_value)
    @duration = Duration(raw_value)
  end
  
  def name=(raw_value)
    @name = Name(raw_value)
  end
  
  attr_reader :name, :duration
  def initialize(name, duration)
    @name = parse_name(name)
    @duration = parse_duration(duration)
  end
  
  def parse_name(name)
    return name if name.is_a?(Name)
    Name.new(name)
  end
  
  def parse_duration(duration)
    return duration if duration.is_a?(Duration)
    Duration(duration)
  end
end
