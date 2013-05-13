module CoinJar
  class Address
    
    def generate(params = {})
      CoinJar.post("bitcoin_addresses", params)
    end
    
  end
end