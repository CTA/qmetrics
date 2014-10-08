require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'qm'

Dir["./spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = 'random'
end
