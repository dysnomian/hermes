class TransactionProcessor
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def run
    begin
      transactions
    rescue FormatError
      puts "Error: Your input doesn't appear to be formatted correctly. \n\n"\
        "You entered:\n\n #{File.read(filename)}"
      false
    end
  end

  private

  def transactions
    parsed_lines.map  { |il| Transaction.generate_from(il) }
  end

  def parsed_lines
    Parser.new(self.filename).parse
  end
end
