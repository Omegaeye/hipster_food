class Item

  attr_reader :name,
              :price

  def initialize(item)
    @name = item[:name]
    @price = item[:price].scan(/[.0-9]/).join().to_f
  end


end
