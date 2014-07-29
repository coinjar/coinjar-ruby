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

    def all_transactions
      Transaction.all
    end
    alias_method :transactions, :all_transactions

    def bitcoin_transactions
      Transaction.bitcoin_transactions
    end

    def exchange_transactions
      Transaction.exchange_transactions
    end

    def bitcoin_deposits
      Transaction.bitcoin_deposits
    end
    alias_method :btc_received, :bitcoin_deposits

    def bitcoin_withdrawals
      Transaction.bitcoin_withdrawals
    end
    alias_method :btc_sent, :bitcoin_withdrawals

    def purchases
      Transaction.purchases
    end
    alias_method :btc_bought, :purchases

    def sales
      Transaction.sales
    end
    alias_method :btc_sold, :sales

  end # class << self

end
