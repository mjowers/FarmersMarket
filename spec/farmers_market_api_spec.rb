require 'rspec'
require 'market'
require 'farmers_market_api'
require 'json'

RSpec.describe FarmersMarketAPI do
  describe "#get_markets" do 
    it "returns an array of Market objects" do
      fixture_data = IO.read("spec/fixtures/api_get_markets_48197.json")
      fixture_data = JSON.parse(fixture_data)

      api = FarmersMarketAPI.new
      expect(api).to receive(:get_markets).and_call_original
      expect(api).to receive(:call_api).and_return(fixture_data)
      markets = api.get_markets(48197)
      expect(markets.length).to eq(19)
      expect(markets).to all(be_a Market)
    end
  end

  describe "#get_market" do 
    it "returns a Market object with more detail" do
      fixture_data = IO.read("spec/fixtures/api_get_market_1000675.json")
      fixture_data = JSON.parse(fixture_data)

      api = FarmersMarketAPI.new
      expect(api).to receive(:get_market).and_call_original
      expect(api).to receive(:call_api).and_return(fixture_data)
      market = api.get_market(1000675)
      expect(market).to be_a Market
      expect(market.address).to eq("Ypsilanti, Michigan, 48197")
      expect(market.googlelink).to eq("http://maps.google.com/?q=42.239797%2C%20-83.616750%20(%22Downtown+Ypsilanti+Farmers'+Market%22)")
      expect(market.schedule).to eq("05/07/2013 to 10/29/2013 Tue: 2:00 PM-6:00 PM;<br> <br> <br> ")
      expect(market.products).to eq("Baked goods; Cheese and/or dairy products; Crafts and/or woodworking items; Cut flowers; Eggs; Fresh fruit and vegetables; Fresh and/or dried herbs; Honey; Canned or preserved fruits, vegetables, jams, jellies, preserves, salsas, pickles, dried fruit, etc.; Maple syrup and/or maple products; Meat; Plants in containers; Poultry; Prepared foods (for immediate consumption); Soap and/or body care products")
    end
  end
end

