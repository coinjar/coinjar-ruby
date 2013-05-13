module CoinJar
  class Address
    
    attr_accessor :address, :label
    
    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
    
    def self.generate(label)
      self.new CoinJar.post("bitcoin_addresses", "label=#{label}")[:bitcoin_address]
    end
    
  end
end