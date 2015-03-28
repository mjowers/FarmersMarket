require 'rspec'
require 'market'
require 'farmers_market_api'
require 'json'

RSpec.describe FarmersMarketAPI do
  describe "#get_markets" do 
    it "returns an array of Market objects" do
      fixture_data = "{\"results\":[{\"id\":\"1000675\",\"marketname\":\"0.6 Downtown Ypsilanti Farmers' Market\"},{\"id\":\"1002811\",\"marketname\":\"1.2 Ypsilanti Depot Town Farmers' Market\"},{\"id\":\"1009041\",\"marketname\":\"4.5 Cobblestone Farmers Market\"},{\"id\":\"1010118\",\"marketname\":\"4.6 Pittsfield Township Farmers Market\"},{\"id\":\"1004217\",\"marketname\":\"5.7 Dixboro Farmers' Market\"},{\"id\":\"1004649\",\"marketname\":\"7.0 Canton Farmers Market\"},{\"id\":\"1008269\",\"marketname\":\"7.0 Canton Harvest Market (pre-Thanksgiving)\"},{\"id\":\"1001082\",\"marketname\":\"7.0 Belleville Farmers Market\"},{\"id\":\"1010223\",\"marketname\":\"7.2 Ann Arbor Farmers Market\"},{\"id\":\"1010882\",\"marketname\":\"7.3 Argus Farm Stop\"},{\"id\":\"1004989\",\"marketname\":\"8.6 Saline Farmers Market\"},{\"id\":\"1002478\",\"marketname\":\"8.7 Westside Farmers Market\"},{\"id\":\"1004990\",\"marketname\":\"9.1 Saline Farmers Market\"},{\"id\":\"1004988\",\"marketname\":\"9.3 Saline Farmers Market\"},{\"id\":\"1008802\",\"marketname\":\"11.8 Romulus Farmers Market\"},{\"id\":\"1000399\",\"marketname\":\"12.2 Plymouth County Farmers Market\"},{\"id\":\"1005502\",\"marketname\":\"12.5 City of Wayne Farmers' Market\"},{\"id\":\"1008206\",\"marketname\":\"12.8 Wayne Farmers Market\"},{\"id\":\"1008205\",\"marketname\":\"12.9 Westland Farmers Market\"}]}\n"
      fixture_data = JSON.parse(fixture_data)['results']

      api = FarmersMarketAPI.new
      expect(api).to receive(:get_markets).and_call_original
      expect(api).to receive(:call_api).and_return(fixture_data)
      markets = api.get_markets(48197)
      expect(markets.length).to eq(19)
    end
  end
end
