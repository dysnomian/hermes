require 'funtools'

class LuhnCheck
  attr_reader :digits

  def initialize(number)
    @digits = number_to_digits(number)
  end

  def valid?
    pl(checksum,
       [:%, 10],
       [:zero?])
  end

  def self.valid?(number)
    new(number).valid?
  end

  private

  def number_to_digits(number)
    number.to_s.split('').
      map { |char| char.to_i }
  end

  def checksum
    addends.reduce(:+)
  end

  def addends
    digits.reverse.reduce([]) do |addended, digit|
      addended << process(digit, addended.length.odd?)
    end.reverse
  end

  def process(digit, change)
    change ? subtract_9(digit * 2) : digit
  end

  def subtract_9(digit)
    digit < 10 ? digit : digit - 9
  end

  def checksum_valid?
    pl(checksum,
       [:%, 10],
       [:zero?])
  end
end
