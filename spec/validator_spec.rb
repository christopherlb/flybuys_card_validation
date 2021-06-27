require 'spec_helper'
require_relative '../validator'

RSpec.describe Validator do
  let(:short_card) { '1234567890' }
  let(:valid_black_1) { '60141016700078611' }
  let(:valid_black_2) {'6014111100033006'}

  it 'stores the card number' do
    expect(Validator.new(short_card).card_number).to eq(short_card)
  end

  context 'with a short card' do
    subject { Validator.new(short_card) }
    it 'shows short card nos as invalid' do
      expect(subject).not_to be_valid
    end
  end

  context 'with a valid card' do
    subject { Validator.new(valid_black_1) }
    it { is_expected.to be_valid }
  end

  describe '#type' do
    subject { Validator.new(card_number).type }
    context 'when supplied a potential black card' do
      let(:card_number) { '60141' }
      it { is_expected.to eq :black }
    end

    context 'when supplied a potential red card' do
      let(:card_number) { '6014352' }
      it { is_expected.to eq :red }
    end
  end
end