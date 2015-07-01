class Transaction
  attr_reader :account

  def initialize(account, change)
    @account = account
    @change  = change
  end

  def to_hash(balance)
    { account => change.call(balance) }
  end

  private

  def change
    @change
  end
end
