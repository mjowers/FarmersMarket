require 'sinatra'
require_relative 'lib/market.rb'
require_relative 'lib/farmers_market_api.rb'

get '/' do 
  erb :index
end

get '/search' do
  api = FarmersMarketAPI.new
  zipcode = params[:zipcode]
  markets = api.get_markets(zipcode)
  erb :markets, :locals => {
  	:zipcode => zipcode,
  	:markets => markets,
  }
end

get '/markets/:id' do
  id = params[:id]
  api = FarmersMarketAPI.new
  market = api.get_market(id)
  
  # mktDetails doesn't return the name, so just hacking it in
  market.name = params[:name] || "Farmer's Market"
  erb :market, :locals => {
    :market => market,
  }
end
