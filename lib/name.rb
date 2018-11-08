class Name < WholeValue
  def self.[](content)
    new(content)
  end
  
  attr_reader :content
  def initialize(content)
    @content = content
    freeze
  end
  
  def to_s
    @content.to_s
  end
  
  def inspect
    "#{self.class}(#{self.content})"
  end
end