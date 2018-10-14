class WholeValue
  def exceptional? 
    false
  end
end

class Name < WholeValue
  def self.[](name)
    new(name)
  end
  attr_reader :name
  def initialize(name)
    @name = name
    freeze
  end
  
  def to_s
    @name
  end
end

def Name(content)
  case content
  when String then Name.new(content)
  when Name then content
  else fail TypeError, "#{content} is not a valid name"
  end
end

class Course < WholeValue
  attr_accessor :name, :duration
  def initialize(name, duration)
    @name = name
    @duration = duration
  end
  
  def name=(new_name)
    @name = Name(new_name)
  end

  def duration=(new_value)
    @duration = Duration(new_value)
  end
end
# 
# Course = Struct.new(:name, :duration) do
#   def duration=(new_value)
#     require "pry"; binding.pry
#     self[:duration] = Duration(new_value)
#   end
# end


def render_value(duration)
  case duration
  when Months
    "#{duration.magnitude} gruling months" 
  when Weeks
    "#{duration.magnitude} delightful weeks"
  when Days
    "a paultry #{duration.magnitude} days"
  end
end

def render_course_info(course)
  "#{course.name} (#{render_value(course.duration)})"
end


class Duration < WholeValue
  def self.[](raw_value)
    new(raw_value)
  end
  attr_reader :magnitude
  def initialize(magnitude)
    @magnitude = magnitude
    freeze
  end
  
  def to_s
    "#{self.magnitude} #{self.class.name.downcase}"
  end
  
  def inspect
    "#{self.class}[#{self.magnitude}]"
  end
  
  alias_method :to_i, :magnitude
end

def Duration(input)
  case input
  when Duration
    input
  when /\A(\d+)\s+months\z/i
    Months[$1.to_i]
  when /\A(\d+)\s+weeks\z/i
    Weeks[$1.to_i]
  when /\A(\d+)\s+days\z/i
    Days[$1.to_i]
  else 
    ExceptionalValue.new(input, "cannot convert #{input} to duration")
  end
end

class ExceptionalValue
  attr_reader :raw_value, :message
  def initialize(raw_value, message = "Unknown")
    @raw_value = raw_value
    @message = message
  end
  
  def exceptional?
    true
  end
  
  def to_s
    @raw_value
  end
end

class Days < Duration; end;
class Weeks < Duration; end;
class Months < Duration; end;

# -----------------------------------------------
# 
# Course = Struct.new(:name, :duration) do
#   def name=(new_name)
#     self[:name] = Name(new_name)
#   end
# 
#   def duration=(new_duration)
#     self[:duration] = Duration(new_duration)
#   end
# end
# 
# class WholeValue
#   def exceptional?
#     false
#   end
# end
# 
# class Name < WholeValue
#   def self.[](content)
#     new(content)
#   end
# 
#   attr_reader :content
#   def initialize(content)
#     @content = content
#     freeze
#   end
# 
#   def to_s
#     @content.to_s
#   end
# 
#   def inspect
#     "#{self.class}(#{@content})"
#   end  
# end
# 
# def Name(content)
#   case content
#   when String then Name.new(content)
#   when Name then content
#   else fail TypeError, "Can't make Name from #{content.inspect}"
#   end
# end
# 
# 
# 
# class Duration < WholeValue
#   def self.[](magnitude)
#     new(magnitude)
#   end
# 
#   attr_reader :magnitude
#   def initialize(magnitude)
#     @magnitude = magnitude
#     freeze
#   end
# 
#   def to_s
#     "#{self.magnitude} #{self.class.name.downcase}"
#   end
# 
#   def inspect
#     "#{self.class}[#{self.magnitude}]"
#   end
# 
#   alias_method :to_i, :magnitude
# end
# 
# class Days < Duration; end
# class Weeks < Duration; end
# class Months < Duration; end
# 
# class ExceptionalValue
#   attr_reader :raw_value, :reason
#   def initialize(raw_value, reason: "Unspecified")
#     @raw_value = raw_value
#     @reason = reason
#   end
#   def exceptional?
#     true
#   end
# 
#   def to_s
#     @raw_value.to_s
#   end
# end
# 
# # helper methods
# def render_course_info(course)
#   "#{course.name} (#{render_value(course.duration)})"
# end
# 
# def render_value(value)
#   case value
#   when Months
#     "#{value.to_i} gruling months"
#   when Weeks
#     "#{value.to_i} delightful weeks"
#   when Days
#     "a paultry #{value.to_i} days"
#   end
# end
# 
# # in the video, this method was capitalized, I don't know why but I imagine
# # it was for a good reason
# def Duration(raw_value)
#   case raw_value
#   when Duration
#     raw_value
#   when /\A(\d+)\s+months\z/i
#     Months[$1.to_i]
#   when /\A(\d+)\s+weeks\z/i
#     Weeks[$1.to_i]
#   when /\A(\d+)\s+days\z/i
#     Days[$1.to_i]
#   else 
#     ExceptionalValue.new(raw_value, reason: "unrecognized format")
#   end
# end
