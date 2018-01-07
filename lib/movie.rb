require_relative 'price_calculators'

# Self-documenting error message.
class PriceError < StandardError
  def initialize(msg = 'Wrong price_calculator.'\
  ' Use an instance of the price_calculator classes. 😜')
    super
  end
end

# Stores names and price codes and calculates the rental charge.
class Movie
  attr_reader :title
  attr_writer :price_calculator

  def price_calculator=(price_calculator)
    raise PriceError unless valid_price_calculator? price_calculator
    @price_calculator = price_calculator
  end

  def initialize(title, price_calculator)
    self.price_calculator = price_calculator
    @title = title
  end

  def charge(days_rented)
    @price_calculator.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price_calculator.frequent_renter_points(days_rented)
  end

  def valid_price_calculator?(candidate)
    [RegularPriceCalculator, NewReleasePriceCalculator,
     ChildrensPriceCalculator].any? do |c|
      candidate.instance_of?(c)
    end
  end
end
