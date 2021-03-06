require 'net/http'
require 'json'

# Service class to communicate with the API and convert responses to ruby
# objects
class FarmersMarketAPI

  # External call to the API
  # todo: error handling 
  def call_api(path)
    response = Net::HTTP.get("search.ams.usda.gov", "/farmersmarkets/v1/data.svc#{path}")
    JSON.parse(response)
  end

  # Returns an array of Market objects for the given zipcode
  def get_markets(zipcode)
    results = call_api("/zipSearch?zip=#{zipcode}")['results']
    markets = results.map do |result|
      Market.new result['id'], result['marketname']
    end
    markets
  end

  def get_market(id)
    result = call_api("/mktDetail?id=#{id}")['marketdetails']
    market = Market.new(id, "")
    market.address = result["Address"]
    market.googlelink = result["GoogleLink"]
    market.products = result["Products"]
    market.schedule = result["Schedule"]
    market
  end
end
