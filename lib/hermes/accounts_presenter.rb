class AccountsPresenter
  attr_reader :accounts

  def initialize(accounts)
    @accounts = accounts.sort_by { |name, amount| name }
  end

  def print
    accounts.reduce("") do |string, account|
      string.concat(readable_account(account))
    end
  end

  private

  def readable_account(account)
    "#{account[0]}: #{readable_balance(account[1])}\n"
  end

  def readable_balance(balance)
    balance.is_a?(Numeric) ? readable_amount(balance) : 'error'
  end

  def readable_amount(balance)
    balance < 0 ? "-$#{balance.abs}" : "$#{balance}"
  end
end
