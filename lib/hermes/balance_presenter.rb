class BalancePresenter
  attr_reader :balances

  def initialize(balances)
    @balances = balances.sort_by { |account, amount| account }
  end

  def print
    puts printable_balances
  end

  private

  def printable_balances
    balances.reduce("") do |print_string, account|
      print_string.concat(readable_account_line(account))
    end
  end

  def readable_account_line(account)
    "#{account[0]}: #{readable_balance(account[1])}\n"
  end

  def readable_balance(balance)
    balance.is_a?(Numeric) ? readable_amount(balance) : 'error'
  end

  def readable_amount(balance)
    if balance < 0
      "-$#{balance.abs}"
    else
      "$#{balance}"
    end
  end
end
