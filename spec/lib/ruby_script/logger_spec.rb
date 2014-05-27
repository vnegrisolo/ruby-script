require 'spec_helper'

describe RubyScript::Logger do

  subject { described_class.new }

  describe '.datetime' do
    it 'when nil args and empty mandatory' do
      expect(subject.datetime).to match(/^\[\d\d\/\d\d\/\d\d\d\d-\d\d:\d\d\]$/)
    end

    it 'when nil args and empty mandatory' do
      RubyScript::Setup.define {|conf| conf.log_datetime = true}
      expect(subject.datetime).to match(/^\[\d\d\/\d\d\/\d\d\d\d-\d\d:\d\d\]$/)
    end

    it 'when nil args and empty mandatory' do
      RubyScript::Setup.define {|conf| conf.log_datetime = false}
      expect(subject.datetime).to eq( "" )
    end
  end

  describe '.log' do

    it 'print message' do
      allow(subject).to receive(:process).and_return('my-script')
      allow(subject).to receive(:datetime).and_return('[now]')
      expect(subject.log('my message')).to eq("[\e[36mmy-script\e[0m] [now]: my message")
    end

  end

end