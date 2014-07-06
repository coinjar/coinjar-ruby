module CoinJar
  class Transaction

    attr_accessor :uuid, :counterparty_name, :counterparty_type, :amount, :status, :confirmations, :bitcoin_txid, :related_payment_uuid, :created_at, :updated_at

    def initialize(args)
      reset(args)
    end

    def fetch
      response = CoinJar.client.get("transactions/" + uuid)
      self.reset(response[:transaction])
      self
    end

    def self.find(uuid)
      transaction = self.new(uuid: uuid)
      transaction.fetch
      transaction
    end

    def self.list(offset = 0, limit = 100)
      CoinJar.client.get("transactions", { offset: offset, limit: limit })[:transactions].map { |t| self.new t }
    end

    def reset(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.all
      offset = -100
      all_transactions = []
      query_results = [nil]
      until query_results.empty?
        query_results = self.list(offset += 100)
        all_transactions += query_results
      end
      all_transactions
    end

    def self.bitcoin_transactions
      all.select{|t| t.bitcoin_transaction?}
    end

    def self.exchange_transactions
      all.select{|t| t.exchange_transaction?}
    end

    def self.bitcoin_deposits
      all.select{|t| t.bitcoin_deposit?}
    end

    def self.bitcoin_withdrawals
      all.select{|t| t.bitcoin_withdrawal?}
    end

    def self.purchases
      all.select{|t| t.purchase?}
    end

    def self.sales
      all.select{|t| t.sale?}
    end

    def self.find_by_bitcoin_txid(txid)
      all.detect{|t| txid == t.bitcoin_txid}
    end

    def self.find_all_by_bitcoin_txid(*txids)
      txids = txids.flatten
      all.select{|t| txids.include?(t.bitcoin_txid)}
    end

    # boolean methods

    def bitcoin_transaction?
      bitcoin_txid
    end

    def exchange_transaction?
      bitcoin_txid.nil?
    end

    def deposit?
      amount.to_f > 0
    end

    def withdrawal?
      amount.to_f < 0
    end

    def bitcoin_deposit?
      bitcoin_transaction? && deposit?
    end

    def bitcoin_withdrawal?
      bitcoin_transaction? && withdrawal?
    end

    def purchase?
      exchange_transaction? && deposit? # Effectively a deposit of bitcoin from fiat.
    end

    def sale?
      exchange_transaction? && withdrawal? # Effectively a withdrawal of bitcoin to fiat.
    end

  end
end
