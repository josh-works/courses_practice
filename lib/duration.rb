require_relative 'whole_value'

class Duration < WholeValue
  include DurationHelper
  
  def self.[](quantity)
    new(quantity)
  end
  
  attr_reader :quantity
  def initialize(quantity)
    @quantity = quantity
    freeze
  end
    
  def to_s
    "#{self.quantity} #{self.class.name.downcase}" 
  end
  
  def inspect
    "#{self.class}[#{self.quantity}]"
  end
end

class Days < Duration; end;
class Weeks < Duration; end;
class Months < Duration; end;