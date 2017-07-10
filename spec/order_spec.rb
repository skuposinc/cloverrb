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
        start_date = "June 15, 2017 8:00am".to_time.to_i * 1000
        end_date = "June 15, 2017 9:00am".to_time.to_i * 1000

        orders = order_client.all(merchant_id, start_date, end_date)

        expect(orders["elements"]).not_to be_empty
        expect(orders["elements"].count).to eq 15
      end
    end
  end
end