class Duration
  
  def self.[](quantity)
    new(quantity)
  end
  attr_reader :quantity
  def initialize(quantity)
    @quantity = quantity
    freeze
  end
end

class Days < Duration; end;
class Weeks < Duration; end;
class Months < Duration; end;