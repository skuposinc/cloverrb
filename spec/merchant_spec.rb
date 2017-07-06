require "spec_helper"

RSpec.describe Cloverrb::Merchant do
  describe "GET merchant details" do
    token = "49ec922b-9d00-aef1-270c-b94ec130f795"
    merchant_id = "CQWH7CZZVQ072"

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