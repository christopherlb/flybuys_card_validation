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
    # Matches on all generic cards, including Visa
    formatted_number.match(/^\d{16}\d?$/)
  end

  def formatted_number
    card_number.gsub /[- ,\.]/, ''
  end

  def type
    :unknown
  end

  def matched?
    true
  end
end