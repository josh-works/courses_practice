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
    end
    # require "pry"; binding.pry
  end
end