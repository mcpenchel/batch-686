class MealsView
  def list_all(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} for $#{meal.price}"
    end
  end

  def ask_for_name
    puts "What's the name of the meal?"
    gets.chomp
  end

  def ask_for_price
    puts "What's the price of the meal?"
    gets.chomp.to_i
  end
end
