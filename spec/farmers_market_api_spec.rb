require 'rspec'
require 'market'
require 'farmers_market_api'
require 'json'

RSpec.describe FarmersMarketAPI do
  describe "#get_markets" do 
    it "returns an array of Market objects" do
      fixture_data = IO.read("spec/fixtures/api_get_markets_48197.json")
      fixture_data = JSON.parse(fixture_data)['results']

      api = FarmersMarketAPI.new
      expect(api).to receive(:get_markets).and_call_original
      expect(api).to receive(:call_api).and_return(fixture_data)
      markets = api.get_markets(48197)
      expect(markets.length).to eq(19)
      expect(markets).to all(be_a Market)
    end
  end
end

