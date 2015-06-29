class CreditTransaction
  attr_reader :account, :amount

  def initialize(account:, amount:, **etc)
    @account = account
    @amount  = amount.to_i
  end

  def apply(balances)
    current = balances.fetch(account, nil)

    if current
      balances[account] = current + amount
    end
    balances
  end
end
