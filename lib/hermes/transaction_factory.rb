module TransactionFactory
  extend self

  defpattern(:build) do
    build(false, :add, nil, nil) do |_, _, account, _|
      Transaction.new(account, error_proc)
    end

    build(true, :add, nil, nil) do |_, _, account, amount|
      Transaction.new(account, add_proc(amount))
    end

    build(nil, :credit, nil, nil) do |_, _, account, amount|
      Transaction.new(account, credit_proc(amount))
    end

    build(nil, :charge, nil, nil) do |_, _, account, amount|
      Transaction.new(account, charge_proc(amount))
    end

    build(nil, nil, nil, nil) do |_, _, _, _|
      raise NotImplementedError
    end
  end

  private

  # Transaction procs: Each takes a balance and returns a new balance.
  def add_proc(amount)
    ->(balance) { amount }
  end

  def charge_proc(amount)
    ->(balance) { balance - amount if balance }
  end

  def credit_proc(amount)
    ->(balance) { balance + amount if balance }
  end

  def error_proc
    ->(balance) { nil }
  end
end
