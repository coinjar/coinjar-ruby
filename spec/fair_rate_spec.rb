require 'spec_helper'

describe 'FairRate', :vcr, class: CoinJar::FairRate do

  it 'should return the current fair rate given a currency' do
    fairrate = CoinJar::FairRate.new('AUD')
    expect(fairrate).to respond_to(:bid, :ask, :spot)
  end
end
