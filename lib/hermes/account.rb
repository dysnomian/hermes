class Account
  attr_reader :credit_card, :name
  attr_accessor :balance

  def initialize(params={})
    @credit_card = params[:credit_card].to_s
    @name        = params[:name].to_s
    @balance     = params[:balance].to_f
  end

  def valid?
    credit_card_valid?
  end

  def charge(amount)
    self.balance -= amount
  end

  def credit(amount)
    self.balance += amount
  end

  private

  def credit_card_valid?
    Luhn.valid?(credit_card)
  end
end
