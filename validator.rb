class Validator
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  # Runs computation to see if this is a valid card or not
  def valid?
    false
  end
end