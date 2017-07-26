require "spec_helper"

RSpec.describe Cloverrb::Address do
  let(:token) { ENV['TEST_API_TOKEN'] }
  let(:merchant_id) { ENV['TEST_MERCHANT_ID'] }
  let(:client) { described_class.new(token, merchant_id) }

  describe "GET merchant address" do
    it "returns the address details of the merchant" do
      VCR.use_cassette("get_address_details", record: :once) do
        response = client.fetch

        expect(response).to have_key("href")
        expect(response).to have_key("country")
      end
    end
  end
end