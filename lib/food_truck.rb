class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new{|k, v| k[v] = 0}
  end

  def check_stock (item)
    @inventory[item]
  end

  def stock (item, value)
    @inventory[item] = @inventory[item] + value
  end

end
