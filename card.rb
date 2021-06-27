# Represents unknown card #s, potentially not FlyBuys.
# This is important incase a POS client messes up integration,
# maybe they send Visa # instead of flybuys (which would be v bad!!)
# and the only way of linking to their account is through that record
class Card
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def valid?
    # Only support strings - there's too much risk of
    # clients or us dropping leading 0's for ints
    # Would be risky trying to cast
    return false unless processable?
    # Matches on all generic cards, including Visa
    formatted_number.match(/^\d{16}\d?$/)
  end

  def formatted_number
    return card_number.to_s unless processable?
    card_number.gsub /[- ,\.]/, ''
  end

  def type
    :unknown
  end

  def matched?
    true
  end

  private

  def processable?
    card_number.class == String
  end
end