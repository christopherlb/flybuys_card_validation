require_relative 'fly_buys_card'

class Red < FlyBuysCard
  def matched?
    puts suffix
    super && suffix.match(/^352/)
  end

  def type
    :red
  end
end