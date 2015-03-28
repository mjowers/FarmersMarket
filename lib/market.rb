# Represents a market returned by the API search methods
# see: http://search.ams.usda.gov/farmersmarkets/v1/svcdesc.html

class Market
  attr_accessor :address, :googlelink, :products, :schedule
  attr_reader :id, :name, :distance

  # Takes in id and marketname from the API response
  # and parses out the distance
  def initialize(id, marketname)
    if marketname.empty?
      name = ""
      distance = ""
    else
      name = marketname.split[1..-1].join(" ")
      distance = marketname.split[0]
    end
    @id = id
    @name = name
    @distance = distance
  end

  def products=(products)
    @products = products.split(/;\s*/)
  end
end
