# Violation of the Interface Segregation Principle in Ruby
# Tip: The solution to fix this is in the name of the principle itself
# ... maybe you should segregate interfaces ;)
class CoffeeMachineInterface
  def select_drink_type
      # select drink type logic
  end

  def select_portion
     # select portion logic
  end

  def select_sugar_amount
     # select sugar logic
  end

  def brew_coffee
     # brew coffee logic
  end

  def clean_coffee_machine
    # clean coffee machine logic
  end

  def fill_coffee_beans
    # fill coffee beans logic
  end

  def fill_water_supply
    # fill water logic
  end

  def fill_sugar_supply
    # fill sugar logic
  end
end

# This class actually contains all the methods of the interface, which is in
# violation of the ISP.
# One class should contain only the method(s) it uses.
class Person
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def make_coffee
    @coffee_machine.select_drink_type
    @coffee_machine.select_portion
    @coffee_machine.select_sugar_amount
    @coffee_machine.brew_coffee
  end
end

# This class actually contains all the methods of the interface, which is in
# violation of the ISP.
# One class should contain only the method(s) it uses.
class Staff
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def service
    @coffee_machine.clean_coffee_machine
    @coffee_machine.fill_coffee_beans
    @coffee_machine.fill_water_supply
    @coffee_machine.fill_sugar_supply
  end
end
