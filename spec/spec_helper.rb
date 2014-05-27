require 'ruby_script'
require 'simplecov'
require './lib/ruby_script/config.rb'

SimpleCov.start

RSpec.configure do |config|
  config.order = 'random'
end
