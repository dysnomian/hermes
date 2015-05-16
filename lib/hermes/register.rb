class Register
  attr_reader :transactions

  def initialize(transactions: transactions)
    @transactions = transactions
  end

  def apply_all
    transactions.reduce({}) do |balances, transaction|
      balances = transaction.apply(balances)
    end
  end

  def print
    AccountsPresenter.new(apply_all).print
  end
end
