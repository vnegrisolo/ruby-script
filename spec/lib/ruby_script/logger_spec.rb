require 'spec_helper'

describe RubyScript::Logger do

  subject { described_class.new }

  describe '.datetime' do
    it 'when nil args and empty mandatory' do
      expect(subject.datetime).to match(/^\[\d\d\/\d\d\/\d\d\d\d-\d\d:\d\d\]$/)
    end

    it 'when nil args and empty mandatory' do
      RubyScript.configure {|conf| conf.log_datetime = true}
      expect(subject.datetime).to match(/^\[\d\d\/\d\d\/\d\d\d\d-\d\d:\d\d\]$/)
    end

    it 'when nil args and empty mandatory' do
      RubyScript.configure {|conf| conf.log_datetime = false}
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

  describe '.log_yield' do
    it 'print message with highlight' do
      allow(subject).to receive(:process).and_return('my-script')
      allow(subject).to receive(:datetime).and_return('[now]')
      expect(subject.log_yield('my message')).to eq("[\e[36mmy-script\e[0m] [now]: \n####################\n\e[33mmy message\e[0m\n####################\n")
    end
  end

  describe '.process' do
    it 'return the current process' do
      expect(subject.process).to eq('rspec')
    end
  end

  describe '.log_begin' do
    it 'print message for the process begin' do
      allow(subject).to receive(:process).and_return('my-script')
      allow(subject).to receive(:datetime).and_return('[now]')
      allow(ARGV).to receive(:inspect).and_return([])
      expect(subject.log_begin({var1: 'value1'})).to eq("[\e[36mmy-script\e[0m] [now]: \n####################\n\e[33mBEGIN my-script with params={:var1=>\"value1\"}\e[0m\n####################\n")
    end
  end

  describe '.log_end' do
    it 'print message for the process end' do
      allow(subject).to receive(:process).and_return('my-script')
      allow(subject).to receive(:datetime).and_return('[now]')
      expect(subject.log_end({var1: 'value1'})).to eq("[\e[36mmy-script\e[0m] [now]: \n####################\n\e[33mEND my-script with params={:var1=>\"value1\"}\e[0m\n####################\n")
    end
  end

end
