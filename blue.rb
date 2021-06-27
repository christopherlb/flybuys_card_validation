require_relative 'fly_buys_card'

class Blue < FlyBuysCard
  def matched?
    super && suffix.match(/^1/)
  end

  def type
    :blue
  end
end