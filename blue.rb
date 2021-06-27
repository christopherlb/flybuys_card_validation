require_relative 'fly_buys_card'
require_relative 'black'
require_relative 'red'
require_relative 'green'

class Blue < FlyBuysCard
  def matched?
    return false unless super
    # Special case - catch all card category
    # Assume we may add more cards in the future with special ranges
    # This may be a maintenance headache - need to keep it up to date,
    # would be easier if it could be centralised
    other_potentials = [Black,Red,Green]
    return !other_potentials.any? { |cardClazz| cardClazz.new(card_number).matched? }
  end

  def type
    :blue
  end

  private

  def expected_length?
    formatted_number.length == 16
  end
end