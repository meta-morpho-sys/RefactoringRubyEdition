require_relative 'movie'
require_relative 'rental'
# Represents the customer of the store.
class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    frequent_renter_points = 0
    result = "Rental Record for #{@name}:\n"
    @rentals.each do |element|
      # add frequent renter points
      frequent_renter_points += element.frequent_renter_points

      # show figures for this rental
      result += "\t" + element.movie.title + "\t at the cost of " + element.charge.to_s + "£\n"
      # total_amount += element.charge
    end

    # add footer lines
    result += "\tAmount owed is #{total_charge}.\n"
    result += "\tYou earned #{frequent_renter_points} frequent renter points."
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end

logan_movie = Movie.new('Logan', 0)
rent = Rental.new(logan_movie, 3)
jack = Customer.new 'Jack'
jack.add_rental rent
p jack.rentals
print jack.statement
