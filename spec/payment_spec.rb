require 'spec_helper'

describe 'Payments', :vcr, class: CoinJar::Payment do
  it 'should return a list of payments'  do
    payments = CoinJar::Payment.list
    expect(payments.first.uuid).to match(/^(([a-z0-9]*[-])+([a-z0-9]*))$/) #Not really sure of the pattern 8-4-4-4-12?
  end

  it 'should find a payment by uuid' do
    payment = CoinJar::Payment.find('d1fd373b-f116-4c30-9ba6-4c38ede1dbe1')
    expect(payment.uuid).to eq 'd1fd373b-f116-4c30-9ba6-4c38ede1dbe1'
  end

  it 'should create a payment given a payee and amount' do
    payment = CoinJar::Payment.new(payee: :n1Pc4SRA4xmG1k3SejrmTAX3NynALcT6sq, amount: 1.25)
    payment.create
    expect(payment.status).to eq 'PENDING'
  end

  it 'should pay the right payee' do
    payment = CoinJar::Payment.new(payee: :n1Pc4SRA4xmG1k3SejrmTAX3NynALcT6sq, amount: 1.25)
    payment.create
    expect(payment.payee_name).to eq 'n1Pc4SRA4xmG1k3SejrmTAX3NynALcT6sq'
  end

  it 'should pay the right amount' do
    payment = CoinJar::Payment.new(payee: :n1Pc4SRA4xmG1k3SejrmTAX3NynALcT6sq, amount: 1.5)
    payment.create
    expect(payment.amount).to eq '1.5'
  end

  it 'should confirm a payment' do
    payment = CoinJar::Payment.new(payee: :n1Pc4SRA4xmG1k3SejrmTAX3NynALcT6sq, amount: 1.5)
    payment.create
    payment.confirm!
    expect(payment.status).to eq 'COMPLETED'
  end

end
