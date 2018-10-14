class Course
  attr_reader :name, :duration
  def initialize(name, duration)
    @name = name
    @duration = duration
  end
end
