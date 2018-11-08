module NameHelper
  def Name(content)
    case content
    when String then Name.new(content)
    when Name then content
    else fail TypeError, "Cannot convert #{content.inspect} to name"
    end
  end
end