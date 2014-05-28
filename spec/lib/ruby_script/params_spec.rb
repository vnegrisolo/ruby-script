require 'spec_helper'

describe RubyScript::Params do

  describe '.initialize' do

    it 'when nil args' do
      expect(described_class.new( nil )).to eq( {} )
    end

    it 'when nil args and nil mandatory' do
      expect(described_class.new( nil, nil )).to eq( {} )
    end

    it 'when empty args and empty mandatory' do
      expect(described_class.new( [], [] )).to eq( {} )
    end

    it 'when args with no value and empty mandatory' do
      expect(described_class.new( ['arg1'], [] )).to eq( {arg1: nil} )
    end

    it 'when args with no value and empty mandatory' do
      expect(described_class.new( ['arg1='], [] )).to eq( {arg1: nil} )
    end

    it 'when valid args and nil mandatory' do
      expect(described_class.new( ['aRG1=value1', 'arg2=value2'], nil )).to eq( {arg1: 'value1', arg2: 'value2'} )
    end

    it 'when valid args and empty mandatory' do
      expect(described_class.new( ['ARg1=value1', 'arg2=value2'], [] )).to eq( {arg1: 'value1', arg2: 'value2'} )
    end

    it 'when valid args and one mandatory symbol' do
      expect(described_class.new( ['ARg1=value1', 'arg2=value2'], [:arg1] )).to eq( {arg1: 'value1', arg2: 'value2'} )
    end

    it 'when valid args and one mandatory string' do
      expect(described_class.new( ['ARg1=value1', 'arg2=value2'], ['aRG1'] )).to eq( {arg1: 'value1', arg2: 'value2'} )
    end

    it 'when valid args and other mandatory' do
      expect{described_class.new( ['arg1=value1', 'ARG2=value2'], [:arg3] )}.to raise_error(ArgumentError, 'Must have a param=arg3.')
    end

  end

end
