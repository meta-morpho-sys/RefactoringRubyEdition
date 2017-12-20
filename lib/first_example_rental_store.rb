# Just a simple data class.
class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end
end

# The rental class represents a customer renting a movie.
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    result = 0
    case movie.price_code
    when Movie::REGULAR
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      result += days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end
    result
  end
end

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

  def amount_for(rental)
    rental.charge
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}:\n"
    @rentals.each do |element|
      this_amount = amount_for(element)

      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # show figures for this rental
      result += "\t" + element.movie.title + "\t at the cost of " + this_amount.to_s + "£\n"
      total_amount += this_amount
    end

    # add footer lines
    result += "\tAmount owed is #{total_amount}.\n"
    result += "\tYou earned #{frequent_renter_points} frequent renter points."
    result
  end

end
#
# logan_movie = Movie.new('Logan', 0)
# rent = Rental.new(logan_movie, 3)
# jack = Customer.new 'Jack'
# jack.add_rental rent
# p jack.rentals
# print jack.statement
