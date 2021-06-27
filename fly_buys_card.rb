require_relative 'card'
# Generic FlyBuys card. You generally don't want to work with this.
# Should have a specific type.
class FlyBuysCard < Card
  def valid?
    return false unless super
    return false unless expected_length?
    return false unless matched?

    chars = formatted_number.chars
    digits = chars.map &:to_i
    multiplied = []

    index = digits.length - 1
    multiply = false
    # There is a better way to do this algo
    begin
      x = multiply ? digits[index] * 2 : digits[index]

      multiplied.push (x % 10)
      multiplied.push (x / 10)

      index -= 1
      multiply = !multiply
    end until index < 0


    return multiplied.sum % 10 == 0
  end

  def matched?
    !!formatted_number.match(/^6014\d{12}\d?$/)
  end

  def suffix
    @suffix ||= formatted_number[4..formatted_number.length]
    @suffix
  end

  def type
    :flybuys
  end

  private
  # Customisation point, expect individual cards to set their own length
  def expected_length?
    formatted_number.length == 16 ||
    formatted_number.length == 17
  end
end