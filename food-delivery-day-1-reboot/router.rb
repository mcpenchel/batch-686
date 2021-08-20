# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_actions
      user_choice = gets.chomp.to_i
      route_to(user_choice)
    end
  end

  private

  def route_to(user_choice)
    case user_choice
    when 1
      @meals_controller.add
    when 2
      @meals_controller.list
    when 3
      @customers_controller.add
    when 4
      @customers_controller.list
    when 5
      @running = false
    else
      puts "Incorrect choice, please choose a valid one!"
    end
  end

  def display_actions
    puts "1 - Add a new meal"
    puts "2 - List all the meals"
    puts "3 - Add a new customer"
    puts "4 - List all the customers"
    puts "5 - Exit"
  end
end
