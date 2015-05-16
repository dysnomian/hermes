require 'require_all'

module Hermes
  require_all 'lib'
  extend self

  def run_and_show(filename)
    puts run(filename)
  end

  def run(filename)
    begin
      present(register(transactions(input_lines(file_lines(filename)))))
    rescue FormatError
      "Error: Your input doesn't appear to be formatted correctly. \n\n"\
        "You entered:\n\n #{File.read(filename)}"
    end
  end

  private

  def file_lines(filename)
    @file_lines ||= File.readlines(filename)
  end

  def input_lines(file_lines)
    file_lines.map { |line| InputLine.new(line) }
  end

  def transactions(input_lines)
    input_lines.map  { |il| Transaction.generate_from(il) }
  end

  def register(transactions)
    Register.new(transactions: transactions)
  end

  def present(register)
    register.print
  end
end
