require 'rspec'
require 'market'

RSpec.describe Market do
  it "parses out the distance from the market name" do
    testMarketData = { 'id' => 1, 'marketname' => '12.8 Wayne Farmers Market' }
    market = Market.new(testMarketData['id'], testMarketData['marketname'])

    expect(market.id).to eq(1)
    expect(market.name).to eq('Wayne Farmers Market')
    expect(market.distance).to eq('12.8') 
  end
end
