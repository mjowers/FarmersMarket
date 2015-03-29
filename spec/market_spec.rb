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

  it "does not require a name" do
    market = Market.new(1, "")
    expect(market.id).to eq(1)
    expect(market.name).to eq("")
    expect(market.distance).to eq("")
  end

  it "parses a products list" do
    market = Market.new(1, "")
    market.products = "Milk;    Cheese; Celery;Fresh tomatoes"
    expect(market.products).to eq(["Milk", "Cheese", "Celery", "Fresh tomatoes"])
  end

  it "removes trailing <br> tags and semicolon from schedule" do
    market = Market.new(1, "")
    market.schedule = "05/07/2013 to 10/29/2013 Tue: 2:00 PM-6:00 PM;<br> <br> <br> "
    expect(market.schedule).to eq("05/07/2013 to 10/29/2013 Tue: 2:00 PM-6:00 PM")
  end
end
