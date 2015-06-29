# An abstract class (since I'm writing Java) for each specific transaction type.
# Each subclass implements #apply appropriately.

class AbstractTransaction
  attr_reader :account, :amount, :card_number

  def initialize(args)
    @amount      = args.fetch(:amount)
    @account     = args.fetch(:account)
    @card_number = args.fetch(:card_number, nil)
  end

  def apply
    raise NotImplementedError
  end
end
