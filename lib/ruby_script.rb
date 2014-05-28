require 'ruby_script/config'
require 'ruby_script/logger'
require 'ruby_script/params'
require 'ruby_script/ruby_script_api'
require 'ruby_script/version'

module RubyScript

  def self.execute(*mandatory_params, &block)
    @logger = RubyScript::Logger.new
    @params = RubyScript::Params.new(ARGV, mandatory_params)

    @logger.log_begin(@params)
    RubyScript::RubyScriptAPI.new(@logger, @params).instance_eval(&block)
    @logger.log_end(@params)
  end

  def self.configure
    yield config
  end

  def self.config
    @config ||= RubyScript::Config.new( { log_datetime: true } )
  end

end
