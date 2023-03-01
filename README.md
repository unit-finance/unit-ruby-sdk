# unit_ruby_sdk

This gem provides a ruby wrapper for [Unit's API](https://docs.unit.co/#introduction).

## Documentation

See [Unit's Docs](https://docs.unit.co)

## Installation

```bash
gem install unit_ruby_sdk
```

## Usage

 Bellow are a few exapmles of the Ruby SDK application. For full documentation of the Unit API please refer to the full documentation at https://docs.unit.co/

### Creating a Business Application

```ruby
require 'unit_ruby_sdk'

Unit.config(api_url: ENV['API_URL'], token: ENV['TOKEN'])

full_name = Unit::Types::FullName.new('John', 'Doe')
date_of_birth = '1980-08-10'
address = Unit::Types::Address.new('123 Main St', 'San Francisco', 'CA', '94205', 'US')
phone = Unit::Types::Phone.new('380', '555123222')
email = 'jone.doe@unit-finance.com'
ssn = '123456789'
beneficial_owner = Unit::Types::BeneficialOwner.new(full_name, date_of_birth, address, phone, email, ssn)

response = Unit::Application.create_business_application(
  name: "Acme Inc.",
  address: address,
  phone: phone,
  state_of_incorporation: "CA",
  ein: '123456789',
  industry: "Retail",
  contact: Unit::Types::BusinessContact.new(full_name, email, phone),
  officer: Unit::Types::Officer.new(full_name, date_of_birth, address, phone, email, ssn),
  beneficial_owners: [beneficial_owner, beneficial_owner],
  entity_type: 'LLC'
)

application = response.data

puts application.id

file = File.open("./spec/test.pdf", "rb")
contents = file.read
file.close

upload_document_request = Unit::Application.upload_document(
  application_id: "836683", 
  document_id: "125214", 
  file: contents, 
  file_type: Unit::Types::DocumentFileType::PDF, 
  is_back_side: true)

puts upload_document_request.data.id
```

### Creating a deposit account request
```ruby
relationships = { "customer": Unit::Types::Relationship.new("customer", "111009").to_hash }
response = Unit::Account::Deposit.create_deposit_account(
  deposit_product: "checking", 
  tags: { "purpose": "checking" }, 
  relationships: relationships)
deposit_account = response.data
puts deposit_account.id
```

### Creating a credit account request
```ruby
response = Unit::Account::Credit.create_credit_account(
  credit_terms: "credit_terms_test", 
  credit_limit: 20_000, 
  customer_id: "851228", 
  tags: { "purpose": "tax" })
credit_account = response.data
puts credit_account.id
```

### Fetching a Customer

```ruby
require 'unit_ruby_sdk'

Unit.config(api_url: ENV['API_URL'], token: ENV['TOKEN'])

customer = Unit::Customer.list_customers.first
puts customer.id
```

### 
### Creating a Payment
    
```ruby
require 'unit_ruby_sdk'

response = Unit::Payment.create_book_payment(
  amount: 1000, 
  description: "test payment", 
  account_id: "27573", 
  counterparty_account_id: "36981"
)
payment = response.data
puts payment.id
```

### Get a transaction by id

```ruby
response = Unit::Transaction.get_transaction(transaction_id: '12345', account_id: '72345')
transaction = response.data
puts transaction.id
```

### Creating an individual debit card
```ruby
response = Unit::Card.create_individual_debit_card(
  account_id: '1234',
  type: "depositAccount",
  shipping_address: address,
  design: "default",
  additional_embossed_text: "Second Cardholder"
)
card = response.data
puts card.id
```

### Creating a check deposit
```ruby
response = Unit::CheckDeposit.create_deposit(
  account_id: account_id,
  amount: 50_000,
  description: "test check deposit"
)
deposit = response.data
puts deposit.id
```

### Creating a counterparty with a plaid token
```ruby
response = Unit::Counterparty.create_with_plaid_token(
  customer_id: "823139", 
  type: "Business", 
  name: "Jo Joel", 
  plaid_processor_token: "processor-sandbox-plaid-token")

counterparty = response.data
puts counterparty.id
```


### Creating a Payment to linked counterparty
```ruby
 response = Unit::Payment.create_ach_payment_linked(
   account_id: "123456", 
   counterparty_id: "56784", 
   amount: 1000, 
   direction: "Credit",
   description: "test payment"
 )
 ach_payment = response.data
 puts ach_payment.id
```

### Creating a wire payment
```ruby
 address = Unit::Types::Address.new('123 Main St', 'San Francisco', 'CA', '94205', 'US')
 response = Unit::Payment.create_wire_payment(
   account_id: "1234", 
   amount: 1000, 
   description: "test payment", 
   counterparty: Unit::Types::WireCounterparty.new("Jane Doe", "27573", "812345678", address))
 wire_payment = response.data
 puts wire_payment.id
```

### Logging Errors

```ruby
require 'unit_ruby_sdk'

Unit.config(api_url: ENV['API_URL'], token: "missing token")

# response is a Unit::UnitError
response = Unit::Application.get_application('123')

# Prints "Bearer token is missing"
response.errors.each{|error| puts error.title}
```
