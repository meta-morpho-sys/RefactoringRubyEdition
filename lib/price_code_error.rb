# Self-documenting error message.
class PriceCodeError < StandardError
  def initialize(msg = 'Wrong price code or no price code. Choose between 0, 1 or 2')
    super
  end
end