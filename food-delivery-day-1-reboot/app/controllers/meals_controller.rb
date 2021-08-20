require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # 1) Ask for the name and price
    name  = @view.ask_for_name
    price = @view.ask_for_price
    # 2) Instantiate a new Meal with name and price
    meal = Meal.new(price: price, name: name)
    # 3) Shove it to the meal repository array and save to CSV
    @meal_repository.create(meal)
  end

  def list
    # 1) meal_repo_instance.all to get the array
    meals = @meal_repository.all
    # 2) then we should loop over the array,
    # =>  and print the name and price of every meal
    @view.list_all(meals)
  end
end
