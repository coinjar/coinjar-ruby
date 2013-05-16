module CoinJar
  class FairRate
    
    attr_accessor :currency, :bid, :ask, :spot
    
    def initialize(currency = "USD")
      self.currency = currency
      response = CoinJar.client.get("fair_rate/" + currency)
      self.reset(response)
      self
    end
    
    def reset(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
  end
end