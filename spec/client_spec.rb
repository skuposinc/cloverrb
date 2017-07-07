require "spec_helper"

RSpec.describe Cloverrb::Client do
  it "has proper base url" do
    expect(described_class::BASE_URL).to eq "https://api.clover.com/v3"
  end

  describe "generating an access token" do
    it "should return a token" do
      VCR.use_cassette("generate_access_token", record: :once) do
        client_id = "738TXSSPWFQ8J"
        code = "35be95bf-8c10-3783-9122-8a0b42a93493"
        app_secret = "40f64a86-b4dc-a41f-7efa-7e1ab9ccf165"

        response = described_class
                    .generate_access_token(client_id, code, app_secret)
                    .parsed_response

        expect(response["access_token"]).to eq "1275d0e2-3430-5dc5-22fc-62e92bd53d73"
      end
    end
  end
end