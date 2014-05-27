module RubyScript
  class Config

    attr_accessor :log_datetime

    def initialize(options = {})
      @log_datetime = options[:log_datetime]
    end

  end
end
