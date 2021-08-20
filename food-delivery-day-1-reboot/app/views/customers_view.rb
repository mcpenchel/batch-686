class CustomersView
  def list_all(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} lives at #{customer.address}"
    end
  end

  def ask_for_name
    puts "What's the name of the customer?"
    gets.chomp
  end

  def ask_for_address
    puts "What's the address of the customer?"
    gets.chomp
  end
end
