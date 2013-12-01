require 'active_support/core_ext/object'
require 'multi_json'
require 'rest_client'

require 'coinjar/version'
require 'coinjar/configuration'
require 'coinjar/client'
require 'coinjar/address'
require 'coinjar/payment'
require 'coinjar/transaction'
require 'coinjar/fair_rate'

module CoinJar
  extend Configuration

  class << self
    def client
      @client = CoinJar::Client.new unless defined?(@client) && @client.hash == config_options.hash
      @client
    end
  end

end
