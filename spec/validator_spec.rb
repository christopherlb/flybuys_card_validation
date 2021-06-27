require 'spec_helper'
require_relative '../validator'

RSpec.describe Validator do
  it 'validates as expected' do
    expect(Validator.validate('60141016700078611')).to eq('Fly Buys Black: 60141016700078611 (valid)')
    expect(Validator.validate('6014152705006141')).to eq('Fly Buys Black: 6014152705006141 (invalid)')
    expect(Validator.validate('6014111100033006')).to eq('Fly Buys Black: 6014111100033006 (valid)')
    expect(Validator.validate('6014709045001234')).to eq('Fly Buys Blue: 6014709045001234 (valid)')
    expect(Validator.validate('6014352700000140')).to eq('Fly Buys Red: 6014352700000140 (valid)')
    expect(Validator.validate('6014355526000020')).to eq('Fly Buys Green: 6014355526000020 (valid)')

    # Typo in doc, 6 vs 9
    expect(Validator.validate('6014 3555 2900 0028')).to eq('Fly Buys Green: 6014355529000028 (invalid)')

    # It's unclear if this is invalid 'cos not a matching card, or just cos bad math
    # Another typo around qty of 1's here
    expect(Validator.validate('601311111111111')).to eq('Unknown: 601311111111111 (invalid)')

    # Extra cases. I decided to treat cards that matched the math, but
    # didn't belong to Fly Buys as valid.
    expect(Validator.validate('6013111111111111')).to eq('Unknown: 6013111111111111 (valid)')
    expect(Validator.validate('6013 0000 0000 0000')).to eq('Unknown: 6013000000000000 (valid)')
  end
end