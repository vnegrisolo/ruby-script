require './lib/ruby_script/config.rb'
require './lib/ruby_script/params.rb'
require './lib/ruby_script/logger.rb'

module RubyScript

  def self.configure
    yield config
  end

  def self.config
    @config ||= RubyScript::Config.new( { log_datetime: true } )
  end

end
