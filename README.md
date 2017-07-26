[![Code Climate](https://codeclimate.com/github/iamarmanjon/cloverrb/badges/gpa.svg)](https://codeclimate.com/github/codeclimate/codeclimate)

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

  > Get a single employee
  ```ruby
    employees_client = Cloverrb::Employee(token, merchant_id)
    employees_client.find(employee_id)
  ```

### Order
  > Get a list of orders of a specific merchant
  ```ruby
    order_client = Cloverrb::Order(token)
    orders = order_client.all(merchant_id
  ```

  > Get the total order amount for a line items
  ```ruby
    line_items_client = Cloverrb::LineItem.new(token, order_id, merchant_id)
    line_items = line_items_client.all
    total = described_class.total(line_items)
  ```

  > Get a list of orders from a specific timeframe
  ```ruby
    order_client = Cloverrb::Order(token)
    options = {
      "start_date": start_date,
      "end_date": end_date
    }
    orders = order_client.all(merchant_id, options)
  ```
  Note: `start_date` and `end_date` must be in milliseconds.
  Example:
  ```
    "June 15, 2017 8:00am".to_time.to_i * 1000
  ```

  > Get a list of orders and filter by state
  ```ruby
    order_client = Cloverrb::Order(token)
    options = {
      "state": "paid"
    }
    orders = order_client.all(merchant_id, options)
  ```

### Line Item
  > Get a list of line items for a specific order
  ```ruby
    line_item_client = Cloverrb::LineItem(token, order_id, merchant_id)
    line_items = line_item_client.all
  ```

### Address
  > Fetch the address details of a merchant
  ```ruby
    address_client = Cloverrb::Address(token, merchant_id)
    address = address_client.fetch
  ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamarmanjon/cloverrb.
