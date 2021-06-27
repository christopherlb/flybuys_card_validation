require_relative 'red'
require_relative 'black'
require_relative 'green'
require_relative 'blue'
require_relative 'fly_buys_card'
require_relative 'card'

class Validator
  # Order is important. Will match first encountered
  # Blue should catch all flybuys, but add FlyBuysCard as a defensive measure
  # Card will catch everything else
  SUPPORTED_CARDS=[Red, Black, Green, Blue, FlyBuysCard, Card ]

  def self.validate(number)
    match = SUPPORTED_CARDS.detect { |clazz| clazz.new(number).matched? }

    # I hope this double instantiation isn't costly
    card = match.new(number)

    "#{type_to_s(card.type)}: #{card.formatted_number} (#{card.valid? ? 'valid' : 'invalid'})"
  end

  def self.type_to_s(type)
    case type
    when :black
      'Fly Buys Black'
    when :green
      'Fly Buys Green'
    when :blue
      'Fly Buys Blue'
    when :red
      'Fly Buys Red'
    when :flybuys
      'Fly Buys (Unknown)'
    else
      'Unknown'
    end
  end
end