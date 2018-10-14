# require_relative './helpers/duration_helper'

module DurationHelper
  def self.yell
    super
    "aahhhhh"
  end
  
  def format_duration(duration)
    super
    case duration
    when Days
      "#{duration.amount} glorious days"
    end
  end
end


class Duration
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