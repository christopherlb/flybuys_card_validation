require 'spec_helper'
require_relative '../validator'

RSpec.describe Validator do
  let(:short_card) { '1234567890' }

  it 'stores the card number' do
    expect(Validator.new(short_card).card_number).to eq(short_card)
  end

  context 'with a short card' do
    subject { Validator.new(short_card) }
    it 'shows short card nos as invalid' do
      expect(subject).not_to be_valid
    end
  end
end