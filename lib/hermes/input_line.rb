class InputLine
  attr_reader :keywords

  def initialize(input_string)
    @keywords ||= input_string.split(" ")
  end

  def to_a
    [valid?, type, account, amount]
  end

  private

  # NOTE: Returns 0 since nil in the leading place on a list gets ignored
  def valid?
    card_number ? LuhnCheck.valid?(card_number) : 0
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
    type == :add ? keywords[2] : nil
  end

  def parse_amount(string)
    amount_regex.match(string)[1].to_i
  end

  def amount_regex
    # all digits between `$` at the start of a line and `.` or EOL
    /^\$?([\d\.]+)+$/
  end
end
