require 'coinjar/version'
require 'coinjar/configuration'

module CoinJar
  
  extend Configuration
  
  def post_request(path, data)
    root_resource[path].post(data)
  end
  
  def get_request(path)
    root_resource[path].get
  end
  
  def put_request(path, data)
    root_resource[path].put(data)
  end
  
  def delete_request(path)
    root_resource[path].delete
  end
  
  def patch_request(path, data)
    root_resource[path].patch(data)
  end
  
  def root_url
    options.endpoint
  end
  
  def root_resource
    RestClient::Resource.new(root_url, :user => options.api_key)
  end
  
  
end