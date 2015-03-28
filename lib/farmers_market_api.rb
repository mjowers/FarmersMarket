require 'net/http'
require 'json'

class FarmersMarketAPI
  def get_markets(zipcode)
    response = Net::HTTP.get("search.ams.usda.gov", "/farmersmarkets/v1/data.svc/zipSearch?zip=#{zipcode}")
    results = JSON.parse(response)['results']
    markets = results.map do |result|
      Market.new result['id'], result['marketname']
    end
    markets
  end
end
