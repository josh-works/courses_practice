class Duration
  
  def self.[](quantity)
    new(quantity)
  end
  
  def initialize(quantity)
    @quantity = quantity
    freeze
  end
  
end

class Day < Duration; end;
class Week < Duration; end;
class Month < Duration; end;