require 'spec_helper'

describe 'Address', :vcr, class: CoinJar::Address do

  it 'should generate an address correctly'  do
    address = CoinJar::Address.generate('Test label')
    expect(address.label).to eq 'Test label'
  end

end
