require 'require_all'

module Hermes
  require_all 'lib'

  extend self

  def run(filename)
      if transactions = TransactionProcessor.new(filename).run
        Register.new(transactions: transactions).print
      end
  end
end
