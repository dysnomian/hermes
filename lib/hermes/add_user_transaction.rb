require 'luhn'

class AddUserTransaction < AbstractTransaction
  # TODO (liss) gods, this is ugly. #tap it at the very least
  def apply(balances)
    balance = balances.fetch(:account, false)
    # if the account doesn't exist, initialize it with the given amount
    if balance == false && valid?
      balances[account] = amount
    # Otherwise, leave it alone
    else
      balances[account] = nil
    end
    balances
  end

  def valid?
    !card_number.nil? && Luhn.valid?(card_number.to_s)
  end
end
