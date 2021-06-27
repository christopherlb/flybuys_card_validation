require_relative 'fly_buys_card'

class Red < FlyBuysCard
  def matched?
    super && suffix.match(/^352/)
  end

  def type
    :red
  end

  private

  def expected_length?
    formatted_number.length == 16
  end
end