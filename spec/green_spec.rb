require 'spec_helper'
require_relative '../card'
require_relative '../fly_buys_card'
require_relative '../green'

RSpec.describe Blue do
  it 'matches a # starting with Green card number only' do
    expect(Green.new('6014355526')).to be_matched
    expect(Green.new('6014355529')).to be_matched
    expect(Green.new('6014355526000020')).to be_matched
    expect(Green.new('6014355526000028')).to be_matched
    expect(Green.new('1601435552600028')).not_to be_matched
    expect(Green.new('6014')).not_to be_matched

    # Don't match known other cards!
    expect(Green.new('60141016700078611')).not_to be_matched
    expect(Green.new('6014709045001234')).not_to be_matched
    expect(Green.new('6014352700000140')).not_to be_matched
  end
end