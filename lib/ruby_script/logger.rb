module RubyScript
  class Logger

    def log(msg)
      log_msg = "[\e[36m#{process}\e[0m] #{datetime}: #{msg}"
      puts log_msg
      log_msg
    end

    def log_yield(msg)
      log("\n#{'#'*20}\n\e[33m#{msg}\e[0m\n#{'#'*20}\n")
    end

    def log_begin
      log_yield "BEGIN #{process} with ARGV='#{ARGV.inspect}'"
    end

    def log_end
      log_yield "END #{process}"
    end

    def datetime
      RubyScript.config.log_datetime == false ? "" : "[#{Time.new.strftime('%d/%m/%Y-%H:%M')}]"
    end

    def process
      File.basename($0)
    end

  end
end
