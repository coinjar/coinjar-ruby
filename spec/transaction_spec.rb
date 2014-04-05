require 'spec_helper'

describe 'Transaction', :vcr, class: CoinJar::Transaction do

  it 'should return an array of transaction object for the current user' do
    @transactions = CoinJar::Transaction.list
    expect(@transactions.first).to be_an_instance_of(CoinJar::Transaction)
  end

  it 'should find a transaction given a uuid' do
    @transaction = CoinJar::Transaction.find('a350ff8e-725d-4000-a45e-8ca4c1ff329a')
    expect(@transaction.uuid).to eq 'a350ff8e-725d-4000-a45e-8ca4c1ff329a'
  end
end
