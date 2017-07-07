# Cloverrb

This is a ruby wrapper for the [Clover API - US](https://www.clover.com/api_docs/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloverrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloverrb

## Usage

### Requirements:
  - Token (Generated via OAuth)
  - Merchant Code

### Merchants
  > Get all merchant details
  ```ruby
    merchant_client = Cloverrb::Merchant(token)
    merchant_client.find(merchant_id)
  ```

### Employees
  > Get a list of employees of a specific merchant
  ```ruby
    employees_client = Cloverrb::Employee(token)
    employees_client.all(merchant_id)
  ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamarmanjon/cloverrb.
