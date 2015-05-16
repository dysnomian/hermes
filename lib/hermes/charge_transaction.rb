class ChargeTransaction
  attr_reader :account, :amount

  def initialize(account:, amount: 0, **etc)
    @account = account
    @amount  = amount
  end

  def apply(balances)
    current = balances.fetch(account, nil)
    balances[account] = current - amount if current
    balances
  end
end
