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
    result = "Rental Record for #{@name}:\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + ' at the cost of ' + element.charge.to_s + "£\n"
    end
    # add footer lines
    result += "\tAmount owed is #{total_charge}.\n"
    result += "\tYou earned #{total_frequent_renter_points} frequent renter points."
  end

  def html_statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + ':' + ' at the cost of £' + element.charge.to_s + "<br>\n"
    end
    # add footer lines
    result += "\tYou owe £<em>#{total_charge}</em><p>\n"
    result += "\tOn this rental you earned <em>#{total_frequent_renter_points}</em> frequent renter points<p>."
  end

  private

  def total_frequent_renter_points
    @rentals.map(&:frequent_renter_points).sum
    # The previous line does the same job as the one below.
    # The previous line does the same job as the one below.
    # @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end

p logan = Movie.new('Logan', 1)
p rental = Rental.new(logan, 3)
p logan.frequent_renter_points 3
p rental.frequent_renter_points
