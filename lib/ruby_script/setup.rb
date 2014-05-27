require 'active_support/core_ext/class'

module RubyScript
  class Setup
    cattr_accessor :log_datetime

    def self.define
      yield self
    end
  end
end
