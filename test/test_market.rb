require 'test/unit'
require 'market.rb'

class TestMarket < Test::Unit::TestCase
  def test_basic_distance_parsing
  	testMarketData = { 'id' => 1, 'marketname' => '12.8 Wayne Farmers Market' }
  	market = Market.new(testMarketData['id'], testMarketData['marketname'])
  	assert_equal(1, market.id)
  	assert_equal('Wayne Farmers Market', market.name)
  	assert_equal('12.8', market.distance)
  end
end