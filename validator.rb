class Validator
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end
end

puts "hello world"
puts Validator.new('123').card_number
