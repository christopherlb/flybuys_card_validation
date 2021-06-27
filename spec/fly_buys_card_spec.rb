require 'spec_helper'
require_relative '../fly_buys_card'

RSpec.describe FlyBuysCard do
  it 'can identify potential FlyBuys cards' do
    expect(FlyBuysCard.new('6014355510000028')).to be_matched
    expect(FlyBuysCard.new('1601435550000028')).not_to be_matched
  end

  it 'can split out the relevant part to Fly Buys' do
    expect(FlyBuysCard.new('6014355510000028').suffix).to eq('355510000028')
  end

  it 'can validate numbers' do
    expect(FlyBuysCard.new('60141016700078611')).to be_valid
    expect(FlyBuysCard.new('6014111100033006')).to be_valid
    expect(FlyBuysCard.new('6014709045001234')).to be_valid
    expect(FlyBuysCard.new('6014352700000140')).to be_valid
    expect(FlyBuysCard.new('6014355526000020')).to be_valid

    # Reasonable separators
    expect(FlyBuysCard.new('6014 1111 0003 3006')).to be_valid
    expect(FlyBuysCard.new('6014 1111.0003-3006')).to be_valid

    # Bad math
    expect(FlyBuysCard.new('6014152705006141')).not_to be_valid
    expect(FlyBuysCard.new('6014355526000028')).not_to be_valid
    expect(FlyBuysCard.new('601311111111111')).not_to be_valid

    # Poor formatting
    expect(FlyBuysCard.new(6014352700000140)).not_to be_valid
    expect(FlyBuysCard.new('6014 1111 0003 3006a')).not_to be_valid

    # Not a fly-buys
    expect(FlyBuysCard.new('6013 1111 0003 3007')).not_to be_valid
  end
end