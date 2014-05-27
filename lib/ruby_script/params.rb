module RubyScript
  class Params < Hash

    def initialize(argv, mandatory_params = nil)
      extract(argv)
      validate(mandatory_params)
    end

    private

    def extract(argv)
      return unless argv

      argv.each do |arg|
        param = arg.split('=')
        self[param[0].downcase.to_sym] = param[1]
      end
    end

    def validate(mandatory_params)
      Array(mandatory_params).each do |p|
        raise ArgumentError.new("Must have a param=#{p}.") unless self[p.to_s.downcase.to_sym]
      end
    end

  end
end
