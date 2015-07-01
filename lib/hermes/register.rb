# Takes an array of transactions and converts them to a hash of balances.
class Register
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def account_balances
    transactions.reduce({}) do |balances, transaction|
      account_balance = balances[transaction.account]
      balances.merge(transaction.to_hash(account_balance))
    end
  end

  def display_balances
    BalancePresenter.new(account_balances).print
  end
end
