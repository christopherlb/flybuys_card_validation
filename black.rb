require_relative 'fly_buys_card'

class Black < FlyBuysCard
  def matched?
    super && suffix.match(/^1/)
  end
end