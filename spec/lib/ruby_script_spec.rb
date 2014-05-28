require 'spec_helper'

describe RubyScript do

  describe '#configure' do
    it 'log_datetime set to true' do
      RubyScript.configure{ |conf| conf.log_datetime = true }
      expect(RubyScript.config.log_datetime).to be true
    end
    it 'log_datetime set to false' do
      RubyScript.configure{ |conf| conf.log_datetime = false }
      expect(RubyScript.config.log_datetime).to be false
    end
  end

end
