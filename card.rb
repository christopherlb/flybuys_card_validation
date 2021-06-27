class Card
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def valid?
    card_number.match /6014\d+/
  end

  def formatted_number
    card_number.gsub /[- ,\.]/, ''
  end

  def type
    'Unknown'
  end

  def matched?
    true
  end
end