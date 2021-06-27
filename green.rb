require_relative 'fly_buys_card'

class Green < FlyBuysCard
  MAX_RANGE=355529
  MIN_RANGE=355526
  def matched?
    return false unless super
    range = suffix[0..5].to_i
    range >= MIN_RANGE && range <= MAX_RANGE
  end

  def type
    :green
  end

  private

  def expected_length?
    formatted_number.length == 16
  end
end
