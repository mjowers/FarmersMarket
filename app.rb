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
