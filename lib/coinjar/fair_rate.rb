module CoinJar
  class FairRate

    attr_accessor :currency, :bid, :ask, :spot

    def initialize(currency = "USD")
      @currency = currency
      response = CoinJar.client.get("fair_rate/" + currency)
      @bid = BigDecimal.new response[:bid]
      @ask = BigDecimal.new response[:ask]
      @spot = BigDecimal.new response[:spot]
    end

  end
end
