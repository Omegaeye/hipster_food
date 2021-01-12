require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test

  def setup
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  def test_it_exists
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Pies", @food_truck.name
  end

  def test_inventory
    assert_equal Hash.new, @food_truck.inventory
  end

  def test_check_stock
    assert_equal 0, @food_truck.check_stock(@item1)
  end

  def test_stocking_items
    @food_truck.stock(@item1, 30)
    expect = { @item1 => 30}
    assert_equal expect, @food_truck.inventory
    assert_equal 30, @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 25)
    assert_equal 55, @food_truck.check_stock(@item1)
    @food_truck.stock(@item2, 12)
    expect = {@item1 => 55, @item2 => 12}
    assert_equal expect, @food_truck.inventory
    require "pry"; binding.pry
  end

end
