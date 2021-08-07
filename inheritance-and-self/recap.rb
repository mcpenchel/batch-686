# frozen_string_literal: true

# OOP -> State (@instance_variables) + Behavior (methods)
# Multiple Inheritance -> Ruby doesn't have it! But class A can inherit from B,
# which could inherit from C, and so on

class Chef
  attr_reader :name, :restaurant

  def initialize(name, restaurant)
    @name = name
    @restaurant = restaurant
  end
end

class Restaurant
  attr_reader :food_type
  attr_accessor :name, :city

  def initialize(name, city, food_type)
    @name = name
    @city = city
    @food_type = food_type
    @customers = []
  end

  # instance method
  def add_customer(customer_name)
    @customers << customer_name
  end

  # instance method
  def print_customers
    @customers.each_with_index do |customer, index|
      puts "#{index} - #{customer}"
    end
  end
end

# The StarRestaurant class is inheriting behavior from the Restaurant class
class StarRestaurant < Restaurant
  attr_reader :stars, :chef
  # we're overwriting the parent's initialize method
  def initialize(name, city, food_type, stars)
    super(name, city, food_type) # we're executing the parent class initialize method
    @stars = stars
  end

  def hire_chef(chef_name)
    # Let's talk about self
    # As this is an instance method, self is the instance on which the method
    # was called. Because the *context* is an *instance context*
    # So when ruby reaches line 93 and this hire_chef method is executed
    self
    # is the a_mineira instance. So we could do
    # self.print_customers, or self.stars, or self.chef

    # Thing is, as this is an instance method, and we have access to the instance
    # variables, why would we use self? Basically, you're gonna use it when you
    # need to reference the instance on which the method was called.
    # A good example is:
    @chef = Chef.new(chef_name, self)
  end

  # we're overwriting the parent's print_customers method
  def print_customers
    puts "You don't have access to star clients..."
  end

  # class method, and we know that because it has a self. before the method_name
  def self.all_details(array_of_restaurants)
    # Let's talk about self
    # As this is a class method, self is the class StarRestaurant.
    # Because the *context* is a *class context*
    array_of_restaurants.each_with_index do |star_restaurant, index|
      puts "#{index + 1} - (#{star_restaurant.stars}) #{star_restaurant.name} serves #{star_restaurant.food_type} food"
    end
  end
end

a_mineira = StarRestaurant.new('À Mineira', 'Rio', 'Mineira', 4)
a_mineira.name
a_mineira.add_customer('Gustavo')
a_mineira.add_customer('Augusto')

kotobuki = StarRestaurant.new('Kotobuki', 'Rio', 'Japanese', 5)

array_of_restaurants = [a_mineira, kotobuki]

# class method being executed!!
StarRestaurant.all_details(array_of_restaurants)

a_mineira.hire_chef('Barbara')
