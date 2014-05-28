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

    def log_begin(params)
      log_yield "BEGIN #{process} with params=#{params}"
    end

    def log_end(params)
      log_yield "END #{process} with params=#{params}"
    end

    def datetime
      RubyScript.config.log_datetime == false ? "" : "[#{Time.new.strftime('%d/%m/%Y-%H:%M')}]"
    end

    def process
      File.basename($0)
    end

  end
end
