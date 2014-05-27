require 'ruby_script/version'
require 'active_support/core_ext'
require './lib/ruby_script/config.rb'
require './lib/ruby_script/params.rb'
require './lib/ruby_script/logger.rb'

module RubyScript
  extend ActiveSupport::Autoload

  autoload :Setup
  autoload :Logger
  autoload :Params
  def self.configure
    yield config
  end

  def self.config
    @config ||= RubyScript::Config.new( { log_datetime: true } )
  end

end
