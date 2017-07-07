require "spec_helper"

RSpec.describe Cloverrb::Merchant do
  describe "GET merchant details" do
    token = ENV['TEST_API_TOKEN']
    merchant_id = ENV['TEST_MERCHANT_ID']

    it "should get the proper merchant details" do
      VCR.use_cassette("get_merchant_details", record: :once) do
        merchant_client = described_class.new(token)
        merchant = merchant_client.find(merchant_id)

        expect(merchant["name"]).to eq "Josh's Cafe"
        expect(merchant["id"]).to eq "CQWH7CZZVQ072"
      end
    end
  end
end