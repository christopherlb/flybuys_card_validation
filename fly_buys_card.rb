require_relative 'card'
# Generic FlyBuys card. You generally don't want to work with this.
# Should have a specific type.
class FlyBuysCard < Card
  def valid?
    card_number.match /6014\d+/
  end

  def matched?
    card_number.match(/^6014\d+/)
  end

  def suffix
    @suffix ||= card_number[4..card_number.length]
    @suffix
  end

  def type
    :flybuys
  end
end