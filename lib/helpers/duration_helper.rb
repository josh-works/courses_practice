module DurationHelper
  def format_duration
    duration = self.duration
    case duration
    when Days
      "#{duration.quantity} glorious days"
    when Weeks
      "#{duration.quantity} delightful weeks"
    when Months
      "#{duration.quantity} gruling months"
    end
  end
  
  def render_course_info
    "#{self.name} (#{self.format_duration})"
  end
  
  def Duration(raw_value)
    case raw_value
    when Duration
      raw_value
    when /\A(\d+)\s+days\z/i
      Days[$1.to_i]
    when /\A(\d+)\s+weeks\z/i
      Weeks[$1.to_i]
    when /\A(\d+)\s+months\z/i
      Months[$1.to_i]
    else
      ExceptionalValue.new(raw_value, "could not convert to Duration")
    end
  end
end