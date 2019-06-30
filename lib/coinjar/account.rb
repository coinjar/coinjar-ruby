module CoinJar
  class Account

    attr_accessor :unconfirmed_balance, :uuid, :email, :full_name, :available_balance

    def initialize
    end

    def fetch
      response = CoinJar.client.get("account")
      self.reset(response[:user])
      self
    end

    def self.find
      user = self.new
      user.fetch
      user
    end

    def reset(args)
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

  end
end
