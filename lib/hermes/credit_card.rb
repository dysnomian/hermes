require 'luhn'

class CreditCard
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def valid?
    Luhn.valid?(card_number.to_s)
  end
end
