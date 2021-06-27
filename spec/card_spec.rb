require 'spec_helper'
require_relative '../card'

RSpec.describe Card do
  it 'can format the card number' do
    expect(Card.new('60141016700078611').formatted_number).to eq '60141016700078611'
    expect(Card.new('6014709045001234').formatted_number).to eq '6014709045001234'
    expect(Card.new('6014-3527-0000-0140').formatted_number).to eq '6014352700000140'
    expect(Card.new('6014.3527-0000-0140').formatted_number).to eq '6014352700000140'
    expect(Card.new('6014-3527,0000,0140').formatted_number).to eq '6014352700000140'
    expect(Card.new('6014 3555 2900 0028').formatted_number).to eq '6014355529000028'
  end
end