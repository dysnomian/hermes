require 'luhn'

class AddUserTransaction
  attr_reader :amount, :account, :card_number

  def initialize(amount:, account:, card_number:, **etc)
    @amount      = amount
    @account     = account
    @card_number = card_number
  end

  def apply(balances)
    balance = balances.fetch(:account, false)
    if balance == false && valid?
      balances[account] = amount
    else
      balances[account] = nil
    end
    balances
  end

  def valid?
    !card_number.nil? && Luhn.valid?(card_number.to_s)
  end
end
