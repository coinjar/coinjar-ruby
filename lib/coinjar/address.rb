module CoinJar
  class Address

    attr_accessor :address, :label

    def initialize(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.generate(label = nil)
      self.new CoinJar.client.post("bitcoin_addresses", "label=#{label}")[:bitcoin_address]
    end

    def self.list(offset = 0, limit = 100)
      CoinJar.client.get("bitcoin_addresses", { offset: offset, limit: limit }).map { |p| self.new p[:bitcoin_address] }
    end

  end
end
