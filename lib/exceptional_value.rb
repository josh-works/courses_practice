class ExceptionalValue
  attr_reader :raw_value, :reason
  def initialize(raw_value, reason = "Unspecified")
    @raw_value = raw_value
    @reason = reason
  end
  
  def exceptional?
    true
  end
  
  def inspect
    @raw_value
  end
  
  alias_method :to_s, :inspect
end