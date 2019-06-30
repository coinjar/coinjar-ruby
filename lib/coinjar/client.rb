module CoinJar
  class Client

    attr_accessor *Configuration::VALID_CONFIG_KEYS, :root_resource

    def initialize(options={})
      merged_options = CoinJar.config_options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
      @root_resource = RestClient::Resource.new(endpoint, :user => api_key)
    end

    def post(path, payload)
      parse url(path).post(payload)
    end

    def get(path, params = nil)
      parse url(path).get(:params => params)
    end

    def put(path, payload)
      parse url(path).put(payload)
    end

    def delete(path)
      parse url(path).delete
    end

    def patch(path, payload)
      parse url(path).patch(payload)
    end

    def parse(response)
      MultiJson.load(response, :symbolize_keys => true)
    end

    def url(path)
      root_resource["#{path}.#{format}"]
    end

  end
end
