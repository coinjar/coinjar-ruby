module CoinJar
  class Transaction
    
    attr_accessor :uuid, :counterparty_name, :counterparty_type, :amount, :status, :confirmations, :bitcoin_txid, :related_payment_uuid, :created_at, :updated_at
    
    def initialize(args)
      reset(args)
    end
    
    def fetch
      CoinJar.client.get("transactions/" + uuid)[:transaction]
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
    
  end
end