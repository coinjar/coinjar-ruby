require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'
require 'vcr'

require 'net/https'
require 'uri'

# require coinjar-ruby gem
require 'coinjar'

CoinJar.api_key = "pJ451Sk8tXz9LdUbGg1sobLUZuVzuJwdyr4sD3owFW4WYHxo"
CoinJar.endpoint = "https://secure.sandbox.coinjar.io/api/v1"

# CoinJar.configure do |config|
#   config.endpoint = 'https://secure.sandbox.coinjar.io/api/v1/'
#   config.api_key = 'pJ451Sk8tXz9LdUbGg1sobLUZuVzuJwdyr4sD3owFW4WYHxo'
# end

RSpec.configure do |config|
  config.include WebMock::API
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.around(:each, :vcr) do |example|
    name = example
          .metadata[:full_description]
          .split(/\s+/, 2).join('/')
          .gsub(/[^\w\/]+/, '_')
    VCR.use_cassette(name) { example.call }
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.filter_sensitive_data('<key>') { ENV['PIN_SECRET'] }
end
