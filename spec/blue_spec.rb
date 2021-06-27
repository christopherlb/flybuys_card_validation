require 'spec_helper'
require_relative '../card'
require_relative '../fly_buys_card'
require_relative '../blue'

RSpec.describe Blue do
  it 'matches a # starting with Blue card number only' do
    expect(Blue.new('6014709045001234')).to be_matched
    expect(Blue.new('601470')).to be_matched
    expect(Blue.new('1601435270000140')).not_to be_matched
    expect(Blue.new('6014')).not_to be_matched
    expect(Blue.new('six014352')).not_to be_matched

    # Don't match known other cards!
    expect(Blue.new('60141016700078611')).not_to be_matched
    expect(Blue.new('6014352700000140')).not_to be_matched
    expect(Blue.new('6014355526000020')).not_to be_matched
  end
end