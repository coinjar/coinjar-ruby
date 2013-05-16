module CoinJar
  class Payment
    
    attr_accessor :uuid, :payee, :payee_name, :amount, :status, :related_transaction_uuid, :created_at, :updated_at
    
    def initialize(args)
      reset(args)
    end
    
    def create
      response = CoinJar.client.post("payments", {:payment => self.instance_values})
      self.reset(response[:payment])
      self
    end
    
    def confirm!
      response = CoinJar.client.post("payments/#{uuid}/confirm", nil)
      self.reset(response[:payment])
      self
    end
    
    def fetch
      response = CoinJar.client.get("payments/" + uuid)
      self.reset(response[:payment])
      self
    end
    
    def self.find(uuid)
      payment = self.new(uuid: uuid)
      payment.fetch
      payment
    end
    
    def self.list(offset = 0, limit = 100)
      CoinJar.client.get("payments", { offset: offset, limit: limit })[:payments].map { |p| self.new p }
    end
    
    def reset(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
  end
end