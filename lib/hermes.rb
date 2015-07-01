require 'hermes/version'
require 'hermes/cli'
require 'hermes/parser'
require 'hermes/input_line'
require 'hermes/luhn_check'
require 'hermes/transaction_factory'
require 'hermes/transaction'
require 'hermes/register'
require 'hermes/balance_presenter'

require 'funtools/composition'

module Hermes
  extend self

  def run(filename)
    transactions = Parser.new(filename).transaction_array
    Register.new(transactions).display_balances
  end
end
