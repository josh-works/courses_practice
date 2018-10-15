class ExceptionalValue
  attr_reader :raw_value, :reason
  def initialize(raw_value, reason = "Unspecified")
    @raw_value = raw_value
    @reason = reason
  end
end