class Meal
  attr_reader :name, :price
  attr_accessor :id
  def initialize(attributes = {})
    @id    = attributes[:id]
    @name  = attributes[:name]
    @price = attributes[:price]
  end
end

# crash-test
# veggie_lasagna = Meal.new(id: 7, name: 'Veggie Lasagna', price: 28)
# p veggie_lasagna
