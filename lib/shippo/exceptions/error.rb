class Shippo::Exceptions::Error < StandardError
  attr_accessor :message

  def initialize(thing = nil)
    if thing.is_a?(String)
      self.message = thing
    elsif thing.respond_to?(:message)
      self.message = thing.message
    else
      super(thing)
    end
  end

  def to_s
    "BOOM! ⇨ #{message}"
  end
end

