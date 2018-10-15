module DurationHelper
  def format_duration
    duration = self.duration
    case duration
    when Days
      "#{duration.quantity} glorious days"
    end
  end
end