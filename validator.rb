require_relative 'red'
require_relative 'black'
require_relative 'fly_buys_card'
require_relative 'card'

class Validator
  # Order is important. Will match first encountered
  SUPPORTED_CARDS=[Red, Black, FlyBuysCard, Card ]
  attr_reader :card_number


  def initialize(card_number)
    @card_number = card_number
  end



  # Runs computation to see if this is a valid card or not
  def valid?
    card_number.match /6014\d+/
  end

  def type
    for cardClazz in SUPPORTED_CARDS do
      card = cardClazz.new(card_number)
      if card.matched?
        return card.type
      end
    end

    # Shouldn't get here, Card should be a back stop
    raise 'Not a card number'
  end
end