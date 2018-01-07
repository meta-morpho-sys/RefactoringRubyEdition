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
      result += "\t" + element.movie.title + ' at the cost of ' + element
                .charge.to_s + "£\n"
    end
    # add footer lines
    result += "\tAmount owed is #{total_charge}.\n"
    result += "\tYou earned #{tfrp} frequent renter points."
  end

  def html_statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + ':' + ' at the cost of £' + element
                .charge.to_s + "<br>\n"
    end
    # add footer lines
    result += "\tYou owe £<em>#{total_charge}</em><p>\n"
    result += "\tOn this rental you earned <em>#{tfrp}</em> frequent" \
              ' renter points<p>.'
  end

  private

  # tfrp stands for total_frequent_renter_points
  def tfrp
    @rentals.map(&:frequent_renter_points).sum
    # The previous line does the same job as the one below.
    # The previous line does the same job as the one below.
    # @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end
