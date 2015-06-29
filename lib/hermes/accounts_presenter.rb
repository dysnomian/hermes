class AccountsPresenter
  attr_reader :accounts

  def initialize(accounts)
    @accounts = accounts.sort_by { |name, amount| name }
  end

  def print
    puts printable_accounts
  end

  def printable_accounts
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

  def formatted_amount(amount)
    sprintf("%0.2f", amount)
  end

  def readable_amount(balance)
    balance < 0 ? "-$#{formatted_amount(balance.abs)}" : "$#{formatted_amount(balance)}"
  end
end
