require 'ruby_script/version'
require 'active_support/core_ext'

module RubyScript
  extend ActiveSupport::Autoload

  autoload :Setup
  autoload :Logger
  autoload :Params
end
