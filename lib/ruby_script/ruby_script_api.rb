module RubyScript
  class RubyScriptAPI

    attr_accessor :params

    def initialize(logger, params)
      @logger, @params = logger, params
    end

    def call(command)
      @logger.log(command)
      system(command)
    end

    def link_file(folder_from, folder_to, file)
      call("rm #{folder_to}/#{file}")
      call("ln -s #{Dir.pwd}/#{folder_from}/#{file} #{folder_to}/#{file}")
    end

    def link_files(folder_from, folder_to)
      call("mkdir -p #{folder_to}")
      Dir.foreach("./#{folder_from}/") do |file|
        next if file == '.' or file == '..'
        link_file(folder_from, folder_to, file)
      end
    end

  end
end
