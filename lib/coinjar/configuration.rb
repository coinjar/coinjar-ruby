module CoinJar
  module Configuration
    VALID_CONFIG_KEYS     = [:api_key, :endpoint]
 
    DEFAULT_ENDPOINT    = 'https://api.coinjar.io/v1'
    DEFAULT_API_KEY      = nil
 
    attr_accessor *VALID_CONFIG_KEYS
 
    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end
 
    def reset
      self.endpoint   = DEFAULT_ENDPOINT
      self.api_key    = DEFAULT_API_KEY
    end
    
    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
 
  end
end