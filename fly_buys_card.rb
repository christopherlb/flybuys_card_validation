require_relative 'card'

class FlyBuysCard < Card
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