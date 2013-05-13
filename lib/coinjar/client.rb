module CoinJar
  class Client
 
    attr_accessor *Configuration::VALID_CONFIG_KEYS, root_resource
 
    def initialize(options={})
      merged_options = CoinJar.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
      @root_resource = RestClient::Resource.new(endpoint, :user => api_key)
    end
    
    def post(path, payload)
      parse url(path).post(payload)
    end
  
    def get(path, params)
      parse url(path)[path].get(:params => params)
    end
  
    def put(path, payload)
      parse url(path)[path].put(payload)
    end
  
    def delete(path)
      parse url(path)[path].delete
    end
  
    def patch(path, payload)
      parse url(path)[path].patch(payload)
    end
    
    def parse(response)
      MultiJson.load(response, :symbolize_keys => true)
    end
    
    def url(path)
      root_resource["#{path}.#{format}"]
    end
 
  end
end