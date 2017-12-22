require_relative 'movie'
# The rental class represents a customer renting a movie.
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    movie.charge(days_rented)
  end

  def frequent_renter_points
    eligible_for_bonus? ? 2 : 1
  end

  private

  def eligible_for_bonus?
    movie.price_code == Movie::NEW_RELEASE && days_rented > 1
  end
end
