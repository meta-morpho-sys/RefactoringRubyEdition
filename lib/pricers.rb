# Holds type code behaviour
class RegularPrice
  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

# Holds type code behaviour
class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end
end

# Holds type code behaviour
class ChildrensPrice
  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
