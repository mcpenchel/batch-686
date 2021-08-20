require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    name    = @view.ask_for_name
    address = @view.ask_for_address
    customer = Customer.new(address: address, name: name)
    @customer_repository.create(customer)
  end

  def list
    customers = @customer_repository.all
    @view.list_all(customers)
  end
end
