class InputLine
  attr_reader :keywords

  def initialize(input_string)
    @keywords ||= input_string.split(" ")
    unless valid?
      raise FormatError.new(input_string)
    end
  end

  def to_hash
    {
      type:        type,
      account:     account,
      card_number: card_number,
      amount:      amount
    }
  end

  private

  def valid?
    [:add, :charge, :credit].include?(type)
  end

  def type
    keywords[0].downcase.to_sym
  end

  def account
    keywords[1]
  end

  def amount
    parse_amount(keywords[-1])
  end

  def card_number
    type == :add ? keywords[2].to_i : nil
  end

  def parse_amount(string)
    amount_regex.match(string)[1].to_i
  end

  def amount_regex
    # all digits between `$` at the start of a line and `.` or EOL
    /^\$?(\d+)\.?\d{2}?/
  end
end
