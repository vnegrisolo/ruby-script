Gem.find_files('ruby_script/**/*.rb').each { |path| require path }

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
