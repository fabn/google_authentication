require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'rails/all'
require 'google_authentication'

require 'rspec/expectations'

# using aruba for full integration features
require 'aruba/cucumber'

Before do
  # raise timeouts
  @aruba_timeout_seconds = 10
  @aruba_io_wait_seconds = 10
end
