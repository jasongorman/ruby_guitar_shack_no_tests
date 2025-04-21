require 'net/http'
require 'uri'
require 'json'
require 'date'

class SalesHistory
  def initialize
    @base_url = "https://gjtvhjg8e9.execute-api.us-east-2.amazonaws.com/default/sales"
  end

  def total_for_period(product_id, start_date, end_date)
    params = {
      productId: product_id,
      startDate: start_date.strftime("%-m/%-d/%Y"),
      endDate: end_date.strftime("%-m/%-d/%Y"),
      action: 'total'
    }

    uri = URI(@base_url)
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    result["total"].to_i
  end
end

