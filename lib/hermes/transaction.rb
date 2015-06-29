# A factory module to generate the appropriate transaction object for the input
# line type.
module Transaction
  extend self

  def generate_from(input_line)
    hash = input_line.to_hash
    case
    when hash[:type] == :add
      AddUserTransaction.new(hash)
    when hash[:type] == :charge
      ChargeTransaction.new(hash)
    when hash[:type] == :credit
      CreditTransaction.new(hash)
    else
      raise FormatError
    end
  end
end

class FormatError < StandardError; end
