require 'net/http'
require 'uri'
require 'json'

require_relative 'product.rb'

class Warehouse
  def initialize
    @base_url = "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/default/product"
  end

  def fetch_product(product_id)
    uri = URI(@base_url)
    uri.query = URI.encode_www_form({ id: product_id })

    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    Product.new(data)
  end
end

