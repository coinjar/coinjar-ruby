module CoinJar
  class Payment
    
    attr_accessor :uuid, :payee_name, :payee_name, :status, :created_at, :updated_at
    
    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
    def create
      response = CoinJar.client.post("payments", {:payment => self.instance_variables})
      self.initialize(response[:payment])
    end
    
    def confirm!
      CoinJar.client.post("payments/#{uuid}/confirm")
    end
    
    def fetch
      CoinJar.client.get("payments/" + uuid)[:payment]
      self.initialize(response[:payment])
    end
    
    def self.find(uuid)
      payment = self.new(uuid: uuid)
      payment.fetch
      payment
    end
    
    def self.list(offset = 0, limit = 100)
      CoinJar.client.get("payments", { offset: offset, limit: limit }).map { |p| self.new p[:payment] }
    end
    
  end
end