# Receives a filename and generates appropriate transactions from it.
class TransactionProcessor
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def run
    begin
      transactions
    rescue FileFormatError
      puts UIText.file_format_error(filename).to_s
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
