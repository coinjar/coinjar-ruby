require 'active_support/core_ext/object'
require 'multi_json'
require 'rest_client'

require 'coinjar/version'
require 'coinjar/configuration'
require 'coinjar/client'
require 'coinjar/address'
require 'coinjar/payment'

module CoinJar
  extend Configuration
  
  class << self
    def client
      @client = CoinJar::Client.new unless defined?(@client) && @client.hash == options.hash
      @client
    end
  end
  
end