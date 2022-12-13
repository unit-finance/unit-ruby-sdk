# unit_ruby_sdk

This gem provides a ruby wrapper for [Unit's API](https://docs.unit.co/#introduction).

## Documentation

See [Unit's Docs](https://docs.unit.co)

## Installation

```bash
gem install unit_ruby_sdk
```

## Usage

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
```

### Fetching a Customer

```ruby
require 'unit_ruby_sdk'

Unit.config(api_url: ENV['API_URL'], token: ENV['TOKEN'])

customer = Unit::Customer.list_customers.first
puts customer.id
```
