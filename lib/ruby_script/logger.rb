module RubyScript
  class Logger

    def log(msg)
      log_msg = "[\e[36m#{process}\e[0m] #{datetime}: #{msg}"
      puts log_msg
      log_msg
    end

    def log_yield(msg)
      log("##################################################")
      log("\e[33m#{msg}\e[0m")
      log("##################################################")
    end

    def log_begin
      log_yield "BEGIN #{process} with ARGV='#{ARGV.inspect}'"
    end

    def log_end
      log_yield "END #{process}"
    end

    def datetime
      Setup.log_datetime == false ? "" : "[#{Time.new.strftime('%d/%m/%Y-%H:%M')}]"
    end

    def process
      File.basename($0)
    end

  end
end
