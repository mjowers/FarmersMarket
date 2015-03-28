# Represents a market returned by the API search methods
# see: http://search.ams.usda.gov/farmersmarkets/v1/svcdesc.html

class Market
  attr_reader :id, :name, :distance 

  # Takes in id and marketname from the API response
  # and parses out the distance
  def initialize(id, marketname)
    name = marketname.split[1..-1].join(" ")
    distance = marketname.split[0]
    @id = id
    @name = name
    @distance = distance
  end
end

