require 'spec_helper'
require_relative '../card'
require_relative '../fly_buys_card'
require_relative '../black'

RSpec.describe Black do
  it 'matches a # starting with black card number only' do
    expect(Black.new('6014155510000028')).to be_matched
    expect(Black.new('60141')).to be_matched
    expect(Black.new('1601415551000028')).not_to be_matched
    expect(Black.new('6014')).not_to be_matched
    expect(Black.new('six0141')).not_to be_matched

    # Don't match known other cards!
    expect(Black.new('6014709045001234')).not_to be_matched
    expect(Black.new('6014352700000140')).not_to be_matched
    expect(Black.new('6014355526000020')).not_to be_matched
  end
end