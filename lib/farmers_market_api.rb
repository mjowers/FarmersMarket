require 'net/http'
require 'json'

# Service class to communicate with the API and convert responses to ruby
# objects
class FarmersMarketAPI

  # External call to the API
  # todo: error handling 
  def call_api(path)
    response = Net::HTTP.get("search.ams.usda.gov", "/farmersmarkets/v1/data.svc#{path}")
    JSON.parse(response)['results']
  end

  # Returns an array of Market objects for the given zipcode
  def get_markets(zipcode)
    results = call_api("/zipSearch?zip=#{zipcode}")
    markets = results.map do |result|
      Market.new result['id'], result['marketname']
    end
    markets
  end
end
