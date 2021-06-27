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
end