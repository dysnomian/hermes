class ChargeTransaction < AbstractTransaction
  def apply(balances)
    current = balances.fetch(account, nil)
    balances[account] = current - amount if current
    balances
  end
end
