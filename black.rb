require_relative 'fly_buys_card'

class Black < FlyBuysCard
  def matched?
    super && suffix.match(/^1/)
  end

  def type
    :black
  end

  private

  def expected_length?
    formatted_number.length == 16 ||
    formatted_number.length == 17
  end
end