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
    expect(Card.new(60141016700078611).formatted_number).to eq '60141016700078611'
  end

  it 'can detect generally bad formatted cards #s' do
    # Black cards of both length
    expect(Card.new('60141016700078611')).to be_valid
    expect(Card.new('6014152705006141')).to be_valid

    # Accept as many generic cards as possible - this will prevent issues with POS and
    # customers hanging around.
    expect(Card.new('4916 3670 972 540  -  8 8')).to be_valid
    expect(Card.new('4916367097254088')).to be_valid # Nb. fake visa

    expect(Card.new('60141016700078611!')).not_to be_valid
    expect(Card.new('60141016700078611a')).not_to be_valid
    expect(Card.new('601410167000786111')).not_to be_valid
    expect(Card.new('6014101670')).not_to be_valid
    expect(Card.new(60141016700078611)).not_to be_valid
  end
end