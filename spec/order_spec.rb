require "spec_helper"

RSpec.describe Cloverrb::Order do
  # THIS TEST USES THE SANDBOX URL SINCE
  # I CAN'T ADD A NEW ORDER IN PRODUCTION

  let(:token) { ENV['TEST_SANDBOX_API_TOKEN'] }
  let(:merchant_id) { ENV['TEST_SANDBOX_MERCHANT_ID'] }

  before(:all) do
    Cloverrb::Client::BASE_URL = "https://apisandbox.dev.clover.com/v3"
  end

  after(:all) do
    Cloverrb::Client::BASE_URL = "https://api.clover.com/v3"
  end

  describe "GET all orders" do
    it "should get all the merchant orders" do
      VCR.use_cassette("get_all_orders", record: :once) do
        order_client = described_class.new(token)
        orders = order_client.all(merchant_id)

        expect(orders["elements"]).not_to be_empty
      end
    end
  end

  describe "GET all orders between dates" do
    it "should fetch the proper amount of orders" do
      VCR.use_cassette("get_all_orders_between_dates", record: :once) do
        order_client = described_class.new(token)
        start_date = "June 15, 2017 8:00am".to_time.utc.to_i * 1000
        end_date = "June 15, 2017 9:00am".to_time.utc.to_i * 1000
        options = { "start_date": start_date, "end_date": end_date }

        orders = order_client.all(merchant_id, options)

        expect(orders["elements"]).not_to be_empty
        expect(orders["elements"].count).to eq 15
      end
    end
  end

  describe "GET all orders that are paid" do
    it "should fetch only the orders that are paid" do
      VCR.use_cassette("get_only_paid_orders", record: :once) do
        order_client = described_class.new(token)
        options = { "state": "paid" }

        orders = order_client.all(merchant_id, options)
        orders_states = orders["elements"].map { |o| o["state"] }

        expect(orders["elements"]).not_to be_empty
        expect(orders_states).not_to include "open"
      end
    end
  end

  describe "GET all orders that are paid and in between dates" do
    it "should fetch only the orders that are paid and correct timeframe" do
      VCR.use_cassette("get_only_paid_and_between_dates", record: :once) do
        order_client = described_class.new(token)
        start_date = "June 15, 2017 8:00am".to_time.utc.to_i * 1000
        end_date = "June 15, 2017 9:00am".to_time.utc.to_i * 1000
        state = "paid"
        options = {
          "start_date": start_date,
          "end_date": end_date,
          "state": state
        }

        orders = order_client.all(merchant_id, options)
        orders_states = orders["elements"].map { |o| o["state"] }

        expect(orders["elements"]).not_to be_empty
        expect(orders["elements"].count).to eq 2
        expect(orders_states).not_to include "open"
      end
    end
  end

  describe "Calculate the total" do
    it "should calculate the total order price from the line items" do
      order_id = ENV['TEST_SANDBOX_ORDER_ID']

      VCR.use_cassette("calculate_total", record: :once) do 
        line_items_client = Cloverrb::LineItem.new(token, order_id, merchant_id)

        line_items = line_items_client.all
        total = described_class.total(line_items)

        expect(total).to eq 9373
      end
    end
  end
end