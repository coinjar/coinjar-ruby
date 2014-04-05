require 'spec_helper'

describe 'Account', :vcr, class: CoinJar::Account do
  it 'should find the current user'  do
    account = CoinJar::Account.find
    expect(account.email).to eq 'demo@coinjar.io'
  end
end
