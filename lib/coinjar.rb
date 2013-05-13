require 'coinjar/version'
require 'coinjar/configuration'
require 'coinjar/client'

require 'coinjar/address'

module CoinJar
  extend Configuration
  
  class << self
    def client
      @client = CoinJar::Client.new unless defined?(@client) && @client.hash != options.hash
    end
  end
  
end