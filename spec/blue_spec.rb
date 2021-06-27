require 'spec_helper'
require_relative '../card'
require_relative '../fly_buys_card'
require_relative '../blue'

RSpec.describe Blue do
  xit 'matches a # starting with Red card number only' do
    expect(Red.new('6014709045001234')).to be_matched
    expect(Red.new('6014')).to be_matched
    expect(Red.new('1601435270000140')).not_to be_matched
    expect(Red.new('6014')).not_to be_matched
    expect(Red.new('six014352')).not_to be_matched

    # Don't match known other cards!
    expect(Red.new('6014709045001234')).not_to be_matched
    expect(Red.new('60141016700078611')).not_to be_matched
    expect(Red.new('6014355526000020')).not_to be_matched
  end
end