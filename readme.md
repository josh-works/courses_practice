my random notes go here, including the "finished answers" so I can easily grab the tests I'm working on:


```ruby

##################
## UGLY VERS 1 ###
##################

class CourseTest < MiniTest::Test
  def setup_copy
    @math = Course.new(Name("Math"), Months[4])
    @grammar = Course.new(Name("Grammar"), Days[50])
    @skrying = Course.new(Name("Skrying"), Weeks[7])
    @math = Course.new(Name("Math"), Months[4])
    @grammar = Course.new(Name("Grammar"), Days[50])
    @skrying = Course.new(Name("Skrying"), Weeks[7])
  end
  
  def test_create_new_duration
    skip
    assert @math
    assert_equal "Math", @math.name.to_s
  end

  def test_duration_has_magnitude
    skip
    assert_equal 4, @math.duration.magnitude
  end

  def test_duration_is_months_object
    skip
    assert_instance_of Months, @math.duration
  end

  def test_duration_formatting_is_not_string
    skip
    refute_equal String, @math.duration.class
  end

  def test_duration_to_i_is_aliased_to_magnitude
    skip
    assert_equal 4, @math.duration.to_i
  end

  def test_duration_to_string
    skip
    assert_equal "4 months", @math.duration.to_s
  end

  def test_duration_inspect
    skip
    assert_equal "Months[4]", @math.duration.inspect
  end

  def test_duration_can_change
    skip
    @math.duration = Weeks[3]

    assert_instance_of Weeks, @math.duration
  end

  def test_duration_can_be_denominated_in_days
    skip
    assert_instance_of Days, @grammar.duration
    assert_equal 50, @grammar.duration.magnitude
  end

  def test_duration_can_be_denominated_in_weeks
    skip
    assert_instance_of Weeks, @skrying.duration
    assert_equal 7, @skrying.duration.magnitude
  end

  def test_duration_can_be_denominated_in_months
    skip
    potions = Course.new("Potions", Months[3])

    assert_instance_of Months, potions.duration
    assert_equal 3, potions.duration.magnitude
  end

  def test_render_months_class
    skip
    results = render_value(@math.duration)

    assert_equal "4 gruling months", results
  end

  def test_render_weeks_class
    skip
    results = render_value(@skrying.duration)

    assert_equal "7 delightful weeks", results
  end

  def test_render_days_class
    skip
    results = render_value(@grammar.duration)

    assert_equal "a paultry 50 days", results
  end

  def test_render_course_info_returns_nicely_formatted_strings
    skip
    assert_equal "Math (4 gruling months)", render_course_info(@math)
    assert_equal "Grammar (a paultry 50 days)", render_course_info(@grammar)
    assert_equal "Skrying (7 delightful weeks)", render_course_info(@skrying)
  end

  def test_freeze_magnitude_in_initialize
    skip
    skip
    # not sure what I can assert to make sure value is frozen
    # https://blog.honeybadger.io/when-to-use-freeze-and-frozen-in-ruby/
  end

  def test_convert_months_string_to_duration
    skip
    @math.duration = "4 months"
    assert_equal Months, @math.duration.class
    assert_equal 4, @math.duration.magnitude
    assert_equal "Months[4]", @math.duration.inspect
  end

  def test_convert_days_string_to_duration
    skip
    @math.duration = "7 days"
    assert_equal Days, @math.duration.class
    assert_equal 7, @math.duration.magnitude
  end

  def test_convert_weeks_string_to_duration
    skip
    @math.duration = "3 weeks"
    assert_instance_of Weeks, @math.duration
    assert_equal 3, @math.duration.magnitude
  end

  def test_exceptional_values
    skip
    @math.duration = "a blink of an eye"
    assert_instance_of ExceptionalValue, @math.duration
    assert_equal "a blink of an eye", @math.duration.to_s
  end

  def test_exceptional_values_know_they_are_exceptional
    skip
    @math.duration = "a blink of an eye"
    assert @math.duration.exceptional?
  end

  def test_other_values_are_not_exceptional
    skip

    # don't worry too much about this test until creating the Name whole value
    # which is outlined below
    refute @math.name.exceptional?
  end

  #uniform abstraction level
  def test_course_names_are_name_class_xx
    skip
    assert_instance_of Name, @math.name
  end

  def test_course_name_to_s_returns_course_name
    skip
    assert_equal "Math", @math.name.to_s
  end

  def test_course_name_fails_if_not_string
    skip
    assert_raises TypeError do
      @math.name = 44
    end
  end

  def test_course_name_is_not_exceptional
    skip
    refute @math.name.exceptional?
  end
end
```

# The 'lib' code

```ruby
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

```