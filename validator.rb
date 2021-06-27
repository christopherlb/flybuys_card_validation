class Validator
  attr_reader :card_number


  def initialize(card_number)
    @card_number = card_number
  end

  # Runs computation to see if this is a valid card or not
  def valid?
    card_number.match /6014\d+/
  end

  def type
    case card_number
    when /60141/
      return :black
    when /6014352/
     :red
    else
      :unknown
    end
  end
end