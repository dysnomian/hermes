# Takes a filename and converts the lines into an array of transactions.
class Parser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def transaction_array
    input_arrays.map { |ia| TransactionFactory.build(*ia) }
  end

  private

  def input_arrays
    lines.map { |line| InputLine.new(line).to_a }
  end

  def lines
    @lines ||= File.readlines(self.filename)
  end
end
