require "spec_helper"

RSpec.describe Cloverrb::LineItem do
  let(:token) { ENV['TEST_API_TOKEN'] }
  let(:merchant_id) { ENV['TEST_MERCHANT_ID'] }
  let(:order_id) { ENV['TEST_ORDER_ID'] }

  describe "GET all line items of an order" do
    it "should get all the order line items" do
      VCR.use_cassette("get_all_line_items", record: :once) do
        line_items_client = described_class.new(token, order_id, merchant_id)
        line_items = line_items_client.all

        expect(line_items["elements"]).to be_an_instance_of Array
      end
    end
  end
end