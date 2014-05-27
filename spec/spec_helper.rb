require 'ruby_script'
require 'simplecov'
require './lib/ruby_script/config.rb'
require './lib/ruby_script/params.rb'
require './lib/ruby_script/logger.rb'

SimpleCov.start

RSpec.configure do |config|
  config.order = 'random'
end
