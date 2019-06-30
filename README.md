# CoinJar

The official CoinJar Ruby gem is the easiest way to interact with CoinJar API in your Ruby applications.

## Status

This gem is not currently released on [RubyGems](http://rubygems.org/gems/coinjar).

For information on using the CoinJar API directly, see [the documentation](https://developer.coinjar.io/display/CD/CoinJar+API).

## Installation

Add this line to your application's Gemfile:

    gem 'coinjar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coinjar

## Usage

### Configuration

First you need to configure the __api_key__, which is the CoinJar authentication token. You can obtain it from [CoinJar Account Settings](https://secure.coinjar.io/users/sign_in) > API Access.

    require 'coinjar'
    CoinJar.api_key = "pJ451Sk8tXz9LdUbGg1sobLUZuVzuJwdyr4sD3owFW4WYHxo"

Optionally you can also set the endpoint class variable, if you need to change the endpoint (for example, to use the Sandbox environment):

  CoinJar.endpoint = "https://secure.sandbox.coinjar.io/api/v1"

### Payments

#### Send a payment

__New payment__

  p = CoinJar::Payment.new payee: "mx8Dv1SmdoahsFxv1FrtgygMh6SkvzHG3o", amount: 0.5

  p.create
  # => #<CoinJar::Payment:0x007fba13b9d1e0 @payee="mx8Dv1SmdoahsFxv1FrtgygMh6SkvzHG3o", @amount="0.5", @uuid="d1fd373b-f116-4c30-9ba6-4c38ede1dbe1", @payee_name="mx8Dv1SmdoahsFxv1FrtgygMh6SkvzHG3o", @payee_type="ADDRESS", @status="PENDING", @created_at="2013-06-25T21:17:05.517+10:00", @updated_at="2013-06-25T21:17:05.517+10:00">

__Confirm the payment__

  p.confirm!

#### Find a payment

Find a payment by uuid

  payment = CoinJar::Payment.find('d1fd373b-f116-4c30-9ba6-4c38ede1dbe1')

### Accounts

#### Get the account details of the current user

  account = CoinJar::Account.find

### Addresses

#### Create a bitcoin address

  address = CoinJar::Address.generate('Label')

### Fair Rate

#### Get the Fair Rate for a given currency

BTC, USD, AUD, NZD, CAD, EUR, GBP, SGD, HKD, CHF and JPY are all currently supported

  fairrate = CoinJar::FairRate.new('AUD')

### Transactions

#### List transactions

  transactions = CoinJar::Transaction.list

This will return an array of _CoinJar::Transaction_ objects
#### Find a transaction

Fund a transaction by uuid

  transaction = CoinJar::Transaction.find('a350ff8e-725d-4000-a45e-8ca4c1ff329a')

## To do

 * Document and test pagination

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
