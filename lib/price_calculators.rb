# The module returns number f points for all rents that are not
# a New Release rent.
module RentersPoints
  def frequent_renter_points(_days_rented)
    1
  end
end

# Holds type code behaviour
class RegularPriceCalculator
  include RentersPoints

  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

# Holds type code behaviour
class NewReleasePriceCalculator
  def charge(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end
end

# Holds type code behaviour
class ChildrensPriceCalculator
  include RentersPoints
  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
